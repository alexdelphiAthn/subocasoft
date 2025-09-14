unit inMtoFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer, inLibVerifactuBuilder,
  cxCheckBox, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, UniDataFac,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  cxSplitter, cxImage, cxDBEdit, dxBarBuiltInMenu, cxPC, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxDBLookupComboBox,
  cxGridBandedTableView, cxGridDBBandedTableView, cxLocalization,
  cxGroupBox, DBCtrls, cxCurrencyEdit, Menus, cxButtons, cxButtonEdit, inlibDevExp,
  cxLookupEdit, cxDBLookupEdit, Vcl.Imaging.pngimage,
   dxSkinBlack, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxSpinEdit, cxCalc,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBevel,
  cxDBNavigator, dxNumericWheelPicker, dxDateRanges, cxDataUtils, cxVariants,
  cxDBLabel, dxGDIPlusClasses, System.UITypes, dxScrollbarAnnotations,
  cxRadioGroup, inMtoGenerarQR, dxSkinBasic, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinTheBezier,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type


  TfrmMtoFac = class(TfrmMtoGen)
    pnl1: TPanel;
    cxspl1: TcxSplitter;
    cxpgcntrlFacturacx: TcxPageControl;
    tsLineasFactura: TcxTabSheet;
    ts5: TcxTabSheet;
    cxlbl17: TcxLabel;
    cxlbl18: TcxLabel;
    cxgrd5: TcxGrid;
    tvLineasFactura: TcxGridDBTableView;
    lv1: TcxGridLevel;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    ts8: TcxTabSheet;
    btnRectificar: TSpeedButton;
    btnImprimir: TSpeedButton;
    cxlbl12: TcxLabel;
    cxgrdbclmnGrdDBTabPrinNRO_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinSERIE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNIF_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFECHA_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinTOTAL_LIQUIDO_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFORMA_PAGO_FACTURA: TcxGridDBColumn;
    cxtbsht1: TcxTabSheet;
    cxdbm1: TcxDBMemo;
    btnNuevaFactura: TSpeedButton;
    cxgrdbclmntv1LINEA_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1CODIGO_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1ZONA: TcxGridDBColumn;
    cxgrdbclmntv1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1CANTIDAD_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmntv1SUM_TOTAL_LINEA: TcxGridDBColumn;
    cxgrd1: TcxGrid;
    tvHistoriaDental: TcxGridDBTableView;
    cxgrdbndtblvw1: TcxGridDBBandedTableView;
    cxgrdbndclmn1: TcxGridDBBandedColumn;
    cxgrdbndclmn2: TcxGridDBBandedColumn;
    cxgrdbndclmn3: TcxGridDBBandedColumn;
    cxgrdbndclmn4: TcxGridDBBandedColumn;
    cxgrdbndclmn5: TcxGridDBBandedColumn;
    cxgrdbndclmn6: TcxGridDBBandedColumn;
    cxgrdbndclmn7: TcxGridDBBandedColumn;
    cxgrdbndclmn8: TcxGridDBBandedColumn;
    cxgrdlvl1: TcxGridLevel;
    cxgrdbclmncxgrdbtblvw1CODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1DESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1PRECIOVENTA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1FECHA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1ZONA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNOMBRE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinAPELLIDOS: TcxGridDBColumn;
    cbbFORMAPAGO: TcxDBLookupComboBox;
    cxtbsht2: TcxTabSheet;
    btnGenerarRecibos: TcxButton;
    pnl4: TPanel;
    cxgrd2: TcxGrid;
    tvLineasRecibos: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvw2NRO_PLAZO_RECIBO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2ESTADO_RECIBO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2FORMA_PAGO_DESCRIPCION_ORIGEN: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2FECHA_PAGO: TcxGridDBColumn;
    cxgrdbndtblvw2: TcxGridDBBandedTableView;
    cxgrdbndclmn9: TcxGridDBBandedColumn;
    cxgrdbndclmn10: TcxGridDBBandedColumn;
    cxgrdbndclmn11: TcxGridDBBandedColumn;
    cxgrdbndclmn12: TcxGridDBBandedColumn;
    cxgrdbndclmn13: TcxGridDBBandedColumn;
    cxgrdbndclmn14: TcxGridDBBandedColumn;
    cxgrdbndclmn15: TcxGridDBBandedColumn;
    cxgrdbndclmn16: TcxGridDBBandedColumn;
    cxgrdlvl2: TcxGridLevel;
    pnl5: TPanel;
    btnReciboPagado: TcxButton;
    btn5: TcxButton;
    btnReciboDevuelto: TcxButton;
    cxgrdbclmncxgrdbtblvw2EUROS_RECIBO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2FECHA_EXPEDICION: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2FECHA_VENCIMIENTO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2IBAN: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2LOCALIDAD_EXPEDICION: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2CODIGO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2RAZONSOCIAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2DIRECCION1_CLIENTE: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2POBLACION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2PROVINCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2CPOSTAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw2IMPORTE_LETRA: TcxGridDBColumn;
    btnReciboEmitido: TcxButton;
    cxgrdbclmncxgrdbtblvw1NOMBRE_ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1DESHISVARCHAR: TcxGridDBColumn;
    pnl2: TPanel;
    pnl3: TPanel;
    cxtbshtCabecera: TcxPageControl;
    tsCabecera: TcxTabSheet;
    lblcxlbl1: TcxLabel;
    lblcxlbl3: TcxLabel;
    dteFECHA_FACTURA: TcxDBDateEdit;
    lblcxlbl8: TcxLabel;
    cbbSerieFactura: TcxDBLookupComboBox;
    btnNroFactura: TcxDBButtonEdit;
    btnCODIGO_CLIENTE: TcxDBButtonEdit;
    lblCodigoPaciente: TcxLabel;
    lblRazonSocial: TcxLabel;
    lblDBRAZONSOCIAL_CLIENTE_FACTURA: TcxDBLabel;
    lblDBMOVIL_CLIENTE_FACTURA: TcxDBLabel;
    lblTelefonoMovil: TcxLabel;
    tsDatosCliente: TcxTabSheet;
    cxgrpbx1: TcxGroupBox;
    txtDIRECCION1_CLIENTE_FACTURA: TcxDBTextEdit;
    txtCPOSTAL_CLIENTE_FACTURA: TcxDBTextEdit;
    txtPOBLACION_CLIENTE_FACTURA: TcxDBTextEdit;
    txtPROVINCIA_CLIENTE_FACTURA: TcxDBTextEdit;
    txtDIRECCION2_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl6: TcxLabel;
    lblcxlbl13: TcxLabel;
    txtNIF_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl9: TcxLabel;
    lblcxlbl104: TcxLabel;
    txtMOVIL_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl11: TcxLabel;
    txtEMAIL_CLIENTE_FACTURA: TcxDBTextEdit;
    txtAPELLIDOS: TcxDBTextEdit;
    txtNOMBRE: TcxDBTextEdit;
    lblcxlbl15: TcxLabel;
    lblcxlbl16: TcxLabel;
    img1: TcxImage;
    txtRAZONSOCIAL_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl14: TcxLabel;
    lblDBCODIGO_CLIENTE_FACTURA: TcxDBLabel;
    btnConsolidar: TSpeedButton;
    dbcGrdDBTabPrinCONSOLIDACION_FACTURA: TcxGridDBColumn;
    btnCrearActualizarCli: TcxButton;
    cxchkNoNIFControl: TcxCheckBox;
    chkEsSimpl: TcxDBCheckBox;
    chkConsolidada: TcxDBCheckBox;
    tsVeriFactu: TcxTabSheet;
    scrlbx1: TScrollBox;
    spQUEUE_ID: TcxDBSpinEdit;
    lbl18: TLabel;
    cxdbmRESPUESTA_COMPLETA: TcxDBMemo;
    lbl17: TLabel;
    cxdbmQRCODE_BASE64: TcxDBMemo;
    lbl13: TLabel;
    cxdbmVERIFACTU_URL: TcxDBMemo;
    lbl12: TLabel;
    txtCHAIN_HASH: TcxDBTextEdit;
    lbl11: TLabel;
    txtCHAIN_NUMBER: TcxDBTextEdit;
    lbl10: TLabel;
    dteISSUED_TIME: TcxDBDateEdit;
    lbl9: TLabel;
    txtISSUER_IRS_ID: TcxDBTextEdit;
    lbl8: TLabel;
    lbl7: TLabel;
    imgQRCODE_PNG: TcxDBImage;
    txtREQUEST_ID: TcxDBTextEdit;
    lbl6: TLabel;
    lbl: TLabel;
    spID_CONSOLIDACION: TcxDBSpinEdit;
    cxdbmPETICION_COMPLETA1: TcxDBMemo;
    dteFECHA_PROCESAMIENTO: TcxDBDateEdit;
    lbl15: TLabel;
    txtESTADO: TcxDBTextEdit;
    lbl16: TLabel;
    lblDB1: TcxDBLabel;
    rgTIPOID_INT_CLIENTE: TcxDBRadioGroup;
    btnPAIS_CLIENTE: TcxDBButtonEdit;
    btnReconsolidar: TSpeedButton;
    lblDB2: TcxDBLabel;
    lblDBFECHA_ULT_CONSO_FACTURA: TcxDBLabel;
    tsError: TcxTabSheet;
    cxGrid1: TcxGrid;
    tvEventosVeriFactu: TcxGridDBTableView;
    cxgrdbndtblvw11: TcxGridDBBandedTableView;
    cxgrdbndclmn: TcxGridDBBandedColumn;
    cxgrdbndclmn17: TcxGridDBBandedColumn;
    cxgrdbndclmn18: TcxGridDBBandedColumn;
    cxgrdbndclmn19: TcxGridDBBandedColumn;
    cxgrdbndclmn20: TcxGridDBBandedColumn;
    cxgrdbndclmn21: TcxGridDBBandedColumn;
    cxgrdbndclmn22: TcxGridDBBandedColumn;
    cxgrdbndclmn23: TcxGridDBBandedColumn;
    lv2: TcxGridLevel;
    dbcGrdDBTabPrinFASE_CONSOLIDACION_FACTURA: TcxGridDBColumn;
    dbcGrdDBTabPrinESSIMPL_FACTURA: TcxGridDBColumn;
    btnConsultarEstado: TSpeedButton;
    btnCancelarFactura: TSpeedButton;
    dbctv3CREATED_AT_LOG: TcxGridDBColumn;
    dbctv3TIPO_EVENTO_LOG: TcxGridDBColumn;
    dbctv3DESCRIPCION_LOG: TcxGridDBColumn;
    dbctv3DATOS_ADICIONALES_LOG: TcxGridDBColumn;
    btnSubsanacion: TSpeedButton;
    lblNroFacturaCab: TcxLabel;
    lblNroFacturaLin: TcxLabel;
    tvLineasFacturaSERIE_FACTURA_LINEA: TcxGridDBColumn;
    tvLineasFacturaNRO_FACTURA_LINEA: TcxGridDBColumn;

 procedure FormCreate(Sender: TObject);
    procedure btnRectificarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure sbGrabarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure btnCrearActualizarCliClick(Sender: TObject);
    procedure cxgrdbclmntv1ODONTOLOGOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnNuevaFacturaClick(Sender: TObject);
    procedure cxgrdbclmncxgrdbtblvw1DESCRIPCION_HISTORIAPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesEditValueChanged(
      Sender: TObject);
    procedure btnCODIGO_CLIENTEPropertiesEditValueChanged(Sender: TObject);
    procedure btn3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCODIGO_CLIENTEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbSerieFacturaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dteFECHA_FACTURAKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnNroFacturaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btn5Click(Sender: TObject);
    procedure btnGenerarRecibosClick(Sender: TObject);
    procedure btnReciboPagadoClick(Sender: TObject);
    procedure btnReciboEmitidoClick(Sender: TObject);
    procedure btnReciboDevueltoClick(Sender: TObject);
    procedure chkConsolidadaPropertiesChange(Sender: TObject);
    procedure btnConsolidarClick(Sender: TObject);
    procedure chkEsSimplPropertiesChange(Sender: TObject);
    procedure btnPAIS_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cbbSerieFacturaPropertiesChange(Sender: TObject);
    procedure dsTablaGDataChange(Sender: TObject; Field: TField);
    procedure btnPAIS_CLIENTEPropertiesChange(Sender: TObject);
    procedure btnReconsolidarClick(Sender: TObject);
    procedure tvLineasFacturaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConsultarEstadoClick(Sender: TObject);
    procedure btnCancelarFacturaClick(Sender: TObject);
    procedure txtNOMBREExit(Sender: TObject);
    procedure txtAPELLIDOSExit(Sender: TObject);
