unit inMtoPre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer, vcl.Imaging.jpeg,
  cxCheckBox, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, UniDataPre,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  cxSplitter, cxImage, cxDBEdit, dxBarBuiltInMenu, cxPC, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxDBLookupComboBox,
  cxGridBandedTableView, cxGridDBBandedTableView, cxLocalization,
  cxGroupBox, DBCtrls, cxCurrencyEdit, Menus, cxButtons, cxButtonEdit,
                                                                    inlibDevExp,
  cxLookupEdit, cxDBLookupEdit, SYSTEM.Math,
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
  cxDBLabel, dxGDIPlusClasses, Vcl.ToolWin, System.UITypes,
  dxScrollbarAnnotations, JvExControls, JvgImage, cxRadioGroup, dxSkinBasic,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinTheBezier, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TDrawMode = (dmNone, dmDraw, dmErase, dmLine, dmCircle, dmRectangle, dmCross);
  TfrmMtoPre = class(TfrmMtoGen)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    cxspl1: TcxSplitter;
    cxpgcntrl1: TcxPageControl;
    cxpgcntrlFacturacx: TcxPageControl;
    tsLineasFactura: TcxTabSheet;
    ts5: TcxTabSheet;
    cxlbl17: TcxLabel;
    cxlbl18: TcxLabel;
    cxgrd5: TcxGrid;
    tvLineasPre: TcxGridDBTableView;
    tv2: TcxGridDBBandedTableView;
    cxgrdbndclmntv2PerId: TcxGridDBBandedColumn;
    cxgrdbndclmntv2AppointmentId: TcxGridDBBandedColumn;
    cxgrdbndclmntv2Linea: TcxGridDBBandedColumn;
    cxgrdbndclmntv2clave: TcxGridDBBandedColumn;
    cxgrdbndclmntv2valor: TcxGridDBBandedColumn;
    cxgrdbndclmntv2instantemodif: TcxGridDBBandedColumn;
    cxgrdbndclmntv2descripcion: TcxGridDBBandedColumn;
    cxgrdbndclmntv2parte: TcxGridDBBandedColumn;
    lv1: TcxGridLevel;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    ts8: TcxTabSheet;
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
    cxtbshtCabecera: TcxTabSheet;
    cxlbl1: TcxLabel;
    cxlbl3: TcxLabel;
    cxdbdtdtFECHA_FACTURA: TcxDBDateEdit;
    cxlbl8: TcxLabel;
    cbbSerieFactura: TcxDBLookupComboBox;
    cxtbshtDatosCliente: TcxTabSheet;
    btnNroFactura: TcxDBButtonEdit;
    cxdbm1: TcxDBMemo;
    btnNuevoPre: TSpeedButton;
    cxgrdbclmntv1LINEA_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1CODIGO_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1ZONA: TcxGridDBColumn;
    cxgrdbclmntv1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1CANTIDAD_LINEA: TcxGridDBColumn;
    cxgrdbclmntv1ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmntv1SUM_TOTAL_LINEA: TcxGridDBColumn;
    cxdbtxtdtRAZONSOCIAL_CLIENTE_FACTURA: TcxDBTextEdit;
    cxlbl7: TcxLabel;
    cxdbtxtdtRAZONSOCIAL_CLIENTE_FACTURA1: TcxDBTextEdit;
    btn1: TcxButton;
    cxgrdbclmnGrdDBTabPrinNOMBRE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinAPELLIDOS: TcxGridDBColumn;
    btnCODIGO_CLIENTE: TcxDBButtonEdit;
    cxlbl4: TcxLabel;
    cxlbl2: TcxLabel;
    cxdblbl1: TcxDBLabel;
    cxdblblRAZONSOCIAL_CLIENTE_FACTURA: TcxDBLabel;
    cxlbl5: TcxLabel;
    cxdblblCODIGO_CLIENTE: TcxDBLabel;
    cbbFORMAPAGO: TcxDBLookupComboBox;
    cxtbsht2: TcxTabSheet;
    btnGenerarRecibos: TcxButton;
    pnl4: TPanel;
    cxgrd2: TcxGrid;
    tvRecibos: TcxGridDBTableView;
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
    btnImprimirRecibo: TcxButton;
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
    btnCrearFactura: TSpeedButton;
    tsDibujo: TcxTabSheet;
    pnl6: TPanel;
    tlb1: TToolBar;
    btnNuevo: TcxButton;
    btnDibujar: TcxButton;
    btnColorAzul: TcxButton;    // NUEVO botón para líneas rectas
    pnl7: TPanel;
    dlgColor1: TColorDialog;
    btnGuardar: TcxButton;
    cxgrpbx1: TcxGroupBox;
    txtDIRECCION1_CLIENTE_FACTURA: TcxDBTextEdit;
    txtCPOSTAL_CLIENTE_FACTURA: TcxDBTextEdit;
    txtPOBLACION_CLIENTE_FACTURA: TcxDBTextEdit;
    txtPROVINCIA_CLIENTE_FACTURA: TcxDBTextEdit;
    txtDIRECCION2_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl6: TcxLabel;
    lblcxlbl13: TcxLabel;
    txtRAZONSOCIAL_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl14: TcxLabel;
    lblcxlbl15: TcxLabel;
    txtNOMBRE: TcxDBTextEdit;
    lblcxlbl16: TcxLabel;
    txtAPELLIDOS: TcxDBTextEdit;
    lblcxlbl9: TcxLabel;
    txtNIF_CLIENTE_FACTURA: TcxDBTextEdit;
    lblcxlbl104: TcxLabel;
    lblcxlbl11: TcxLabel;
    txtEMAIL_CLIENTE_FACTURA: TcxDBTextEdit;
    txtMOVIL_CLIENTE_FACTURA: TcxDBTextEdit;
    img1: TcxImage;
    btnResetear: TcxButton;
    imgImagenNew: TJvgBitmapImage;
    pbDibujo: TPaintBox;
    cxdbrdgrpTIPOID_INT_CLIENTE: TcxDBRadioGroup;
    lblDBNOMBRE_SPA_PAIS: TcxDBLabel;
    btnPAIS_CLIENTE: TcxDBButtonEdit;
    btnBorrar: TcxButton;
    btnColorVerde: TcxButton;
    btnColorRojo: TcxButton;
    btnCruz: TcxButton;
    btnRectangulo: TcxButton;
    btnCirculo: TcxButton;
    btnLinea: TcxButton;

    procedure FormCreate(Sender: TObject);
    procedure btnRectificarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure sbGrabarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cbb1PropertiesChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cxgrdbclmntv1ODONTOLOGOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnNuevoPreClick(Sender: TObject);
    procedure cxdbtxtdtRAZONSOCIAL_CLIENTE_FACTURA2Enter(Sender: TObject);
    procedure cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxgrd5Enter(Sender: TObject);
    procedure tvLineasPreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCODIGO_CLIENTEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbSerieFacturaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxdbdtdtFECHA_FACTURAKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnNroFacturaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnImprimirReciboClick(Sender: TObject);
    procedure btnGenerarRecibosClick(Sender: TObject);
    procedure btnReciboPagadoClick(Sender: TObject);
    procedure btnReciboEmitidoClick(Sender: TObject);
    procedure btnReciboDevueltoClick(Sender: TObject);
    procedure btnGenerarHistoriaClick(Sender: TObject);
    procedure btnCrearFacturaClick(Sender: TObject);
    //RELATIVOS AL DIBUJO
    procedure pbDibujoMouseUp(Sender: TObject; Button: TMouseButton;
                                             Shift: TShiftState; X, Y: Integer);
    procedure pbDibujoMouseMove(Sender: TObject; Shift: TShiftState; X,
                                                                    Y: Integer);
    procedure pbDibujoMouseDown(Sender: TObject; Button: TMouseButton;
                                             Shift: TShiftState; X, Y: Integer);
    procedure pbDibujoPaint(Sender: TObject);
    procedure UpdateTimerHandler(Sender: TObject);
    procedure btnResetearClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnDibujarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnColorAzulClick(Sender: TObject);
                                              // NUEVO procedimiento para líneas
    procedure dsTablaGDataChange(Sender: TObject; Field: TField);
    procedure btnPAIS_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure txtNOMBREExit(Sender: TObject);
    procedure txtAPELLIDOSExit(Sender: TObject);
    procedure pcPantallaChange(Sender: TObject);
    procedure tvLineasPreEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btnColorRojoClick(Sender: TObject);
    procedure btnColorVerdeClick(Sender: TObject);
    procedure btnLineaClick(Sender: TObject);
    procedure btnCirculoClick(Sender: TObject);
    procedure btnRectanguloClick(Sender: TObject);
    procedure btnCruzClick(Sender: TObject);
  private
    FDrawMode: TDrawMode;
    FIsDrawing: Boolean;
    FLastX, FLastY: Integer;
    FOriginalBitmap: TBitmap;
    FGhostX, FGhostY: Integer;
    FShowGhost: Boolean;
    FModified: Boolean;
    FDataSource: TDataSource;
    FUpdateTimer: TTimer;
    FDisplayBitmap: TBitmap;
    FBackBuffer: TBitmap;
    // NUEVAS variables para líneas rectas
    FLineStartX, FLineStartY: Integer;
    FLineEndX, FLineEndY: Integer;
    FIsDrawingLine: Boolean;
    FTempBitmap: TBitmap;
    //nuevas variables para cambio de color y formas nuevas
    FCurrentColor: TColor;
    FIsDrawingShape: Boolean;
    FShapeStartX, FShapeStartY: Integer;
    FShapeEndX, FShapeEndY: Integer;
    procedure SetDrawMode(const Value: TDrawMode);
    procedure SaveImageToDatabase;
    procedure LoadImageFromDatabase;
    procedure LoadImageFromDatabaseSilent;
    procedure RestoreOriginalImage;
    procedure UpdateDisplay;
    procedure UpdateButtonStates;
    procedure Initialize;
    procedure Finalize;
    procedure SetButtonHints;    // NUEVO procedimiento para configurar hints
    //FUNCIONES DE COORDENADAS PARA MOUSEUP, MOVE Y DOWN
    function MouseToBitmapCoords(X, Y: Integer): TPoint;
    function GetImageRect: TRect;
    procedure DrawOnBitmap(X, Y: Integer);
    procedure DrawLineOnBitmap(X1, Y1, X2, Y2: Integer);
                                            // NUEVA función para dibujar líneas
    procedure DrawCircleOnBitmap(X1, Y1, X2, Y2: Integer);
    procedure DrawRectangleOnBitmap(X1, Y1, X2, Y2: Integer);
    procedure DrawCrossOnBitmap(X1, Y1, X2, Y2: Integer);
  public
    property DrawMode: TDrawMode read FDrawMode write SetDrawMode;
    procedure CambiarEstadoRecibo(sEstado:string);
  end;

  procedure ShowMtoPre(Owner       : TComponent); overload;
  procedure ShowMtoPre(Owner       : TComponent; sidFactura: String); overload;
