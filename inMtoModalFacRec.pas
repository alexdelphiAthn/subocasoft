unit inMtoModalFacRec;

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
  TfrmGenFacRec = class(TForm)
    cxlbl1: TcxLabel;
    edtNumFacOrigen: TcxTextEdit;
    pnl1: TPanel;
    btn3: TcxButton;
    chkAbonar: TcxCheckBox;
    btnGenerar: TcxButton;
    cxgrpbx1: TcxGroupBox;
    edtNumFacAbono: TcxTextEdit;
    edtSerieOrigen: TcxTextEdit;
    edtSerieFacAbono: TcxTextEdit;
    chkDuplicar: TcxCheckBox;
    cxlbl8: TcxLabel;
    cmbSerieFactura: TcxLookupComboBox;
    cxlbl2: TcxLabel;
    dtFecha: TcxDateEdit;
//    procedure btn1Click(Sender: TObject);
//    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
//    procedure btn4Click(Sender: TObject);
   // procedure btnGenerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
    procedure chkAbonarClick(Sender: TObject);
    procedure chkDuplicarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenFacRec: TfrmGenFacRec;

implementation

uses
  inMtoFac, UniDataFac;

{$R *.dfm}

procedure TfrmGenFacRec.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGenFacRec.btnGenerarClick(Sender: TObject);
var
  SavedCursor : TCursor;
begin
    if chkAbonar.Checked = True then
    begin
      SavedCursor := Screen.Cursor;
      try
        Screen.Cursor:=crHourglass;
        with dmmFac do
        begin
          with unstrdprcCrearFacturaAbono do
          begin
             //connection.StartTransaction;
             ParamByName('pidseriefactura').AsString :=  edtSerieOrigen.Text;
             ParamByName('pidnumfactura').AsString :=  edtNumFacOrigen.Text;
             ParamByName('pidseriefacturaabono').AsString :=  cmbSerieFactura.Text;
             ParamByName('pfechafacturaabono').AsDate :=  dtFecha.Date;
             ExecProc;
             //connection.Commit;
             edtSerieFacAbono.Text := ParamByName('pidseriefacturaabono').AsString;
             edtNumFacAbono.Text := ParamByName('pidnumfacturaabono').AsString;
             unqryFac.Refresh;
          end;
       end;
      finally
        Screen.Cursor := SavedCursor;
      end;
    end;
    if chkDuplicar.Checked = True then
    begin
      SavedCursor := Screen.Cursor;
      try
        Screen.Cursor:=crHourglass;
        with dmmFac.unstrdprcDuplicarFactura do
        begin
          //connection.StartTransaction;
          ParamByName('pidseriefactura').AsString :=  edtSerieOrigen.Text;
          ParamByName('pidnumfactura').AsString :=  edtNumFacOrigen.Text;
          ParamByName('pidseriefacturaabono').AsString :=  cmbSerieFactura.Text;
          ParamByName('pfechafacturaabono').AsDate :=  dtFecha.Date;
          ExecProc;
          //connection.Commit;
          edtSerieFacAbono.Text := ParamByName('pidseriefacturaabono').AsString;
          edtNumFacAbono.Text := ParamByName('pidnumfacturaabono').AsString;
          dmmFac.unqryFac.Refresh;
       end;
      finally
         Screen.Cursor:=SavedCursor;
      end;
    end
end;

procedure TfrmGenFacRec.chkAbonarClick(Sender: TObject);
begin
  if chkAbonar.Checked then
    chkDuplicar.Checked := False;
end;

procedure TfrmGenFacRec.chkDuplicarClick(Sender: TObject);
begin
  if chkDuplicar.Checked then
    chkAbonar.Checked := False;
end;

procedure TfrmGenFacRec.FormCreate(Sender: TObject);
begin
  cmbSerieFactura.Properties.ListSource := dmmFac.dsSeries;
  edtNumFacOrigen.Text := dmmFac.unqryFac.findField('NRO_FACTURA').AsString;
  edtSerieOrigen.Text := dmmFac.unqryFac.findField('SERIE_FACTURA').AsString;
  cmbSerieFactura.Text := cmbSerieFactura.Properties.ListSource.DataSet.Fields[0].AsString;
  dtFecha.Date := Trunc(Now);
end;

end.

