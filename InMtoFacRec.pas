unit InMtoFacRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer, RzStatus,
  RzPanel, cxCheckBox, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, UniDataFacRec,
  cxButtonEdit, cxCurrencyEdit, cxMaskEdit, dxBarBuiltInMenu, Menus,
  cxGroupBox, cxButtons, cxDropDownEdit, cxCalendar, cxDBEdit, DBCtrls,
  cxLabel, cxGridBandedTableView, cxGridDBBandedTableView, cxPC, cxSplitter,
  cxRadioGroup, inMtoModalFacImpRec, cxMemo, cxLocalization;

type
  TfrmMtoFacRec = class(TfrmMtoGen)
    pnl1: TPanel;
    cxspl1: TcxSplitter;
    cxpgcntrl2: TcxPageControl;
    ts4: TcxTabSheet;
    cxgrd5: TcxGrid;
    tv1: TcxGridDBTableView;
    tvctv1linea: TcxGridDBColumn;
    tvctv1codigo: TcxGridDBColumn;
    tvctv1familia: TcxGridDBColumn;
    tvctv1nombre: TcxGridDBColumn;
    tvctv1cantidad: TcxGridDBColumn;
    tvctv1precio: TcxGridDBColumn;
    tvctv1iva: TcxGridDBColumn;
    tvctv1imp_iva: TcxGridDBColumn;
    tvctv1neto: TcxGridDBColumn;
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
    ts5: TcxTabSheet;
    cxlbl15: TcxLabel;
    cxlbl16: TcxLabel;
    cxlbl17: TcxLabel;
    cxlbl18: TcxLabel;
    cxlbl19: TcxLabel;
    cxlbl7: TcxLabel;
    dbchkPAGADO: TDBCheckBox;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    cxDBCurrencyEdit4: TcxDBCurrencyEdit;
    ts6: TcxTabSheet;
    ts8: TcxTabSheet;
    pnl2: TPanel;
    pnl3: TPanel;
    cxpgcntrl1: TcxPageControl;
    ts1: TcxTabSheet;
    cxlbl1: TcxLabel;
    DBE1: TcxDBTextEdit;
    cxlbl3: TcxLabel;
    cxdbdtdt1: TcxDBDateEdit;
    DBE19: TcxDBTextEdit;
    cxlbl2: TcxLabel;
    DBENOMCLI: TcxDBTextEdit;
    cxlbl5: TcxLabel;
    DBENUMFAC: TcxDBTextEdit;
    cxlbl8: TcxLabel;
    DBECODCLI2: TcxDBTextEdit;
    cxlbl9: TcxLabel;
    btn1: TcxButton;
    ts2: TcxTabSheet;
    DBE3: TcxDBTextEdit;
    cxlbl4: TcxLabel;
    DBEdireccionCliente5: TcxDBTextEdit;
    cxgrpbx1: TcxGroupBox;
    DBEdireccionCliente4: TcxDBTextEdit;
    DBEpoblacionCliente: TcxDBTextEdit;
    DBEdireccionCliente: TcxDBTextEdit;
    DBEdireccionCliente1: TcxDBTextEdit;
    DBEdireccionCliente6: TcxDBTextEdit;
    cxgrpbx2: TcxGroupBox;
    DBECODCLI: TcxDBTextEdit;
    DBEdireccionCliente2: TcxDBTextEdit;
    DBECPCliente: TcxDBTextEdit;
    DBEpoblacionCliente1: TcxDBTextEdit;
    DBEdireccionCliente3: TcxDBTextEdit;
    DBEdireccionCliente7: TcxDBTextEdit;
    DBEemail1: TcxDBTextEdit;
    DBEMovil: TcxDBTextEdit;
    btn3: TcxButton;
    ts3: TcxTabSheet;
    DBECODCLI1: TcxDBTextEdit;
    cxlbl6: TcxLabel;
    DBEnombreCliente1: TcxDBTextEdit;
    cxgrpbx3: TcxGroupBox;
    DBErazonsocialCliente: TcxDBTextEdit;
    DBEdireccionCliente8: TcxDBTextEdit;
    DBECPCliente1: TcxDBTextEdit;
    DBEpoblacionCliente2: TcxDBTextEdit;
    DBEdireccionCliente9: TcxDBTextEdit;
    DBEPaisCliente: TcxDBTextEdit;
    cxgrpbx4: TcxGroupBox;
    DBENombre_Envio_AuxCliente: TcxDBTextEdit;
    DBEdireccionCliente10: TcxDBTextEdit;
    DBECPCliente2: TcxDBTextEdit;
    DBEpoblacionCliente3: TcxDBTextEdit;
    DBEdireccionCliente11: TcxDBTextEdit;
    DBEPais_Envio_auxCliente: TcxDBTextEdit;
    DBEPaisCliente1: TcxDBTextEdit;
    DBEemail: TcxDBTextEdit;
    DBEnombre: TcxDBTextEdit;
    cxGrid1: TcxGrid;
    tvFacturas: TcxGridDBTableView;
    cxgrdbclmnGridDBTableView1NUMFAC: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1CODCLI: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1NOMCLI: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1FECHA: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1SUM_BASE: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1SUM_IVA: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1SUBTOTAL: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1TOTAL: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1F_PAGO: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1PAGADO: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1VENC1: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1COMENTARIO: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1AGENTE: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1PEDIDO: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1ANTICIPO: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1DEVOLUCION_FACTURA: TcxGridDBColumn;
    cxgrdbclmnFacturasSERIE: TcxGridDBColumn;
    tvLinFac: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView2LINEA: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2CODIGO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2NOMBRE: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2CANTIDAD: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2PRECIO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2IMP_IVA: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2NETO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2P_UNI: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2NUMERO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2IVA: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2DTO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2PROP1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2PROP2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2PROP3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2PIEZAS: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2ALMACEN: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2DTO2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2PRESENTACION: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2UBICACION: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView2SERIE: TcxGridDBColumn;
    lvFacturas: TcxGridLevel;
    lvLinFac: TcxGridLevel;
    tvcGrdDBTabPrinSERIE: TcxGridDBColumn;
    tvcGrdDBTabPrinNUMFAC: TcxGridDBColumn;
    tvcGrdDBTabPrinFECHA: TcxGridDBColumn;
    tvcGrdDBTabPrinCODCLI: TcxGridDBColumn;
    tvcGrdDBTabPrinNOMCLI: TcxGridDBColumn;
    tvcGrdDBTabPrinBASE0: TcxGridDBColumn;
    tvcGrdDBTabPrinBASE1: TcxGridDBColumn;
    tvcGrdDBTabPrinIVA0: TcxGridDBColumn;
    tvcGrdDBTabPrinIVA1: TcxGridDBColumn;
    tvcGrdDBTabPrinRE1: TcxGridDBColumn;
    tvcGrdDBTabPrinSUM_IVA: TcxGridDBColumn;
    tvcGrdDBTabPrinSUM_BASE: TcxGridDBColumn;
    tvcGrdDBTabPrinSUM_RE: TcxGridDBColumn;
    tvcGrdDBTabPrinSUM_IRPF: TcxGridDBColumn;
    tvcGrdDBTabPrinSUBTOTAL: TcxGridDBColumn;
    tvcGrdDBTabPrinTOTAL: TcxGridDBColumn;
    tvcGrdDBTabPrinPAGADO: TcxGridDBColumn;
    tvcGrdDBTabPrinCOMENTARIO: TcxGridDBColumn;
    tvcGrdDBTabPrinCOMENTARIO2: TcxGridDBColumn;
    tvcGrdDBTabPrinCOMENTARIO3: TcxGridDBColumn;
    tvcGrdDBTabPrinAGENTE: TcxGridDBColumn;
    tvcGrdDBTabPrinPEDIDO: TcxGridDBColumn;
    tvcGrdDBTabPrinESTADO: TcxGridDBColumn;
    tvcGrdDBTabPrinPORCENTAJE_RETENCION: TcxGridDBColumn;
    tvcGrdDBTabPrinIMPORTE_RETENCION: TcxGridDBColumn;
    tvcGrdDBTabPrinAPLICADA_RETENCION: TcxGridDBColumn;
    tvcGrdDBTabPrinCONCEPTO_RETENCION: TcxGridDBColumn;
    tvcGrdDBTabPrinDESCONTAR_RETENCION: TcxGridDBColumn;
    tvcGrdDBTabPrinLIQUIDADA: TcxGridDBColumn;
    tvcGrdDBTabPrinPENDIENTE: TcxGridDBColumn;
    tvcGrdDBTabPrinANTICIPO: TcxGridDBColumn;
    tvcGrdDBTabPrinREFERENCIA: TcxGridDBColumn;
    tvcGrdDBTabPrinFACTURA_ABONO: TcxGridDBColumn;
    tvcGrdDBTabPrinDEVOLUCION_FACTURA: TcxGridDBColumn;
    tvcGrdDBTabPrinIBAN: TcxGridDBColumn;
    tvcGrdDBTabPrinBIC: TcxGridDBColumn;
    tvcGrdDBTabPrinIMPORTADO: TcxGridDBColumn;
    tvcGrdDBTabPrinHora: TcxGridDBColumn;
    tvcGrdDBTabPrinnombreCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinapellidosCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinrazonsocialCliente: TcxGridDBColumn;
    tvcGrdDBTabPrindniCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinMovilCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinemailCliente: TcxGridDBColumn;
    tvcGrdDBTabPrindireccionCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinpoblacionCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinprovinciaCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinCPCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinPaisCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinNombre_Envio_AuxCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinDireccion_Envio_AuxCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinCP_Envio_AuxCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinPoblacion_Envio_AuxCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinProvincia_Envio_AuxCliente: TcxGridDBColumn;
    tvcGrdDBTabPrinPais_Envio_auxCliente: TcxGridDBColumn;
    tvcGrdDBTabPrininstantemodif: TcxGridDBColumn;
    tvcGrdDBTabPrinusuariomodif: TcxGridDBColumn;
    tvcGrdDBTabPrinNUM_FRA_RECTIFICADA: TcxGridDBColumn;
    tvcGrdDBTabPrinSERIE_FRA_RECTIFICADA: TcxGridDBColumn;
    cxdbrdgrp2: TcxDBRadioGroup;
    tvcGrdDBTabPrinTIPO_FRA_RECTIFICADA: TcxGridDBColumn;
    DBE2: TcxDBTextEdit;
    cxlbl10: TcxLabel;
    DBENUM_FRA_RECTIFICADA: TcxDBTextEdit;
    cxlbl11: TcxLabel;
    DBEF_PAGO: TcxDBTextEdit;
    btnImprimir: TSpeedButton;
    cxlbl12: TcxLabel;
    cxdbm1: TcxDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure tvctv1codigoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btn3Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowMtoFacRec(Owner       : TComponent); overload;
  procedure ShowMtoFacRec(Owner       : TComponent; sidFactura: String); overload;

