unit inMtoClientes;

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
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel, UniDataClientes,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxLocalization, cxCalendar,
  cxButtonEdit, cxCurrencyEdit, inMtoPrincipal,
  cxMemo, cxRichEdit, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxBevel, cxDBNavigator, System.UITypes, dxDateRanges, dxGDIPlusClasses,
  cxImage, Vcl.Menus, cxButtons, dxBar, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  dxScrollbarAnnotations, cxDBLabel, Vcl.Grids, Vcl.DBGrids, cxRadioGroup,
  cxGroupBox, dxSkinBasic, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinTheBezier, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmMtoClientes = class(TfrmMtoGen)
    pnl1: TPanel;
    cxdbtxtdtCODIGO_CLIENTE: TcxDBTextEdit;
    cxlbl2: TcxLabel;
    cxdbtxtdtRAZON_SOCIAL: TcxDBTextEdit;
    cxlbl3: TcxLabel;
    cxdbtxtdtTELEFONO2: TcxDBTextEdit;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxdbtxtdtEMAIL: TcxDBTextEdit;
    pnl2: TPanel;
    cxpgcntrl2: TcxPageControl;
    cxtbsht3: TcxTabSheet;
    cxlbl7: TcxLabel;
    cxlbl8: TcxLabel;
    cxdbtxtdt8: TcxDBTextEdit;
    cxlbl9: TcxLabel;
    cxdbtxtdt9: TcxDBTextEdit;
    cxdbtxtdt10: TcxDBTextEdit;
    cxlbl10: TcxLabel;
    cxlbl16: TcxLabel;
    cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNIF_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION_CLIENTE1: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION_CLIENTE2: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinOBSERVACIONES_CLIENTE: TcxGridDBColumn;
    cxdbtxtdtDireccion: TcxDBTextEdit;
    cxlbl1: TcxLabel;
    cxlbl4: TcxLabel;
    cxdbtxtdtNIF: TcxDBTextEdit;
    cxtbsht1: TcxTabSheet;
    cxedtRAZONSOCIAL_CLIENTE: TcxDBTextEdit;
    cxlbl11: TcxLabel;
    cxedtPROFESION_CLIENTE: TcxDBTextEdit;
    cxlbl12: TcxLabel;
    cxgrdbclmnGrdDBTabPrinREFERENCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinTELEFONO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROFESION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFECHA_NACIMIENTO: TcxGridDBColumn;
    cxlbl13: TcxLabel;
    cxedtPROFESION_CLIENTE1: TcxDBTextEdit;
    cxlbl14: TcxLabel;
    cxdbdtdt1: TcxDBDateEdit;
    cxdbtxtdtMOVIL_CLIENTE: TcxDBTextEdit;
    cxtbsht2: TcxTabSheet;
    cxtbsht4: TcxTabSheet;
    cxgrdbclmnGrdDBTabPrinNOMBRE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinAPELLIDOS: TcxGridDBColumn;
    cxdbtxtdtNOMBRE: TcxDBTextEdit;
    cxlbl15: TcxLabel;
    cxlbl17: TcxLabel;
    cxdbtxtdtAPELLIDOS: TcxDBTextEdit;
    cxgrd1: TcxGrid;
    tvFacturacion: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvw1NRO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1SERIE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1RAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1NIF_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1MOVIL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1EMAIL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1DIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1DIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1POBLACION_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1PROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1CPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1PAIS_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1FECHA_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1TOTAL_LIQUIDO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1FORMA_PAGO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1COMENTARIOS_FACTURA: TcxGridDBColumn;
    cxgrdlvlcxgrd1Level1: TcxGridLevel;
    cxgrdlvlcxgrd1Level2: TcxGridLevel;
    tvLineasFacturacion: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1ZONA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1ODONTOLOGO: TcxGridDBColumn;
    btn1: TSpeedButton;
    cxgrdbclmnGrdDBTabPrinIBAN: TcxGridDBColumn;
    cxlbl18: TcxLabel;
    cxdbtxtdtPAIS_CLIENTE: TcxDBTextEdit;
    img1: TcxImage;
    pnlHistoriaRight: TPanel;
    pnl3: TPanel;
    cxgrd5: TcxGrid;
    tvHistoriasClientes: TcxGridDBTableView;
    cxgrdbclmncxgrdtvtv1FECHA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1CODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1DESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1ZONA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1PRECIOVENTA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1NOMBRE_ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1NRO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1SERIE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1LINEA_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1ID: TcxGridDBColumn;
    cxgrdbndtblvwtv2: TcxGridDBBandedTableView;
    cxgrdbndclmntv2PerId: TcxGridDBBandedColumn;
    cxgrdbndclmntv2AppointmentId: TcxGridDBBandedColumn;
    cxgrdbndclmntv2Linea: TcxGridDBBandedColumn;
    cxgrdbndclmntv2clave: TcxGridDBBandedColumn;
    cxgrdbndclmntv2valor: TcxGridDBBandedColumn;
    cxgrdbndclmntv2instantemodif: TcxGridDBBandedColumn;
    cxgrdbndclmntv2descripcion: TcxGridDBBandedColumn;
    cxgrdbndclmntv2parte: TcxGridDBBandedColumn;
    cxgrdlvllv1: TcxGridLevel;
    btnFacturarSeleccionados: TcxButton;
    tsPresupuestos: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridLevel2: TcxGridLevel;
    tsFichaDental: TcxTabSheet;
    cxgrdbclmnHistoriasClientesCANTIDAD: TcxGridDBColumn;
    btnImprimir: TcxButton;
    dxbrmngr1: TdxBarManager;
    dxbrpmn1: TdxBarPopupMenu;
    dxbrlrgbtn1: TdxBarLargeButton;
    dxbrlrgbtnCuestionario: TdxBarLargeButton;
    cxgrd2: TcxGrid;
    tv1: TcxGridDBTableView;
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
    cxgrdbclmntv1PREGUNTA: TcxGridDBColumn;
    cxgrdbclmntv1RESPUESTA: TcxGridDBColumn;
    pnl4: TPanel;
    cxdbdtdt2: TcxDBDateEdit;
    lbl1: TLabel;
    btnCrearCuestionario: TButton;
    txtDIRECCION1_CLIENTE: TcxDBTextEdit;
    lblDB1: TcxDBLabel;
    btnCODIGO_CLIENTE: TcxDBButtonEdit;
    rgInternacional: TcxDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIAPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure MostrarBlocdeNotas;
    procedure cxdbtxtdtRAZON_SOCIALEnter(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesEditValueChanged(
      Sender: TObject);
    procedure btnFacturarSeleccionadosClick(Sender: TObject);
    procedure dxbbEtiquetasClick(Sender: TObject);
    procedure dxbrpmn1Show(Sender: TObject);
    procedure btnCrearCuestionarioClick(Sender: TObject);
    procedure dxbrlrgbtnCuestionarioClick(Sender: TObject);
    procedure cxdbtxtdtNIFPropertiesChange(Sender: TObject);
    procedure btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnCODIGO_CLIENTEPropertiesChange(Sender: TObject);

  private

  public
    { Public declarations }
  end;
  procedure ShowMtoClientes(Owner       : TComponent); overload;
  procedure ShowMtoClientes(Owner       : TComponent; sEmail: String); overload;
var
  dmmClientes: TDMClientes;
  frmMtoClientes: TfrmMtoClientes;

implementation

uses
  inLibWin, inMtoModalHistoriaCli, inMtoGenSearch, inLibDevExp,
  inMtoModalCliEti, inLibDocumentoValidator, inMtoModalCliCues;

{$R *.dfm}

procedure ShowMtoClientes(Owner       : TComponent); overload;
var
  frmMtoClientes : TfrmMtoClientes;
begin
  if not(IsOpenMDI('Pacientes', Owner)) then
  begin
    Application.CreateForm(TfrmMtoClientes, frmMtoClientes);
    frmMtoClientes.edtBusqGlobal.SetFocus;
  end;
end;

procedure ShowMtoClientes(Owner       : TComponent; sEmail: String); overload;
var
  frmMtoClientes : TfrmMtoClientes;
begin
  if not(IsOpenMDI('Pacientes', Owner)) then
  begin
    Application.CreateForm(TfrmMtoClientes, frmMtoClientes);
  end;
  frmMtoClientes.Show;
  dmmClientes.unqryClientes.Locate('CODIGO_CLIENTE', sEmail, []);
end;

procedure TfrmMtoClientes.FormCreate(Sender: TObject);
begin
  dmmClientes := TDMClientes.Create(nil);
  dsTablaG.DataSet := dmmClientes.unqryClientes;
  tvHistoriasClientes.DataController.DataSource := dmmClientes.dsHistoria;
  tvFacturacion.DataController.DataSource := dmmClientes.dsFacturas;
  tvLineasFacturacion.DataController.DataSource := dmmClientes.dsLinFac;
  inherited;
end;

procedure TfrmMtoClientes.MostrarBlocdeNotas;
  var
    form:TfrmModalHistoriaCli;
begin
  inherited;
   form := TfrmModalHistoriaCli.Create(Application);
   try
          form.ShowModal;
   finally
          form.Free;
          dmmClientes.unqryHistoria.Refresh;
   end;
end;

procedure TfrmMtoClientes.btn1Click(Sender: TObject);
begin
  inherited;
  dsTablaG.DataSet.Insert;
  pcPantalla.ActivePage := tsFicha;
  tsFicha.SetFocus;
  cxdbtxtdtNOMBRE.SetFocus;
end;

procedure TfrmMtoClientes.btnCODIGO_CLIENTEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Application);
  try
    formulario.dsData.DataSet := dmmClientes.unqryPaises;
    formulario.dsData.DataSet.Open;
    formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
    PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Paises');
    formulario.Caption := 'Búsqueda de Paises en Clientes';
    formulario.ShowModal;
  finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmClientes.CopiarPaisaCliente;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.btnCODIGO_CLIENTEPropertiesChange(Sender: TObject);
