unit inMtoHistoriaClientes;

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
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel, UniDataHistoriaClientes,
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
  dxBevel, cxDBNavigator, dxDateRanges, dxGDIPlusClasses, cxImage,
  dxScrollbarAnnotations;

type
  TfrmMtoHistoriaClientes = class(TfrmMtoGen)
    pnl1: TPanel;
    cxdbtxtdt1: TcxDBTextEdit;
    cxlbl2: TcxLabel;
    cxdbtxtdt3: TcxDBTextEdit;
    cxlbl3: TcxLabel;
    cxlbl6: TcxLabel;
    pnl2: TPanel;
    cxpgcntrl2: TcxPageControl;
    cxtbsht2: TcxTabSheet;
    cxgrdbclmnGrdDBTabPrinID: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPRECIOVENTA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFECHA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinZONA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_HISTORIA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNRO_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinLINEA_LINEA: TcxGridDBColumn;
    cxdbm1: TcxDBMemo;
    cxtbsht1: TcxTabSheet;
    cxlbl1: TcxLabel;
    btnCODIGO_CLIENTE: TcxDBButtonEdit;
    btnTRATAMIENTO: TcxDBButtonEdit;
    btnODONTOLOGO: TcxDBButtonEdit;
    cxlbl4: TcxLabel;
    cxdbdtdtFecha: TcxDBDateEdit;
    cxlbl7: TcxLabel;
    cxtbsht3: TcxTabSheet;
    cxlbl8: TcxLabel;
    cxdbtxtdtMOVIL_CLIENTE: TcxDBTextEdit;
    cxdbtxtdtNRO_FACTURA1: TcxDBTextEdit;
    cxlbl10: TcxLabel;
    cxlbl11: TcxLabel;
    cxdbtxtdtSERIE_FACTURA: TcxDBTextEdit;
    cxdbcrncydt1: TcxDBCurrencyEdit;
    btnCrearHis: TSpeedButton;
    cxgrdbclmnGrdDBTabPrinODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinSERIE_FACTURA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNOMBRE_ODONTOLOGO: TcxGridDBColumn;
    cxdbtxtdtNROPIEZA: TcxDBTextEdit;
    cxlbl5: TcxLabel;
    cxdbtxtdtDESCRIPCION_ARTICULO1: TcxDBTextEdit;
    cxdbtxtdtRAZONSOCIAL_CLIENTE: TcxDBTextEdit;
    img1: TcxImage;
    cxlbl9: TcxLabel;
    sbFacturar: TSpeedButton;
    cxdbtxtdtZONA: TcxDBTextEdit;
    cxlbl12: TcxLabel;
    cxdbtxtdtRAZONSOCIAL_CLIENTE1: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbGrabarClick(Sender: TObject);
    procedure btnCrearHisClick(Sender: TObject);
    procedure btnCODIGO_CLIENTEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxdbdtdtFechaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnTRATAMIENTOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnODONTOLOGOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure sbFacturarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;
  procedure ShowMtoHistoriaClientes(Owner       : TComponent); overload;
  //procedure ShowMtoClientes(Owner       : TComponent; sEmail: String); overload;
var
  dmmHistoriaClientes: TDMHistoriaClientes;
  frmMtoHistoriaClientes: TfrmMtoHistoriaClientes;

implementation

uses
  inLibWin,
  inLibDevExp,
  inMtoGenSearch,
  inMtoModalHisFac;

{$R *.dfm}

procedure ShowMtoHistoriaClientes(Owner       : TComponent); overload;
var
  frmMtoHistoriaClientes : TfrmMtoHistoriaClientes;
begin
  if not(IsOpenMDI('Historia de Clientes', Owner)) then
  begin
    Application.CreateForm(TfrmMtoHistoriaClientes, frmMtoHistoriaClientes);
  end;
end;

//procedure ShowMtoClientes(Owner       : TComponent; sEmail: String); overload;
//var
//  frmMtoClientes : TfrmMtoClientes;
//begin
//  if not(IsOpenMDI('Clientes', Owner)) then
//  begin
//    Application.CreateForm(TfrmMtoClientes, frmMtoClientes);
//  end;
//  dmmClientes.zqryClientes.Locate('email', sEmail, []);
//end;

procedure TfrmMtoHistoriaClientes.FormCreate(Sender: TObject);
begin
  dmmHistoriaClientes := TDMHistoriaClientes.Create(nil);
  dsTablaG.DataSet := dmmHistoriaClientes.unqryHistoria;
  inherited;
end;

procedure TfrmMtoHistoriaClientes.sbFacturarClick(Sender: TObject);
var
  I, RecordIndex, ColumnIndex: Integer;
  sIdHistoria, sNroFac, sNroLin, sResul: string;
  formulario : TfrmModalHisFac;