//    procedure btnCODIGO_CLIENTEKeyPress(Sender: TObject; var Key: Char);
    procedure btnSubsanacionClick(Sender: TObject);
    procedure tvLineasFacturaCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvLineasFacturaEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure img1DblClick(Sender: TObject);
    procedure dbcGrdDBTabPrinFASE_CONSOLIDACION_FACTURACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

  private
    procedure AsignarControles;
    function fncCabeceraEdit: Boolean;
    function fncHayConexion: Boolean;
    procedure prcGenerarQRProvisionalyencolar;
    procedure prcCheckConsolidacion;
    procedure prcCheckSimpl;
    procedure prcCambiarEstadoRecibo(const sEstado: string);
    function fncValidarFacturaAntesConsolidacion(const sSerie: string;
      const iNumero: Integer): Boolean;
    procedure prcActualizarEstadoConsolidacion(const sSerie: string;
      const iNumero: Integer; const sFase: string; const bConsolidada: Boolean);
    procedure prcConsultarEstadoFacturaVerifactu(const sSerie: string;
      const iNumero: Integer);
    procedure prcCancelarFacturaVerifactu(const sSerie: string;
      const iNumero: Integer);
  public
    procedure CheckConsolidacion;
    procedure CheckSimpl;
    procedure CambiarEstadoRecibo(sEstado: string);
    procedure prcSubsanacionManual(const sSerie: string;
                                   const iNumero: Integer);

    function HayConexion: Boolean;

  end;

procedure ShowMtoFac(Owner: TComponent); overload;
procedure ShowMtoFac(Owner: TComponent; sidFactura: String); overload;

var
  frmMtoFac: TfrmMtoFac;
  dmmFac: TdmFac;

implementation

uses
  inLibWin, inMtoGenSearch, inMtoModalFacRec, inMtoModalFacImp,
  inMtoModalFacRecImp, inLibDocumentoValidator, inLibData,
  inLibVerifactuClient, inLibPermission, inMtoPrincipal, inMtoModalSubsanacion,
  inMtoModalHistoriaCli, inLibJSON, inLibVarGlob, inLibJSONState;

{$R *.dfm}

{ Procedimientos globales }

procedure ShowMtoFac(Owner: TComponent); overload;
var
  frmMtoFac: TfrmMtoFac;
begin
  if not (IsOpenMDI('Facturas', Owner)) then
  begin
    Application.CreateForm(TfrmMtoFac, frmMtoFac);
    frmMtoFac.edtBusqGlobal.SetFocus;
  end;
end;