begin
  inherited;
  if dsTablaG.State in [dsEdit, dsInsert, dsBrowse] then
    if dsTablaG.DataSet.FieldByName('PAIS_CLIENTE').AsString <> 'ES' then
      rgInternacional.Visible := True
    else
      rgInternacional.Visible := False;
end;

procedure TfrmMtoClientes.btnCrearCuestionarioClick(Sender: TObject);
begin
  inherited;
  dmmClientes.Crear_Cuestionario;
end;

procedure TfrmMtoClientes.btnFacturarSeleccionadosClick(Sender: TObject);
var
  I, RecordIndex, ColumnIndex: Integer;
  sIdHistoria, sResul, sNroFac, sNroLin, sSerie: string;
begin
  if ((dmmClientes.unqryHistoria.State = dsInsert)
   or (dmmClientes.unqryHistoria.State = dsEdit))  then
    dmmClientes.unqryHistoria.Post;
  for I := 0 to
                       tvHistoriasClientes.Controller.SelectedRecordCount - 1 do
  begin
    ColumnIndex := cxgrdbclmncxgrdtvtv1ID.Index;
    RecordIndex :=
         tvHistoriasClientes.Controller.SelectedRecords[I].RecordIndex;
    sIdHistoria :=
     VarToStr(tvHistoriasClientes.DataController.Values[RecordIndex,
                                                                  ColumnIndex]);
    dmmClientes.FacturarHistorias(sIdHistoria, sSerie, sNroFac, sNroLin);
    sResul := sResul + sSerie +'\'+ sNroFac + ' linea ' + sNroLin + sLineBreak;
  end;
  dmmClientes.unqryFacturas.Refresh;
  dmmClientes.unqryLinFac.Refresh;
  ShowMessage('Se ha/n creado los documentos de borrador de venta ' +
                                         'correctamente '+ sLineBreak + sResul);
