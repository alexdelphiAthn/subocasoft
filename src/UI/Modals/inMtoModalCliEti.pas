unit inMtoModalCliEti;

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
  cxSpinEdit;

type
  TfrmPrintCliEti = class(TForm)
    frxrprt1: TfrxReport;
    frxpdfPedWeb: TfrxPDFExport;
    pnl1: TPanel;
    btn4: TcxButton;
    btn2: TcxButton;
    btnVistaPreliminar: TcxButton;
    btn3: TcxButton;
    edtCodCli: TcxTextEdit;
    cxlbl1: TcxLabel;
    cxRadioGroup1: TcxRadioGroup;
    cxlbl2: TcxLabel;
    speDejarBlancos: TcxSpinEdit;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnVistaPreliminarClick(Sender: TObject);
  //  procedure rbRangoFechasClick(Sender: TObject);
  //  procedure rbActualClick(Sender: TObject);

  private
    procedure Preparar_consulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintCliEti: TfrmPrintCliEti;

implementation

uses
  inMtoClientes;

{$R *.dfm}


procedure TfrmPrintCliEti.btn2Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.Print;
end;

procedure TfrmPrintCliEti.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintCliEti.btn4Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.PrepareReport(True);
  frxrprt1.Export(frxpdfPedWeb);
end;

procedure TfrmPrintCliEti.Preparar_consulta;
begin
  dmmClientes.CrearDataSetEtiquetas(speDejarBlancos.Value, edtCodCli.text);
end;

procedure TfrmPrintCliEti.btn5Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.DesignReport();
end;

procedure TfrmPrintCliEti.btnVistaPreliminarClick(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.ShowReport;
end;

end.
