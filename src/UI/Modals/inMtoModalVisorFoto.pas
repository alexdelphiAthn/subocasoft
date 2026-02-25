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
    procedure FormDestroy(Sender: TObject);
    procedure btnPrimeraClick(Sender: TObject);
    procedure btnUltimaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Rotar90dchaClick(Sender: TObject);
    procedure btnAjustarClick(Sender: TObject);
    procedure btnOpenFolderClick(Sender: TObject);
  private
    FTargetScrollX: Integer;
    FTargetScrollY: Integer;
    FScrollRetryCount: Integer;
    function ObtenerOrientacionEXIF(const ARutaImagen: string): Integer;
    function ObtenerFechaExif(const RutaArchivo: string): TDateTime;
  private
    FZoomFactor: Double;
    FIsDragging: Boolean;
    FDragStartX, FDragStartY: Integer;
    FScrollStartX, FScrollStartY: Integer;
    FOriginalBitmap: TBitmap;
    FListaImagenes: TStringList;
    FIndiceActual: Integer;
    FClientDataSet: TClientDataSet;
    FDragStartPos: TPoint;
    FScrollStart: TPoint;
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
  FIndiceActual := -1;
  Image1.Cursor := crHandPoint;
  KeyPreview := True;
  WindowState := wsMaximized;
  pnlCarrusel.Height := 170;
  pnlCarrusel.Align := alBottom;
end;

function TfrmMtoVisorFoto.ObtenerFechaExif(const RutaArchivo: string): TDateTime;
begin
  Result := TImageUtils.ObtenerFechaExif(RutaArchivo);
end;

procedure TfrmMtoVisorFoto.FormDestroy(Sender: TObject);
begin
  FOriginalBitmap.Free;
  FListaImagenes.Free;
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
  FIndiceActual := AIndiceInicial;
  if FListaImagenes.Count > 0 then
  begin
    CargarCarrusel;
    MostrarImagenPorIndice(FIndiceActual);
  end;
  ShowModal;
end;

procedure TfrmMtoVisorFoto.MostrarImagenes(cdsFotos:TClientDataSet;
                                                   AIndiceInicial: Integer = 0);
begin
  FClientDataSet := cdsFotos;
  FListaImagenes.Clear; // Limpiar lista antes de cargar
  CargarCarrusel;
   if FListaImagenes.Count > 0 then
    MostrarImagenPorIndice(AIndiceInicial);
  ShowModal;
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
    Orientacion := ObtenerOrientacionEXIF(ARutaArchivo);
    GPBitmap := TGPBitmap.Create(ARutaArchivo);
    try
      case Orientacion of
        3: GPBitmap.RotateFlip(Rotate180FlipNone);
        6: GPBitmap.RotateFlip(Rotate90FlipNone);
        8: GPBitmap.RotateFlip(Rotate270FlipNone);
      end;
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
    AnchoMiniatura := 140;
    MiniaturasPorPantalla := ScrollBoxMiniaturas.ClientWidth div AnchoMiniatura;
    MiniaturasALaIzquierda := MiniaturasPorPantalla div 2;
    PosicionDestino := (AIndice - MiniaturasALaIzquierda) * AnchoMiniatura;
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
      BitmapRotado.Width := FOriginalBitmap.Height;
      BitmapRotado.Height := FOriginalBitmap.Width;
      BitmapRotado.PixelFormat := FOriginalBitmap.PixelFormat;
      SetGraphicsMode(BitmapRotado.Canvas.Handle, GM_ADVANCED);
      XForm.eM11 := 0;   // Rotación 90º derecha
      XForm.eM12 := 1;
      XForm.eM21 := -1;
      XForm.eM22 := 0;
      XForm.eDx := BitmapRotado.Width;
      XForm.eDy := 0;    // Traslación en Y
      SetWorldTransform(BitmapRotado.Canvas.Handle, XForm);
      BitmapRotado.Canvas.Draw(0, 0, FOriginalBitmap);
      FOriginalBitmap.Assign(BitmapRotado);
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
  AnchoBox := ScrollBox1.ClientWidth;
  AltoBox   := ScrollBox1.ClientHeight;
  if (FOriginalBitmap.Width = 0) or (FOriginalBitmap.Height = 0) then
    Exit(1.0);
  RatioW := AnchoBox / FOriginalBitmap.Width;
  RatioH := AltoBox   / FOriginalBitmap.Height;
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
  while ScrollBoxMiniaturas.ControlCount > 0 do
    ScrollBoxMiniaturas.Controls[0].Free;
  if not Assigned(FClientDataSet) or not FClientDataSet.Active then
    Exit;
  X := 5;
  FClientDataSet.First;
  while not FClientDataSet.Eof do
  begin
    FListaImagenes.Add(FClientDataSet.FieldByName('RutaFoto').AsString);
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
  ScrollBoxMiniaturas.HorzScrollBar.Range := X + 10;
  ScrollBoxMiniaturas.Invalidate;
  Application.ProcessMessages;
  if ScrollBoxMiniaturas.ControlCount > 0 then
    ResaltarMiniatura(0);
end;

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
  if (FZoomFactor < 5.0) then
  begin
    FZoomFactor := FZoomFactor + 0.25;
    AplicarZoom;
  end;
end;