var
  dmmFacRec: TDMFacRec;
  frmMtoFacRec: TfrmMtoFacRec;

implementation

uses inLibWin, inMtoSearCliFac, inMtoSearArtFac;

{$R *.dfm}

procedure ShowMtoFacRec(Owner       : TComponent); overload;
var
  frmMtoFacRec : TfrmMtoFacRec;
begin
  if not(IsOpenMDI('Facturas Rectificativas', Owner)) then
  begin
    Application.CreateForm(TfrmMtoFacRec, frmMtoFacRec);
  end;
end;

procedure ShowMtoFacRec(Owner       : TComponent; sidFactura: String); overload;
var
  frmMtoFacRec : TfrmMtoFacRec;
  //dmmFacRec: TDMFacRec;
begin
  if not(IsOpenMDI('Facturas Rectificativas', Owner)) then
  begin
    Application.CreateForm(TfrmMtoFacRec, frmMtoFacRec);
  end;
  //dmPedFab.zqryFabCab.Locate('NUMPED', sidPedido, []);
end;


procedure TfrmMtoFacRec.FormCreate(Sender: TObject);
begin
  dmmFacRec := TDMFacRec.Create(nil);
  dsTablaG.DataSet := dmmFacRec.zqryFacRec;
  inherited;
end;

