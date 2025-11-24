unit UniDataFacRec;

interface

uses
  SysUtils, Classes, ZSqlUpdate, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, inMtoPrincipal, ZStoredProcedure, frxClass, frxDBSet;

type
  TdmFacRec = class(TDataModule)
    zqryFacRec: TZQuery;
    zqryLinFacRec: TZQuery;
    dsLinFacRec: TDataSource;
    dsFacturas: TDataSource;
    dsLinFac: TDataSource;
    zqryFacturas: TZQuery;
    zqryLinFac: TZQuery;
    zqryClientes: TZQuery;
    dsClientes: TDataSource;
    fxdstPrintFacRec: TfrxDBDataset;
    fxdstPrintLinFacRec: TfrxDBDataset;
    zqryLinFacRecPrint: TZQuery;
    zqryFacRecPrint: TZQuery;
    dsFacRecPrint: TDataSource;
    dsLinFacRecPrint: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CopiarDatosMaestros;
    procedure CalcularFactura;
    procedure zqryLinFacRecBeforePost(DataSet: TDataSet);
    procedure zqryLinFacRecAfterPost(DataSet: TDataSet);
    procedure zqryLinFacRecAfterDelete(DataSet: TDataSet);
    procedure zqryFacRecBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFacRec: TdmFacRec;

implementation

uses
  InMtoFacRec;

{$R *.dfm}

procedure TdmFacRec.DataModuleCreate(Sender: TObject);
begin
  with frmopenapp do
  begin
  zqryFacRec.Connection := FdmConn.ZconnGlent;
  zqryLinFacRec.Connection := FdmConn.ZconnGlent;
  zqryFacturas.Connection := FdmConn.ZconnGlent;
  zqryLinFac.Connection := FdmConn.ZconnGlent;
  zqryClientes.Connection := FdmConn.ZconnGlent;
  zqryFacRecPrint.Connection := FdmConn.ZconnGlent;
  zqryLinFacRecPrint.Connection := FdmConn.ZconnGlent;
  //zspCrearFacturaAbono.Connection := FdmConn.ZconnGlent;
  //zqryRecibos.Connection := FdmConn.ZconnGlent;

  //zqryFoto.Connection := FdmConn.ZconnGlent;
  end;
  //zqryFoto.Active := False;
  zqryFacRec.Active := False;
  zqryLinFacRec.Active := False;
  //zqryFoto.Open;
  zqryFacRec.Open;
  zqryLinFacRec.Open;
  zqryFacturas.Open;
  zqryLinFac.Open;
  zqryClientes.Open;
  //zqryRecibos.Open;
end;

procedure TdmFacRec.DataModuleDestroy(Sender: TObject);
begin
  zqryFacRec.Close;
  zqryLinFacRec.Close;
  zqryFacturas.Close;
  zqryLinFac.Close;
  zqryClientes.Close;
  zqryFacRecPrint.Close;
  zqryLinFacRecPrint.Close;
end;

