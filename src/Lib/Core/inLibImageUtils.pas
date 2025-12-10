unit inLibImageUtils;

interface
uses
  Windows, Graphics, GDIPAPI, GDIPOBJ, dexif, dMetaData, SysUtils, Classes,
  System.IOUtils, System.StrUtils, DateUtils;
type
  TImageUtils = class
  public
    // Funciones EXIF
    class function ObtenerOrientacionEXIF(const ARutaImagen: string): Integer;
    class function ObtenerFechaExif(const RutaArchivo: string): TDateTime;
    // Funciones de manipulación de imágenes
    class function CrearThumbnail(const ARutaImagen: string;
                                  ASize: Integer): TBitmap;
    class function RotarBitmapSegunEXIF(const ARutaImagen: string;
                                        ADestino: TBitmap): Boolean;
    // Funciones de gestión de thumbnails
    class function ObtenerNombreThumbnail(const ARutaArchivo: string): string;
    class function NecesitaActualizacion(const ARutaArchivo,
                                         ARutaThumbnail: string): Boolean;
  end;
implementation
{ TImageUtils }
class function TImageUtils.ObtenerOrientacionEXIF(
                                            const ARutaImagen: string): Integer;
var
  Image: TGPImage;
  PropItem: PPropertyItem;
  PropSize: UINT;
begin
  Result := 1; // Valor por defecto (sin rotación)
  if not FileExists(ARutaImagen) then
    Exit;
  Image := TGPImage.Create(ARutaImagen);
  try
    // PropertyTagOrientation = $0112
    PropSize := Image.GetPropertyItemSize($0112);
    if PropSize > 0 then
    begin
      GetMem(PropItem, PropSize);
      try
        if Image.GetPropertyItem($0112, PropSize, PropItem) = Ok then
        begin
          if PropItem.type_ = PropertyTagTypeShort then
            Result := PWord(PropItem.value)^;
        end;
      finally
        FreeMem(PropItem);
      end;
    end;
  finally
    Image.Free;
  end;
end;
class function TImageUtils.ObtenerFechaExif(
                                          const RutaArchivo: string): TDateTime;
var
  ImgData: TImgData;
  sNombreFich: string;
  Partes: TArray<string>;
  Dia, Mes, Anio: Word;
begin
  Result := 0;
  if not FileExists(RutaArchivo) then
    Exit;
  sNombreFich := ExtractFileName(RutaArchivo);
  // SOLO procesar si empieza con "FE_" (case insensitive)
  if StartsText('FE_', sNombreFich) then
  begin
    Partes := sNombreFich.Split(['_']);
    // Debe tener al menos 4 partes: FE, DD, MM, YYYY
    if Length(Partes) >= 4 then
    begin
      try
        Dia := StrToInt(Partes[1]);
        Mes := StrToInt(Partes[2]);
        Anio := StrToInt(Partes[3]);
        // Validar rangos
        if (Dia >= 1) and (Dia <= 31) and
           (Mes >= 1) and (Mes <= 12) and
           (Anio >= 1900) and (Anio <= 2100) then
        begin
          try
            Result := EncodeDate(Anio, Mes, Dia);
            Exit; // Fecha válida encontrada, salir
          except
            // Fecha inválida (ej: FE_31_02_2025), continuar con EXIF
          end;
        end;
      except
        // Error al parsear números, continuar con EXIF
      end;
    end;
  end;
  // Si no tiene formato FE_ o falló el parsing,
  //intentar obtener de metadatos EXIF
  ImgData := TImgData.Create;
  try
    try
      if ImgData.ProcessFile(RutaArchivo) then
      begin
        if ImgData.HasEXIF then
        begin
          with ImgData.ExifObj do
          begin
            Result := DateTimeOriginal;
            if Result = 0 then
              Result := DateTimeDigitized;
            if Result = 0 then
              Result := DateTimeModified;
          end;
        end;
      end;
      // Si no se pudo obtener de EXIF, usar fecha de creación del archivo
      if Result = 0 then
        Result := TFile.GetCreationTime(RutaArchivo);
    except
      on E: Exception do
      begin
        // En caso de error, usar fecha de creación del archivo
        Result := TFile.GetCreationTime(RutaArchivo);
      end;
    end;
  finally
    ImgData.Free;
  end;
end;
class function TImageUtils.CrearThumbnail(const ARutaImagen: string;
                                          ASize: Integer): TBitmap;
var
  GPBitmap: TGPBitmap;
  GPGraphics: TGPGraphics;
  Orientacion: Integer;
  NuevoAncho, NuevoAlto: Integer;
  Proporcion: Double;