procedure ShowMtoFac(Owner: TComponent; sidFactura: String); overload;
var
  frmMtoFac: TfrmMtoFac;
begin
  if not (IsOpenMDI('Facturas', Owner)) then
  begin
    Application.CreateForm(TfrmMtoFac, frmMtoFac);
  end;
  // Localizar factura específica si es necesario
  // dmPedFab.zqryFabCab.Locate('NUMPED', sidPedido, []);
end;

{ TfrmMtoFac - Métodos públicos (mantenidos para compatibilidad) }

procedure TfrmMtoFac.CheckConsolidacion;
begin
  prcCheckConsolidacion;
end;

procedure TfrmMtoFac.CheckSimpl;
begin
  prcCheckSimpl;
end;

procedure TfrmMtoFac.CambiarEstadoRecibo(sEstado: string);
begin
  prcCambiarEstadoRecibo(sEstado);
end;

function TfrmMtoFac.HayConexion: Boolean;
begin
  Result := fncHayConexion;
end;

procedure TfrmMtoFac.img1DblClick(Sender: TObject);
begin
  inherited;
  lblNroFacturaCab.Caption :=
                            dmmFac.unqryFac.FieldByName('NRO_FACTURA').AsString;
  lblNroFacturaLin.Caption :=
                   dmmFac.unqryLinFac.FieldByName('NRO_FACTURA_LINEA').AsString;
end;

{ TfrmMtoFac - Métodos privados }

function TfrmMtoFac.fncCabeceraEdit: Boolean;
begin
  Result := ((dsTablaG.State = dsInsert) or (dsTablaG.State = dsEdit));
end;

function TfrmMtoFac.fncHayConexion: Boolean;
var
  bConnected: Boolean;
  sWebServ, sCausaOFF: String;
begin
  bConnected := True;
  sWebServ := dmmFac.GetWebServiceInvoice;

  if not HayInternetConPing then
  begin
    bConnected := False;
    sCausaOFF := 'No hay internet';
    ShowMessage(sCausaOFF);
    frmOpenApp.VeriFactuLog.RegistrarError('', sCausaOFF);
  end;

  if bConnected and not IsWebServiceUp(sWebServ) then
  begin
    bConnected := False;
    sCausaOFF := 'WebService ' + sWebServ + ' caído';
    ShowMessage(sCausaOFF);
    frmOpenApp.VeriFactuLog.RegistrarError('', sCausaOFF);
  end;

  Result := bConnected;
end;

procedure TfrmMtoFac.prcCheckConsolidacion;
begin
  if chkConsolidada.Checked = True then
  begin
    dmmFac.unqryFac.ReadOnly := True;
    dmmFac.unqryLinFac.ReadOnly := True;
    tvLineasFactura.optionsData.Editing := False;
    tvLineasFactura.optionsData.Deleting := False;
    tvLineasFactura.optionsData.Inserting := False;
    btnConsolidar.Enabled := False;
    btnImprimir.Enabled := True;
  end
  else
  begin
    dmmFac.unqryFac.ReadOnly := False;
    dmmFac.unqryLinFac.ReadOnly := False;
    tvLineasFactura.optionsData.Editing := True;
    tvLineasFactura.optionsData.Deleting := True;
    tvLineasFactura.optionsData.Inserting := True;
    btnConsolidar.Enabled := True;
    btnImprimir.Enabled := False;
  end;
end;

procedure TfrmMtoFac.prcCheckSimpl;
begin
  if chkEsSimpl.Checked = True then
  begin
    lblCodigoPaciente.Enabled := False;
    btnCODIGO_CLIENTE.Enabled := False;
    lblRazonSocial.Enabled := False;
    lblDBRAZONSOCIAL_CLIENTE_FACTURA.Enabled := False;
    lblTelefonoMovil.Enabled := False;
    lblDBMOVIL_CLIENTE_FACTURA.Enabled := False;
    tsDatosCliente.Enabled := False;
  end
  else
  begin
    lblCodigoPaciente.Enabled := True;
    btnCODIGO_CLIENTE.Enabled := True;
    lblRazonSocial.Enabled := True;
    lblDBRAZONSOCIAL_CLIENTE_FACTURA.Enabled := True;
    lblTelefonoMovil.Enabled := True;
    lblDBMOVIL_CLIENTE_FACTURA.Enabled := True;
    tsDatosCliente.Enabled := True;
  end;
end;

procedure TfrmMtoFac.prcCambiarEstadoRecibo(const sEstado: string);
begin
  with dmmFac.unqryRecibos do
  begin
    if not ((State = dsEdit) or (State = dsInsert)) then
      Edit;
    FieldByName('ESTADO_RECIBO').AsString := sEstado;
    if sEstado = 'Pagado' then
      FieldByName('FECHA_PAGO').AsDateTime := Trunc(Now)
    else if ((sEstado = 'Emitido') or (sEstado = 'Devuelto')) then
      FieldByName('FECHA_PAGO').AsVariant := null;
    Post;
  end;
end;

function TfrmMtoFac.fncValidarFacturaAntesConsolidacion(const sSerie: string;
  const iNumero: Integer): Boolean;
var
  bTieneLineas: Boolean;
  bEsValida: Boolean;
begin
  bEsValida := True;
  bTieneLineas := dmmFac.TieneLineas(sSerie, iNumero);

  if not bTieneLineas then
  begin
    bEsValida := False;
    ShowMessage('El borrador no tiene lineas');
    frmOpenApp.VeriFactuLog.RegistrarError('Intento de consolidación. ' +
                                           'Factura sin lineas',
      'Borrador ' + sSerie + '\' + IntToStr(iNumero) + ' sin lineas',
                                                               sSerie, iNumero);
  end;
  if not (dsTablaG.State in [dsEdit, dsInsert]) then
    dmmFac.unqryFac.Edit;

  dmmFac.unqryFac.Post;  //obligo a validar la cabecera

  if ((dmmFac.unqryFac.FieldByName('CONSOLIDACION_FACTURA').AsString = 'S') and
      (dmmFac.unqryFac.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString
                                                            <> 'OFFLINE') ) then
  begin
    bEsValida := False;
    ShowMessage('La factura ya está consolidada');
    frmOpenApp.VeriFactuLog.RegistrarError('Intento de consolidación. ' +
                                           'Factura ya consolidada',
      'Factura ' + sSerie + '\' + IntToStr(iNumero) + ' consolidada',
                                                               sSerie, iNumero);
  end;
  Result := bEsValida;
end;

procedure TfrmMtoFac.prcActualizarEstadoConsolidacion(const sSerie: string;
  const iNumero: Integer; const sFase: string; const bConsolidada: Boolean);
var
  sConsolidada: string;
begin
  if bConsolidada then
    sConsolidada := 'S'
  else
    sConsolidada := 'N';
  SetConsolidationFase(iNumero, sSerie, sFase, sConsolidada);
end;

procedure TfrmMtoFac.prcGenerarQRProvisionalyencolar;
var
  sURLQR, sPref, sNif: String;
  frmQR: TfrmMtoGenerarQR;
  bmpQR: TBitmap;
  PngImage: TPngImage;
  Stream: TMemoryStream;
  formatSettings: TFormatSettings;