procedure TdmFacRec.CopiarDatosMaestros;
//var
//  zqryCopy : TZQuery;
begin
//  zqryCopy := TZQuery.Create(nil);
//  zqryCopy.Connection := frmOpenApp.FdmConn.ZconnGlent;
    if not (( zqryFacRec.State = dsInsert ) or
           ( zqryFacRec.State = dsEdit )) then
             zqryFacRec.Edit;
    if    (( zqryClientes.State = dsInsert ) or
           ( zqryClientes.State = dsEdit )) then
             zqryClientes.Post;
    zqryFacRec.FieldByName('razonsocialCliente').AsString :=
	 														zqryClientes.FieldByName('nombre').AsString +
															' ' + zqryClientes.FieldByName('apellidos').AsString;
    zqryFacRec.FieldByName('dniCliente').AsString := zqryClientes.FieldByName('dni').AsString;
    zqryFacRec.FieldByName('MovilCliente').AsString := zqryClientes.FieldByName('Movil').AsString;
    zqryFacRec.FieldByName('EmailCliente').AsString := zqryClientes.FieldByName('email').AsString;
    zqryFacRec.FieldByName('DireccionCliente').AsString := zqryClientes.FieldByName('direccion').AsString;
    zqryFacRec.FieldByName('poblacionCliente').AsString := zqryClientes.FieldByName('poblacion').AsString;
    zqryFacRec.FieldByName('provinciaCliente').AsString := zqryClientes.FieldByName('provincia').AsString;
    zqryFacRec.FieldByName('CPCliente').AsString := zqryClientes.FieldByName('CP').AsString;
    zqryFacRec.FieldByName('PaisCliente').AsString := zqryClientes.FieldByName('Pais').AsString;
    zqryFacRec.FieldByName('Nombre_Envio_AuxCliente').AsString := zqryClientes.FieldByName('Nombre_Envio_Aux').AsString;
    zqryFacRec.FieldByName('Direccion_Envio_AuxCliente').AsString := zqryClientes.FieldByName('Direccion_Envio_Aux').AsString;
    zqryFacRec.FieldByName('CP_Envio_AuxCliente').AsString := zqryClientes.FieldByName('CP_Envio_Aux').AsString;
    zqryFacRec.FieldByName('Poblacion_Envio_AuxCliente').AsString := zqryClientes.FieldByName('Poblacion_Envio_Aux').AsString;
    zqryFacRec.FieldByName('Provincia_Envio_AuxCliente').AsString := zqryClientes.FieldByName('Provincia_Envio_Aux').AsString;
    zqryFacRec.FieldByName('Pais_Envio_auxCliente').AsString := zqryClientes.FieldByName('Pais_Envio_aux').AsString;
    zqryFacRec.Post;
end;

procedure TdmFacRec.CalcularFactura;
var

  //i:Integer;
  cTotal, cIVA, cBase:Currency;
  zqryTotals : TZQuery;
begin
  zqryTotals := TZQuery.Create(nil);
  zqryTotals.Connection := frmOpenApp.FdmConn.ZconnGlent;
    if not (( zqryFacRec.State = dsInsert ) or
           ( zqryFacRec.State = dsEdit )) then
             zqryFacRec.Edit;
    if    (( zqryLinFacRec.State = dsInsert ) or
           ( zqryLinFacRec.State = dsEdit )) then
             zqryLinFacRec.Post;
    zqryTotals.SQL.Text := ' SELECT SUM(neto) as sum_neto,       ' +
                           '        SUM(imp_iva) as sum_imp_iva, ' +
                           '        SUM(precio) as sum_precio    ' +
                           '   FROM glt_linfac                       ' +
                           '  WHERE numfac = ' + QuotedStr(zqryFacRec.FindField('numfac').AsString) +
                           '    AND serie = ' + QuotedStr(zqryFacRec.FindField('serie').AsString) + ';';
    zqryTotals.Open;
    zqryTotals.First;
    cTotal := zqryTotals.FindField('sum_neto').AsCurrency;
    cIVA := zqryTotals.FindField('sum_imp_iva').AsCurrency;
    cBase := zqryTotals.FindField('sum_precio').AsCurrency;
    zqryTotals.Close;
    zqryTotals.Free;
    zqryFacRec.FindField('SUM_BASE').AsCurrency := cBase;
    zqryFacRec.FindField('BASE1').AsCurrency := cBase;
    zqryFacRec.FindField('SUM_IVA').AsCurrency := cIVA;
    zqryFacRec.FindField('IVA1').AsCurrency := cIVA;
    zqryFacRec.FindField('TOTAL').AsCurrency := cTotal;
    zqryFacRec.FindField('SUBTOTAL').AsCurrency := cTotal;
    zqryFacRec.Post;
end;

procedure TdmFacRec.zqryLinFacRecBeforePost(DataSet: TDataSet);
var
  sNumFac, sTipoFac : String;
  qryGetLinea: TZQuery;
  qryGetIVA: TZQuery;
  iIva : Integer;
