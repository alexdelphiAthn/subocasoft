unit inMtoModalVisorFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Jpeg, Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dexif, dMetaData,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxImageSlider, data.DB,
  datasnap.DBClient, cxClasses, system.math, GDIPAPI, GDIPOBJ, shellapi,
  system.IOUtils, system.StrUtils;

type
  TfrmMtoVisorFoto = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    pnlCarrusel: TPanel;
    pnlZoom: TPanel;
    lblZoom: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnSiguiente: TSpeedButton;
    ScrollBoxMiniaturas: TScrollBox;
    btnPrimera: TSpeedButton;
    btnUltima: TSpeedButton;
    Rotar90dcha: TSpeedButton;
    btnAjustar: TSpeedButton;
    btnOpenFolder: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure btnZoom100Click(Sender: TObject);
    procedure MiniaturaClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1DblClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    //procedure dxImageSlider1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrimeraClick(Sender: TObject);
    procedure btnUltimaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Rotar90dchaClick(Sender: TObject);
    procedure btnAjustarClick(Sender: TObject);
    procedure btnOpenFolderClick(Sender: TObject);
  private
    function ObtenerOrientacionEXIF(const ARutaImagen: string): Integer;
    function ObtenerFechaExif(const RutaArchivo: string): TDateTime;
  private
    FZoomFactor: Double;
    FIsDragging: Boolean;
    FDragStartX, FDragStartY: Integer;
    FScrollStartX, FScrollStartY: Integer;
    FOriginalBitmap: TBitmap;
    FListaImagenes: TStringList;
    //FListaMiniaturas: TStringList;
    FIndiceActual: Integer;
    FClientDataSet: TClientDataSet;
    //FLastMouseX, FLastMouseY : Integer;
    procedure CargarImagen(const ARutaArchivo: string);
    procedure AplicarZoom;
    procedure ActualizarLabelZoom;
    procedure CargarCarrusel;
    procedure ActualizarBotonesNavegacion;
    procedure MostrarImagenPorIndice(AIndice: Integer; bClick:boolean = false);
    procedure ResaltarMiniatura(AIndice: Integer; bClick:Boolean = false);
    function CalcularFactorFit: Double;
  public
    procedure MostrarImagen(const ARutaArchivo: string);
    procedure MostrarImagenes(const AListaArchivos: TStringList;
                              AIndiceInicial: Integer = 0); overload;
    procedure MostrarImagenes(cdsFotos:TClientDataset;
                              AIndiceInicial: Integer = 0); overload;
  end;
var
  frmMtoVisorFoto: TfrmMtoVisorFoto;

implementation

{$R *.dfm}

procedure TfrmMtoVisorFoto.FormCreate(Sender: TObject);
begin
  FZoomFactor := 1.0;
  FIsDragging := False;
  FOriginalBitmap := TBitmap.Create;
  FListaImagenes := TStringList.Create;
  //FListaMiniaturas := TStringList.Create;
  FIndiceActual := -1;
  // Configurar cursor de mano para arrastrar
  Image1.Cursor := crHandPoint;
  // Configurar ventana
  KeyPreview := True;
  WindowState := wsMaximized;
  // Configurar carrusel
  //dxImageSlider1.ShowNavigation := True;
//  dxImageSlider1.Height := 120;
  pnlCarrusel.Height := 170;
  pnlCarrusel.Align := alBottom;
  // Ocultar navegación por defecto
  //pnlNavigation.Visible := False;
  //pnlCarrusel.Visible := False;
end;

function TfrmMtoVisorFoto.ObtenerFechaExif(const RutaArchivo: string): TDateTime;
var
  ImgData: TImgData;
  DebugMsg: string;
  sNombreFich:string;
  Partes: TArray<string>;
  Dia, Mes, Anio:Word;