var
  frmMtoPre: TfrmMtoPre;
  dmmPre : TdmPre;

implementation

uses
  inLibWin, inMtoGenSearch,  inMtoModalPreRec, inMtoModalPreImp,
  inMtoModalPreRecImp,
  inLibPermission, inMtoPrincipal, inMtoModalHistoriaCli, inMtoModalPresuFac;

{$R *.dfm}

procedure ShowMtoPre(Owner       : TComponent); overload;
var
  frmMtoPre : TfrmMtoPre;
begin
  if not(IsOpenMDI('Presupuestos', Owner)) then
  begin
    Application.CreateForm(TfrmMtoPre, frmMtoPre);
    frmMtoPre.edtBusqGlobal.SetFocus;
  end;
end;

procedure ShowMtoPre(Owner       : TComponent; sidFactura: String); overload;
var
  frmMtoPre : TfrmMtoPre;
begin
  if not(IsOpenMDI('Presupuestos', Owner)) then
  begin
    Application.CreateForm(TfrmMtoPre, frmMtoPre);
  end;

  //dmPedFab.zqryFabCab.Locate('NUMPED', sidPedido, []);
end;

//RELATIVO A DIBUJOS
procedure TfrmMtoPre.UpdateTimerHandler(Sender: TObject);
begin
  FUpdateTimer.Enabled := False;
  // Solo actualizar si realmente hay cambios pendientes
  if FModified and Assigned(pbDibujo) then
    pbDibujo.Invalidate;
end;

procedure TfrmMtoPre.SetButtonHints;
begin
  // Hints descriptivos y claros para cada botón
  btnNuevo.Hint := 'Cargar imagen por defecto' + #13#10 +
                   'Reemplaza el dibujo actual con la imagen inicial limpia';
  btnNuevo.ShowHint := True;
  btnResetear.Hint := 'Restaurar imagen guardada' + #13#10 +
                      'Descarta los cambios actuales y vuelve a la' +
                                                      'última versión guardada';
  btnResetear.ShowHint := True;
  btnGuardar.Hint := 'Guardar en base de datos' + #13#10 +
                     'Guarda permanentemente los cambios' +
                                                      'realizados en el dibujo';
  btnGuardar.ShowHint := True;
  btnDibujar.Hint := 'Dibujo libre' + #13#10 +
                     'Permite dibujar líneas continuas arrastrando el mouse';
  btnDibujar.ShowHint := True;
  btnBorrar.Hint := 'Borrador' + #13#10 +
                    'Borra partes del dibujo restaurando la' +
                                                  'imagen original en esa zona';
  btnBorrar.ShowHint := True;
  btnLinea.Hint := 'Dibujar líneas rectas' + #13#10 +
                   'Haz clic en el punto inicial, luego en el punto final' +
                                                  'para trazar una línea recta';
  btnLinea.ShowHint := True;

  btnColorRojo.Hint := 'Cambiar color a rojo' + #13#10 +
                                        'Selecciona el color rojo para dibujar';
  btnColorRojo.ShowHint := True;
  btnColorVerde.Hint := 'Cambiar color a verde' + #13#10 +
                                       'Selecciona el color verde para dibujar';
  btnColorVerde.ShowHint := True;
  btnColorAzul.Hint := 'Cambiar color a azul' + #13#10 +
                                        'Selecciona el color azul para dibujar';
  btnColorAzul.ShowHint := True;
  btnCirculo.Hint := 'Dibujar círculos' + #13#10 +
                                    'Haz clic y arrastra para crear un círculo';
  btnCirculo.ShowHint := True;
  btnRectangulo.Hint := 'Dibujar rectángulos' + #13#10 +
                                 'Haz clic y arrastra para crear un rectángulo';
  btnRectangulo.ShowHint := True;
  btnCruz.Hint := 'Dibujar cruz (X)' + #13#10 +
                                      'Haz clic y arrastra para crear una cruz';
  btnCruz.ShowHint := True;
end;

procedure TfrmMtoPre.FormCreate(Sender: TObject);
begin
  dmmPre := TDMPre.Create(Self);
  dsTablaG.DataSet := dmmPre.unqryFac;
//  cxlclzr1.Active := False;
//  cxlclzr1.Active := True;
  tvLineasPre.DataController.DataSource := dmmPre.dsLinFac;
  tvRecibos.DataController.DataSource := dmmPre.dsRecibos;
  cbbSerieFactura.Properties.ListSource := dmmPre.dsSeries;
  cbbFORMAPAGO.Properties.ListSource := dmmPre.dsFormasPago;
  Initialize;
  inherited;
//  if not FbPermisoEscritura then
//  begin
//    dmmPre.zqryFac.ReadOnly := True;
//    dmmPre.zqryLinFac.ReadOnly := True;
//    dmmPre.zqryClientes.ReadOnly := True;
//  end;
end;

procedure TfrmMtoPre.btn1Click(Sender: TObject);
begin
  inherited;
  if dmmPre.unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString = '0' then
    dmmPre.NuevoCliente;
  dmmPre.CrearCliente;
  ShowMessage('Paciente:' +
      '' + dmmPre.unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString + '' +
                                'pasado correctamente a la tabla de pacientes');
end;

procedure TfrmMtoPre.btnNuevoPreClick(Sender: TObject);
begin
  inherited;
  if ((dmmPre.unqryFac.State <> dsInsert) and (dmmPre.unqryFac.State <> dsEdit))
                                                                            then
  begin
    dmmPre.unqryFac.Insert;
    pcPantalla.ActivePage := tsFicha;
    tsFicha.SetFocus;
    cxtbshtCabecera.PageControl.ActivePage := cxtbshtCabecera;
    cxtbshtCabecera.SetFocus;
    btnCODIGO_CLIENTE.SetFocus;
    cxpgcntrlFacturacx.ActivePageIndex := tsLineasFactura.PageIndex;
    tsLineasFactura.SetFocus;
  end;
end;

procedure TfrmMtoPre.btnPAIS_CLIENTEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Application);
  try
    formulario.dsData.DataSet := dmmPre.unqryPaises;
    formulario.dsData.DataSet.Open;
    formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
    PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Paises');
    formulario.Caption := 'Búsqueda de Paises en Presupuestos de Cliente';
    formulario.ShowModal;
  finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmPre.CopiarPaisaCliente;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoPre.btnImprimirReciboClick(Sender: TObject);
  var
    form:TfrmPrintPreRec;
begin
  inherited;
   form := TfrmPrintPreRec.Create(Application);
   try
     form.edtNroFac.Text := dmmPre.unqryRecibos.findField('NRO_FACTURA')
                                                                      .AsString;
     form.edtSerie.Text := dmmPre.unqryRecibos.findField('SERIE_FACTURA')
                                                                      .AsString;
     form.edtRecibo.Text := dmmPre.unqryRecibos.findField('NRO_PLAZO_RECIBO')
                                                                      .AsString;
     form.ShowModal;
   finally
     form.Free;
   end;
