unit inMtoPaises;

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
  TfrmMtoPaises = class(TfrmMtoGen)
    unqryPaises: TUniQuery;
    dbcGrdDBTabPrinCOD_PAIS: TcxGridDBColumn;
    dbcGrdDBTabPrinCOD_PAIS_ALPHA3: TcxGridDBColumn;
    dbcGrdDBTabPrinCOD_PAIS_ALPHA2: TcxGridDBColumn;
    dbcGrdDBTabPrinNOMBRE_SPA_PAIS: TcxGridDBColumn;
    dbcGrdDBTabPrinNOMBRE_ENG_PAIS: TcxGridDBColumn;
    dbcGrdDBTabPrinORDEN_PAIS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //FDmConn:TdmConn;
    FException: boolean;
  public
    { Public declarations }
  end;
  procedure ShowMtoPaises(Owner       : TComponent);


var
  frmMtoPaises: TfrmMtoPaises;

implementation

uses inLibWin;

{$R *.dfm}

procedure ShowMtoPaises(Owner       : TComponent);
var
  FfrmUbi : TfrmMtoPaises;
begin
  if not(IsOpenMDI('Paises', Owner)) then
  begin
    Application.CreateForm(TfrmMtoPaises, FfrmUbi);
  end;
end;

procedure TfrmMtoPaises.FormShow(Sender: TObject);
begin
  inherited;
  if FException then
  begin
     PostMessage( Handle, wm_Close, 0, 0 );
     Exit;
  end;
end;

procedure TfrmMtoPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  unqryPaises.Close;
  inherited;
end;

procedure TfrmMtoPaises.FormCreate(Sender: TObject);
begin
  try
    with frmopenapp do
    unqryPaises.Connection := FDmConn.conUni;
    dsTablaG.DataSet.Open;
    inherited;
  except
     FException := True;
  raise;

  end;
   //pcDetall.ActivePage := tsDatGen;
end;

end.

