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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dMetaData,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, data.DB,
  datasnap.DBClient, cxClasses, system.math, GDIPAPI, GDIPOBJ, shellapi,
  inlibimageutils;

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
//    procedure Timer1Timer(Sender: TObject);
  private
//    const WM_USER = $0400;
    FTargetScrollX: Integer;
    FTargetScrollY: Integer;
    FScrollRetryCount: Integer;
    //Timer1: TTimer;
//    procedure WMScrollToPosition(var Msg: TMessage); message WM_USER + 100;
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
    //FIsDragging: Boolean;
    FDragStartPos: TPoint; // Usaremos TPoint para guardar X e Y de pantalla
    FScrollStart: TPoint;  // Para guardar la posición inicial de los ScrollBars
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
begin
  Result := TImageUtils.ObtenerFechaExif(RutaArchivo);
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

//procedure TfrmMtoVisorFoto.Image1DblClick(Sender: TObject);
//var
//  PuntoClick: TPoint;
//  PuntoEnImagenActual: TPoint;
//  PuntoEnOriginal: TPoint;
//  NuevoZoom: Double;
//  FactorFit: Double;
//  // Variables para el cálculo seguro de scroll
//  MaxScrollX, MaxScrollY: Integer;
//  NuevoAnchoImg, NuevoAltoImg: Integer;
//begin
//  if FOriginalBitmap.Empty then Exit;
//
//  // 1. Obtener coordenadas ANTES de calcular nada (crítico para la precisión)
//  GetCursorPos(PuntoClick);
//  PuntoClick := ScrollBox1.ScreenToClient(PuntoClick);
//
//  // Validar click dentro del área visible
//  if (PuntoClick.X < 0) or (PuntoClick.X >= ScrollBox1.ClientWidth) or
//     (PuntoClick.Y < 0) or (PuntoClick.Y >= ScrollBox1.ClientHeight) then Exit;
//
//  // Resetear arrastre por seguridad
//  FIsDragging := False;
//
//  // --- LÓGICA DE NIVELES DE ZOOM (MEJORADA) ---
//  FactorFit := CalcularFactorFit;
//
//  // Ciclo de Zoom: Fit -> 1.7 -> 2.2 -> Fit
//  if FZoomFactor < (1.7 - 0.01) then
//    NuevoZoom := 1.7
//  else if FZoomFactor < (2.5 - 0.01) then
//    NuevoZoom := 2.5
//  else
//    NuevoZoom := FactorFit; // Si ya está grande, volver a encajar (Reset)
//
//  // Seguridad: no permitir zoom menor al fit
//  if NuevoZoom < FactorFit then NuevoZoom := FactorFit;
//
//  // Si el zoom no cambia realmente, salir
//  if Abs(NuevoZoom - FZoomFactor) < 0.01 then Exit;
//
//  // --- CÁLCULO DEL PUNTO EN LA IMAGEN ORIGINAL ---
//  // Calculamos qué pixel de la imagen original está bajo el ratón AHORA
//  PuntoEnImagenActual.X := PuntoClick.X + ScrollBox1.HorzScrollBar.Position;
//  PuntoEnImagenActual.Y := PuntoClick.Y + ScrollBox1.VertScrollBar.Position;
//
//  PuntoEnOriginal.X := Round(PuntoEnImagenActual.X / FZoomFactor);
//  PuntoEnOriginal.Y := Round(PuntoEnImagenActual.Y / FZoomFactor);
//
//  // --- CÁLCULO DE LA NUEVA POSICIÓN DE SCROLL ---
//  // OBJETIVO: Que (PuntoOriginal * NuevoZoom) caiga exactamente en PuntoClick
//  FTargetScrollX := Round((PuntoEnOriginal.X * NuevoZoom) - PuntoClick.X);
//  FTargetScrollY := Round((PuntoEnOriginal.Y * NuevoZoom) - PuntoClick.Y);
//
//  // --- APLICACIÓN DEL ZOOM ---
//  LockWindowUpdate(ScrollBox1.Handle);
//  try
//    FZoomFactor := NuevoZoom;
//    AplicarZoom; // Se asume que esto redimensiona el TImage o repinta el Bitmap
//
//    // Calcular límites reales basados en el nuevo tamaño
//    NuevoAnchoImg := Round(FOriginalBitmap.Width * FZoomFactor);
//    NuevoAltoImg := Round(FOriginalBitmap.Height * FZoomFactor);
//
//    MaxScrollX := NuevoAnchoImg - ScrollBox1.ClientWidth;
//    MaxScrollY := NuevoAltoImg - ScrollBox1.ClientHeight;
//
//    // Ajustar límites (Clamp)
//    // Nota: Usamos Max(0, ...) porque si la imagen es menor que el cliente, el scroll debe ser 0
//    FTargetScrollX := Max(0, Min(FTargetScrollX, MaxScrollX));
//    FTargetScrollY := Max(0, Min(FTargetScrollY, MaxScrollY));
//
//    // Aplicar Scroll
//    ScrollBox1.HorzScrollBar.Position := FTargetScrollX;
//    ScrollBox1.VertScrollBar.Position := FTargetScrollY;
//  finally
//    LockWindowUpdate(0);
//    // Restaurar estado
//    FIsDragging := False;
//    Image1.Cursor := crHandPoint;
//    Screen.Cursor := crDefault;
//  end;
//end;