begin
  Result := 0;
  if not FileExists(RutaArchivo) then
  begin
    //ShowMessage('Archivo no existe: ' + RutaArchivo);
    Exit;
  end;
  sNombreFich := ExtractFileName(RutaArchivo);
  if StartsText('FE', sNombreFich) then
  begin
    Partes := sNombreFich.Split(['_']);
    if Length(Partes) >= 4 then
    begin
      Dia := StrToInt(Partes[1]);
      Mes := StrToInt(Partes[2]);
      Anio := StrToInt(Partes[3]);
    end;
    Result := EncodeDate(Anio, Mes, Dia);
  end
  else
  begin
    ImgData := TImgData.Create;
    try
      try
  //      DebugMsg := 'Procesando archivo...';
        if ImgData.ProcessFile(RutaArchivo) then
        begin
  //        DebugMsg := DebugMsg + #13#10 + 'Archivo procesado OK';
          if ImgData.HasEXIF then
          begin
  //          DebugMsg := DebugMsg + #13#10 + 'Tiene EXIF';
            with ImgData.ExifObj do
            begin
              // Debug: Mostrar todos los intentos
  //            DebugMsg := DebugMsg + #13#10 + 'DateTimeOriginal: ' + DateTimeToStr(DateTimeOriginal);
  //            DebugMsg := DebugMsg + #13#10 + 'DateTimeDigitized: ' + DateTimeToStr(DateTimeDigitized);
  //            DebugMsg := DebugMsg + #13#10 + 'DateTimeModified: ' + DateTimeToStr(DateTimeModified);
              //DebugMsg := DebugMsg + #13#10 + 'DateTime (string): ' + DateTime;
              // Intentar TagValue
  //            DebugMsg := DebugMsg + #13#10 + 'TagValue[DateTimeOriginal]: ' + VarToStr(TagValue['DateTimeOriginal']);
              Result := DateTimeOriginal;
              if Result = 0 then
                Result := DateTimeDigitized;
              if Result = 0 then
                Result := DateTimeModified;
              if Result = 0 then
                Result := TFile.GetCreationTime(RutaArchivo);
  //            DebugMsg := DebugMsg + #13#10 + 'Resultado final: ' + DateTimeToStr(Result);
            end;
          end
          else
            Result := TFile.GetCreationTime(RutaArchivo);
        end
        else
          Result := TFile.GetCreationTime(RutaArchivo);
        //ShowMessage(DebugMsg);
      except
        on E: Exception do
        begin
          Result := TFile.GetCreationTime(RutaArchivo);
        end;
      end;
    finally
      ImgData.Free;
    end;
  end;
end;

procedure TfrmMtoVisorFoto.FormDestroy(Sender: TObject);
begin
  FOriginalBitmap.Free;
  FListaImagenes.Free;
  //FListaMiniaturas.Free;
end;

procedure TfrmMtoVisorFoto.MostrarImagen(const ARutaArchivo: string);
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add(ARutaArchivo);
    MostrarImagenes(Lista, 0);
  finally
    Lista.Free;
  end;
end;

procedure TfrmMtoVisorFoto.MostrarImagenes(const AListaArchivos: TStringList;
  AIndiceInicial: Integer = 0);
begin
  FListaImagenes.Assign(AListaArchivos);
  //FListaMiniaturas.Clear; // Sin miniaturas, se generarán
  FIndiceActual := AIndiceInicial;
  if FListaImagenes.Count > 0 then
  begin
    CargarCarrusel;
    MostrarImagenPorIndice(FIndiceActual);
//    pnlNavigation.Visible := FListaImagenes.Count > 1;
//    pnlCarrusel.Visible := FListaImagenes.Count > 1;
  end;
  ShowModal;
end;

procedure TfrmMtoVisorFoto.MostrarImagenes(cdsFotos:TClientDataSet;
                                           AIndiceInicial: Integer = 0);
begin
//  FListaImagenes.Assign(AListaArchivos);
//  FListaMiniaturas.Assign(AListaMiniaturas);
//  FIndiceActual := AIndiceInicial;
//  if FListaImagenes.Count > 0 then
//  begin
  FClientDataSet := cdsFotos;
  FListaImagenes.Clear; // Limpiar lista antes de cargar

  CargarCarrusel;
   if FListaImagenes.Count > 0 then
    MostrarImagenPorIndice(AIndiceInicial);