begin
  Result := TBitmap.Create;
  if not FileExists(ARutaImagen) then
  begin
    // Crear thumbnail vacío en caso de error
    Result.Width := ASize;
    Result.Height := ASize;
    Result.Canvas.Brush.Color := clWhite;
    Result.Canvas.FillRect(Rect(0, 0, ASize, ASize));
    Exit;
  end;
  try
    // 1. Leer orientación EXIF
    Orientacion := ObtenerOrientacionEXIF(ARutaImagen);
    // 2. Cargar con GDI+ (más rápido y mejor calidad que TJPEGImage)
    GPBitmap := TGPBitmap.Create(ARutaImagen);
    try
      // 3. Aplicar rotación según EXIF
      case Orientacion of
        3: GPBitmap.RotateFlip(Rotate180FlipNone);
        6: GPBitmap.RotateFlip(Rotate90FlipNone);
        8: GPBitmap.RotateFlip(Rotate270FlipNone);
      end;
      // 4. Calcular tamaño del thumbnail manteniendo proporción
      if GPBitmap.GetWidth > GPBitmap.GetHeight then
      begin
        Proporcion := ASize / GPBitmap.GetWidth;
        NuevoAncho := ASize;
        NuevoAlto := Round(GPBitmap.GetHeight * Proporcion);
      end
      else
      begin
        Proporcion := ASize / GPBitmap.GetHeight;
        NuevoAlto := ASize;
        NuevoAncho := Round(GPBitmap.GetWidth * Proporcion);
      end;
      // Validar dimensiones mínimas
      if (NuevoAncho < 1) then NuevoAncho := 1;
      if (NuevoAlto < 1) then NuevoAlto := 1;
      // 5. Crear bitmap de destino
      Result.Width := NuevoAncho;
      Result.Height := NuevoAlto;
      Result.PixelFormat := pf24bit;
      // 6. Dibujar con GDI+ (ALTA CALIDAD)
      GPGraphics := TGPGraphics.Create(Result.Canvas.Handle);
      try
        GPGraphics.SetInterpolationMode(InterpolationModeHighQualityBicubic);
        GPGraphics.SetSmoothingMode(SmoothingModeHighQuality);
        GPGraphics.DrawImage(GPBitmap, 0, 0, NuevoAncho, NuevoAlto);
      finally
        GPGraphics.Free;
      end;
    finally
      GPBitmap.Free;
    end;
  except
    on E: Exception do
    begin
      // En caso de error, devolver thumbnail vacío
      Result.Width := ASize;
      Result.Height := ASize;
      Result.Canvas.Brush.Color := clWhite;
      Result.Canvas.FillRect(Rect(0, 0, ASize, ASize));
    end;
  end;
end;
class function TImageUtils.RotarBitmapSegunEXIF(const ARutaImagen: string;
                                                 ADestino: TBitmap): Boolean;
var
  GPBitmap: TGPBitmap;
  GPGraphics: TGPGraphics;
  Orientacion: Integer;
begin
  Result := False;
  if not FileExists(ARutaImagen) then
    Exit;
  try
    // 1. Leer orientación EXIF
    Orientacion := ObtenerOrientacionEXIF(ARutaImagen);
    // 2. Cargar con GDI+
    GPBitmap := TGPBitmap.Create(ARutaImagen);
    try
      // 3. Aplicar rotación según EXIF
      case Orientacion of
        3: GPBitmap.RotateFlip(Rotate180FlipNone);
        6: GPBitmap.RotateFlip(Rotate90FlipNone);
        8: GPBitmap.RotateFlip(Rotate270FlipNone);
      end;
      // 4. Convertir a TBitmap
      ADestino.Width := GPBitmap.GetWidth;
      ADestino.Height := GPBitmap.GetHeight;
      ADestino.PixelFormat := pf24bit;
      GPGraphics := TGPGraphics.Create(ADestino.Canvas.Handle);
      try
        GPGraphics.SetInterpolationMode(InterpolationModeHighQualityBicubic);
        GPGraphics.DrawImage(GPBitmap, 0, 0,
                            ADestino.Width, ADestino.Height);
      finally
        GPGraphics.Free;
      end;
      Result := True;
    finally
      GPBitmap.Free;
    end;
  except
    on E: Exception do
      Result := False;
  end;
end;
class function TImageUtils.ObtenerNombreThumbnail(const ARutaArchivo: string): string;
begin
  // Convertir foto1.jpg a foto1_thumb.bmp
  Result := ChangeFileExt(ExtractFileName(ARutaArchivo), '_thumb.bmp');
end;
class function TImageUtils.NecesitaActualizacion(const ARutaArchivo,
                                                  ARutaThumbnail: string): Boolean;
var
  FechaOriginal, FechaThumbnail: TDateTime;
begin
  // Si no existe el thumbnail, necesita crearse
  if not FileExists(ARutaThumbnail) then
  begin
    Result := True;
    Exit;
  end;
  // Si el archivo original no existe, no necesita actualización
  if not FileExists(ARutaArchivo) then
  begin
    Result := False;
    Exit;
  end;
  // Si el archivo original es más nuevo que el thumbnail, necesita actualizarse
  FechaOriginal := FileDateToDateTime(FileAge(ARutaArchivo));
  FechaThumbnail := FileDateToDateTime(FileAge(ARutaThumbnail));
  Result := FechaOriginal > FechaThumbnail;
end;
end.