procedure TfrmMtoVisorFoto.Image1DblClick(Sender: TObject);
var
  PuntoClick: TPoint;
  PuntoEnImagenActual: TPoint;
  PuntoEnOriginal: TPoint;
  NuevoZoom: Double;
  FactorFit: Double;
  // Variables para el cálculo seguro de scroll
  MaxScrollX, MaxScrollY: Integer;
  NuevoAnchoImg, NuevoAltoImg: Integer;
  // --- NUEVO: Variables para mover el ratón ---
  PuntoGlobalMouse: TPoint;
  PuntoExactoImagen: TPoint;
  PuntoDestino: TPoint;
begin
  if FOriginalBitmap.Empty then Exit;
  // 1. CAPTURAR POSICIÓN GLOBAL DEL RATÓN (Necesaria para moverlo luego)
  GetCursorPos(PuntoGlobalMouse);
  // Obtener coordenadas locales para validación
  PuntoClick := ScrollBox1.ScreenToClient(PuntoGlobalMouse);
  // Validar click dentro del área visible
  if (PuntoClick.X < 0) or (PuntoClick.X >= ScrollBox1.ClientWidth) or
     (PuntoClick.Y < 0) or (PuntoClick.Y >= ScrollBox1.ClientHeight) then Exit;
  // --- CORRECCIÓN CRÍTICA: OBTENER EL PUNTO REAL EN LA IMAGEN ---
  // Usamos ScreenToClient de la Imagen (no del ScrollBox) para ignorar bordes grises
  // Esto arregla el problema de "me pone una imagen que no es"
  PuntoExactoImagen := Image1.ScreenToClient(PuntoGlobalMouse);
  // Convertimos a coordenadas del bitmap original (base 1.0)
  PuntoEnOriginal.X := Round(PuntoExactoImagen.X / FZoomFactor);
  PuntoEnOriginal.Y := Round(PuntoExactoImagen.Y / FZoomFactor);
  FIsDragging := False;
  // --- LÓGICA DE NIVELES DE ZOOM ---
  FactorFit := CalcularFactorFit;
  if FZoomFactor < (1.25 - 0.01) then
    NuevoZoom := 1.25
  else if FZoomFactor < (1.5 - 0.01) then
    NuevoZoom := 1.5
  else if FZoomFactor < (1.7 - 0.01) then
    NuevoZoom := 1.7
  else if FZoomFactor < (2.2 - 0.01) then
    NuevoZoom := 2.2
  else
    NuevoZoom := FactorFit;
  if NuevoZoom < FactorFit then NuevoZoom := FactorFit;
  if Abs(NuevoZoom - FZoomFactor) < 0.01 then Exit;
  // --- CÁLCULO DE LA NUEVA POSICIÓN DE SCROLL ---
  // Intentamos mover el scroll para que el punto quede bajo el ratón.
  // Usamos la posición original del ratón (PuntoClick) como referencia.
  FTargetScrollX := Round((PuntoEnOriginal.X * NuevoZoom) - PuntoClick.X);
  FTargetScrollY := Round((PuntoEnOriginal.Y * NuevoZoom) - PuntoClick.Y);
  // --- APLICACIÓN DEL ZOOM ---
  // No usamos LockWindowUpdate aquí para que el salto del ratón se vea fluido
  // (O puedes usarlo, pero SetCursorPos debe ir después)
  FZoomFactor := NuevoZoom;
  AplicarZoom;
  // Forzar reajuste del ScrollBox antes de calcular límites
  ScrollBox1.Realign;
  // Calcular límites reales
  NuevoAnchoImg := Round(FOriginalBitmap.Width * FZoomFactor);
  NuevoAltoImg := Round(FOriginalBitmap.Height * FZoomFactor);
  MaxScrollX := NuevoAnchoImg - ScrollBox1.ClientWidth;
  MaxScrollY := NuevoAltoImg - ScrollBox1.ClientHeight;
  // Ajustar límites (Clamp)
  FTargetScrollX := Max(0, Min(FTargetScrollX, MaxScrollX));
  FTargetScrollY := Max(0, Min(FTargetScrollY, MaxScrollY));
  // Aplicar Scroll
  ScrollBox1.HorzScrollBar.Position := FTargetScrollX;
  ScrollBox1.VertScrollBar.Position := FTargetScrollY;
  // =========================================================================
  // --- NUEVO: MOVER EL RATÓN FÍSICAMENTE (SETCURSORPOS) ---
  // =========================================================================
  // Calculamos dónde ha acabado EXACTAMENTE ese píxel en la pantalla
  // tras aplicar el Zoom y el Scroll (que puede haber chocado con el borde).
  // 1. Dónde está el punto en la nueva imagen agrandada
  PuntoExactoImagen.X := Round(PuntoEnOriginal.X * NuevoZoom);
  PuntoExactoImagen.Y := Round(PuntoEnOriginal.Y * NuevoZoom);
  // 2. Convertimos esa coordenada interna a coordenada de PANTALLA
  // Image1 ya se ha movido y redimensionado, así que esto nos da la posición real visual.
  PuntoDestino := Image1.ClientToScreen(PuntoExactoImagen);
  // 3. Teletransportamos el ratón a ese punto
  SetCursorPos(PuntoDestino.X, PuntoDestino.Y);
  // Restaurar estado
  FIsDragging := False;
  Image1.Cursor := crHandPoint;
  Screen.Cursor := crDefault;