//    pnlNavigation.Visible := FListaImagenes.Count > 1;
//    pnlCarrusel.Visible := FListaImagenes.Count > 1;
//  end;
  ShowModal;
//  FZoomFactor := CalcularFactorFit;
//    // Si la imagen ya cabe sin escalar, el factor será 1.0 (no cambia nada)
//  AplicarZoom;
end;

procedure TfrmMtoVisorFoto.CargarImagen(const ARutaArchivo: string);
var
  GPBitmap: TGPBitmap;
  GPGraphics: TGPGraphics;
  Orientacion: Integer;
begin
  Image1.Visible := True;
  Image1.BringToFront;
  try
    // 1. Leer orientación EXIF
    Orientacion := ObtenerOrientacionEXIF(ARutaArchivo);
    // 2. Cargar con GDI+
    GPBitmap := TGPBitmap.Create(ARutaArchivo);
    try
      // 3. Aplicar rotación según EXIF
      case Orientacion of
        3: GPBitmap.RotateFlip(Rotate180FlipNone);
        6: GPBitmap.RotateFlip(Rotate90FlipNone);
        8: GPBitmap.RotateFlip(Rotate270FlipNone);
      end;
      // 4. Convertir a TBitmap
      FOriginalBitmap.Width := GPBitmap.GetWidth;
      FOriginalBitmap.Height := GPBitmap.GetHeight;
      FOriginalBitmap.PixelFormat := pf24bit;
      GPGraphics := TGPGraphics.Create(FOriginalBitmap.Canvas.Handle);
      try
        GPGraphics.SetInterpolationMode(InterpolationModeHighQualityBicubic);
        GPGraphics.DrawImage(GPBitmap, 0, 0,
                            FOriginalBitmap.Width, FOriginalBitmap.Height);
      finally
        GPGraphics.Free;
      end;
      // 5. Aplicar zoom
      FZoomFactor := CalcularFactorFit;
      AplicarZoom;
    finally
      GPBitmap.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Error al cargar la imagen: ' + E.Message);
    end;
  end;
end;

procedure TfrmMtoVisorFoto.MiniaturaClick(Sender: TObject);
begin
  if Sender is TImage then
  begin
    MostrarImagenPorIndice(TImage(Sender).Tag, true);
    ResaltarMiniatura(TImage(Sender).Tag, true);
  end;
end;

procedure TfrmMtoVisorFoto.ResaltarMiniatura(AIndice: Integer;
                                             bClick:Boolean = false);
var
  i: Integer;
  Img: TImage;
  Shap: TShape;
  MiniaturaSeleccionada: TImage;
  AnchoMiniatura: Integer;
  MiniaturasPorPantalla: Integer;
  MiniaturasALaIzquierda: Integer;
  PosicionDestino: Integer;
begin
  MiniaturaSeleccionada := nil;
  // Quitar resaltado de todas y buscar la seleccionada
  for i := 0 to ScrollBoxMiniaturas.ControlCount - 1 do
  begin
    if ScrollBoxMiniaturas.Controls[i] is TShape then
    begin
      Shap := TShape(ScrollBoxMiniaturas.Controls[i]);
      if (Shap.Tag = AIndice) then
      begin
        Shap.Pen.Color := clBlue;
        Shap.Pen.Width := 3;
      end
      else
      begin
        Shap.Pen.Color := clBlack;
        Shap.Pen.Width := 2;
      end;
    end;
    if ScrollBoxMiniaturas.Controls[i] is TImage then
    begin
      Img := TImage(ScrollBoxMiniaturas.Controls[i]);
      if Img.Tag = AIndice then
        MiniaturaSeleccionada := Img;
    end;
  end;
  if not bClick then
  if Assigned(MiniaturaSeleccionada) then
  begin
    // Cada miniatura ocupa 110 píxeles (100 de ancho + 10 de separación)
    AnchoMiniatura := 140;
    // Calcular cuántas miniaturas caben en el área visible
    MiniaturasPorPantalla := ScrollBoxMiniaturas.ClientWidth div AnchoMiniatura;
    // Calcular cuántas miniaturas deberían quedar a la izquierda para centrar la seleccionada
    MiniaturasALaIzquierda := MiniaturasPorPantalla div 2;
    // Calcular la posición de scroll:
    // índice actual menos las que van a la izquierda, multiplicado por el ancho
    PosicionDestino := (AIndice - MiniaturasALaIzquierda) * AnchoMiniatura;
    // Si es negativo, ir al inicio
    if PosicionDestino < 0 then
      PosicionDestino := 0;
    ScrollBoxMiniaturas.HorzScrollBar.Position := PosicionDestino;
    ScrollBoxMiniaturas.Update;
  end;