procedure TfrmMtoFacRec.btn1Click(Sender: TObject);
var
  formulario : TfrmMtoSearchCliFac;
begin
    screen.cursor:=crHourglass;
    formulario := TfrmMtoSearchCliFac.Create(Application);

    //formulario.OnClose := TfrmMtoFac.prcfrmMtoSearchFormClose;
    try
      //formulario.zqryData.SQL.text := 'select C.CODIGO_CLIENTE AS Clave, C.* from clientes C';
      formulario.zqryData.Open;
      screen.cursor:=crDefault;
      formulario.tvGrdDBTabPrin.DataController.CreateAllItems;
      formulario.tvGrdDBTabPrin.ApplyBestFit();
      formulario.ShowModal;
    finally
      formulario.zqryData.Close;
      formulario.Free;
    end;

end;

procedure TfrmMtoFacRec.tvctv1codigoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  formulario : TfrmMtoSearArtFac;
begin
    screen.cursor:=crHourglass;
    formulario := TfrmMtoSearArtFac.Create(Application);

    //formulario.OnClose := TfrmMtoFac.prcfrmMtoSearchFormClose;
    try
      //formulario.zqryData.SQL.text := 'select C.CODIGO_CLIENTE AS Clave, C.* from clientes C';
      formulario.zqryData.Open;
      screen.cursor:=crDefault;
      //formulario.tvGrdDBTabPrin.DataController.CreateAllItems;
      //formulario.tvGrdDBTabPrin.ApplyBestFit();
      formulario.ShowModal;
    finally
      formulario.zqryData.Close;
      formulario.Free;
    end;