end;

procedure TfrmMtoPre.btnLineaClick(Sender: TObject);
begin
  inherited;
  if FDrawMode = dmLine then
    DrawMode := dmNone
  else
    DrawMode := dmLine;
end;

procedure TfrmMtoPre.btnCirculoClick(Sender: TObject);
begin
  inherited;
  if FDrawMode = dmCircle then
    DrawMode := dmNone
  else
    DrawMode := dmCircle;
end;

procedure TfrmMtoPre.btnCODIGO_CLIENTEKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if ((Key = VK_RETURN) and (Shift = [ssCtrl])) then
//    btnBuscar_Clientes_ActivosClick(nil);
end;

procedure TfrmMtoPre.btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Application);
  try
    formulario.dsData.DataSet := dmmPre.unqryCliDataFac;
    formulario.dsData.DataSet.Open;
    formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
    PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Clientes');
    formulario.Caption := 'Búsqueda de Pacientes en Presupuestos';
    formulario.ShowModal;
  finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmPre.CopiarClienteaFactura;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoPre.btnCrearFacturaClick(Sender: TObject);
  var
    form:TfrmGenPreFac;
begin
  inherited;
   form := TfrmGenPreFac.Create(Application);
   try
     form.edtNumFacOrigen.Text := dsTablaG.DataSet.findField('NRO_FACTURA')
                                                                      .AsString;
     form.edtSerieOrigen.Text := dsTablaG.DataSet.findField('SERIE_FACTURA')
                                                                      .AsString;
     form.ShowModal;
   finally
     form.Free;
   end;
end;

procedure TfrmMtoPre.btnCruzClick(Sender: TObject);
begin
  inherited;
  if FDrawMode = dmCross then
    DrawMode := dmNone
  else
    DrawMode := dmCross;
end;

procedure TfrmMtoPre.btnGenerarHistoriaClick(Sender: TObject);
begin
  inherited;
  //dmmPre.ActualizarHistoria;
end;

procedure TfrmMtoPre.btnGenerarRecibosClick(Sender: TObject);
begin
  inherited;
  if ((dmmPre.unqryFac.State = dsEdit) or (dmmPre.unqryFac.State = dsInsert))
                                                                            then
    dmmPre.unqryFac.Post;
  dmmPre.unstrdprcGetRecibos.ParamByName('pNRO_FACTURA')
            .AsInteger := dmmPre.unqryFac.FieldByName('NRO_FACTURA').AsInteger;
  dmmPre.unstrdprcGetRecibos.ParamByName('pSERIE_FACTURA')
            .AsString := dmmPre.unqryFac.FieldByName('SERIE_FACTURA').AsString;
  dmmPre.unstrdprcGetRecibos.ExecProc;
  dmmPre.unqryRecibos.Refresh;
end;

procedure TfrmMtoPre.btnReciboDevueltoClick(Sender: TObject);
begin
  inherited;
  CambiarEstadoRecibo('Devuelto');
end;

procedure TfrmMtoPre.btnReciboEmitidoClick(Sender: TObject);
begin
  inherited;
  CambiarEstadoRecibo('Emitido');
end;

procedure TfrmMtoPre.btnReciboPagadoClick(Sender: TObject);
begin
  inherited;
  CambiarEstadoRecibo('Pagado');
end;

procedure TfrmMtoPre.btnRectanguloClick(Sender: TObject);
begin
  inherited;
  if FDrawMode = dmRectangle then
    DrawMode := dmNone
  else
    DrawMode := dmRectangle;
end;

procedure TfrmMtoPre.btnRectificarClick(Sender: TObject);
  var
    form:TfrmGenPreRec;
begin
  inherited;
   form := TfrmGenPreRec.Create(Application);
   try
          form.ShowModal;
   finally
          form.Free;
   end;
end;

procedure TfrmMtoPre.CambiarEstadoRecibo(sEstado: string);
begin
  with dmmPre.unqryRecibos do
  begin
    if not((State = dsEdit) or  (State = dsInsert)) then
      Edit;
    FieldByName('ESTADO_RECIBO').AsString := sEstado;
    if sEstado = 'Pagado' then
       FieldByNAme('FECHA_PAGO').AsDateTime := Trunc(Now)
    else
      if ((sEstado = 'Emitido') or (sEstado='Devuelto')) then
        FieldByNAme('FECHA_PAGO').AsVariant := null;
    Post;
  end;
end;

procedure TfrmMtoPre.cbb1PropertiesChange(Sender: TObject);
begin
  inherited;
//    if ( dsTablaG.DataSet.State = dsInsert ) or
//     ( dsTablaG.DataSet.State = dsEdit ) then
//      dmmPre.zqryFac.FieldByName('APLICAR_IRPF_FACTURAS').AsString :=
//         dmmPre.zqrySeries.FieldByName('APLICAR_IRPF').AsString;
end;

procedure TfrmMtoPre.cbbSerieFacturaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if ((Key = VK_DOWN) and (Shift = [ssShift])) then
      cbbSerieFactura.DroppedDown := True;
end;

procedure TfrmMtoPre.cxdbdtdtFECHA_FACTURAKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_DOWN) and (Shift = [ssShift])) then
      cxdbdtdtFECHA_FACTURA.DroppedDown := True;
end;

procedure TfrmMtoPre.cxdbtxtdtRAZONSOCIAL_CLIENTE_FACTURA2Enter(
  Sender: TObject);
var
  buttonSelected : Integer;
begin
end;

procedure TfrmMtoPre.cxgrd5Enter(Sender: TObject);
begin
  inherited;
  //if dmmPre.unqryLinFac.RecordCount = 0 then
  //  dmmPre.dsLinFac.DataSet.Insert;
end;

procedure TfrmMtoPre.cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmPre.unqryArtDataLinFac;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Productos');
      formulario.Caption :=
                          'Búsqueda de Tratamientos en Lineas de Presupuestos';
      formulario.ShowModal;
    finally
     inherited;
     if formulario.sFicha = 'S' then
          dmmPre.CopiarArticuloaLineaFactura;
        formulario.dsData.DataSet.Close;
        FreeAndNil(formulario);
    end;
end;

procedure TfrmMtoPre.
  cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesEditValueChanged(Sender: TObject);
  var
  E : TcxCustomEdit;
begin
  inherited;
  if ((dmmPre.unqryLinFac.State = dsInsert)) then
  begin
     with dmmPre.unstrdprcGetDataArticulo do
     begin
       e := Sender as TcxCustomEdit;
       ParamByName('pidcodarticulo').AsString :=  VarToStr(e.EditingValue);
       ExecProc;
       dmmPre.unqryLinFac.FindField('CODIGO_ARTICULO_LINEA')
                                          .AsString := VarToStr(e.EditingValue);
       dmmPre.unqryLinFac.FindField('DESCRIPCION_ARTICULO_LINEA')
                           .AsString := ParamByName('pidnomarticulo').AsString;
       dmmPre.unqryLinFac.FindField('PRECIOVENTA_ARTICULO_LINEA')
                             .AsFloat := ParamByName('pidprecioventa').AsFloat;
     end;
  end;
end;

procedure TfrmMtoPre.cxgrdbclmntv1ODONTOLOGOPropertiesButtonClick(
                                        Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
    //screen.cursor:=crHourglass;
    formulario := TfrmMtoSearch.Create(Application);
    //formulario.OnClose := TfrmMtoPre.prcfrmMtoSearchFormClose;
    try
      formulario.dsData.DataSet := dmmPre.unqryDocDataFac;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      formulario.Caption := 'Búsqueda de Odontólogos en Lineas de Facturas';
      formulario.ShowModal;
    finally
      inherited;
        if formulario.sFicha = 'S' then
          dmmPre.CopiarOdontologoaLineaFactura;
        formulario.dsData.DataSet.Close;
        FreeAndNil(formulario);
    end;
end;

procedure TfrmMtoPre.btnImprimirClick(Sender: TObject);
  var
    form:TfrmPrintPre;
begin
  inherited;
   form := TfrmPrintPre.Create(Application);
   try
     form.edtNroFac.Text := dsTablaG.DataSet.findField('NRO_FACTURA').AsString;
     form.edtSerie.Text := dsTablaG.DataSet.findField('SERIE_FACTURA').AsString;
     form.ShowModal;
   finally
     form.Free;
   end;
end;

procedure TfrmMtoPre.btnNroFacturaPropertiesButtonClick(Sender: TObject;
                                                         AButtonIndex: Integer);
begin
  inherited;
  dmmPre.NuevaFactura;
end;

procedure TfrmMtoPre.sbGrabarClick(Sender: TObject);
begin
  with dmmPre do
  begin
    if ((unqryFac.State = dsInsert) or (unqryFac.State = dsEdit)) then
      unqryFac.Post;
    if ((dsLinFac.Dataset.State = dsInsert) or (dsLinFac.Dataset.State = dsEdit)
                                                                          ) then
      dsLinFac.Dataset.Post;
  end;
end;

procedure TfrmMtoPre.tvLineasPreEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  cxlclzr1.Active := False;
  cxlclzr1.Active := True;
  cxlclzr1.Locale := 1034;
end;

procedure TfrmMtoPre.tvLineasPreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift <> [ssCtrl]) then
    if ((Key = VK_RETURN) and (dmmPre.dsLinFac.DataSet.RecordCount = 0) and
         ((dsTablaG.DataSet.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA')
                                              .AsString <> 'PACIENTE NUEVO') OR
           (dsTablaG.DataSet.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA')
                                  .AsString <> 'PACIENTE NO ENCONTRADO'))) then
      tvLineasPre.DataController.Insert;
