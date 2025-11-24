unit inMtoGenerarQR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvImage, DelphiZXIngQRCode;

type
  TfrmMtoGenerarQR = class(TForm)
    edtText: TEdit;
    btnGenerarQR: TButton;
    pb1: TPaintBox;
    procedure btnGenerarQRClick(Sender: TObject);
    procedure pb1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
 private
    QRCodeBitmap: TBitmap;

  public
    function GetQRImage(sUrl:String):TBitmap;
  end;

var
  frmMtoGenerarQR: TfrmMtoGenerarQR;

implementation

{$R *.dfm}

procedure TfrmMtoGenerarQR.FormCreate(Sender: TObject);
begin
  QRCodeBitmap := TBitmap.Create;
end;

procedure TfrmMtoGenerarQR.FormDestroy(Sender: TObject);
begin
  FreeAndNil(QRCodeBitmap);
end;

function TfrmMtoGenerarQR.GetQRImage(sUrl: String): TBitmap;
begin
  edtText.Text := sUrl;
  btnGenerarQRClick(Self);
  Result := TBitmap.Create;
  Result.Assign(QRCodeBitmap);
end;
//
procedure TfrmMtoGenerarQR.pb1Paint(Sender: TObject);
var
  Scale: Double;
begin
  PB1.Canvas.Brush.Color := clWhite;
  PB1.Canvas.FillRect(Rect(0, 0, PB1.Width, PB1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (PB1.Width < PB1.Height) then
    begin
      Scale := PB1.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := PB1.Height / QRCodeBitmap.Height;
    end;
    PB1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width),
                           Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;


procedure TfrmMtoGenerarQR.btnGenerarQRClick(Sender: TObject);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  Scale: Integer;  // ¡AÑADIR ESTA VARIABLE!
  x, y: Integer;   // ¡AÑADIR ESTAS VARIABLES!
begin
  Scale := 8;  // ¡ESTA ES LA CLAVE! 8 píxeles por módulo
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := edtText.Text;
    QRCode.Encoding := TQRCodeEncoding(qrUTF8NoBOM);
    QRCode.QuietZone := 4;

    // CAMBIO PRINCIPAL: Multiplicar por Scale
    QRCodeBitmap.Width := QRCode.Columns * Scale;   // En lugar de QRCode.Columns
    QRCodeBitmap.Height := QRCode.Rows * Scale;     // En lugar de QRCode.Rows
    QRCodeBitmap.PixelFormat := pf1bit;

    // Limpiar
    QRCodeBitmap.Canvas.Brush.Color := clWhite;
    QRCodeBitmap.Canvas.FillRect(Rect(0, 0, QRCodeBitmap.Width, QRCodeBitmap.Height));
    QRCodeBitmap.Canvas.Brush.Color := clBlack;

    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if QRCode.IsBlack[Row, Column] then
        begin
          // CAMBIO: En lugar de 1 píxel, dibujar cuadrado de Scale x Scale
          x := Column * Scale;
          y := Row * Scale;
          QRCodeBitmap.Canvas.FillRect(Rect(x, y, x + Scale, y + Scale));
        end;
      end;
    end;

  finally
    QRCode.Free;
  end;
  pb1.Repaint;
end;

end.