end;

procedure TfrmMtoClientes.cxdbtxtdtNIFPropertiesChange(Sender: TObject);
//var
//  validator: TDocumentoValidator;
begin
//  if ((dsTablaG.State = dsEdit) or (dsTablaG.State = dsInsert)) then
//  begin
//    validator := TDocumentoValidator.Create;
//    try
//      if not validator.ValidarDocumento(cxdbtxtdtNIF.Text) then
//        ShowMessage('NIF inválido');
//    finally
//      validator.Free;
//    end;
//  end;
end;

procedure TfrmMtoClientes.cxdbtxtdtRAZON_SOCIALEnter(Sender: TObject);
var
  buttonSelected : Integer;
begin
   if ( (dmmClientes.unqryClientes.State = dsEdit) or
        (dmmClientes.unqryClientes.State = dsInsert)) then
  begin
    inherited;
    with dmmClientes do
    begin
      begin
        buttonSelected := messagedlg('¿Desea copiar los datos de nombre y apellidos?',mtConfirmation, mbYesNo, 0);
        if buttonSelected = mrYes     then
        begin
          with unqryClientes do
            FieldByName('RAZONSOCIAL_CLIENTE').AsString := FieldByName('NOMBRE').AsString + ' ' +
                                                           FieldByName('APELLIDOS').AsString;
        end;
      end;
    end;
  end;