end;

procedure TfrmMtoPre.txtAPELLIDOSExit(Sender: TObject);
begin
  inherited;
  if ((dmmPre.unqryFac.State = dsEdit) or
     (dmmPre.unqryFac.State = dsInsert)) then
  begin
    inherited;
    with dmmPre do
    begin
      begin
        unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
          unqryFac.FieldByName('NOMBRE').AsString + ' ' +
                                     unqryFac.FieldByName('APELLIDOS').AsString;
      end;
    end;
  end;
end;

procedure TfrmMtoPre.txtNOMBREExit(Sender: TObject);
begin
  inherited;
 if ((dmmPre.unqryFac.State = dsEdit) or
     (dmmPre.unqryFac.State = dsInsert)) then
  begin
    inherited;
    with dmmPre do
    begin
      begin
        unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
          unqryFac.FieldByName('NOMBRE').AsString + ' ' +
                                     unqryFac.FieldByName('APELLIDOS').AsString;
      end;
    end;
  end;
end;

procedure TfrmMtoPre.Finalize;
begin
  if Assigned(FOriginalBitmap) then
    FreeAndNil(FOriginalBitmap);
  if Assigned(FDisplayBitmap) then
    FreeAndNil(FDisplayBitmap);
  if Assigned(FBackBuffer) then
    FreeAndNil(FBackBuffer);
  if Assigned(FTempBitmap) then
    FreeAndNil(FTempBitmap);
  if Assigned(FUpdateTimer) then
    FreeAndNil(FUpdateTimer);
end;

procedure TfrmMtoPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //Finalize;
  FreeAndNil(dmmPre);
end;

//RELATIVO AL DIBUJO
procedure TfrmMtoPre.Initialize;
begin
  FDrawMode := dmNone;
  FIsDrawing := False;
  FShowGhost := False;
  FModified := False;
  FLastX := -1;
  FLastY := -1;
  FGhostX := -1;
  FGhostY := -1;
  // Variables para líneas rectas
  FIsDrawingLine := False;
  FLineStartX := -1;
  FLineStartY := -1;
  FLineEndX := -1;
  FLineEndY := -1;
  // NUEVAS variables para formas geométricas
  FIsDrawingShape := False;
  FShapeStartX := -1;
  FShapeStartY := -1;
  FShapeEndX := -1;
  FShapeEndY := -1;
  FCurrentColor := clBlue; // Color por defecto
  // Crear bitmaps
  FOriginalBitmap := TBitmap.Create;
  FDisplayBitmap := TBitmap.Create;
  FBackBuffer := TBitmap.Create;
  FTempBitmap := TBitmap.Create;
  // Verificar que la imagen por defecto existe
  if Assigned(imgImagenNew) and Assigned(imgImagenNew.Bitmap) and
     not imgImagenNew.Bitmap.Empty then
  begin
    FDisplayBitmap.Assign(imgImagenNew.Bitmap);
    FOriginalBitmap.Assign(imgImagenNew.Bitmap);
  end
  else
  begin
    // Crear imagen en blanco si no hay imagen por defecto
    FDisplayBitmap.Width := 400;
    FDisplayBitmap.Height := 300;
    FDisplayBitmap.Canvas.Brush.Color := clWhite;
    FDisplayBitmap.Canvas.FillRect(Rect(0, 0, FDisplayBitmap.Width,
                                                        FDisplayBitmap.Height));
    FOriginalBitmap.Assign(FDisplayBitmap);
  end;
  // Configurar timer
  FUpdateTimer := TTimer.Create(nil);
  FUpdateTimer.Interval := 50; // Reducido para mayor responsividad
  FUpdateTimer.OnTimer := UpdateTimerHandler;
  FUpdateTimer.Enabled := False;
  // Configurar DoubleBuffered
  Self.DoubleBuffered := True;
  // Configurar PaintBox
  if Assigned(pbDibujo) then
  begin
    pbDibujo.ControlStyle := pbDibujo.ControlStyle + [csOpaque];
  end;

  UpdateButtonStates;
  FDataSource := dmmPre.dsDibujos;
  // Configurar hints
  SetButtonHints;
  // Cargar imagen de base de datos sin mostrar mensajes
  if (dmmPre.unqryDibujos.RecordCount > 0) then
    LoadImageFromDatabaseSilent;
end;

procedure TfrmMtoPre.LoadImageFromDatabaseSilent;
var
  Stream: TMemoryStream;
  JpegImage: TJPEGImage;
  BlobField: TBlobField;
begin
  try
    if not Assigned(FDataSource) then
      FDataSource := dmmPre.dsDibujos;
    if not Assigned(FDataSource) or not Assigned(FDataSource.DataSet) then
      Exit;  // Salir silenciosamente
    // Abrir el dataset si no está abierto
    if not FDataSource.DataSet.Active then
    begin
      try
        FDataSource.DataSet.Open;
      except
        Exit;  // Salir silenciosamente si no se puede abrir
      end;
    end;

    // Obtener el campo BLOB
    BlobField := TBlobField(FDataSource.DataSet.FieldByName('DIBUJO_FACTURA'));
    // Verificar que el campo tiene datos
    if BlobField.IsNull or (BlobField.BlobSize = 0) then
      Exit;  // Salir silenciosamente, mantener imagen por defecto
    Stream := TMemoryStream.Create;
    JpegImage := TJPEGImage.Create;
    try
      BlobField.SaveToStream(Stream);
      Stream.Position := 0;
      if Stream.Size > 0 then
      begin
        JpegImage.LoadFromStream(Stream);
        FDisplayBitmap.Assign(JpegImage);
        FOriginalBitmap.Assign(JpegImage);
        // Actualizar visualización sin forzar
        if Assigned(pbDibujo) then
          pbDibujo.Invalidate;
        FModified := False;
        UpdateButtonStates;
      end;

    except
      // En caso de error, mantener imagen por defecto silenciosamente
    end;

  finally
    if Assigned(JpegImage) then
      JpegImage.Free;
    if Assigned(Stream) then
      Stream.Free;
  end;
end;

procedure TfrmMtoPre.SetDrawMode(const Value: TDrawMode);
begin
  FDrawMode := Value;
  UpdateButtonStates;

  // Cambiar cursor
  case FDrawMode of
    dmNone: pbDibujo.Cursor := crDefault;
    dmDraw: pbDibujo.Cursor := crCross;
    dmErase: pbDibujo.Cursor := crCross;
    dmLine: pbDibujo.Cursor := crCross;
    dmCircle: pbDibujo.Cursor := crCross;
    dmRectangle: pbDibujo.Cursor := crCross;
    dmCross: pbDibujo.Cursor := crCross;
  end;

  if FDrawMode <> dmErase then
  begin
    FShowGhost := False;
  end;

  // Resetear variables según el modo
  if FDrawMode <> dmLine then
  begin
    FIsDrawingLine := False;
    FLineStartX := -1;
    FLineStartY := -1;
  end;

  if not (FDrawMode in [dmCircle, dmRectangle, dmCross]) then
  begin
    FIsDrawingShape := False;
    FShapeStartX := -1;
    FShapeStartY := -1;
  end;
end;

procedure TfrmMtoPre.UpdateButtonStates;
begin
  // Destacar el botón activo
  btnDibujar.Font.Style := [];
  btnBorrar.Font.Style := [];
  btnLinea.Font.Style := [];
  case FDrawMode of
    dmDraw: btnDibujar.Font.Style := [fsBold];
    dmErase: btnBorrar.Font.Style := [fsBold];
    dmLine: btnLinea.Font.Style := [fsBold];
  end;

  // Habilitar botón guardar si hay cambios
  btnGuardar.Enabled := FModified;
end;

procedure TfrmMtoPre.btnGuardarClick(Sender: TObject);
begin
  try
    SaveImageToDatabase;
    FModified := False;
    UpdateButtonStates;
    ShowMessage('Gráfico guardado correctamente en la base de datos.');
  except
    on E: Exception do
      ShowMessage('Error al guardar: ' + E.Message);
  end;
end;

procedure TfrmMtoPre.btnDibujarClick(Sender: TObject);
begin
  if FDrawMode = dmDraw then
    DrawMode := dmNone
  else
    DrawMode := dmDraw;
end;