end;

//procedure TfrmMtoVisorFoto.Timer1Timer(Sender: TObject);
//begin
////  Timer1.Enabled := False;
////  // Asegurar que el estado es correcto
////  FIsDragging := False;
////  Image1.Cursor := crHandPoint;
////  Screen.Cursor := crDefault;
////  if (ScrollBox1.HorzScrollBar.Position <> FTargetScrollX) or
////     (ScrollBox1.VertScrollBar.Position <> FTargetScrollY) then
////  begin
////    ScrollBox1.HorzScrollBar.Position := FTargetScrollX;
////    ScrollBox1.VertScrollBar.Position := FTargetScrollY;
////  end;
//end;

// Y restaurar AplicarZoom a su versión original SIN Visible := False
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
    TempBitmap.PixelFormat := pf24bit;
    TempBitmap.Width := NuevoAncho;
    TempBitmap.Height := NuevoAlto;
    // Activar interpolación para mejor calidad
    SetStretchBltMode(TempBitmap.Canvas.Handle, HALFTONE);
    SetBrushOrgEx(TempBitmap.Canvas.Handle, 0, 0, nil);
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

//procedure TfrmMtoVisorFoto.Image1MouseDown(Sender: TObject;
//                                           Button: TMouseButton;
//                                           Shift: TShiftState;
//                                           X, Y: Integer);
//begin
//  // Guardar posición del mouse
////  FLastMouseX := X;
////  FLastMouseY := Y;
//  if (ssDouble in Shift) then Exit;
//  if Button = mbLeft then
//  begin
//    FIsDragging := True;
//    FDragStartX := X;
//    FDragStartY := Y;
//    FScrollStartX := ScrollBox1.HorzScrollBar.Position;
//    FScrollStartY := ScrollBox1.VertScrollBar.Position;
//    Image1.Cursor := crDrag;
//  end;
//end;