end;

procedure TfrmMtoFacRec.btn3Click(Sender: TObject);
begin
  inherited;
  dmmFacRec.CopiarDatosMaestros;
end;

procedure TfrmMtoFacRec.btnImprimirClick(Sender: TObject);
  var
    form:TfrmPrintFacRect;
begin
  inherited;
   form := TfrmPrintFacRect.Create(Application);
   try
          form.edtNroFac.Text := dsTablaG.DataSet.findField('numfac').AsString;
          form.edtSerie.Text := dsTablaG.DataSet.findField('serie').AsString;
          form.edtTipoRec.Text := dsTablaG.DataSet.FindField('TIPO_FRA_RECTIFICADA').AsString;
//          dmPedWeb.zqryPrintPedidoW.SQL.Text := 'SELECT * from web_pedidos ' +
//                                                ' WHERE idpedidoweb = ' + QuotedStr(form.edtNroPed.Text);
//          dmPedWeb.zqryPrintPedidoW.Open;
//          dmPedWeb.zqryPrintPedidoWLineas.Open;
//          dmPedWeb.zqryPrintPedidoWLineasPer.Open;
          form.ShowModal;
   finally
//          dmPedWeb.zqryPrintPedidoW.Close;
//          dmPedWeb.zqryPrintPedidoWLineas.Close;
//          dmPedWeb.zqryPrintPedidoWLineasPer.Close;
          form.Free;
   end;
end;

procedure TfrmMtoFacRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmmFacRec);
end;

end.
