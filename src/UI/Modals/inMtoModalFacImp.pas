unit inMtoModalFacImp;

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
  cxCalendar, frxDesgn, cxGroupBox, cxRadioGroup, frxExportBaseDialog,
  cxCheckBox, inMtoPrincipal, dxSkinBasic, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinTheBezier,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmPrintFac = class(TForm)
    frxrprt1: TfrxReport;
    frxpdfPedWeb: TfrxPDFExport;
    pnl1: TPanel;
    btnVistaPreliminar: TcxButton;
    btnSalir: TcxButton;
    edtNroFac: TcxTextEdit;
    cxlbl1: TcxLabel;
    edtSerie: TcxTextEdit;
    cxRadioGroup1: TcxRadioGroup;
    rbActual: TcxRadioButton;
    fxrptSimple: TfrxReport;
    cxchkEsSimpl: TcxCheckBox;
    procedure btnVistaPreliminarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    procedure Preparar_consulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintFac: TfrmPrintFac;

implementation

uses
  inMtoFac;

{$R *.dfm}

procedure TfrmPrintFac.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintFac.Preparar_consulta;
begin
  dmmFac.unqryFacPrint.Connection := frmOpenApp.FDmConn.conUni;
  dmmFac.unqryLinFacPrint.Connection := frmOpenApp.FDmConn.conUni;
  if rbActual.Checked = true then
  begin
    with dmmFac.unqryFacPrint do
    begin
                Params.Clear;
                 SQL.Text := 'SELECT *  ' +
                             '       FROM V_SUBOC_FACTURAS f' +
                             '        WHERE NRO_FACTURA = :numfac' +
                             '          AND SERIE_FACTURA = :serie';
                 //Params.AddParam('numfac');
                 Params.ParamByName('numfac').DataType := ftString;
                 Params.ParamByName('numfac').Value := edtNroFac.text;
                 //Params.AddParam('serie');
                 Params.ParamByName('serie').DataType := ftString;
                 Params.ParamByName('serie').Value := edtSerie.text;
    end;
    dmmFac.unqryFacPrint.Open;
    if dmmFac.unqryFacPrint.RecordCount = 0 then
    begin
      raise Exception.Create('No se puede imprimir el documento. ' +
                             'Factura incompleta. Revise VeriFactu');
    end;
    with dmmFac.unqryLinFacPrint do
    begin
                Params.Clear;
               //Params.Create;
                 SQL.Text := '       SELECT * ' +
                             '         FROM SUBOC_FACTURAS_LINEAS V  ' +
                             '        WHERE V.NRO_FACTURA_LINEA = :numfac' +
                             '          AND V.SERIE_FACTURA_LINEA = :serie ' +
                             '     order by V.LINEA_LINEA';
                 //Params.AddParam('numfac');
                 Params.ParamByName('numfac').DataType := ftString;
                 Params.ParamByName('numfac').Value := edtNroFac.text;
                 //Params.AddParam('serie');
                 Params.ParamByName('serie').DataType := ftString;
                 Params.ParamByName('serie').Value := edtSerie.text;
      end;
    dmmFac.unqryLinFacPrint.MasterSource := dmmFac.dsFacPrint;
    dmmFac.unqryLinFacPrint.Open;
  end;
end;

procedure TfrmPrintFac.btnVistaPreliminarClick(Sender: TObject);
begin
  Preparar_consulta;
  if cxchkEsSimpl.Checked = True then
    fxrptSimple.ShowReport
  else
    frxrprt1.ShowReport;
end;

end.