end;

procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Application);
  try
    formulario.dsData.DataSet := dmmClientes.unqryArtDataHisCli;
    formulario.dsData.DataSet.Open;
    formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
    PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Productos');
    formulario.Caption := 'Búsqueda de Tratamientos en Historia de Clientes';
    formulario.ShowModal;
  finally
    inherited;
    if formulario.sFicha = 'S' then
      dmmClientes.CopiarArticuloaHistoriaCliente;
    formulario.dsData.DataSet.Close;
    FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesEditValueChanged(
  Sender: TObject);
  var
  E : TcxCustomEdit;
begin
  inherited;
  if ((dmmClientes.unqryHistoria.State = dsInsert)) then
  begin
     with dmmClientes.unstrdprcGetDataArticulo do
     begin
       e := Sender as TcxCustomEdit;
       ParamByName('pidcodarticulo').AsString :=  VarToStr(e.EditingValue);
       ExecProc;
       dmmClientes.unqryHistoria.FindField('CODIGO_ARTICULO').AsString := VarToStr(e.EditingValue);
       dmmClientes.unqryHistoria.FindField('DESCRIPCION_ARTICULO').AsString := ParamByName('pidnomarticulo').AsString;
       dmmClientes.unqryHistoria.FindField('PRECIOVENTA_ARTICULO').AsFloat := ParamByName('pidprecioventa').AsFloat;
     end;
  end;
end;

procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  MostrarBlocdeNotas;
end;

procedure TfrmMtoClientes.dxbbEtiquetasClick(Sender: TObject);
var
  formulario : TfrmPrintCliEti;
begin
  formulario := TfrmPrintCliEti.Create(Application);
  try
    formulario.edtCodCli.Text := dsTablaG.Dataset.FieldByName('CODIGO_CLIENTE').AsString;
    formulario.ShowModal;
  finally
    inherited;
    FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.dxbrlrgbtnCuestionarioClick(Sender: TObject);
var
  formulario : TfrmPrintCliCues;
begin
  formulario := TfrmPrintCliCues.Create(Application);
  try
    if dmmClientes.unqryCuestionario.RecordCount = 0 then
      dmmClientes.Crear_Cuestionario;
    formulario.edtCodCli.Text := dsTablaG.Dataset.FieldByName('CODIGO_CLIENTE').AsString;
    formulario.ShowModal;
  finally
    inherited;
    FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.dxbrpmn1Show(Sender: TObject);
begin
  inherited;
  (Sender as TdxBarPopupMenu).SubMenuControl.Width := btnImprimir.Width;
end;

procedure TfrmMtoClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmmClientes);
end;

end.