procedure TfrmMtoPre.btnBorrarClick(Sender: TObject);
begin
  if FDrawMode = dmErase then
    DrawMode := dmNone
  else
    DrawMode := dmErase;
end;

procedure TfrmMtoPre.btnColorAzulClick(Sender: TObject);
begin
  FCurrentColor := clBlue;
  //UpdateColorButtonStates;
end;

procedure TfrmMtoPre.btnColorRojoClick(Sender: TObject);
begin
  inherited;
  FCurrentColor := clRed;
  //UpdateColorButtonStates;
end;

procedure TfrmMtoPre.btnColorVerdeClick(Sender: TObject);
begin
  inherited;
  FCurrentColor := clGreen;
  //UpdateColorButtonStates;
end;

procedure TfrmMtoPre.DrawOnBitmap(X, Y: Integer);
var
  EraseRect: TRect;
  EraseSize: Integer;
begin
  if not Assigned(FDisplayBitmap) then
    Exit;

  // Asegurar que las coordenadas están dentro del bitmap
  if (X < 0) or (Y < 0) or (X >= FDisplayBitmap.Width) or
      (Y >= FDisplayBitmap.Height) then
    Exit;

  case FDrawMode of
    dmDraw:
    begin
      FDisplayBitmap.Canvas.Pen.Color := FCurrentColor; // Usar color actual
      FDisplayBitmap.Canvas.Pen.Width := 3;
      FDisplayBitmap.Canvas.Pen.Style := psSolid;
      FDisplayBitmap.Canvas.Brush.Color := FCurrentColor; // Usar color actual

      if FIsDrawing and (FLastX <> -1) and (FLastY <> -1) then
      begin
        // Dibujar línea desde la última posición
        FDisplayBitmap.Canvas.MoveTo(FLastX, FLastY);
        FDisplayBitmap.Canvas.LineTo(X, Y);
      end
      else
      begin
        // Dibujar punto inicial
        FDisplayBitmap.Canvas.Ellipse(X - 2, Y - 2, X + 3, Y + 3);
      end;
    end;

    dmErase:
    begin
      EraseSize := 10;
      EraseRect := Rect(
        Max(0, X - EraseSize),
        Max(0, Y - EraseSize),
        Min(FDisplayBitmap.Width, X + EraseSize),
        Min(FDisplayBitmap.Height, Y + EraseSize)
      );

      // Verificar que tenemos imagen original para restaurar
      if not FOriginalBitmap.Empty and
         (FOriginalBitmap.Width = FDisplayBitmap.Width) and
         (FOriginalBitmap.Height = FDisplayBitmap.Height) then
      begin
        FDisplayBitmap.Canvas.CopyRect(EraseRect, FOriginalBitmap.Canvas, EraseRect);
      end
      else
      begin
        // Si no hay imagen original, borrar con blanco
        FDisplayBitmap.Canvas.Brush.Color := clWhite;
        FDisplayBitmap.Canvas.FillRect(EraseRect);
      end;
    end;
  end;

  FModified := True;
  UpdateButtonStates;
end;

procedure TfrmMtoPre.DrawLineOnBitmap(X1, Y1, X2, Y2: Integer);
begin
  if not Assigned(FDisplayBitmap) then
    Exit;
  // Asegurar que las coordenadas están dentro del bitmap
  X1 := Max(0, Min(X1, FDisplayBitmap.Width - 1));
  Y1 := Max(0, Min(Y1, FDisplayBitmap.Height - 1));
  X2 := Max(0, Min(X2, FDisplayBitmap.Width - 1));
  Y2 := Max(0, Min(Y2, FDisplayBitmap.Height - 1));
  // Configurar lápiz para línea
  FDisplayBitmap.Canvas.Pen.Color := FCurrentColor;
  FDisplayBitmap.Canvas.Pen.Width := 3;
  FDisplayBitmap.Canvas.Pen.Style := psSolid;
  // Dibujar línea
  FDisplayBitmap.Canvas.MoveTo(X1, Y1);
  FDisplayBitmap.Canvas.LineTo(X2, Y2);
  FModified := True;
  UpdateButtonStates;
end;

procedure TfrmMtoPre.DrawCircleOnBitmap(X1, Y1, X2, Y2: Integer);
begin
  if not Assigned(FDisplayBitmap) then
    Exit;

  // Asegurar que las coordenadas están dentro del bitmap
  X1 := Max(0, Min(X1, FDisplayBitmap.Width - 1));
  Y1 := Max(0, Min(Y1, FDisplayBitmap.Height - 1));
  X2 := Max(0, Min(X2, FDisplayBitmap.Width - 1));
  Y2 := Max(0, Min(Y2, FDisplayBitmap.Height - 1));

  // Configurar lápiz para círculo
  FDisplayBitmap.Canvas.Pen.Color := FCurrentColor;
  FDisplayBitmap.Canvas.Pen.Width := 3;
  FDisplayBitmap.Canvas.Pen.Style := psSolid;
  FDisplayBitmap.Canvas.Brush.Style := bsClear; // Solo contorno

  // Dibujar círculo/elipse
  FDisplayBitmap.Canvas.Ellipse(X1, Y1, X2, Y2);

  FModified := True;
  UpdateButtonStates;
end;

procedure TfrmMtoPre.DrawRectangleOnBitmap(X1, Y1, X2, Y2: Integer);
begin
  if not Assigned(FDisplayBitmap) then
    Exit;

  // Asegurar que las coordenadas están dentro del bitmap
  X1 := Max(0, Min(X1, FDisplayBitmap.Width - 1));
  Y1 := Max(0, Min(Y1, FDisplayBitmap.Height - 1));
  X2 := Max(0, Min(X2, FDisplayBitmap.Width - 1));
  Y2 := Max(0, Min(Y2, FDisplayBitmap.Height - 1));

  // Configurar lápiz para rectángulo
  FDisplayBitmap.Canvas.Pen.Color := FCurrentColor;
  FDisplayBitmap.Canvas.Pen.Width := 3;
  FDisplayBitmap.Canvas.Pen.Style := psSolid;
  FDisplayBitmap.Canvas.Brush.Style := bsClear; // Solo contorno

  // Dibujar rectángulo
  FDisplayBitmap.Canvas.Rectangle(X1, Y1, X2, Y2);

  FModified := True;
  UpdateButtonStates;
end;

procedure TfrmMtoPre.DrawCrossOnBitmap(X1, Y1, X2, Y2: Integer);
begin
  if not Assigned(FDisplayBitmap) then
    Exit;

  // Asegurar que las coordenadas están dentro del bitmap
  X1 := Max(0, Min(X1, FDisplayBitmap.Width - 1));
  Y1 := Max(0, Min(Y1, FDisplayBitmap.Height - 1));
  X2 := Max(0, Min(X2, FDisplayBitmap.Width - 1));
  Y2 := Max(0, Min(Y2, FDisplayBitmap.Height - 1));

  // Configurar lápiz para cruz
  FDisplayBitmap.Canvas.Pen.Color := FCurrentColor;
  FDisplayBitmap.Canvas.Pen.Width := 3;
  FDisplayBitmap.Canvas.Pen.Style := psSolid;

  // Dibujar línea diagonal principal (\)
  FDisplayBitmap.Canvas.MoveTo(X1, Y1);
  FDisplayBitmap.Canvas.LineTo(X2, Y2);

  // Dibujar línea diagonal secundaria (/)
  FDisplayBitmap.Canvas.MoveTo(X2, Y1);
  FDisplayBitmap.Canvas.LineTo(X1, Y2);

  FModified := True;
  UpdateButtonStates;
end;

procedure TfrmMtoPre.dsTablaGDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if ((dmmPre <> nil) and (FDisplayBitmap <> nil) and
      (dmmPre.unqryDibujos.RecordCount > 0)) then
    LoadImageFromDatabaseSilent;
end;

// Implementación de las funciones de conversión de coordenadas
// Función para obtener el rectángulo donde se muestra la imagen
function TfrmMtoPre.GetImageRect: TRect;
var
  ImageWidth, ImageHeight: Integer;
  ScaleX, ScaleY, Scale: Double;
  DisplayWidth, DisplayHeight: Integer;
begin
  // Inicializar resultado vacío
  Result := Rect(0, 0, 0, 0);
  // Verificaciones de seguridad
  if not Assigned(FDisplayBitmap) or FDisplayBitmap.Empty or
     not Assigned(pbDibujo) or (pbDibujo.Width <= 0) or (pbDibujo.Height <= 0)
                                                                            then
    Exit;
  ImageWidth := FDisplayBitmap.Width;
  ImageHeight := FDisplayBitmap.Height;
  if (ImageWidth <= 0) or (ImageHeight <= 0) then
    Exit;
  // Calcular escala manteniendo proporción
  ScaleX := pbDibujo.Width / ImageWidth;
  ScaleY := pbDibujo.Height / ImageHeight;
  Scale := Min(ScaleX, ScaleY);
  // Calcular dimensiones escaladas
  DisplayWidth := Round(ImageWidth * Scale);
  DisplayHeight := Round(ImageHeight * Scale);
  // Centrar la imagen
  Result.Left := (pbDibujo.Width - DisplayWidth) div 2;
  Result.Top := (pbDibujo.Height - DisplayHeight) div 2;
  Result.Right := Result.Left + DisplayWidth;
  Result.Bottom := Result.Top + DisplayHeight;