end;

procedure TfrmMtoVisorFoto.Rotar90dchaClick(Sender: TObject);
var
  BitmapRotado: TBitmap;
  XForm: TXForm;
begin
  if FOriginalBitmap.Empty then Exit;
  Screen.Cursor := crHourGlass;
  try
    BitmapRotado := TBitmap.Create;
    try
      // El ancho del rotado es el alto del original y viceversa
      BitmapRotado.Width := FOriginalBitmap.Height;
      BitmapRotado.Height := FOriginalBitmap.Width;
      BitmapRotado.PixelFormat := FOriginalBitmap.PixelFormat;
      // Configurar el modo de mapeo para rotación
      SetGraphicsMode(BitmapRotado.Canvas.Handle, GM_ADVANCED);
      // Crear la matriz de transformación para rotar 90º a la derecha
      XForm.eM11 := 0;   // Rotación 90º derecha
      XForm.eM12 := 1;
      XForm.eM21 := -1;  // AQUÍ estaba el error, faltaba el signo menos
      XForm.eM22 := 0;
      XForm.eDx := BitmapRotado.Width;  // Traslación en X
      XForm.eDy := 0;    // Traslación en Y
      SetWorldTransform(BitmapRotado.Canvas.Handle, XForm);
      // Dibujar la imagen original con la transformación aplicada
      BitmapRotado.Canvas.Draw(0, 0, FOriginalBitmap);
      // Reemplazar el bitmap original
      FOriginalBitmap.Assign(BitmapRotado);
      // Recalcular zoom y aplicar
      FZoomFactor := CalcularFactorFit;
      AplicarZoom;
    finally
      BitmapRotado.Free;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMtoVisorFoto.MostrarImagenPorIndice(AIndice: Integer;
                                                       bClick: Boolean = false);
begin
  if (AIndice >= 0) and (AIndice < FListaImagenes.Count) then
  begin
    FIndiceActual := AIndice;
    CargarImagen(FListaImagenes[AIndice]);
    ResaltarMiniatura(AIndice, bClick);
    ActualizarBotonesNavegacion;
  end;
end;

function TfrmMtoVisorFoto.CalcularFactorFit: Double;
var
  AnchoBox, AltoBox: Integer;
  RatioW, RatioH: Double;
begin
  // Dimensiones visibles del ScrollBox (excluye scrollbars)
  AnchoBox := ScrollBox1.ClientWidth;
  AltoBox   := ScrollBox1.ClientHeight;

  // Evitamos división por cero (por si la imagen está vacía)
  if (FOriginalBitmap.Width = 0) or (FOriginalBitmap.Height = 0) then
    Exit(1.0);

  // Ratio ancho/alto del contenedor vs. de la imagen
  RatioW := AnchoBox / FOriginalBitmap.Width;
  RatioH := AltoBox   / FOriginalBitmap.Height;

  // El factor que hace que *ambos* lados entren es el menor de los dos
  Result := Min(RatioW, RatioH);
end;

