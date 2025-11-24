unit inMtoArticulos;

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
  dxBevel, cxDBNavigator, dxDateRanges, dxGDIPlusClasses, cxImage,
  dxScrollbarAnnotations;

type
  TfrmMtoArticulos = class(TfrmMtoGen)
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
    cxdbtxtdtCODIGO_ARTICULO: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxdbtxtdtDESCRIPCION_ARTICULO: TcxDBTextEdit;
    cxlbl3: TcxLabel;
    cxlbl5: TcxLabel;
    cxgrdbclmnGrdDBTabPrinCODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFAMILIA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPRECIOVENTA_ARTICULO: TcxGridDBColumn;
    img1: TcxImage;
    cxdbcrncydt1: TcxDBCurrencyEdit;
    btnNuevo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNuevoClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;
  procedure ShowMtoArticulos(Owner       : TComponent); overload;
  procedure ShowMtoArticulos(Owner       : TComponent; sArt: String); overload;
var
  frmMtoArticulos: TfrmMtoArticulos;
  dmmArticulos: TDMArticulos;
implementation

uses
  inLibWin;

{$R *.dfm}

procedure ShowMtoArticulos(Owner       : TComponent); overload;
var
  frmMtoArticulos : TfrmMtoArticulos;
begin
  if not(IsOpenMDI('Tratamientos', Owner)) then
  begin
    Application.CreateForm(TfrmMtoArticulos, frmMtoArticulos);
    frmMtoArticulos.edtBusqGlobal.SetFocus;
  end;
end;

procedure ShowMtoArticulos(Owner       : TComponent; sArt: String); overload;
var
  frmMtoArticulos : TfrmMtoArticulos;
begin
  if not(IsOpenMDI('Tratamientos', Owner)) then
  begin
    Application.CreateForm(TfrmMtoArticulos, frmMtoArticulos);
  end;
  frmMtoArticulos.dsTablaG.DataSet.Locate('CODIGO_ARTICULO', sArt, []);
end;

procedure TfrmMtoArticulos.FormCreate(Sender: TObject);
begin
  dmmArticulos := TDMArticulos.Create(dmArticulos);
  dsTablaG.DataSet := dmmArticulos.unqryArticulos;
  inherited;
end;

procedure TfrmMtoArticulos.btnNuevoClick(Sender: TObject);
begin
  inherited;
 if ((dsTablaG.Dataset.State <> dsInsert) and (dsTablaG.Dataset.State <> dsEdit)) then
  begin
    dsTablaG.Dataset.Insert;
    pcPantalla.ActivePage := tsFicha;
    tsFicha.SetFocus;
    cxdbtxtdtCODIGO_ARTICULO.SetFocus;
  end;
end;

procedure TfrmMtoArticulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmArticulos);
end;

end.