begin
  Stream := TMemoryStream.Create;
  try
    dmmFac.unqryConsolidacion.ReadOnly := false;
    dmmFac.unqryConsolidacion.Insert;
    sURLQR := dmmFac.GetURLOffLineVerifactu;
    formatSettings := TFormatSettings.Create;
    formatSettings.DecimalSeparator := '.';
    CargarConfiguracionOffline(sPref, sNif);
    sURLQR := sURLQR + 'nif=' + sNif + '&numserie=' + sPref+
      dsTablaG.dataset.FieldByName('SERIE_FACTURA').AsString +
      '%2F' + dsTablaG.dataset.FieldByName('NRO_FACTURA').AsString +
      '&fecha=' + FormatDateTime('dd-mm-yyyy',
      dsTablaG.dataset.FieldByName('FECHA_FACTURA').AsDateTime) +
      '&importe=' + FormatFloat('0.00',
      dsTablaG.dataset.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat,
      formatSettings);
    try
      frmQR := TfrmMtoGenerarQR.Create(Self);
      frmQR.Hide;
      bmpQR := frmQR.GetQRImage(sURLQR);
    finally
      FreeAndNil(frmQR);
    end;
    PngImage := TPngImage.Create;
    try
      bmpQR.PixelFormat := pf1bit;
      PngImage.Assign(bmpQR);
      PngImage.SaveToStream(Stream);
      Stream.Position := 0;
      dmmFac.unqryConsolidacion.FieldByName('ID_CONSOLIDACION').AsInteger :=
        GetNextCont('CS');
      (dmmFac.unqryConsolidacion.FieldByName('QRCODE_PNG') as
        TBlobField).LoadFromStream(Stream);
      dmmFac.unqryConsolidacion.FieldByName('ESTADO').AsString := 'PENDIENTE';
      dmmFac.unqryConsolidacion.FieldByName('VERIFACTU_URL').AsString :=
        sURLQR;
      dmmFac.unqryConsolidacion.FieldByName('PETICION_COMPLETA').AsString :=
        BuildInvoiceJSON(dmmFac.unqryFac.FieldByName('NRO_FACTURA').AsString,
        dmmFac.unqryFac.FieldByName('SERIE_FACTURA').AsString);
      dmmFac.unqryConsolidacion.Post;
      dmmFac.unqryConsolidacion.Refresh;
      dmmFac.unqryConsolidacion.ReadOnly := true;
    finally
      PngImage.Free;
    end;
  finally
    Stream.Free;
  end;
end;

{ TfrmMtoFac - Eventos de formulario }
procedure TfrmMtoFac.FormCreate(Sender: TObject);
begin
  dmmFac := TDMFac.Create(Self);
//  cxlclzr1.Active := False;
//  cxlclzr1.Active := True;
  cxchkNoNIFControl.Checked := False;
  dsTablaG.DataSet := dmmFac.unqryFac;
  tvLineasFactura.DataController.DataSource := dmmFac.dsLinFac;
  tvLineasRecibos.DataController.DataSource := dmmFac.dsRecibos;
  tvEventosVeriFactu.DataController.DataSource := dmmFac.dsErrores;
  tvHistoriaDental.DataController.DataSource := dmmFac.dsHistoria;
  AsignarControles;
  cbbSerieFactura.Properties.ListSource := dmmFac.dsSeries;
  cbbFORMAPAGO.Properties.ListSource := dmmFac.dsFormasPago;
  prcCheckConsolidacion;
  prcCheckSimpl;
  inherited;
end;

procedure TfrmMtoFac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmmFac);
end;

{ TfrmMtoFac - Eventos de botones }
procedure TfrmMtoFac.btnCrearActualizarCliClick(Sender: TObject);
var
  sCodCliente: string;
begin
  inherited;
  sCodCliente := dmmFac.unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString;
  if sCodCliente = '0' then
    dmmFac.NuevoCliente;
  dmmFac.CrearCliente;
  ShowMessage('Paciente: ' + sCodCliente +
    ' pasado correctamente a la tabla de pacientes');
end;

procedure TfrmMtoFac.btnNuevaFacturaClick(Sender: TObject);
begin
  inherited;
  if ((dmmFac.unqryFac.State <> dsInsert) and
    (dmmFac.unqryFac.State <> dsEdit)) then
  begin
    dmmFac.unqryFac.ReadOnly := False;
    dmmFac.unqryFac.Insert;
    pcPantalla.ActivePage := tsFicha;
    tsFicha.SetFocus;
    tsCabecera.PageControl.ActivePage := tsCabecera;
    tsCabecera.SetFocus;
    btnCODIGO_CLIENTE.SetFocus;
    cxpgcntrlFacturacx.ActivePageIndex := tsLineasFactura.PageIndex;
    tsLineasFactura.SetFocus;
  end;
end;

procedure TfrmMtoFac.btnConsolidarClick(Sender: TObject);
var
  bConnected: Boolean;
  sCausaOFF: string;
  sSerieFactura: String;
  iNumeroFactura: Integer;
  sJSONPeticion: string;
  bProcesarOK: Boolean;
begin
  Screen.Cursor := crHourGlass;
  sbGrabarClick(Sender);
  sSerieFactura := dmmFac.unqryFac.FieldByName('SERIE_FACTURA').AsString;
  iNumeroFactura := dmmFac.unqryFac.FieldByName('NRO_FACTURA').AsInteger;
  if not fncValidarFacturaAntesConsolidacion(sSerieFactura, iNumeroFactura) then
    Exit;
  bConnected := fncHayConexion;
  if not bConnected then
  begin
    ShowMessage('Se generará un QR provisional');
    prcGenerarQRProvisionalYEncolar;
    prcActualizarEstadoConsolidacion(sSerieFactura,
                                     iNumeroFactura,
                                     'OFFLINE',
                                     True);
    frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
      'Consolidada OFFLINE, causa ' + sCausaOFF +
      dsTablaG.Dataset.FieldByName('TOTAL_LIQUIDO_FACTURA').AsString,
                                       sSerieFactura, iNumeroFactura );
    btnImprimirClick(Self);
  end
  else
  begin
    try
      sJSONPeticion := BuildInvoiceJSON(IntToStr(iNumeroFactura), sSerieFactura);
            frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
                                          'Enviando petición de consolidación. ',
                                                 sSerieFactura, iNumeroFactura,
                                                 sJSONPeticion);
      bProcesarOK := CrearYProcesarConsolidacion(sSerieFactura,
                                                 iNumeroFactura,
                                                 sJSONPeticion);
      if bProcesarOK then
      begin
        dmmFac.unqryConsolidacion.Refresh;
        if (dmmFac.unqryConsolidacion.RecordCount > 0) then
          if (dmmFac.unqryConsolidacion.FieldByName('ESTADO').AsString <>
                                                               'PENDIENTE') then
          begin
            prcActualizarEstadoConsolidacion(sSerieFactura, iNumeroFactura,
              'ONLINE', True);
            dmmFac.unqryFac.Refresh;
            btnImprimirClick(Self);
          end;
        end
        else
          ShowMessage('Error al procesar la consolidación de la factura.' +
                      ' Verifique en pestaña Eventos');
    except
      on E: Exception do
      begin
        ShowMessage('Error en consolidación: ' + E.Message);
      end;
    end;
  end;
  dmmFac.unqryFac.Refresh;
  dmmFac.unqryErrores.Refresh;
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoFac.prcCancelarFacturaVerifactu(const sSerie: string;
  const iNumero: Integer);
var
  VerifactuClient: TVerifactuClient;
  iQueueId: Integer;
  sJSONResponse: string;
  CancelResponse: TCancelationResponse;
  bPuedeCancelar: Boolean;