//procedure TfrmMtoVisorFoto.Image1MouseDown(Sender: TObject;
//  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//begin
//  // 1. Lógica para el botón DERECHO (Ajustar / Fit)
//  if Button = mbRight then
//  begin
//    FIsDragging := False;
//    FZoomFactor := CalcularFactorFit; // Tu función que calcula el ajuste a ventana
//    LockWindowUpdate(ScrollBox1.Handle);
//    try
//      AplicarZoom;
//      // Centrar scrollbars a 0,0 al ajustar
//      ScrollBox1.HorzScrollBar.Position := 0;
//      ScrollBox1.VertScrollBar.Position := 0;
//    finally
//      LockWindowUpdate(0);
//      Image1.Cursor := crHandPoint;
//    end;
//    Exit; // Salimos para no procesar arrastre
//  end;
//  // 2. Evitar conflicto si es doble click
//  if (ssDouble in Shift) then Exit;
//  // 3. Lógica normal de arrastre (Botón Izquierdo)
//  if Button = mbLeft then
//  begin
//    FIsDragging := True;
//    FDragStartX := X;
//    FDragStartY := Y;
//    FScrollStartX := ScrollBox1.HorzScrollBar.Position;
//    FScrollStartY := ScrollBox1.VertScrollBar.Position;
//    Image1.Cursor := crDrag;
//  end;
//end;
//
//procedure TfrmMtoVisorFoto.Image1MouseMove(Sender: TObject; Shift: TShiftState;
//  X, Y: Integer);
//var
//  DeltaX, DeltaY: Integer;
//begin
//  if FIsDragging then
//  begin
//    DeltaX := FDragStartX - X;
//    DeltaY := FDragStartY - Y;
//    ScrollBox1.HorzScrollBar.Position := FScrollStartX + DeltaX;
//    ScrollBox1.VertScrollBar.Position := FScrollStartY + DeltaY;
//  end;
//end;
//
//procedure TfrmMtoVisorFoto.Image1MouseUp(Sender: TObject; Button: TMouseButton;
//  Shift: TShiftState; X, Y: Integer);
//begin
//  if Button = mbLeft then
//  begin
//    FIsDragging := False;
//    Image1.Cursor := crHandPoint;
//  end;
//end;

procedure TfrmMtoVisorFoto.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // 1. Lógica botón DERECHO (Reset / Fit)
  if Button = mbRight then
  begin
    FIsDragging := False;
    // ... tu lógica de zoom existente ...
    Exit;
  end;

  // 2. Lógica botón IZQUIERDO (Iniciar Arrastre)
  if Button = mbLeft then
  begin
    FIsDragging := True;

    // IMPORTANTE: Guardamos la posición absoluta del ratón en la pantalla
    GetCursorPos(FDragStartPos);

    // Guardamos la posición actual de los scrolls
    FScrollStart.X := ScrollBox1.HorzScrollBar.Position;
    FScrollStart.Y := ScrollBox1.VertScrollBar.Position;

    Image1.Cursor := crDrag; // O crSizeAll
  end;
end;

procedure TfrmMtoVisorFoto.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  CurrentPos: TPoint;
  DeltaX, DeltaY: Integer;
begin
  if FIsDragging then
  begin
    // Obtenemos la posición actual del ratón en pantalla
    GetCursorPos(CurrentPos);

    // Calculamos cuánto se ha movido el ratón desde el clic inicial
    // Nota: Restamos DragStart - Current para invertir el movimiento (efecto "mano")
    DeltaX := FDragStartPos.X - CurrentPos.X;
    DeltaY := FDragStartPos.Y - CurrentPos.Y;

    // Aplicamos el desplazamiento a los ScrollBars
    ScrollBox1.HorzScrollBar.Position := FScrollStart.X + DeltaX;
    ScrollBox1.VertScrollBar.Position := FScrollStart.Y + DeltaY;
  end;
end;

procedure TfrmMtoVisorFoto.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FIsDragging and (Button = mbLeft) then
  begin
    FIsDragging := False;
    Image1.Cursor := crDefault; // O crHandPoint
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
begin
  Result := TImageUtils.ObtenerOrientacionEXIF(ARutaImagen);
end;

end.