procedure TfrmMtoVisorFoto.CargarCarrusel;
var
  BlobStream: TStream;
  BMPImage: TBitmap;
  Shape : TShape;
  Img: TImage;
  X: Integer;
  HintImg : string;
begin
  // Limpiar miniaturas anteriores
  while ScrollBoxMiniaturas.ControlCount > 0 do
    ScrollBoxMiniaturas.Controls[0].Free;
  if not Assigned(FClientDataSet) or not FClientDataSet.Active then
    Exit;
  X := 5;
  FClientDataSet.First;
  while not FClientDataSet.Eof do
  begin
    FListaImagenes.Add(FClientDataSet.FieldByName('RutaFoto').AsString);
    // Crear miniatura
    Img := TImage.Create(ScrollBoxMiniaturas);
    Img.Parent := ScrollBoxMiniaturas;
    Img.Left := X;
    Img.Top := 5;
    Img.Width := 140;
    Img.Height := 140;
    Img.Stretch := True;
    Img.Proportional := True;
    Img.Center := True;
    Img.Tag := FClientDataSet.FieldByName('Index').AsInteger;
    Img.OnClick := MiniaturaClick;
    Img.Cursor := crHandPoint;
    Img.ShowHint := True;
    Img.Hint := FormatDateTime('dd/mm/yyyy',
             ObtenerFechaExif(FClientDataSet.FieldByName('RutaFoto').AsString));
    // Borde para resaltar
    Shape := TShape.Create(ScrollBoxMiniaturas);
    Shape.Parent := ScrollBoxMiniaturas;
    Shape.Left := Img.Left - 1;
    Shape.Top := Img.Top - 1;
    Shape.Width := Img.Width + 2;
    Shape.Height := Img.Height + 2;
    Shape.Brush.Style := bsClear;
    Shape.Pen.Color := clBlack;
    Shape.Tag := Img.Tag;
    Shape.SendToBack;
    Img.BringToFront;
    // Cargar imagen desde BLOB
    BMPImage := TBitmap.Create;
    try
      BlobStream := FClientDataSet.CreateBlobStream(
                           FClientDataSet.FieldByName('Miniatura'), bmRead);
      try
        BMPImage.LoadFromStream(BlobStream);
        Img.Picture.Graphic := BMPImage;
      finally
        BlobStream.Free;
      end;
    finally
      BMPImage.Free;
    end;
    Inc(X, 150);
    FClientDataSet.Next;
  end;
  // AÑADIR ESTAS LÍNEAS:
  // Forzar actualización del ScrollBox
  ScrollBoxMiniaturas.HorzScrollBar.Range := X + 10;
  // X es la última posición + un margen
  ScrollBoxMiniaturas.Invalidate;
  Application.ProcessMessages;
  // Resaltar la primera miniatura
  if ScrollBoxMiniaturas.ControlCount > 0 then
    ResaltarMiniatura(0);
end;

//procedure TfrmMtoVisorFoto.MostrarImagenPorIndice(AIndice: Integer);
//begin
//  if (AIndice >= 0) and (AIndice < FListaImagenes.Count) then
//  begin
//    FIndiceActual := AIndice;
//    CargarImagen(FListaImagenes[AIndice]);
////    if dxImageSlider1.Images.Count > AIndice then
//    dxImageSlider1.ItemIndex := AIndice;
//    ActualizarBotonesNavegacion;
//  end;
//end;

procedure TfrmMtoVisorFoto.ActualizarBotonesNavegacion;
begin
  btnAnterior.Enabled := FIndiceActual > 0;
  btnSiguiente.Enabled := FIndiceActual < (FListaImagenes.Count - 1);
  if FListaImagenes.Count > 1 then
    Caption := Format('Visor de Imagen (%d/%d) - %s',
      [FIndiceActual + 1, FListaImagenes.Count,
       ExtractFileName(FListaImagenes[FIndiceActual])])
  else
    Caption := 'Visor de Imagen - ' +
                                 ExtractFileName(FListaImagenes[FIndiceActual]);
end;