begin
  // Validaciones iniciales
  bPuedeCancelar := True;
  // Verificar que la factura esté consolidada
  if ((dsTablaG.DataSet.FieldByName('CONSOLIDACION_FACTURA').AsString = 'N') or
     (dsTablaG.DataSet.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString =
                                                                'OFFLINE')) then
  begin
    ShowMessage('Solo se pueden cancelar facturas consolidadas y enviadas');
    Exit;
  end;
  // Verificar que no esté ya cancelada
  if dsTablaG.DataSet.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString =
                                                                'CANCELADA' then
  begin
    ShowMessage('La factura ya está cancelada');
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  iQueueId := dmmFac.fncObtenerQueueIdFactura(sSerie, iNumero);
  if iQueueId = 0 then
  begin
    ShowMessage('No se encontró el Queue ID de la factura en Verifactu');
    frmOpenApp.VeriFactuLog.RegistrarError(
      'Queue ID no encontrado para cancelación', '', sSerie, iNumero);
    Exit;
  end;
  if not fncHayConexion then
  begin
    ShowMessage('No hay conexión con el servicio Verifactu');
    frmOpenApp.VeriFactuLog.RegistrarError(
      'Sin conexión para cancelación', '', sSerie, iNumero);
    Exit;
  end;
  // Confirmar cancelación
  if MessageDlg(Format('¿Está seguro de cancelar la factura %s/%d?',
                       [sSerie, iNumero]),
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  try
    VerifactuClient := TVerifactuClient.Create(frmOpenApp.FDmConn.conUni);
    try
      // Realizar cancelación
      sJSONResponse := VerifactuClient.CancelarFacturaPorQueueId(iQueueId);
      // Procesar respuesta
      CancelResponse :=
                    VeriFactuClient.ProcesarRespuestaCancelacion(sJSONResponse);
      if CancelResponse.Success then
      begin
        // Cancelación exitosa
        ShowMessage('Factura cancelada correctamente en AEAT');
        // Actualizar estado
        prcActualizarEstadoConsolidacion(sSerie, iNumero, 'CANCELADA', True);
        // Guardar información de cancelación en BD
        //dmmFac.GuardarCancelacionVerifactu(sSerie, iNumero, CancelResponse);
        // Log de éxito
        frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
          Format('Cancelada correctamente. QueueId: %d, RequestId: %s',
                 [CancelResponse.QueueId, CancelResponse.RequestId]),
          sSerie, iNumero, CancelResponse.JSONCompleto);
        // Refrescar datos
        dmmFac.unqryFac.Refresh;
        dmmFac.unqryConsolidacion.Refresh;
      end
      else
      begin
        // Error en cancelación
        VerifactuClient.ProcesarErrorCancelacion(CancelResponse,
                                                               sSerie, iNumero);
      end;
    finally
      FreeAndNil(VerifactuClient);
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Error en cancelación: ' + E.Message);
      frmOpenApp.VeriFactuLog.RegistrarError(
        'Excepción en cancelación: ' + E.Message, '', sSerie, iNumero);
    end;
  end;
end;

procedure TfrmMtoFac.prcConsultarEstadoFacturaVerifactu(const sSerie: string;
  const iNumero: Integer);
var
  VerifactuClient: TVerifactuClient;
  iQueueId: Integer;
  sEstadoRespuesta: string;
  bConsultaOK: Boolean;
  StateHandler: TStateHandler;
  State: TVerificationState;
  sMessage, sErrorCode: string;
begin
  Screen.Cursor := crHourGlass;
  bConsultaOK := True;
  iQueueId := fncObtenerQueueIdFactura(sSerie, iNumero);
  if iQueueId = 0 then
  begin
    bConsultaOK := False;
    ShowMessage('No se encontró el Queue ID de la factura en Verifactu');
  end;
  if bConsultaOK and not fncHayConexion then
  begin
    bConsultaOK := False;
    ShowMessage('No hay conexión con el servicio Verifactu');
  end;
  if bConsultaOK then
  begin
    VerifactuClient := TVerifactuClient.Create(frmOpenApp.FDmConn.conUni);
    try
      sEstadoRespuesta := VerifactuClient.ConsultarEstadoFactura(iQueueId,
                                                               sSerie, iNumero);
      if Trim(sEstadoRespuesta) <> '' then
      begin
        //ShowMessage('Estado de la factura en Verifactu:' + sLineBreak +
        //  sLineBreak + sEstadoRespuesta);

        StateHandler := TStateHandler.Create;
        try
          // Tu respuesta JSON con error
          StateHandler.HandleResponseWithCode(
                                sEstadoRespuesta,
                                State,
                                sMessage,
                                sErrorCode);
          if State = vsPending then
          begin
              frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
                  'Factura en espera. Todavía no ha sido enviada al servidor. ',
                                             sSerie, iNumero, sEstadoRespuesta);
          end;
          if State = vsVerified then
          begin
            frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
                  'OK. Factura enviada y aprobada en AEAT.',
                                             sSerie, iNumero, sEstadoRespuesta);
          if (dmmFac.unqryFac.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString
                                                            <> 'CANCELADA') then
              SetConsolidationFase(iNumero, sSerie, 'VERIFICADA', 'S');
          end;
          if State = vsErrorFatal then
          begin
            if dmmFac.unqryFac.FieldByName(
                          'FASE_CONSOLIDACION_FACTURA').AsString = 'ONLINE' then
              SetConsolidationFase(iNumero, sSerie, 'ERROR', 'S');
            TVerifactuErrorHandler.HandleVerifactuError(
                       sErrorCode, sMessage, sEstadoRespuesta, sSerie, iNumero);
//              frmOpenApp.VeriFactuLog.RegistrarError(
//                         'ERROR NO CATALOGADO ' +
//                         'Estado: ' + sMessage,
//                                      sEstadoRespuesta,
//                                      sSerie,
//                                      iNumero
//                                      );

          end;

        finally
            StateHandler.Free;
        end;
      end
      else
      begin
        ShowMessage('No se pudo obtener el estado de la factura');
        frmOpenApp.VeriFactuLog.RegistrarError('',
          'Error consultando estado factura ' + sSerie + '\' +
          IntToStr(iNumero));
      end;
    finally
      FreeAndNil(VerifactuClient);
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMtoFac.btnConsultarEstadoClick(Sender: TObject);
var
  sSerieFactura: string;
  iNumeroFactura: Integer;
  bPuedeConsultar: Boolean;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  { Obtener datos de la factura actual }
  sSerieFactura := dsTablaG.DataSet.FieldByName('SERIE_FACTURA').AsString;
  iNumeroFactura := dsTablaG.DataSet.FieldByName('NRO_FACTURA').AsInteger;

  { Validar que la factura está consolidada y online, que se ha enviado}
  bPuedeConsultar :=
         (dsTablaG.DataSet.FieldByName('CONSOLIDACION_FACTURA').AsString = 'S')
    and (dsTablaG.DataSet.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString <>
                                                                    'OFFLINE')
     and (dsTablaG.DataSet.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString <>
                                                                 'VERIFICADA');
  if not bPuedeConsultar then
  begin
    ShowMessage('Solo se puede consultar el estado de facturas consolidadas');
  end
  else
  begin
    try
      prcConsultarEstadoFacturaVerifactu(sSerieFactura, iNumeroFactura);
      dmmFac.unqryFac.Refresh;
      dmmFac.unqryErrores.Refresh;
      ShowMessage('Consulte la pestaña Eventos Verifactu');
    except
      on E: Exception do
      begin
        ShowMessage('Error al consultar estado: ' + E.Message);
        frmOpenApp.VeriFactuLog.RegistrarError('',
          'Excepción consultando estado factura ' + sSerieFactura + '/' +
          IntToStr(iNumeroFactura) + ': ' + E.Message);
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoFac.btnReconsolidarClick(Sender: TObject);
var
  iIDConsolidacion: Integer;
  bProcessOK: Boolean;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if (dmmFac.unqryConsolidacion.RecordCount > 0) then
  begin
    iIDConsolidacion :=
      dmmFac.unqryConsolidacion.FieldByName('ID_CONSOLIDACION').AsInteger;
    if not fncHayConexion then
    begin
      ShowMessage('No hay internet');
      Exit;
    end;
    if (dmmFac.unqryConsolidacion.FieldByName('ESTADO').AsString = 'OFFLINE') then
    begin
      bProcessOK := LlamarWebServiceVerifactu(iIDConsolidacion);
      if bProcessOK then
      begin
        ShowMessage('Consolidación ' + IntToStr(iIDConsolidacion) +
          ' procesada correctamente');
        prcActualizarEstadoConsolidacion(
          dsTablaG.DataSet.FieldByName('SERIE_FACTURA').AsString,
          dsTablaG.DataSet.FieldByName('NRO_FACTURA').AsInteger,
          'ONLINE', True);
        dmmFac.unqryFac.Refresh;
        dmmFac.unqryConsolidacion.Refresh;
        frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
          'Re-Consolidada ONLINE ' +
          dsTablaG.DataSet.FieldByName('SERIE_FACTURA').AsString + '\' +
          IntToStr(dsTablaG.DataSet.FieldByName('NRO_FACTURA').AsInteger) +
          dsTablaG.Dataset.FieldByName('TOTAL_LIQUIDO_FACTURA').AsString,
          dsTablaG.DataSet.FieldByName('SERIE_FACTURA').AsString,
          dsTablaG.DataSet.FieldByName('NRO_FACTURA').AsInteger);
      end;
    end
    else
      ShowMessage('Sólo se puede Re-consolidar con estado OFFLINE');
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoFac.btnRectificarClick(Sender: TObject);
var
  form: TfrmGenFacRec;