procedure TfrmMtoVisorFoto.btnZoomOutClick(Sender: TObject);
begin
  if (FZoomFactor > 0.25) then
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
  if ((FIndiceActual >= 0) and (not FOriginalBitmap.Empty)) then
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
  if (FIndiceActual >= 0) and (FIndiceActual < FListaImagenes.Count) then
  begin
    RutaArchivoActual := FListaImagenes[FIndiceActual];
    RutaCarpeta := ExtractFilePath(RutaArchivoActual);
    if DirectoryExists(RutaCarpeta) then
    begin
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

procedure TfrmMtoVisorFoto.Image1DblClick(Sender: TObject);
var
  PuntoClick: TPoint;
  PuntoEnImagenActual: TPoint;
  PuntoEnOriginal: TPoint;
  NuevoZoom: Double;
  FactorFit: Double;
  MaxScrollX, MaxScrollY: Integer;
  NuevoAnchoImg, NuevoAltoImg: Integer;
  PuntoGlobalMouse: TPoint;
  PuntoExactoImagen: TPoint;
  PuntoDestino: TPoint;
begin
  if FOriginalBitmap.Empty then Exit;
  GetCursorPos(PuntoGlobalMouse);
  PuntoClick := ScrollBox1.ScreenToClient(PuntoGlobalMouse);
  if (PuntoClick.X < 0) or
     (PuntoClick.X >= ScrollBox1.ClientWidth) or
     (PuntoClick.Y < 0) or
     (PuntoClick.Y >= ScrollBox1.ClientHeight) then
       Exit;
  PuntoExactoImagen := Image1.ScreenToClient(PuntoGlobalMouse);
  PuntoEnOriginal.X := Round(PuntoExactoImagen.X / FZoomFactor);
  PuntoEnOriginal.Y := Round(PuntoExactoImagen.Y / FZoomFactor);
  FIsDragging := False;
  FactorFit := CalcularFactorFit;
  if FZoomFactor < (0.50 - 0.01) then
    NuevoZoom := 0.50
  else if FZoomFactor < (1.0 - 0.01) then
    NuevoZoom := 1.0
  else if FZoomFactor < (1.25 - 0.01) then
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
  FTargetScrollX := Round((PuntoEnOriginal.X * NuevoZoom) - PuntoClick.X);
  FTargetScrollY := Round((PuntoEnOriginal.Y * NuevoZoom) - PuntoClick.Y);
  FZoomFactor := NuevoZoom;
  AplicarZoom;
  ScrollBox1.Realign;
  NuevoAnchoImg := Round(FOriginalBitmap.Width * FZoomFactor);
  NuevoAltoImg := Round(FOriginalBitmap.Height * FZoomFactor);
  MaxScrollX := NuevoAnchoImg - ScrollBox1.ClientWidth;
  MaxScrollY := NuevoAltoImg - ScrollBox1.ClientHeight;
  FTargetScrollX := Max(0, Min(FTargetScrollX, MaxScrollX));
  FTargetScrollY := Max(0, Min(FTargetScrollY, MaxScrollY));
  ScrollBox1.HorzScrollBar.Position := FTargetScrollX;
  ScrollBox1.VertScrollBar.Position := FTargetScrollY;
  PuntoExactoImagen.X := Round(PuntoEnOriginal.X * NuevoZoom);
  PuntoExactoImagen.Y := Round(PuntoEnOriginal.Y * NuevoZoom);
  PuntoDestino := Image1.ClientToScreen(PuntoExactoImagen);
  SetCursorPos(PuntoDestino.X, PuntoDestino.Y);
  FIsDragging := False;
  Image1.Cursor := crHandPoint;
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoVisorFoto.AplicarZoom;
var
  NuevoAncho, NuevoAlto: Integer;
  TempBitmap: TBitmap;
  GPBmp: TGPBitmap;
  DestGraph: TGPGraphics;
begin
  if FOriginalBitmap.Empty then Exit;
  NuevoAncho := Round(FOriginalBitmap.Width * FZoomFactor);
  NuevoAlto := Round(FOriginalBitmap.Height * FZoomFactor);
  TempBitmap := TBitmap.Create;
  try
    TempBitmap.PixelFormat := pf24bit;
    TempBitmap.SetSize(NuevoAncho, NuevoAlto);
    DestGraph := TGPGraphics.Create(TempBitmap.Canvas.Handle);
    try
      GPBmp := TGPBitmap.Create(FOriginalBitmap.Handle,
                                FOriginalBitmap.Palette);
      try
        DestGraph.SetInterpolationMode(InterpolationModeHighQualityBicubic);
        DestGraph.SetSmoothingMode(SmoothingModeHighQuality);
        DestGraph.SetPixelOffsetMode(PixelOffsetModeHighQuality);
        DestGraph.DrawImage(GPBmp, 0, 0, NuevoAncho, NuevoAlto);
      finally
        GPBmp.Free;
      end;
    finally
      DestGraph.Free;
    end;
    Image1.Picture.Assign(TempBitmap);
    Image1.Width := NuevoAncho;
    Image1.Height := NuevoAlto;
    ActualizarLabelZoom;
  finally
    TempBitmap.Free;
  end;
end;

procedure TfrmMtoVisorFoto.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    FIsDragging := False;
    Exit;
  end;
  if Button = mbLeft then
  begin
    FIsDragging := True;
    GetCursorPos(FDragStartPos);
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
    GetCursorPos(CurrentPos);
    DeltaX := FDragStartPos.X - CurrentPos.X;
    DeltaY := FDragStartPos.Y - CurrentPos.Y;
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
    VK_END: MostrarImagenPorIndice(FListaImagenes.Count - 1);
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