procedure TfrmMtoVisorFoto.AplicarZoom;
var
  NuevoAncho, NuevoAlto: Integer;
  TempBitmap: TBitmap;
begin
  if FOriginalBitmap.Empty then Exit;
  NuevoAncho := Round(FOriginalBitmap.Width * FZoomFactor);
  NuevoAlto := Round(FOriginalBitmap.Height * FZoomFactor);
  TempBitmap := TBitmap.Create;
  try
    TempBitmap.Width := NuevoAncho;
    TempBitmap.Height := NuevoAlto;
    TempBitmap.Canvas.StretchDraw(
      Rect(0, 0, NuevoAncho, NuevoAlto),
      FOriginalBitmap
    );
    Image1.Picture.Bitmap.Assign(TempBitmap);
    Image1.Width := NuevoAncho;
    Image1.Height := NuevoAlto;
    ActualizarLabelZoom;
  finally
    TempBitmap.Free;
  end;
end;

procedure TfrmMtoVisorFoto.ActualizarLabelZoom;
begin
  lblZoom.Caption := Format('Zoom: %d%%', [Round(FZoomFactor * 100)]);
end;

procedure TfrmMtoVisorFoto.btnZoomInClick(Sender: TObject);
begin
  if FZoomFactor < 5.0 then
  begin
    FZoomFactor := FZoomFactor + 0.25;
    AplicarZoom;
  end;
end;

procedure TfrmMtoVisorFoto.btnZoomOutClick(Sender: TObject);
begin
  if FZoomFactor > 0.25 then
  begin
    FZoomFactor := FZoomFactor - 0.25;
    AplicarZoom;
  end;
end;

procedure TfrmMtoVisorFoto.btnZoom100Click(Sender: TObject);
begin
  FZoomFactor := 1.0;
  AplicarZoom;
end;

procedure TfrmMtoVisorFoto.btnAjustarClick(Sender: TObject);
begin
  if (FIndiceActual >= 0) and (not FOriginalBitmap.Empty) then
  begin
    FZoomFactor := CalcularFactorFit;
    AplicarZoom;
  end;
end;

procedure TfrmMtoVisorFoto.btnAnteriorClick(Sender: TObject);
begin
  if FIndiceActual > 0 then
    MostrarImagenPorIndice(FIndiceActual - 1);
end;

procedure TfrmMtoVisorFoto.btnOpenFolderClick(Sender: TObject);
var
  RutaCarpeta: string;
  RutaArchivoActual: string;
begin
  // Obtener la ruta del archivo actual
  if (FIndiceActual >= 0) and (FIndiceActual < FListaImagenes.Count) then
  begin
    RutaArchivoActual := FListaImagenes[FIndiceActual];
    // Extraer la carpeta del archivo
    RutaCarpeta := ExtractFilePath(RutaArchivoActual);
    // Verificar que existe
    if DirectoryExists(RutaCarpeta) then
    begin
      // Abrir Windows Explorer y seleccionar el archivo actual
      ShellExecute(Application.Handle,
                   'open',
                   'explorer.exe',
                   PChar('/select,"' + RutaArchivoActual + '"'),
                   nil,
                   SW_SHOWNORMAL);
    end
    else
    begin
      ShowMessage('No se encontró la carpeta: ' + RutaCarpeta);
    end;
  end
  else
  begin
    ShowMessage('No hay ningún archivo seleccionado');
  end;
end;

procedure TfrmMtoVisorFoto.btnPrimeraClick(Sender: TObject);
begin
  MostrarImagenPorIndice(0);
end;

procedure TfrmMtoVisorFoto.btnSiguienteClick(Sender: TObject);
begin
  if FIndiceActual < (FListaImagenes.Count - 1) then
    MostrarImagenPorIndice(FIndiceActual + 1);
end;

procedure TfrmMtoVisorFoto.btnUltimaClick(Sender: TObject);
begin
  MostrarImagenPorIndice(FListaImagenes.Count - 1);
end;