end;

function TfrmMtoPre.MouseToBitmapCoords(X, Y: Integer): TPoint;
var
  ImageRect: TRect;
  ScaleX, ScaleY: Double;
begin
  Result := Point(-1, -1);
  // Verificar que tenemos bitmap válido
  if not Assigned(FDisplayBitmap) or FDisplayBitmap.Empty then
    Exit;
  // Obtener el rectángulo donde se muestra la imagen
  ImageRect := GetImageRect;
  // Verificar que el rectángulo es válido
  if (ImageRect.Width <= 0) or (ImageRect.Height <= 0) then
    Exit;
  // Verificar que el clic está dentro del área de la imagen
  if (X < ImageRect.Left) or (X >= ImageRect.Right) or
     (Y < ImageRect.Top) or (Y >= ImageRect.Bottom) then
    Exit;
  // Calcular la escala
  ScaleX := FDisplayBitmap.Width / ImageRect.Width;
  ScaleY := FDisplayBitmap.Height / ImageRect.Height;
  // Convertir coordenadas
  Result.X := Round((X - ImageRect.Left) * ScaleX);
  Result.Y := Round((Y - ImageRect.Top) * ScaleY);
  // Asegurar límites
  Result.X := Max(0, Min(Result.X, FDisplayBitmap.Width - 1));
  Result.Y := Max(0, Min(Result.Y, FDisplayBitmap.Height - 1));
end;

procedure TfrmMtoPre.RestoreOriginalImage;
begin
  // Verificar que tenemos una imagen original válida
  if not Assigned(FOriginalBitmap) or FOriginalBitmap.Empty then
  begin
    // Si no hay imagen original, cargar la imagen por defecto
    if Assigned(imgImagenNew) and Assigned(imgImagenNew.Bitmap)
                                          and not imgImagenNew.Bitmap.Empty then
    begin
      FDisplayBitmap.Assign(imgImagenNew.Bitmap);
      FOriginalBitmap.Assign(imgImagenNew.Bitmap);
      ShowMessage('Se ha restaurado la imagen por defecto.');
    end
    else
    begin
      ShowMessage('No hay imagen original para restaurar.');
      Exit;
    end;
  end
  else
  begin
    // Restaurar desde la imagen original guardada
    FDisplayBitmap.Assign(FOriginalBitmap);
    ShowMessage('Imagen restaurada a la versión original.');
  end;

  // Actualizar la visualización en el TPaintBox
  if Assigned(pbDibujo) then
    pbDibujo.Invalidate;
  // Marcar que no hay cambios pendientes
  FModified := False;
  UpdateButtonStates;
  // Limpiar el modo de dibujo si estaba activo
  DrawMode := dmNone;
end;

procedure TfrmMtoPre.btnResetearClick(Sender: TObject);
begin
  // Cambiar a modo normal
  DrawMode := dmNone;
  // Restaurar imagen original
  RestoreOriginalImage;
end;

procedure TfrmMtoPre.btnNuevoClick(Sender: TObject);
begin
  // Cambiar a modo normal
  DrawMode := dmNone;
  // Asignar imagen por defecto
  FDisplayBitmap.Assign(imgImagenNew.Bitmap);
  FOriginalBitmap.Assign(imgImagenNew.Bitmap);
  // Actualizar visualización
  if Assigned(pbDibujo) then
    pbDibujo.Invalidate;
  // Marcar como modificado (porque cambiamos de la
  //imagen guardada a la por defecto)
  FModified := True;
  UpdateButtonStates;
  ShowMessage('Gráfico reseteado a la imagen por defecto.');
end;

//procedure TfrmMtoPre.pbDibujoMouseDown(Sender: TObject; Button: TMouseButton;
//                                             Shift: TShiftState; X, Y: Integer);
//var
//  BitmapPoint: TPoint;
//begin
//  if Button = mbLeft then
//  begin
//    BitmapPoint := MouseToBitmapCoords(X, Y);
//    if (BitmapPoint.X = -1) or (BitmapPoint.Y = -1) then
//      Exit;
//    case FDrawMode of
//      dmDraw, dmErase:
//      begin
//        FIsDrawing := True;
//        FLastX := BitmapPoint.X;
//        FLastY := BitmapPoint.Y;
//        DrawOnBitmap(BitmapPoint.X, BitmapPoint.Y);
//        pbDibujo.Invalidate;
//      end;
//
//      dmLine:  // NUEVO: Manejo de líneas rectas
//      begin
//        if not FIsDrawingLine then
//        begin
//          // Primer clic: establecer punto inicial
//          FLineStartX := BitmapPoint.X;
//          FLineStartY := BitmapPoint.Y;
//          FLineEndX := BitmapPoint.X;
//          FLineEndY := BitmapPoint.Y;
//          FIsDrawingLine := True;
//        end
//        else
//        begin
//          // Segundo clic: establecer punto final y dibujar línea
//          FLineEndX := BitmapPoint.X;
//          FLineEndY := BitmapPoint.Y;
//          // Dibujar línea definitiva
//          DrawLineOnBitmap(FLineStartX, FLineStartY, FLineEndX, FLineEndY);
//          // Resetear estado de línea
//          FIsDrawingLine := False;
//          FLineStartX := -1;
//          FLineStartY := -1;
//          pbDibujo.Invalidate;
//        end;
//      end;
//    end;
//  end;
//end;

procedure TfrmMtoPre.pbDibujoMouseDown(Sender: TObject; Button: TMouseButton;
                                             Shift: TShiftState; X, Y: Integer);
var
  BitmapPoint: TPoint;
begin
  if Button = mbLeft then
  begin
    BitmapPoint := MouseToBitmapCoords(X, Y);
    if (BitmapPoint.X = -1) or (BitmapPoint.Y = -1) then
      Exit;

    case FDrawMode of
      dmDraw, dmErase:
      begin
        FIsDrawing := True;
        FLastX := BitmapPoint.X;
        FLastY := BitmapPoint.Y;
        DrawOnBitmap(BitmapPoint.X, BitmapPoint.Y);
        pbDibujo.Invalidate;
      end;

      dmLine:
      begin
        if not FIsDrawingLine then
        begin
          // Primer clic: establecer punto inicial
          FLineStartX := BitmapPoint.X;
          FLineStartY := BitmapPoint.Y;
          FLineEndX := BitmapPoint.X;
          FLineEndY := BitmapPoint.Y;
          FIsDrawingLine := True;
        end
        else
        begin
          // Segundo clic: establecer punto final y dibujar línea
          FLineEndX := BitmapPoint.X;
          FLineEndY := BitmapPoint.Y;
          DrawLineOnBitmap(FLineStartX, FLineStartY, FLineEndX, FLineEndY);
          FIsDrawingLine := False;
          FLineStartX := -1;
          FLineStartY := -1;
          pbDibujo.Invalidate;
        end;
      end;

      // NUEVOS casos para formas geométricas
      dmCircle, dmRectangle, dmCross:
      begin
        if not FIsDrawingShape then
        begin
          // Primer clic: establecer punto inicial
          FShapeStartX := BitmapPoint.X;
          FShapeStartY := BitmapPoint.Y;
          FShapeEndX := BitmapPoint.X;
          FShapeEndY := BitmapPoint.Y;
          FIsDrawingShape := True;
        end
        else
        begin
          // Segundo clic: establecer punto final y dibujar forma
          FShapeEndX := BitmapPoint.X;
          FShapeEndY := BitmapPoint.Y;

          case FDrawMode of
            dmCircle: DrawCircleOnBitmap(FShapeStartX, FShapeStartY,
                                         FShapeEndX, FShapeEndY);
            dmRectangle: DrawRectangleOnBitmap(FShapeStartX, FShapeStartY,
                                               FShapeEndX, FShapeEndY);
            dmCross: DrawCrossOnBitmap(FShapeStartX, FShapeStartY,
                                       FShapeEndX, FShapeEndY);
          end;

          // Resetear estado de forma
          FIsDrawingShape := False;
          FShapeStartX := -1;
          FShapeStartY := -1;
          pbDibujo.Invalidate;
        end;
      end;
    end;
  end;
end;