begin
  sNumFac := zqryFacRec.FindField('numfac').AsString;
  sTipoFac := zqryFacRec.FindField('TIPO_FRA_RECTIFICADA').AsString;
  if ( zqryLinFacRec.FindField('linea').AsString = '' ) then
  begin
    qryGetLinea := TZQuery.Create(nil);
    qryGetLinea.Connection := frmOpenApp.FdmConn.ZconnGlent;
    qryGetLinea.SQL.Text := 'SELECT FNC_GET_NEXT_LINEA_FACTURA_REC(' + QuotedStr(sNumFac) + ');';
    qryGetLinea.Open;
    zqryLinFacRec.FindField('linea').AsString := qryGetLinea.Fields[0].AsString;
    qryGetLinea.Close;
    qryGetLinea.Free;
  end;
  if ((sTipoFac = 'D') or (sTipoFac = 'I')) then
    zqryLinFacRec.FindField('iva').AsInteger :=0
  else
  begin
    qryGetIVA := TZQuery.Create(nil);
    qryGetIVA.Connection := frmOpenApp.FdmConn.ZconnGlent;
    qryGetIVA.SQL.Text := 'SELECT FNC_GET_IVA_VIGENTE() ';
    qryGetIVA.Open;
    zqryLinFacRec.FindField('iva').AsInteger := qryGetIVA.Fields[0].AsInteger;
  end;
  iIva := zqryLinFacRec.FindField('iva').AsInteger;

  if zqryLinFacRec.FindField('cantidad').AsCurrency = 0 then
    zqryLinFacRec.FindField('cantidad').AsCurrency := 1;

  if zqryLinFacRec.FindField('cantidad').AsCurrency <> 1 then
    zqryLinFacRec.FindField('neto').AsCurrency := 0;

  if zqryLinFacRec.FindField('neto').AsCurrency = 0 then
  begin
    zqryLinFacRec.FindField('precio').AsCurrency :=   zqryLinFacRec.FindField('cantidad').AsCurrency *
                                                      zqryLinFacRec.FindField('p_uni').AsCurrency;
    zqryLinFacRec.FindField('imp_iva').AsCurrency := zqryLinFacRec.FindField('precio').AsCurrency * (iIva/100);
    zqryLinFacRec.FindField('neto').AsCurrency := zqryLinFacRec.FindField('precio').AsCurrency +
                                                      zqryLinFacRec.FindField('imp_iva').AsCurrency;
  end
  else
  begin
    zqryLinFacRec.FindField('imp_iva').AsCurrency := (zqryLinFacRec.FindField('neto').AsCurrency - (zqryLinFacRec.FindField('neto').AsCurrency / (1+(iIva/100)))) ;
    zqryLinFacRec.FindField('p_uni').AsCurrency := ((zqryLinFacRec.FindField('neto').AsCurrency - zqryLinFacRec.FindField('imp_iva').AsCurrency))  / zqryLinFacRec.FindField('cantidad').AsCurrency;
    zqryLinFacRec.FindField('precio').AsCurrency := zqryLinFacRec.FindField('cantidad').AsCurrency * zqryLinFacRec.FindField('p_uni').AsCurrency;
  end;

end;

procedure TdmFacRec.zqryLinFacRecAfterPost(DataSet: TDataSet);
begin
  CalcularFactura;
end;

procedure TdmFacRec.zqryLinFacRecAfterDelete(DataSet: TDataSet);
begin
  CalcularFactura;
end;

procedure TdmFacRec.zqryFacRecBeforeDelete(DataSet: TDataSet);
var
  zqryDeleteLin:TzQuery;
  sNumFac, sSerie :String;
begin
  sNumFac := zqryFacRec.FindField('numfac').AsString;
  sSerie := zqryFacRec.FindField('serie').AsString;
    zqryDeleteLin := TZQuery.Create(nil);
    with zqryDeleteLin do
    begin
      Connection := frmOpenApp.FdmConn.ZconnGlent;
      SQL.Text := 'DELETE FROM glt_linfac WHERE NUMFAC =' + QuotedStr(sNumFac) +
                  '                        AND SERIE = '  + QuotedStr(sSerie) + ';';
      ExecSQL();
    end;
end;

end.