//procedure TfrmMtoVisorFoto.dxImageSlider1Click(Sender: TObject);
//begin
//  if dxImageSlider1.ItemIndex >= 0 then
//    MostrarImagenPorIndice(dxImageSlider1.ItemIndex);
//end;

// Y ahora usa esas coordenadas en el DblClick:

procedure TfrmMtoVisorFoto.Image1DblClick(Sender: TObject);
var
  PuntoClick: TPoint;
  PuntoEnImagenActual: TPoint;
  PuntoEnOriginal: TPoint;
  // Configuración de cuadrícula
  NumColumnas, NumFilas: Integer;
  AnchoZonaOriginal, AltoZonaOriginal: Double;
  ColumnaClick, FilaClick: Integer;
  // Coordenadas de la zona seleccionada en imagen original
  CentroZonaX, CentroZonaY: Double;
  // Zoom
  ZoomNecesarioX, ZoomNecesarioY, NuevoZoom: Double;
  NuevaPosScroll: TPoint;
  FactorFit: Double;
begin
  if FOriginalBitmap.Empty then Exit;
  FactorFit := CalcularFactorFit;
  // Si ya hay zoom (más que fit + 10%), volver a fit
  if FZoomFactor > (FactorFit * 1.1) then
  begin
    FZoomFactor := FactorFit;
    AplicarZoom;
    Exit;
  end;
  // Dividir en cuadrícula 4x4 (máximo 16 zonas)
  NumColumnas := 4;
  NumFilas := 4;
  // Obtener posición del click en pantalla
  GetCursorPos(PuntoClick);
  // Convertir a coordenadas del ScrollBox
  PuntoClick := ScrollBox1.ScreenToClient(PuntoClick);
  // Validar que el click está dentro del área del ScrollBox
  if (PuntoClick.X < 0) or (PuntoClick.X >= ScrollBox1.ClientWidth) or
     (PuntoClick.Y < 0) or (PuntoClick.Y >= ScrollBox1.ClientHeight) then
    Exit;
  // Coordenadas absolutas en la imagen escalada actual
  PuntoEnImagenActual.X := PuntoClick.X + ScrollBox1.HorzScrollBar.Position;
  PuntoEnImagenActual.Y := PuntoClick.Y + ScrollBox1.VertScrollBar.Position;
  // Convertir a coordenadas de la imagen ORIGINAL
  PuntoEnOriginal.X := Round(PuntoEnImagenActual.X / FZoomFactor);
  PuntoEnOriginal.Y := Round(PuntoEnImagenActual.Y / FZoomFactor);
  // Validar que está dentro de la imagen original
  if (PuntoEnOriginal.X < 0) or (PuntoEnOriginal.X >= FOriginalBitmap.Width) or
     (PuntoEnOriginal.Y < 0) or (PuntoEnOriginal.Y >= FOriginalBitmap.Height) then
    Exit;
  // Tamaño de cada zona en la imagen ORIGINAL
  AnchoZonaOriginal := FOriginalBitmap.Width / NumColumnas;
  AltoZonaOriginal := FOriginalBitmap.Height / NumFilas;
  // Determinar en qué columna y fila se hizo click
  ColumnaClick := Trunc(PuntoEnOriginal.X / AnchoZonaOriginal);
  FilaClick := Trunc(PuntoEnOriginal.Y / AltoZonaOriginal);
  // Asegurar que no se salga del rango
  if ColumnaClick >= NumColumnas then ColumnaClick := NumColumnas - 1;
  if FilaClick >= NumFilas then FilaClick := NumFilas - 1;
  if ColumnaClick < 0 then ColumnaClick := 0;
  if FilaClick < 0 then FilaClick := 0;
  // Calcular el centro de la zona en coordenadas originales
  CentroZonaX := (ColumnaClick * AnchoZonaOriginal) + (AnchoZonaOriginal / 2);
  CentroZonaY := (FilaClick * AltoZonaOriginal) + (AltoZonaOriginal / 2);
  // Calcular zoom necesario para que esta zona llene la pantalla
  ZoomNecesarioX := ScrollBox1.ClientWidth / AnchoZonaOriginal;
  ZoomNecesarioY := ScrollBox1.ClientHeight / AltoZonaOriginal;
  // Usar el menor para que toda la zona sea visible
  NuevoZoom := Min(ZoomNecesarioX, ZoomNecesarioY);
  // Limitar zoom máximo
  if NuevoZoom > 5.0 then NuevoZoom := 5.0;
  // Aplicar el nuevo zoom
  FZoomFactor := NuevoZoom;
  AplicarZoom;
  // Calcular scroll para centrar la zona
  NuevaPosScroll.X := Round((CentroZonaX * FZoomFactor) - (ScrollBox1.ClientWidth / 2.0));
  NuevaPosScroll.Y := Round((CentroZonaY * FZoomFactor) - (ScrollBox1.ClientHeight / 2.0));
  // Aplicar límites
  NuevaPosScroll.X := Max(0, Min(NuevaPosScroll.X, Image1.Width - ScrollBox1.ClientWidth));
  NuevaPosScroll.Y := Max(0, Min(NuevaPosScroll.Y, Image1.Height - ScrollBox1.ClientHeight));
  if NuevaPosScroll.X < 0 then NuevaPosScroll.X := 0;
  if NuevaPosScroll.Y < 0 then NuevaPosScroll.Y := 0;
  // Aplicar scroll
  ScrollBox1.HorzScrollBar.Position := NuevaPosScroll.X;
  ScrollBox1.VertScrollBar.Position := NuevaPosScroll.Y;
