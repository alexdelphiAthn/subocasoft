unit inMtoModalFacRecImp;

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
  ExtCtrls, ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit,
  cxCalendar, frxDesgn, cxGroupBox, cxRadioGroup, frxExportBaseDialog, frxRich;

type
  TfrmPrintFacRec = class(TForm)
    pnl1: TPanel;
    btn4: TcxButton;
    btn2: TcxButton;
    btn1: TcxButton;
    btn3: TcxButton;
    edtNroFac: TcxTextEdit;
    cxlbl1: TcxLabel;
    cxRadioGroup1: TcxRadioGroup;
    rbActual: TcxRadioButton;
    rbRangoFechas: TcxRadioButton;
    edtSerie: TcxTextEdit;
    edtRecibo: TcxTextEdit;
    frxpdf: TfrxPDFExport;
    rbRecibi: TcxRadioButton;
    frxrprt2: TfrxReport;
    frxrchbjct1: TfrxRichObject;
    frxrprt1: TfrxReport;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure rbRangoFechasClick(Sender: TObject);
    procedure rbActualClick(Sender: TObject);

  private
    procedure Preparar_consulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintFacRec: TfrmPrintFacRec;

implementation

uses
  inMtoFac;

{$R *.dfm}


procedure TfrmPrintFacRec.btn2Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.Print;
end;

procedure TfrmPrintFacRec.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintFacRec.btn4Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.PrepareReport(True);
  frxrprt1.Export(frxpdf);
end;

procedure TfrmPrintFacRec.Preparar_consulta;
begin
  if ((rbActual.Checked = true) or (rbRecibi.Checked = True)) then
  begin
    with dmmFac.unqryRecibosPrint do
    begin
                 SQL.Text := 'SELECT *  ' +
                             '       FROM SUBOC_RECIBOS ' +
                             '        WHERE NRO_FACTURA = :numfac' +
                             '          AND SERIE_FACTURA = :serie' +
                             '         AND NRO_PLAZO_RECIBO = :recibo';
                 Params.ParamByName('numfac').AsInteger := StrToInt(edtNroFac.text);
                 Params.ParamByName('serie').AsString := edtSerie.text;
                 Params.ParamByName('recibo').AsInteger := StrToInt(edtRecibo.Text);
    end;
    with dmmFac.unqryLinFacPrint do
    begin
                SQL.Text :=    'SELECT *  ' +
                             '       FROM SUBOC_FACTURAS_LINEAS ' +
                             '        WHERE NRO_FACTURA_LINEA = :numfac' +
                             '          AND SERIE_FACTURA_LINEA = :serie' ;

                 Params.ParamByName('numfac').AsInteger := StrToInt(edtNroFac.text);
                 Params.ParamByName('serie').AsString := edtSerie.text;
    end;
    with dmmFac do
    begin
      unqryRecibosPrint.Open;
      unqryLinFacPrint.Open;
      unqryLinFacPrint.MasterSource := dmmFac.dsRecibosPrint;
    end;
  end;
  if rbRangoFechas.Checked = true then
  begin
    with dmmFac.unqryRecibosPrint do
    begin
                 SQL.Text := 'SELECT *  ' +
                             '       FROM SUBOC_RECIBOS ' +
                             '        WHERE NRO_FACTURA = :numfac' +
                             '          AND SERIE_FACTURA = :serie' ;
                 Params.ParamByName('numfac').AsInteger := StrToInt(edtNroFac.text);
                 Params.ParamByName('serie').AsString := edtSerie.text;
    end;
    dmmFac.unqryRecibosPrint.Open;
  end;
end;

procedure TfrmPrintFacRec.btn5Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.DesignReport();
end;

procedure TfrmPrintFacRec.btn1Click(Sender: TObject);
begin
  Preparar_consulta;
  if rbRecibi.Checked = True then
    frxrprt2.ShowReport
  else
    frxrprt1.ShowReport;
end;

procedure TfrmPrintFacRec.rbRangoFechasClick(Sender: TObject);
begin
  //dedDesde.Enabled := true;

end;

procedure TfrmPrintFacRec.rbActualClick(Sender: TObject);
begin
  //dedDesde.Enabled := false;

end;

end.
