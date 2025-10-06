unit inMtoModalVisorFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Jpeg, Buttons;

type
  TfrmMtoVisorFoto = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    pnlZoom: TPanel;
    btnZoomIn: TSpeedButton;
    btnZoomOut: TSpeedButton;
    btnZoom100: TSpeedButton;
    lblZoom: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure btnZoom100Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1DblClick(Sender: TObject);
  private
    FZoomFactor: Double;
    FIsDragging: Boolean;
    FDragStartX, FDragStartY: Integer;
    FScrollStartX, FScrollStartY: Integer;
    FOriginalBitmap: TBitmap;
    procedure CargarImagen(const ARutaArchivo: string);
    procedure AplicarZoom;
    procedure ActualizarLabelZoom;
  public
    procedure MostrarImagen(const ARutaArchivo: string);
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
  
  // Configurar cursor de mano para arrastrar
  Image1.Cursor := crHandPoint;
  
  // Configurar ventana
  KeyPreview := True;
  WindowState := wsMaximized;
end;

procedure TfrmMtoVisorFoto.MostrarImagen(const ARutaArchivo: string);
begin
  CargarImagen(ARutaArchivo);
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
    FZoomFactor := 1.0;
    AplicarZoom;
    
    Caption := 'Visor de Imagen - ' + ExtractFileName(ARutaArchivo);
  finally
    JPEGImage.Free;
  end;
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
    
    // Dibujar imagen escalada
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
    VK_ADD, 187: btnZoomInClick(nil);  // + o =
    VK_SUBTRACT, 189: btnZoomOutClick(nil);  // -
    VK_MULTIPLY: btnZoom100Click(nil);  // *
  end;
end;

end.