end;

procedure TfrmMtoVisorFoto.Image1MouseDown(Sender: TObject;
                                           Button: TMouseButton;
                                           Shift: TShiftState;
                                           X, Y: Integer);
begin
  // Guardar posición del mouse
//  FLastMouseX := X;
//  FLastMouseY := Y;
  if Button = mbLeft then
  begin
    FIsDragging := True;
    FDragStartX := X;
    FDragStartY := Y;
    FScrollStartX := ScrollBox1.HorzScrollBar.Position;
    FScrollStartY := ScrollBox1.VertScrollBar.Position;
    Image1.Cursor := crDrag;
  end;
end;
procedure TfrmMtoVisorFoto.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  DeltaX, DeltaY: Integer;
begin
  if FIsDragging then
  begin
    DeltaX := FDragStartX - X;
    DeltaY := FDragStartY - Y;
    ScrollBox1.HorzScrollBar.Position := FScrollStartX + DeltaX;
    ScrollBox1.VertScrollBar.Position := FScrollStartY + DeltaY;
  end;
end;

procedure TfrmMtoVisorFoto.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FIsDragging := False;
    Image1.Cursor := crHandPoint;
  end;
end;

procedure TfrmMtoVisorFoto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Close;
    VK_ADD, 187: btnZoomInClick(nil);      // + o =
    VK_SUBTRACT, 189: btnZoomOutClick(nil); // -
    VK_MULTIPLY: btnZoom100Click(nil);      // *
    VK_LEFT: btnAnteriorClick(nil);         // Flecha izquierda
    VK_RIGHT: btnSiguienteClick(nil);       // Flecha derecha
    VK_HOME: MostrarImagenPorIndice(0);     // Inicio - primera imagen
    VK_END: MostrarImagenPorIndice(FListaImagenes.Count - 1); // Fin - última imagen
  end;
end;

procedure TfrmMtoVisorFoto.FormResize(Sender: TObject);
begin
  if (FIndiceActual >= 0) and (not FOriginalBitmap.Empty) then
  begin
    FZoomFactor := CalcularFactorFit;
    AplicarZoom;
  end;
end;

function TfrmMtoVisorFoto.ObtenerOrientacionEXIF(const ARutaImagen: string): Integer;
var
  Image: TGPImage;
  PropItem: PPropertyItem;
  PropSize: UINT;
begin
  Result := 1; // Valor por defecto (sin rotación)
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

end.
