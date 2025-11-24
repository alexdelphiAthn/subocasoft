unit inMtoPreguntas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData,   DBCtrls,
  cxNavigator, ExtCtrls, //dxCntner, dxExEdtr, dxEdLib,
  cxContainer, unidataconn,
  cxTextEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, StdCtrls, Buttons, ADODB, //BetterADODataSet,
  cxDBEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLookAndFeels,
  cxLookAndFeelPainters, cxCheckBox, cxLabel, cxDBLabel, cxTimeEdit, cxCalendar, inMtoPrincipal,
   cxLocalization,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges, MemDS,
  DBAccess, Uni, dxBevel, cxDBNavigator, dxScrollbarAnnotations;

type
  TfrmMtoPreguntas = class(TfrmMtoGen)
    unqryPreguntas: TUniQuery;
    cxgrdbclmnGrdDBTabPrinCODIGO_PREGUNTA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPREGUNTA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //FDmConn:TdmConn;
    FException: boolean;
  public
    { Public declarations }
  end;
  procedure ShowMtoPreguntas(Owner       : TComponent);


var
  frmMtoPreguntas: TfrmMtoPreguntas;

implementation

uses inLibWin;

{$R *.dfm}

procedure ShowMtoPreguntas(Owner       : TComponent);
var
  FfrmUbi : TfrmMtoPreguntas;
begin
  if not(IsOpenMDI('Preguntas', Owner)) then
  begin
    Application.CreateForm(TfrmMtoPreguntas, FfrmUbi);
  end;
end;

procedure TfrmMtoPreguntas.FormShow(Sender: TObject);
begin
  inherited;
  if FException then
  begin
     PostMessage( Handle, wm_Close, 0, 0 );
     Exit;
  end;
end;

procedure TfrmMtoPreguntas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  unqryPreguntas.Close;
  inherited;
end;

procedure TfrmMtoPreguntas.FormCreate(Sender: TObject);
begin
  try
    with frmopenapp do
    unqryPreguntas.Connection := FDmConn.conUni;
    dsTablaG.DataSet.Open;
    inherited;
  except
     FException := True;
  raise;

  end;
   //pcDetall.ActivePage := tsDatGen;
end;

end.