(*procedure TfrmMtoPre.pbDibujoMouseMove(Sender: TObject; Shift: TShiftState; X,
                                                                    Y: Integer);
var
  BitmapPoint: TPoint;
  NeedUpdate: Boolean;
begin
  NeedUpdate := False;
  BitmapPoint := MouseToBitmapCoords(X, Y);
  // Preview de línea mientras se está dibujando
  if (FDrawMode = dmLine) and FIsDrawingLine and
     (BitmapPoint.X <> -1) and (BitmapPoint.Y <> -1) then
  begin
    // Actualizar punto final temporal
    if (Abs(FLineEndX - BitmapPoint.X) > 2) or (Abs(FLineEndY - BitmapPoint.Y)
                                                                       > 2) then
    begin
      FLineEndX := BitmapPoint.X;
      FLineEndY := BitmapPoint.Y;
      NeedUpdate := True;
    end;
  end;

  // Manejar fantasma del borrador
  if (FDrawMode = dmErase) then
  begin
    // Actualizar posición del fantasma solo si cambió significativamente
    if (Abs(FGhostX - X) > 2) or (Abs(FGhostY - Y) > 2) then
    begin
      FGhostX := X;
      FGhostY := Y;
      FShowGhost := True;
      NeedUpdate := True;
    end;
  end
  else
  begin
    // Ocultar fantasma si no estamos en modo borrar
    if FShowGhost then
    begin
      FShowGhost := False;
      NeedUpdate := True;
    end;
  end;

  // Manejar dibujo continuo
  if FIsDrawing and (ssLeft in Shift) and (FDrawMode in [dmDraw, dmErase]) then
  begin
    if (BitmapPoint.X <> -1) and (BitmapPoint.Y <> -1) then
    begin
      // Solo dibujar si la posición cambió lo suficiente
      if (Abs(BitmapPoint.X - FLastX) > 1) or (Abs(BitmapPoint.Y - FLastY) > 1)
                                                                            then
      begin
        DrawOnBitmap(BitmapPoint.X, BitmapPoint.Y);
        FLastX := BitmapPoint.X;
        FLastY := BitmapPoint.Y;
        NeedUpdate := True;
      end;
    end;
  end;

  // Actualizar solo si es necesario
  if NeedUpdate then
  begin
    if not FUpdateTimer.Enabled then
    begin
      FUpdateTimer.Enabled := True;
    end;
  end;
end; *)

procedure TfrmMtoPre.pbDibujoMouseMove(Sender: TObject;
                                       Shift: TShiftState; X, Y: Integer);
var
  BitmapPoint: TPoint;
  NeedUpdate: Boolean;
begin
  NeedUpdate := False;
  BitmapPoint := MouseToBitmapCoords(X, Y);

  // Preview de línea mientras se está dibujando
  if (FDrawMode = dmLine) and FIsDrawingLine and
     (BitmapPoint.X <> -1) and (BitmapPoint.Y <> -1) then
  begin
    if ((Abs(FLineEndX - BitmapPoint.X) > 2) or
       (Abs(FLineEndY - BitmapPoint.Y) > 2)) then
    begin
      FLineEndX := BitmapPoint.X;
      FLineEndY := BitmapPoint.Y;
      NeedUpdate := True;
    end;
  end;

  // NUEVO: Preview de formas geométricas mientras se están dibujando
  if (FDrawMode in [dmCircle, dmRectangle, dmCross]) and FIsDrawingShape and
     (BitmapPoint.X <> -1) and (BitmapPoint.Y <> -1) then
  begin
    if ((Abs(FShapeEndX - BitmapPoint.X) > 2) or
       (Abs(FShapeEndY - BitmapPoint.Y) > 2)) then
    begin
      FShapeEndX := BitmapPoint.X;
      FShapeEndY := BitmapPoint.Y;
      NeedUpdate := True;
    end;
  end;

  // Manejar fantasma del borrador
  if (FDrawMode = dmErase) then
  begin
    if (Abs(FGhostX - X) > 2) or (Abs(FGhostY - Y) > 2) then
    begin
      FGhostX := X;
      FGhostY := Y;
      FShowGhost := True;
      NeedUpdate := True;
    end;
  end
  else
  begin
    if FShowGhost then
    begin
      FShowGhost := False;
      NeedUpdate := True;
    end;
  end;

  // Manejar dibujo continuo
  if FIsDrawing and (ssLeft in Shift) and (FDrawMode in [dmDraw, dmErase]) then
  begin
    if (BitmapPoint.X <> -1) and (BitmapPoint.Y <> -1) then
    begin
      if ((Abs(BitmapPoint.X - FLastX) > 1) or
          (Abs(BitmapPoint.Y - FLastY) > 1)) then
      begin
        DrawOnBitmap(BitmapPoint.X, BitmapPoint.Y);
        FLastX := BitmapPoint.X;
        FLastY := BitmapPoint.Y;
        NeedUpdate := True;
      end;
    end;
  end;

  // Actualizar solo si es necesario
  if NeedUpdate then
  begin
    if not FUpdateTimer.Enabled then
    begin
      FUpdateTimer.Enabled := True;
    end;
  end;
end;