begin
  formulario := TfrmModalHisFac.Create(Application);
  for I := 0 to cxGrdDBTabPrin.Controller.SelectedRecordCount - 1 do
  begin
    if (I=0) then
    begin
      dmmHistoriaClientes.dsSeriesFac.DataSet.Open;
      formulario.cmbSerieFactura.Properties.ListSource := dmmHistoriaClientes.dsSeriesFac;
      formulario.cmbSerieFactura.Text := formulario.cmbSerieFactura.Properties.ListSource.DataSet.Fields[0].AsString;
      formulario.dtFecha.Date := Trunc(Now);
      formulario.ShowModal;
      if formulario.sSalir = 'S' then
      begin
        dmmHistoriaClientes.dsSeriesFac.DataSet.Close;
        FreeAndNil(formulario);
        Exit;
      end;
    end;
    ColumnIndex := cxgrdbclmnGrdDBTabPrinID.Index;
    RecordIndex := cxGrdDBTabPrin.Controller.SelectedRecords[I].RecordIndex;
    sIdHistoria := VarToStr(cxGrdDBTabPrin.DataController.Values[RecordIndex, ColumnIndex]);
    dmmHistoriaClientes.FacturarHistorias(sIdHistoria,
                                          formulario.cmbSerieFactura.Text,
                                          formulario.edtNroFactura.Text,
                                          formulario.dtFecha.Date, sNroFac, sNroLin);
    sResul := sResul + formulario.cmbSerieFactura.Text +'\'+ sNroFac + ' linea ' + sNroLin + sLineBreak;
  end;
  dmmHistoriaClientes.dsSeriesFac.DataSet.Close;
  FreeAndNil(formulario);
  ShowMessage('Se ha/n creado la/s factura/s correctamente '+ sLineBreak + sResul);
end;

procedure TfrmMtoHistoriaClientes.sbGrabarClick(Sender: TObject);
begin
  inherited;
  dsTablaG.DataSet.Refresh;
end;

//procedure TfrmMtoHistoriaClientes.MostrarBlocdeNotas;
//  var
//    form:TfrmClientesHistoria;
//begin
//  inherited;
//   form := TfrmClientesHistoria.Create(Application);
//   try
//          form.ShowModal;
//   finally
//          form.Free;
//   end;
//end;

//procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIAPropertiesButtonClick(
//  Sender: TObject; AButtonIndex: Integer);
//begin
//  inherited;
//  MostrarBlocdeNotas;
//end;

procedure TfrmMtoHistoriaClientes.btnCODIGO_CLIENTEKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if ((Key = VK_RETURN) and (Shift = [ssCtrl])) then
//    btnCODIGO_CLIENTEClick(nil);
end;

procedure TfrmMtoHistoriaClientes.btnCODIGO_CLIENTEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmHistoriaClientes.unqryCliDataHis;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Clientes');
      formulario.Caption := 'Búsqueda de Pacientes en Historias';
      formulario.ShowModal;
    finally
        inherited;
        if formulario.sFicha = 'S' then
        begin
          dmmHistoriaClientes.CopiarClienteaHistoria;
          dmmHistoriaClientes.unqryHistoria.Refresh;
        end;
        formulario.dsData.DataSet.Close;
        FreeAndNil(formulario);
    end;
end;

procedure TfrmMtoHistoriaClientes.btnCrearHisClick(Sender: TObject);
begin
  inherited;
  dsTablaG.DataSet.Insert;
  pcPantalla.ActivePage := tsFicha;
  tsFicha.SetFocus;
  dsTablaG.DataSet.FieldByName('FECHA').AsDateTime := Now;
  dsTablaG.DataSet.FieldByName('CANTIDAD').AsString := '1';
  btnODONTOLOGO.SetFocus;
end;

procedure TfrmMtoHistoriaClientes.btnODONTOLOGOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmHistoriaClientes.unqryDocDataHis;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      formulario.Caption := 'Búsqueda de Odontólogos en Historias';
      formulario.ShowModal;
    finally
        inherited;
        if formulario.sFicha = 'S' then
          dmmHistoriaClientes.CopiarOdontologoaHistoria;
          //dmmHistoriaClientes.unqryHistoria.Refresh; //da errror porque no está asignado cliente
        formulario.dsData.DataSet.Close;
        FreeAndNil(formulario);
    end;
end;

procedure TfrmMtoHistoriaClientes.btnTRATAMIENTOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin

    formulario := TfrmMtoSearch.Create(Application);
    try
      formulario.dsData.DataSet := dmmHistoriaClientes.unqryArtDataHis;
      formulario.dsData.DataSet.Open;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
      PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Productos');
      formulario.Caption := 'Búsqueda de Tratamientos en Historias';
      formulario.ShowModal;
    finally
        inherited;
        if formulario.sFicha = 'S' then
          dmmHistoriaClientes.CopiarArticulosaHistoria;
          cxdbtxtdtNROPIEZA.SetFocus;
        formulario.dsData.DataSet.Close;
        FreeAndNil(formulario);
    end;
end;

procedure TfrmMtoHistoriaClientes.cxdbdtdtFechaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if ((Key = VK_DOWN) and (Shift = [ssShift])) then
      cxdbdtdtFecha.DroppedDown := True;
end;

procedure TfrmMtoHistoriaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmmHistoriaClientes);
end;

end.
