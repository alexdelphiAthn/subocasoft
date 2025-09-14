unit inMtoModalHisFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlue, frxClass, frxDBSet, StdCtrls, cxButtons, DB,
  DBClient, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel,
  dxSkinBlack, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, frxExportPDF,
  ExtCtrls, cxRadioGroup, cxGroupBox, cxDBEdit, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar;

type
  TfrmModalHisFac = class(TForm)
    pnl1: TPanel;
    btnSalir: TcxButton;
    btnGenerar: TcxButton;
    cxlbl8: TcxLabel;
    cmbSerieFactura: TcxLookupComboBox;
    cxlbl2: TcxLabel;
    dtFecha: TcxDateEdit;
    edtNroFactura: TcxTextEdit;
    cxlbl3: TcxLabel;
//    procedure btn1Click(Sender: TObject);
//    procedure btn2Click(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
//    procedure btn4Click(Sender: TObject);
   // procedure btnGenerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
//    procedure chkAbonarClick(Sender: TObject);
//    procedure chkDuplicarClick(Sender: TObject);

  private
    { Private declarations }
  public
    sSalir:string;
  end;

var
  frmModalHisFac: TfrmModalHisFac;

implementation

uses
  inMtoHistoriaClientes;

{$R *.dfm}

procedure TfrmModalHisFac.btnSalirClick(Sender: TObject);
begin
  sSalir := 'S';
  Close;

end;

procedure TfrmModalHisFac.btnGenerarClick(Sender: TObject);
begin
  sSalir := 'N';
 Close;
end;

procedure TfrmModalHisFac.FormCreate(Sender: TObject);
begin
  //cmbSerieFactura.Properties.ListSource := dmmPre.dsSeriesFac;
//  edtNumFacOrigen.Text := dmmFac.unqryFac.findField('NRO_FACTURA').AsString;
//  edtSerieOrigen.Text := dmmFac.unqryFac.findField('SERIE_FACTURA').AsString;


end;

end.