procedure TfrmMtoPre.pbDibujoMouseUp(Sender: TObject; Button: TMouseButton;
                                             Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and FIsDrawing then
  begin
    FIsDrawing := False;
    FLastX := -1;
    FLastY := -1;
    // Parar el timer y actualizar inmediatamente
    FUpdateTimer.Enabled := False;
    pbDibujo.Invalidate;
  end;
end;

//procedure TfrmMtoPre.pbDibujoPaint(Sender: TObject);
//var
//  PaintBox: TPaintBox;
//  DestRect: TRect;
//  TempBitmap: TBitmap;
//begin
//  PaintBox := Sender as TPaintBox;
//  // Limpiar fondo
//  PaintBox.Canvas.Brush.Color := clBtnFace;
//  PaintBox.Canvas.FillRect(PaintBox.ClientRect);
//  if not Assigned(FDisplayBitmap) or FDisplayBitmap.Empty then
//    Exit;
//  // Obtener rectángulo de destino
//  DestRect := GetImageRect;
//  if (DestRect.Width <= 0) or (DestRect.Height <= 0) then
//    Exit;
//  // Si estamos dibujando una línea, mostrar preview
//  if (FDrawMode = dmLine) and FIsDrawingLine and
//     (FLineStartX <> -1) and (FLineStartY <> -1) then
//  begin
//    // Crear bitmap temporal para preview
//    TempBitmap := TBitmap.Create;
//    try
//      TempBitmap.Assign(FDisplayBitmap);
//      // Dibujar línea de preview
//      TempBitmap.Canvas.Pen.Color := clRed;
//      TempBitmap.Canvas.Pen.Width := 2;
//      TempBitmap.Canvas.Pen.Style := psDot;
//      TempBitmap.Canvas.MoveTo(FLineStartX, FLineStartY);
//      TempBitmap.Canvas.LineTo(FLineEndX, FLineEndY);
//      // Mostrar con preview
//      PaintBox.Canvas.StretchDraw(DestRect, TempBitmap);
//    finally
//      TempBitmap.Free;
//    end;
//  end
//  else
//  begin
//    // Mostrar imagen normal
//    try
//      PaintBox.Canvas.StretchDraw(DestRect, FDisplayBitmap);
//    except
//      PaintBox.Canvas.Brush.Color := clWhite;
//      PaintBox.Canvas.FillRect(DestRect);
//    end;
//  end;
//
//  // Dibujar fantasma del borrador si está activo
//  if FShowGhost and (FDrawMode = dmErase) and
//     (FGhostX >= DestRect.Left) and (FGhostX < DestRect.Right) and
//     (FGhostY >= DestRect.Top) and (FGhostY < DestRect.Bottom) then
//  begin
//    PaintBox.Canvas.Brush.Style := bsClear;
//    PaintBox.Canvas.Pen.Color := clRed;
//    PaintBox.Canvas.Pen.Style := psDot;
//    PaintBox.Canvas.Pen.Width := 1;
//    // Dibujar círculo del borrador
//    PaintBox.Canvas.Ellipse(
//      FGhostX - 12, FGhostY - 12,
//      FGhostX + 12, FGhostY + 12
//    );
//  end;
//end;

procedure TfrmMtoPre.pbDibujoPaint(Sender: TObject);
var
  PaintBox: TPaintBox;
  DestRect: TRect;
  TempBitmap: TBitmap;
  ScaleX, ScaleY: Double;
  PreviewX1, PreviewY1, PreviewX2, PreviewY2: Integer;
begin
  PaintBox := Sender as TPaintBox;

  // Limpiar fondo
  PaintBox.Canvas.Brush.Color := clBtnFace;
  PaintBox.Canvas.FillRect(PaintBox.ClientRect);

  if not Assigned(FDisplayBitmap) or FDisplayBitmap.Empty then
    Exit;

  // Obtener rectángulo de destino
  DestRect := GetImageRect;
  if (DestRect.Width <= 0) or (DestRect.Height <= 0) then
    Exit;

  // Calcular escalas para convertir coordenadas del bitmap a pantalla
  ScaleX := DestRect.Width / FDisplayBitmap.Width;
  ScaleY := DestRect.Height / FDisplayBitmap.Height;

  // Mostrar preview según el modo activo
  if ((FDrawMode = dmLine) and FIsDrawingLine and (FLineStartX <> -1) and (FLineStartY <> -1)) or
     ((FDrawMode in [dmCircle, dmRectangle, dmCross]) and FIsDrawingShape and
      (FShapeStartX <> -1) and (FShapeStartY <> -1)) then
  begin
    // Crear bitmap temporal para preview
    TempBitmap := TBitmap.Create;
    try
      TempBitmap.Assign(FDisplayBitmap);

      // Configurar para preview
      TempBitmap.Canvas.Pen.Color := clRed;
      TempBitmap.Canvas.Pen.Width := 2;
      TempBitmap.Canvas.Pen.Style := psDot;
      TempBitmap.Canvas.Brush.Style := bsClear;

      case FDrawMode of
        dmLine:
        begin
          TempBitmap.Canvas.MoveTo(FLineStartX, FLineStartY);
          TempBitmap.Canvas.LineTo(FLineEndX, FLineEndY);
        end;

        dmCircle:
        begin
          TempBitmap.Canvas.Ellipse(FShapeStartX,
                                    FShapeStartY,
                                    FShapeEndX,
                                    FShapeEndY);
        end;

        dmRectangle:
        begin
          TempBitmap.Canvas.Rectangle(FShapeStartX,
                                      FShapeStartY,
                                      FShapeEndX,
                                      FShapeEndY);
        end;

        dmCross:
        begin
          // Dibujar línea diagonal principal (\)
          TempBitmap.Canvas.MoveTo(FShapeStartX, FShapeStartY);
          TempBitmap.Canvas.LineTo(FShapeEndX, FShapeEndY);
          // Dibujar línea diagonal secundaria (/)
          TempBitmap.Canvas.MoveTo(FShapeEndX, FShapeStartY);
          TempBitmap.Canvas.LineTo(FShapeStartX, FShapeEndY);
        end;
      end;

      // Mostrar con preview
      PaintBox.Canvas.StretchDraw(DestRect, TempBitmap);
    finally
      TempBitmap.Free;
    end;
  end
  else
  begin
    // Mostrar imagen normal
    try
      PaintBox.Canvas.StretchDraw(DestRect, FDisplayBitmap);
    except
      PaintBox.Canvas.Brush.Color := clWhite;
      PaintBox.Canvas.FillRect(DestRect);
    end;
  end;

  // Dibujar fantasma del borrador si está activo
  if FShowGhost and (FDrawMode = dmErase) and
     (FGhostX >= DestRect.Left) and (FGhostX < DestRect.Right) and
     (FGhostY >= DestRect.Top) and (FGhostY < DestRect.Bottom) then
  begin
    PaintBox.Canvas.Brush.Style := bsClear;
    PaintBox.Canvas.Pen.Color := clGray;
    PaintBox.Canvas.Pen.Style := psDot;
    PaintBox.Canvas.Pen.Width := 1;
    // Dibujar círculo del borrador
    PaintBox.Canvas.Ellipse(
      FGhostX - 12, FGhostY - 12,
      FGhostX + 12, FGhostY + 12
    );
  end;
end;

procedure TfrmMtoPre.pcPantallaChange(Sender: TObject);
begin
  inherited;

end;

// Función optimizada para actualizar la pantalla sin parpadeo
procedure TfrmMtoPre.UpdateDisplay;
begin
  // Solo invalidar si realmente es necesario
  if Assigned(pbDibujo) and pbDibujo.Visible then
  begin
    // Invalidar solo si no estamos ya en un Paint
    if not (csDestroying in ComponentState) then
      pbDibujo.Invalidate;
  end;
end;

procedure TfrmMtoPre.SaveImageToDatabase;
var
  Stream: TMemoryStream;
  JpegImage: TJPEGImage;
begin
  // Verificar que tenemos un bitmap válido para guardar
  if not Assigned(FDisplayBitmap) or FDisplayBitmap.Empty then
  begin
    ShowMessage('No hay imagen para guardar.');
    Exit;
  end;

  // Verificar que tenemos acceso a la base de datos
  if not Assigned(FDataSource) or not Assigned(FDataSource.DataSet) then
  begin
    FDataSource := dmmPre.dsDibujos;
    if not Assigned(FDataSource) or not Assigned(FDataSource.DataSet) then
    begin
      ShowMessage('Error: No se puede acceder a la base de datos.');
      Exit;
    end;
  end;

  Stream := TMemoryStream.Create;
  JpegImage := TJPEGImage.Create;
  try
    try
      // Convertir el bitmap a JPEG para optimizar el tamaño
      JpegImage.Assign(FDisplayBitmap);
      JpegImage.CompressionQuality := 95;  // Buena calidad, tamaño razonable
      JpegImage.Compress;
      // Guardar el JPEG en el stream
      JpegImage.SaveToStream(Stream);
      Stream.Position := 0;
      // Verificar que se generó contenido
      if Stream.Size = 0 then
      begin
        ShowMessage('Error: No se pudo generar la imagen para guardar.');
        Exit;
      end;

      // Abrir el dataset si no está abierto
      if not FDataSource.DataSet.Active then
      begin
        try
          FDataSource.DataSet.Open;
        except
          on E: Exception do
          begin
            ShowMessage('Error al abrir la tabla: ' + E.Message);
            Exit;
          end;
        end;
      end;

      // Poner el dataset en modo edición
      try
        if FDataSource.DataSet.State = dsBrowse then
          FDataSource.DataSet.Edit;
      except
        on E: Exception do
        begin
          ShowMessage('Error al editar el registro: ' + E.Message);
          Exit;
        end;
      end;

      // Guardar la imagen en el campo BLOB
      try
        TBlobField(FDataSource.DataSet.FieldByName('DIBUJO_FACTURA'))
                                                        .LoadFromStream(Stream);
        // Confirmar los cambios
        FDataSource.DataSet.Post;
        // Actualizar la imagen original para futuras operaciones de "resetear"
        FOriginalBitmap.Assign(FDisplayBitmap);
        // Marcar que no hay cambios pendientes
        FModified := False;
        UpdateButtonStates;
        //ShowMessage('Gráfico guardado correctamente en la base de datos.');
      except
        on E: Exception do
        begin
          // Cancelar la edición en caso de error
          try
            FDataSource.DataSet.Cancel;
          except
            // Ignorar errores al cancelar
          end;

          ShowMessage('Error al guardar en la base de datos: ' + E.Message);
        end;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Error al procesar la imagen: ' + E.Message);
      end;
    end;

  finally
    JpegImage.Free;
    Stream.Free;
  end;
end;

procedure TfrmMtoPre.LoadImageFromDatabase;
var
  Stream: TMemoryStream;
  JpegImage: TJPEGImage;
  BlobField: TBlobField;
begin
  try
    // Verificar acceso a la base de datos
    if not Assigned(FDataSource) then
      FDataSource := dmmPre.dsDibujos;
    if not Assigned(FDataSource) or not Assigned(FDataSource.DataSet) then
    begin
      ShowMessage('Error: No se puede acceder a la base de datos.');
      Exit;
    end;

    // Verificar que hay registros
    if FDataSource.DataSet.RecordCount = 0 then
    begin
      ShowMessage('No hay registros en la base de datos.');
      Exit;
    end;

    // Obtener el campo BLOB
    BlobField := TBlobField(FDataSource.DataSet.FieldByName('DIBUJO_FACTURA'));
    // Verificar que el campo tiene datos
    if BlobField.IsNull or (BlobField.BlobSize = 0) then
    begin
      ShowMessage('No hay imagen guardada en la base de datos.');
      // Cargar imagen por defecto
      FDisplayBitmap.Assign(imgImagenNew.Bitmap);
      FOriginalBitmap.Assign(imgImagenNew.Bitmap);
      pbDibujo.Invalidate;
      Exit;
    end;

    Stream := TMemoryStream.Create;
    JpegImage := TJPEGImage.Create;
    try
      // Cargar los datos del BLOB al stream
      BlobField.SaveToStream(Stream);
      Stream.Position := 0;
      // Cargar la imagen desde el stream
      JpegImage.LoadFromStream(Stream);
      // Asignar a nuestros bitmaps
      FDisplayBitmap.Assign(JpegImage);
      FOriginalBitmap.Assign(JpegImage);
      // Actualizar la visualización
      pbDibujo.Invalidate;
      // Marcar que no hay cambios pendientes
      FModified := False;
      UpdateButtonStates;
      ShowMessage('Gráfico cargado correctamente desde la base de datos.');
    except
      on E: Exception do
      begin
        ShowMessage('Error al cargar la imagen: ' + E.Message);
        // En caso de error, cargar imagen por defecto
        FDisplayBitmap.Assign(imgImagenNew.Bitmap);
        FOriginalBitmap.Assign(imgImagenNew.Bitmap);
        pbDibujo.Invalidate;
      end;
    end;

  finally
    if Assigned(JpegImage) then
      JpegImage.Free;
    if Assigned(Stream) then
      Stream.Free;
  end;
end;
end.

