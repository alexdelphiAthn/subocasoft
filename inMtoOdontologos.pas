unit inMtoOdontologos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer,
   cxCheckBox, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  dxBarBuiltInMenu, cxPC, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel, UniDataArticulos,
  cxGridBandedTableView, cxGridDBBandedTableView, dxSkinBlack,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxLocalization,
  cxCurrencyEdit, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxBevel, cxDBNavigator, inMtoPrincipal,
  dxDateRanges, MemDS, DBAccess, Uni, cxImage, dxGDIPlusClasses,
  dxScrollbarAnnotations;

type
  TfrmMtoOdontologos = class(TfrmMtoGen)
    pnl1: TPanel;
    cxdbtxtdt1: TcxDBTextEdit;
    cxlbl2: TcxLabel;
    cxlbl1: TcxLabel;
    cxdbtxtdt2: TcxDBTextEdit;
    pnl2: TPanel;
    cxpgcntrl2: TcxPageControl;
    cxtbsht3: TcxTabSheet;
    cxlbl18: TcxLabel;
    cxdbtxtdt15: TcxDBTextEdit;
    Panel1: TPanel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxgrdbclmnGrdDBTabPrinODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNOMBRE_ODONTOLOGO: TcxGridDBColumn;
    unqryOdontologos: TUniQuery;
    img1: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
  end;
  procedure ShowMtoOdontologos(Owner       : TComponent); overload;
  procedure ShowMtoOdontologos(Owner       : TComponent; sOdon: String); overload;
var
  frmMtoOdontologos: TfrmMtoOdontologos;

implementation

uses
  inLibWin;

{$R *.dfm}

procedure ShowMtoOdontologos(Owner       : TComponent); overload;
var
  frmMtoOdontologos : TfrmMtoOdontologos;
begin
  if not(IsOpenMDI('Odontólogos', Owner)) then
  begin
    Application.CreateForm(TfrmMtoOdontologos, frmMtoOdontologos);
    frmMtoOdontologos.edtBusqGlobal.SetFocus;
  end;
end;

procedure ShowMtoOdontologos(Owner       : TComponent; sOdon: String); overload;
var
  frmMtoOdontologos : TfrmMtoOdontologos;
begin
  if not(IsOpenMDI('Odontólogos', Owner)) then
  begin
    Application.CreateForm(TfrmMtoOdontologos, frmMtoOdontologos);
  end;
  //dmmArticulos.zqryArticulos.Locate('CODIGO_ARTICULO', sArt, []);
end;

procedure TfrmMtoOdontologos.FormCreate(Sender: TObject);
begin
  //dmmArticulos := TDMArticulos.Create(dmArticulos);
  unqryOdontologos.Connection := frmOpenApp.FDmConn.conUni;
  unqryOdontologos.Open;
  inherited;
end;

procedure TfrmMtoOdontologos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //FreeAndNil(dmArticulos);
end;

end.