begin
  inherited;
  form := TfrmGenFacRec.Create(Application);
  try
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TfrmMtoFac.btnSubsanacionClick(Sender: TObject);
begin
  inherited;
  //
  prcSubsanacionManual(dsTablaG.DataSet.findField('SERIE_FACTURA').AsString,
                       dsTablaG.DataSet.findField('NRO_FACTURA').AsInteger);
  dsTablaG.DataSet.Refresh;
  dmmFac.unqryErrores.Refresh;
  dmmFac.unqryLinFac.Refresh;
end;

procedure TfrmMtoFac.prcSubsanacionManual(const sSerie: string; const iNumero: Integer);
var
  frmSubsanacion: TfrmModalSubsanacion;
  bPuedeSubsanar: Boolean;
  sFase:string;
begin
  // Validaciones previas
  bPuedeSubsanar := True;

  // Verificar que la factura existe y está consolidada
  if (dsTablaG.DataSet.IsEmpty) then
  begin
    ShowMessage('No hay ninguna factura seleccionada');
    bPuedeSubsanar := False;
  end;

  if bPuedeSubsanar and
  (dsTablaG.DataSet.FieldByName('CONSOLIDACION_FACTURA').AsString <> 'S') then
  begin
    ShowMessage('Sólo se pueden subsanar facturas que estén consolidadas');
    bPuedeSubsanar := False;
  end;
  sFase := dsTablaG.DataSet.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString;
  if sFase = 'OFFLINE' then
  begin
    ShowMessage('Sólo se pueden subsanar facturas que estén enviadas');
    bPuedeSubsanar := False;
  end;


  // Verificar que está en estado de error o necesita subsanación
//  if bPuedeSubsanar then
//  begin
//    sFase :=
//            dsTablaG.DataSet.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString;
//    if not ((sFase = 'ERROR') ) then
//    begin
//      ShowMessage('La factura no está en estado de error.');
//      bPuedeSubsanar := False;
//    end;
//  end;
  if bPuedeSubsanar then
  begin
    try
      frmSubsanacion := TfrmModalSubsanacion.Create(Self,
                                                    sSerie,
                                                    iNumero);
      try
        if frmSubsanacion.ShowModal = mrOk then
        begin
          // Refrescar los datos después de la subsanación exitosa
          dmmFac.unqryFac.Refresh;
          dmmFac.unqryConsolidacion.Refresh;
          dmmFac.unqryErrores.Refresh;
          ShowMessage('Subsanación completada correctamente.' + sLineBreak +
                     'Verifique el estado en la pestaña Verifactu.');
          // Cambiar a la pestaña Verifactu para mostrar los resultados
          cxpgcntrlFacturacx.ActivePage := tsVeriFactu;
        end;
      finally
        FreeAndNil(frmSubsanacion);
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Error al abrir el formulario de subsanación: ' + E.Message);
        frmOpenApp.VeriFactuLog.RegistrarError(
          'Error abriendo subsanación manual: ' + E.Message, '', sSerie, iNumero);
      end;
    end;
  end;
end;

procedure TfrmMtoFac.btnImprimirClick(Sender: TObject);
var
  form: TfrmPrintFac;
begin
  inherited;
  form := TfrmPrintFac.Create(Application);
  try
    form.edtNroFac.Text :=
      dsTablaG.DataSet.findField('NRO_FACTURA').AsString;
    form.edtSerie.Text :=
      dsTablaG.DataSet.findField('SERIE_FACTURA').AsString;
    form.cxchkEsSimpl.Checked :=
      (dsTablaG.DataSet.findField('ESSIMPL_FACTURA').AsString = 'S');
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TfrmMtoFac.btn5Click(Sender: TObject);
var
  form: TfrmPrintFacRec;
begin
  inherited;
  form := TfrmPrintFacRec.Create(Application);
  try
    form.edtNroFac.Text :=
      dmmFac.unqryRecibos.findField('NRO_FACTURA').AsString;
    form.edtSerie.Text :=
      dmmFac.unqryRecibos.findField('SERIE_FACTURA').AsString;
    form.edtRecibo.Text :=
      dmmFac.unqryRecibos.findField('NRO_PLAZO_RECIBO').AsString;
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TfrmMtoFac.btnGenerarRecibosClick(Sender: TObject);
begin
  inherited;
  if ((DMMfAC.unqryFac.State = dsEdit) or
    (dmmFac.unqryFac.State = dsInsert)) then
    dmmFac.unqryFac.Post;
  dmmFac.unstrdprcGetRecibos.ParamByName('pNRO_FACTURA').AsInteger :=
    dmmFac.unqryFac.FieldByName('NRO_FACTURA').AsInteger;
  dmmFac.unstrdprcGetRecibos.ParamByName('pSERIE_FACTURA').AsString :=
    dmmFac.unqryFac.FieldByName('SERIE_FACTURA').AsString;
  dmmFac.unstrdprcGetRecibos.ExecProc;
  dmmFac.unqryRecibos.Refresh;
end;

procedure TfrmMtoFac.btnReciboPagadoClick(Sender: TObject);
begin
  inherited;
  prcCambiarEstadoRecibo('Pagado');
end;

procedure TfrmMtoFac.btnReciboEmitidoClick(Sender: TObject);
begin
  inherited;
  prcCambiarEstadoRecibo('Emitido');
end;

procedure TfrmMtoFac.btnReciboDevueltoClick(Sender: TObject);
begin
  inherited;
  prcCambiarEstadoRecibo('Devuelto');
end;

procedure TfrmMtoFac.sbGrabarClick(Sender: TObject);
begin
  with dmmFac do
  begin
    if ((unqryFac.State = dsInsert) or (unqryFac.State = dsEdit)) then
      unqryFac.Post;
    if ((dsLinFac.Dataset.State = dsInsert) or
      (dsLinFac.Dataset.State = dsEdit)) then
      dsLinFac.Dataset.Post;
    if ((unqryHistoria.State = dsInsert) or
      (unqryHistoria.State = dsEdit)) then
      unqryHistoria.Post;
  end;
end;

{ TfrmMtoFac - Eventos de búsqueda y selección }

