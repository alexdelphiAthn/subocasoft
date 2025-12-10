unit inMtoModalCliCues;

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
  TfrmPrintCliCues = class(TForm)
    frxrprt1: TfrxReport;
    frxpdfPedWeb: TfrxPDFExport;
    pnl1: TPanel;
    btn4: TcxButton;
    btn2: TcxButton;
    btn1: TcxButton;
    btn3: TcxButton;
    edtCodCli: TcxTextEdit;
    cxlbl1: TcxLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  //  procedure rbRangoFechasClick(Sender: TObject);
  //  procedure rbActualClick(Sender: TObject);

  private
    procedure Preparar_consulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintCliCues: TfrmPrintCliCues;

implementation

uses
  inMtoClientes;

{$R *.dfm}


procedure TfrmPrintCliCues.btn2Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.Print;
end;

procedure TfrmPrintCliCues.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintCliCues.btn4Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.PrepareReport(True);
  frxrprt1.Export(frxpdfPedWeb);
end;

procedure TfrmPrintCliCues.Preparar_consulta;
begin
    with dmmClientes.unqryCliPrintCues do
    begin
                Params.Clear;
                 SQL.Text := 'select *                                            ' +
                             ' from suboc_clientes cli                            ' +
                             ' inner join suboc_cuestionario sc                   ' +
                            '  on cli.CODIGO_CLIENTE = sc.CODIGO_CLIENTE          ' +
                            '  inner join suboc_cuestionario_respuestas sr        ' +
                            '  on sc.CODIGO_CUESTIONARIO = sr.CODIGO_CUESTIONARIO ' +
                            '  WHERE cli.CODIGO_CLIENTE = :CODIGO_CLIENTE ' ;
                 //Params.AddParam('numfac');
                 Params.ParamByName('CODIGO_CLIENTE').DataType := ftString;
                 Params.ParamByName('CODIGO_CLIENTE').Value := edtCodCli.text;
    end;
    dmmClientes.unqryCliPrintCues.Open;
end;

procedure TfrmPrintCliCues.btn5Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.DesignReport();
end;

procedure TfrmPrintCliCues.btn1Click(Sender: TObject);
begin
  Preparar_consulta;
  frxrprt1.ShowReport;
end;

end.
