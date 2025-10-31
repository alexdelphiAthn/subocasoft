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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxImageSlider, data.DB,
  datasnap.DBClient, cxClasses, system.math;
type
  TfrmMtoVisorFoto = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    pnlNavigation: TPanel;
    pnlCarrusel: TPanel;
    btnAnterior: TSpeedButton;
    btnSiguiente: TSpeedButton;
    pnlZoom: TPanel;
    lblZoom: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btnPrimera: TSpeedButton;
    btnUltima: TSpeedButton;
    ScrollBoxMiniaturas: TScrollBox;
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
    procedure CargarImagen(const ARutaArchivo: string);
    procedure AplicarZoom;
    procedure ActualizarLabelZoom;
    procedure CargarCarrusel;
    procedure ActualizarBotonesNavegacion;
    procedure MostrarImagenPorIndice(AIndice: Integer);
    procedure ResaltarMiniatura(AIndice: Integer);
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
  pnlCarrusel.Height := 130;
  pnlCarrusel.Align := alBottom;
  // Ocultar navegación por defecto
  //pnlNavigation.Visible := False;
  //pnlCarrusel.Visible := False;
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
    CargarCarrusel;
    MostrarImagenPorIndice(AIndiceInicial);
//    pnlNavigation.Visible := FListaImagenes.Count > 1;
//    pnlCarrusel.Visible := FListaImagenes.Count > 1;
//  end;
  ShowModal;
end;

procedure TfrmMtoVisorFoto.CargarImagen(const ARutaArchivo: string);
var
  JPEGImage: TJPEGImage;
begin
  JPEGImage := TJPEGImage.Create;
  try
    JPEGImage.LoadFromFile(ARutaArchivo);
    FOriginalBitmap.Assign(JPEGImage);
    // Resetear zoom
    FZoomFactor := CalcularFactorFit;
    // Si la imagen ya cabe sin escalar, el factor será 1.0 (no cambia nada)
    AplicarZoom;
  finally
    JPEGImage.Free;
  end;
end;

procedure TfrmMtoVisorFoto.MiniaturaClick(Sender: TObject);
begin
  if Sender is TImage then
  begin
    MostrarImagenPorIndice(TImage(Sender).Tag);
    ResaltarMiniatura(TImage(Sender).Tag);
  end;
end;

procedure TfrmMtoVisorFoto.ResaltarMiniatura(AIndice: Integer);
var
  i: Integer;
  Img: TImage;
  Shap:TShape;
begin
  // Quitar resaltado de todas
  for i := 0 to ScrollBoxMiniaturas.ControlCount - 1 do
  begin
    if ScrollBoxMiniaturas.Controls[i] is TShape then
    begin
      Shap := TShape(ScrollBoxMiniaturas.Controls[i]);
      if (Shap.Tag = AIndice) then
      begin
        Shap.Pen.Color := clBlue;
        Shap.Pen.Width := 2;
      end
      else
        begin
          Shap.Pen.Color := clBlack;
          Shap.Pen.Width := 1;
        end;
    end;
//    if ScrollBoxMiniaturas.Controls[i] is TImage then
//    begin
//      Img := TImage(ScrollBoxMiniaturas.Controls[i]);
//      if Img.Tag = AIndice then
//      begin
//        // Resaltar la seleccionada
//        //Img.BorderStyle := bsSingle;
//        Shape.Pen.Color := clYellow;
//        TPanel(Img.Parent).Color := clHighlight;
//      end
//      else
//      begin
//        // Normal
//        //Img.BorderStyle := bsNone;
//      end;
//    end;
  end;
end;

procedure TfrmMtoVisorFoto.MostrarImagenPorIndice(AIndice: Integer);
begin
  if (AIndice >= 0) and (AIndice < FListaImagenes.Count) then
  begin
    FIndiceActual := AIndice;
    CargarImagen(FListaImagenes[AIndice]);
    ResaltarMiniatura(AIndice);
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
    Img.Width := 100;
    Img.Height := 100;
    Img.Stretch := True;
    Img.Proportional := True;
    Img.Center := True;
    Img.Tag := FClientDataSet.FieldByName('Index').AsInteger; // Índice
    Img.OnClick := MiniaturaClick;
    Img.Cursor := crHandPoint;
    Img.ShowHint := True;
    //HintImg := FClientDataSet.FieldByName('NombreArchivo').AsString;
    HintImg := HintImg + #13#10 + 'Fecha: ' + FormatDateTime('dd/mm/yyyy hh:nn',
                                FClientDataSet.FieldByName('Fecha').AsDateTime);
    Img.Hint := HintImg;
    // Borde para resaltar
    //Img.ParentBackground := False;
    Shape := TShape.Create(ScrollBoxMiniaturas);
    Shape.Parent := ScrollBoxMiniaturas;
    Shape.Left := Img.Left - 1;
    Shape.Top := Img.Top - 1;
    Shape.Width := Img.Width + 2;  // ancho imagen + 2
    Shape.Height := Img.Height + 2; // alto imagen + 2
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

    Inc(X, 110); // Espacio entre miniaturas
    FClientDataSet.Next;
  end;

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

procedure TfrmMtoVisorFoto.btnAnteriorClick(Sender: TObject);
begin
  if FIndiceActual > 0 then
    MostrarImagenPorIndice(FIndiceActual - 1);
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

procedure TfrmMtoVisorFoto.Image1DblClick(Sender: TObject);
begin
  btnZoomInClick(Sender);
end;

procedure TfrmMtoVisorFoto.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
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
end.