procedure TfrmMtoFac.btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  formulario: TfrmMtoSearch;
begin
  if (dmmFac.unqryFac.ReadOnly = false) then
  begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmFac.unqryCliDataFac;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Clientes');
      formulario.Caption := 'Búsqueda de Pacientes en Facturas';
      formulario.ShowModal;
    finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmFac.CopiarClienteaFactura;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
    end;
  end;
end;

procedure TfrmMtoFac.btnPAIS_CLIENTEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  formulario: TfrmMtoSearch;
begin
  if (dmmFac.unqryFac.ReadOnly = false) then
  begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmFac.unqryPaises;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Paises');
      formulario.Caption := 'Búsqueda de Paises en Facturas de Cliente';
      formulario.ShowModal;
    finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmFac.CopiarPaisaCliente;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
    end;
  end;
end;

procedure TfrmMtoFac.btnNroFacturaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if (dsTablaG.State = dsInsert) then
    dmmFac.NuevaFactura;
end;

procedure TfrmMtoFac.cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario: TfrmMtoSearch;
begin
  if (dmmFac.unqryLinFac.ReadOnly = false) then
  begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmFac.unqryArtDataLinFac;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Productos');
      formulario.Caption := 'Búsqueda de Tratamientos en Lineas de Facturas';
      formulario.ShowModal;
    finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmFac.CopiarArticuloaLineaFactura;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
    end;
  end;
end;

procedure TfrmMtoFac.cxgrdbclmntv1ODONTOLOGOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario: TfrmMtoSearch;
begin
  if (dmmFac.unqryLinFac.ReadOnly = false) then
  begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmFac.unqryDocDataFac;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      formulario.Caption := 'Búsqueda de Odontólogos en Lineas de Facturas';
      formulario.ShowModal;
    finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmFac.CopiarOdontologoaLineaFactura;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
    end;
  end;
end;

procedure TfrmMtoFac.cxgrdbclmncxgrdbtblvw1DESCRIPCION_HISTORIAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  form: TfrmModalHistoriaCli;
begin
  inherited;
  form := TfrmModalHistoriaCli.Create(Application);
  form.cxdbmHistoria.DataBinding.DataSource := dmmFac.dsHistoria;
  try
    form.ShowModal;
  finally
    FreeAndNil(form);
    dmmFac.unqryHistoria.Refresh;
  end;
end;

{ TfrmMtoFac - Eventos de cambio de datos }

procedure TfrmMtoFac.btnCODIGO_CLIENTEPropertiesEditValueChanged(
  Sender: TObject);
var
  e: TcxCustomEdit;
  sCodigo: String;
begin
  inherited;
  if (dmmFac <> nil) then
  begin

  end;
end;

procedure TfrmMtoFac.cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesEditValueChanged(
  Sender: TObject);
var
  E: TcxCustomEdit;
begin
  inherited;
  if ((dmmFac.unqryLinFac.State = dsInsert) or
    (dmmFac.unqryLinFac.State = dsEdit)) then
  begin
    with dmmFac.unstrdprcGetDataArticulo do
    begin
      e := Sender as TcxCustomEdit;
      ParamByName('pidcodarticulo').AsString := VarToStr(e.EditingValue);
      ExecProc;
      dmmFac.unqryLinFac.FindField('CODIGO_ARTICULO_LINEA').AsString :=
        VarToStr(e.EditingValue);
      dmmFac.unqryLinFac.FindField('DESCRIPCION_ARTICULO_LINEA').AsString :=
        ParamByName('pidnomarticulo').AsString;
      dmmFac.unqryLinFac.FindField('PRECIOVENTA_ARTICULO_LINEA').AsFloat :=
        ParamByName('pidprecioventa').AsFloat;
    end;
  end;
end;

procedure TfrmMtoFac.cbbSerieFacturaPropertiesChange(Sender: TObject);
var
  e: TcxCustomEdit;
begin
  inherited;
  if (dmmFac <> nil) then
  begin
    if ((dmmFac.unqryFac.State = dsInsert)) then
    begin
      e := Sender as TcxCustomEdit;
      if dmmFac.SerieEsSimp(VarToStr(e.EditingValue)) then
        dmmFac.unqryFac.FieldByName('ESSIMPL_FACTURA').AsString := 'S'
      else
        dmmFac.unqryFac.FieldByName('ESSIMPL_FACTURA').AsString := 'N';
    end;
  end;
end;

procedure TfrmMtoFac.chkConsolidadaPropertiesChange(Sender: TObject);
begin
  inherited;
  if ((dmmFac <> nil) and (dmmFac.unqryFac <> nil) and
    (dmmFac.unqryFac.Disconnected = false)) then
    prcCheckConsolidacion;
end;

procedure TfrmMtoFac.chkEsSimplPropertiesChange(Sender: TObject);
begin
  inherited;
  if ((dmmFac <> nil) and (dmmFac.unqryFac <> nil) and
    (dmmFac.unqryFac.Disconnected = false)) then
  begin
    prcCheckSimpl;
    if (fncCabeceraEdit) then
    begin
      if (chkEsSimpl.Checked = True) then
      begin
        dmmFac.SeleccionarSerieSimpl;
      end
      else if (chkEsSimpl.Checked = False) then
        dmmFac.SeleccionarSerie;
    end;
  end;
end;

procedure TfrmMtoFac.dbcGrdDBTabPrinFASE_CONSOLIDACION_FACTURACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
     AColor:TColor;
     ATextColor:TColor;
     sEstado:String;
begin
  inherited;
//
  sEstado := UpperCase(Trim(VarToStr(AViewInfo.DisplayValue)));

//    if (sEstado = '') or (sEstado = 'BORRADOR') then
//      AViewInfo.BackgroundBitmap := nil // Usar color por defecto
  if cxGrdDBTabPrin.DataController.DataSet.State = dsBrowse then
    if (sEstado = 'ERROR') or (sEstado = 'ERROR_BORRADOR') then
  begin
    AColor := RGB(240, 128, 128); // Light coral - más suave que el rojo
    ATextColor := clBlack;
  end
  else if sEstado = 'OFFLINE' then
  begin
    AColor := RGB(173, 216, 230); // Light blue - más suave que el azul puro
    ATextColor := clBlack;
  end
  else if sEstado = 'ONLINE' then
  begin
    AColor := RGB(255, 235, 59);
    ATextColor := clBlack;
  end
  else if sEstado = 'CANCELADA' then
  begin
    AColor := RGB(218, 165, 32);
    ATextColor := clBlack;
  end
  else if (sEstado = 'VERIFICADO') or (sEstado = 'VERIFICADA') then
  begin
    AColor := RGB(144, 238, 144); // Light green - más suave que el verde lima
    ATextColor := clBlack;
  end
  else
  begin
    AColor := clWhite;
    ATextColor := clBlack;
  end;

  ACanvas.Brush.Color := AColor;
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.Font.Color := ATextColor;
  ACanvas.DrawText(VarToStr(AViewInfo.DisplayValue),
                   AViewInfo.TextBounds,
                   cxAlignLeft or cxAlignVCenter);
  ADone := True;
//  end;
end;

procedure TfrmMtoFac.dsTablaGDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if dsTablaG.State = dsInsert then
  begin
    btnNroFactura.Properties.ReadOnly := false;
    cbbSerieFactura.Properties.ReadOnly := false;
    chkEsSimpl.Properties.ReadOnly := false;
  end
  else
  begin
    btnNroFactura.Properties.ReadOnly := true;
    cbbSerieFactura.Properties.ReadOnly := true;
    chkEsSimpl.Properties.ReadOnly := true;
  end;

end;

procedure TfrmMtoFac.btnPAIS_CLIENTEPropertiesChange(Sender: TObject);
begin
  inherited;
  if (dmmFac <> nil) and (dmmFac.unqryFac.Disconnected = false) then
  begin
    if (dmmFac.unqryFac.findField('PAIS_CLIENTE_FACTURA').AsString <> 'ES') then
      rgTIPOID_INT_CLIENTE.Visible := True
    else
      rgTIPOID_INT_CLIENTE.Visible := False;
  end;
end;

{ TfrmMtoFac - Eventos de teclado }

procedure TfrmMtoFac.AsignarControles;
begin
  spID_CONSOLIDACION.DataBinding.DataSource := dmmFac.dsConsolidacion;
  txtESTADO.DataBinding.DataSource := dmmFac.dsConsolidacion;
  cxdbmRESPUESTA_COMPLETA.DataBinding.DataSource := dmmFac.dsConsolidacion;
  imgQRCODE_PNG.DataBinding.DataSource := dmmFac.dsConsolidacion;
  spQUEUE_ID.DataBinding.DataSource := dmmFac.dsConsolidacion;
  dteFECHA_PROCESAMIENTO.DataBinding.DataSource := dmmFac.dsConsolidacion;
  txtISSUER_IRS_ID.DataBinding.DataSource := dmmFac.dsConsolidacion;
  dteISSUED_TIME.DataBinding.DataSource := dmmFac.dsConsolidacion;
  txtCHAIN_NUMBER.DataBinding.DataSource := dmmFac.dsConsolidacion;
  txtCHAIN_HASH.DataBinding.DataSource := dmmFac.dsConsolidacion;
  cxdbmVERIFACTU_URL.DataBinding.DataSource := dmmFac.dsConsolidacion;
  cxdbmQRCODE_BASE64.DataBinding.DataSource := dmmFac.dsConsolidacion;
  cxdbmPETICION_COMPLETA1.DataBinding.DataSource := dmmFac.dsConsolidacion;
end;

procedure TfrmMtoFac.btn3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Reservado para futuras funcionalidades
end;

procedure TfrmMtoFac.btnCancelarFacturaClick(Sender: TObject);
begin
  inherited;
  prcCancelarFacturaVerifactu(
                  dsTablaG.DataSet.FieldByName('SERIE_FACTURA').AsString,
                  dsTablaG.DataSet.FieldByName('NRO_FACTURA').AsInteger);
  dmmFac.unqryFac.Refresh;
  dmmFac.unqryErrores.Refresh;
end;

//procedure TfrmMtoFac.btnCODIGO_CLIENTEKeyPress(Sender: TObject; var Key: Char);
//var
//  sCodigo:String;
//begin
//  inherited;
//  if Key = #13 then
//  begin
//    Key := #0;
//    if (fncCabeceraEdit) then
//    begin
//      sCodigo := dmmFac.unqryFac.FindField('CODIGO_CLIENTE_FACTURA').AsString;
//      if ((sCodigo <> '') and (sCodigo <> '0')) then
//      begin
//        with dmmFac.unstrdprcGetDataCliente do
//        begin
//          ParamByName('pCODIGO_CLIENTE').AsString :=
//                   dmmFac.unqryFac.FindField('CODIGO_CLIENTE_FACTURA').AsString;
//          ExecProc;
//          dmmFac.unqryFac.FindField('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
//            ParamByName('pRAZONSOCIAL_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('NOMBRE').AsString :=
//            ParamByName('pNOMBRE').AsString;
//          dmmFac.unqryFac.FindField('APELLIDOS').AsString :=
//            ParamByName('pAPELLIDOS').AsString;
//          dmmFac.unqryFac.FindField('NIF_CLIENTE_FACTURA').AsString :=
//            ParamByName('pNIF_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('MOVIL_CLIENTE_FACTURA').AsString :=
//            ParamByName('pMOVIL_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('EMAIL_CLIENTE_FACTURA').AsString :=
//            ParamByName('pEMAIL_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('DIRECCION1_CLIENTE_FACTURA').AsString :=
//            ParamByName('pDIRECCION1_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('DIRECCION2_CLIENTE_FACTURA').AsString :=
//            ParamByName('pDIRECCION2_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('POBLACION_CLIENTE_FACTURA').AsString :=
//            ParamByName('pPOBLACION_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('PROVINCIA_CLIENTE_FACTURA').AsString :=
//            ParamByName('pPROVINCIA_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('CPOSTAL_CLIENTE_FACTURA').AsString :=
//            ParamByName('pCPOSTAL_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('PAIS_CLIENTE_FACTURA').AsString :=
//            ParamByName('pPAIS_CLIENTE').AsString;
//          dmmFac.unqryFac.FindField('TIPOID_INT_CLIENTE_FACTURA').AsString :=
//            ParamByName('pTIPOID_INT_CLIENTE').AsString;
//        end;
//      end;
//    end;
//  end;
//end;

procedure TfrmMtoFac.btnCODIGO_CLIENTEKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Reservado para futuras funcionalidades
end;

procedure TfrmMtoFac.cbbSerieFacturaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_DOWN) and (Shift = [ssShift])) then
    cbbSerieFactura.DroppedDown := True;
end;

procedure TfrmMtoFac.dteFECHA_FACTURAKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_DOWN) and (Shift = [ssShift])) then
    dteFECHA_FACTURA.DroppedDown := True;
end;

procedure TfrmMtoFac.tvLineasFacturaCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
//  cxlclzr1.Active := False;
//  cxlclzr1.Locale := 1034;
//  cxlclzr1.Translate;
//  cxlclzr1.Active := True;
end;

procedure TfrmMtoFac.tvLineasFacturaEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  cxlclzr1.Active := False;
  cxlclzr1.Active := True;
  cxlclzr1.Locale := 1034;
end;

procedure TfrmMtoFac.tvLineasFacturaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sRazonSocial: string;
begin
  inherited;
  if (Shift <> [ssCtrl]) then
  begin
    if ((Key = VK_RETURN) and (dmmFac.dsLinFac.DataSet.RecordCount = 0)) then
    begin
      if ((dsTablaG.Dataset.State = dsInsert) or
          (dsTablaG.DataSet.state = dsEdit)) then
        dsTablaG.DataSet.Post;
      tvLineasFactura.DataController.Insert;
    end;
  end;
end;

procedure TfrmMtoFac.txtAPELLIDOSExit(Sender: TObject);
begin
  if ((dmmFac.unqryFac.State = dsEdit) or
    (dmmFac.unqryFac.State = dsInsert)) then
  begin
    inherited;
    with dmmFac do
    begin
//      buttonSelected := messagedlg('¿Desea copiar los datos de nombre ' +
//        'y apellidos?', mtConfirmation, mbYesNo, 0);
//      if buttonSelected = mrYes then
      begin
        unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
          unqryFac.FieldByName('NOMBRE').AsString + ' ' +
          unqryFac.FieldByName('APELLIDOS').AsString;
      end;
    end;
  end;
end;

procedure TfrmMtoFac.txtNOMBREExit(Sender: TObject);
begin
  if ((dmmFac.unqryFac.State = dsEdit) or
    (dmmFac.unqryFac.State = dsInsert)) then
  begin
    inherited;
    with dmmFac do
    begin
//      buttonSelected := messagedlg('¿Desea copiar los datos de nombre ' +
//        'y apellidos?', mtConfirmation, mbYesNo, 0);
//      if buttonSelected = mrYes then
      begin
        unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
          unqryFac.FieldByName('NOMBRE').AsString + ' ' +
          unqryFac.FieldByName('APELLIDOS').AsString;
      end;
    end;
  end;
end;

end.
