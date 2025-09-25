unit UniDataPre;

interface

uses
  SysUtils, Classes,  DB,
   inMtoPrincipal, DBClient, Provider, frxClass, frxDBSet,
   Windows, Dialogs, System.Variants, MemDS, DBAccess, Uni;

type
  TdmPre = class(TDataModule)
    dsLinFac: TDataSource;
    dsFacPrint: TDataSource;
    dsLinFacPrint: TDataSource;
    dsSeries: TDataSource;
    fxdsPrintFac: TfrxDBDataset;
    fxdstPrintLinFac: TfrxDBDataset;
    unqryFac: TUniQuery;
    unqryFacPrint: TUniQuery;
    unqryLinFacPrint: TUniQuery;
    unqrySeries: TUniQuery;
    unqryCliDataFac: TUniQuery;
    unqryArtDataLinFac: TUniQuery;
    unqryDocDataFac: TUniQuery;
    unqryGetLinea: TUniQuery;
    unqryLinFac: TUniQuery;
    unstrdprcGetContadorFactura: TUniStoredProc;
    unstrdprcGetContador: TUniStoredProc;
    unstrdprcCrearCliente: TUniStoredProc;
    unstrdprcGetDataArticulo: TUniStoredProc;
    unstrdprcGetDataCliente: TUniStoredProc;
    dsFormasPago: TDataSource;
    unqryFormaPago: TUniQuery;
    dsRecibos: TDataSource;
    unqryRecibos: TUniQuery;
    dsRecibosPrint: TDataSource;
    fxdsRecibos: TfrxDBDataset;
    unqryRecibosPrint: TUniQuery;
    unstrdprcGetRecibos: TUniStoredProc;
    unstrdprcCalcularFactura: TUniStoredProc;
    unqryDibujos: TUniQuery;
    dsSeriesFac: TDataSource;
    unqrySeriesFac: TUniQuery;
    unstrdprcCrearFactura: TUniStoredProc;
    dsDibujos: TDataSource;
    dsPaises: TDataSource;
    unqryPaisesCli: TUniQuery;
    unqryPaises: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure zqryFacAfterInsert(DataSet: TDataSet);
    procedure zqryFacBeforeDelete(DataSet: TDataSet);
    procedure zqryFacAfterDelete(DataSet: TDataSet);
    procedure zqryFacBeforePost(DataSet: TDataSet);
    procedure zqryLinFacBeforeInsert(DataSet: TDataSet);
    procedure zqryLinFacBeforePost(DataSet: TDataSet);
    procedure zqryLinFacAfterPost(DataSet: TDataSet);
    procedure zqryLinFacAfterDelete(DataSet: TDataSet);
    procedure unqryFacAfterPost(DataSet: TDataSet);

public
    bEsNuevoCliente:Boolean;
    procedure NuevaFactura;
    procedure NuevoCliente;
    procedure CrearCliente;
    procedure CopiarPaisaCliente;
//    procedure ActualizarHistoria;
    procedure CalcularLinea;
    procedure CopiarClienteaFactura;
    procedure CopiarArticuloaLineaFactura;
    procedure CopiarOdontologoaLineaFactura;
    function FormaPagoDefault:String;
  end;

var
  dmPre: TdmPre;

implementation

uses
  inMtoPre;

{$R *.dfm}

{ TdmPedFab }

procedure TdmPre.CalcularLinea;
var
  sNumFac, sSerie : String;
begin
  if     (( dsLinFac.Dataset.State = dsInsert ) or
          ( dsLinFac.Dataset.State = dsEdit )
         ) then
  begin
    sNumFac := unqryFac.FindField('NRO_FACTURA').AsString;
    sSerie := unqryFac.FindField('SERIE_FACTURA').AsString;

    if ( dsLinFac.Dataset.FindField('LINEA_LINEA').AsString = '' ) then
    begin
      unqryGetLinea.SQL.Text := 'SELECT FNC_GET_NEXT_LINEA_PRESUPUESTO(' + QuotedStr(sNumFac) + ',' +
                                                                     QuotedStr(sSerie)  +')';
      unqryGetLinea.Open;
      dsLinFac.Dataset.FindField('LINEA_LINEA').AsString := unqryGetLinea.Fields[0].AsString;
      unqryGetLinea.Close;
    end;
    if dsLinFac.Dataset.FindField('CANTIDAD_LINEA').AsCurrency = 0 then
      dsLinFac.Dataset.FindField('CANTIDAD_LINEA').AsCurrency := 1;
    dsLinFac.Dataset.FindField('SUM_TOTAL_LINEA').AsCurrency :=
                                            dsLinFac.Dataset.FindField('CANTIDAD_LINEA').AsCurrency *
                                            dsLinFac.Dataset.FindField('PRECIOVENTA_ARTICULO_LINEA').AsCurrency;
    //ActualizarHistoria;
  end;
end;

procedure TdmPre.CopiarArticuloaLineaFactura;
begin
   with dsLinFac.Dataset do
   begin
      Edit;
      FindField('CODIGO_ARTICULO_LINEA').AsString :=
                          unqryArtDataLinFac.FindField('CODIGO_ARTICULO').AsString;
      FindField('DESCRIPCION_ARTICULO_LINEA').AsString :=
                          unqryArtDataLinFac.FindField('DESCRIPCION_ARTICULO').AsString;
      FindField('PRECIOVENTA_ARTICULO_LINEA').AsString :=
                          unqryArtDataLinFac.FindField('PRECIOVENTA_ARTICULO').AsString;
      Post;
   end;
end;

procedure TdmPre.CopiarClienteaFactura;
begin
  if ((unqryFac.State <> dsEdit) or (dmmPre.unqryFac.State <> dsInsert)) then
          dmmPre.unqryFac.Edit;
  unqryFac.FindField('CODIGO_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('CODIGO_CLIENTE').AsString;
  unqryFac.FindField('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('RAZONSOCIAL_CLIENTE').AsString;
  unqryFac.FindField('NOMBRE').AsString :=
                          unqryCliDataFac.FindField('NOMBRE').AsString;
  unqryFac.FindField('APELLIDOS').AsString :=
                          unqryCliDataFac.FindField('APELLIDOS').AsString;
  unqryFac.FindField('NIF_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('NIF_CLIENTE').AsString;
  unqryFac.FindField('MOVIL_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('MOVIL_CLIENTE').AsString;
  unqryFac.FindField('EMAIL_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('EMAIL_CLIENTE').AsString;
  unqryFac.FindField('DIRECCION1_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('DIRECCION1_CLIENTE').AsString;
  unqryFac.FindField('DIRECCION2_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('DIRECCION2_CLIENTE').AsString;
  unqryFac.FindField('POBLACION_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('POBLACION_CLIENTE').AsString;
  unqryFac.FindField('PROVINCIA_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('PROVINCIA_CLIENTE').AsString;
  unqryFac.FindField('CPOSTAL_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('CPOSTAL_CLIENTE').AsString;
  unqryFac.FindField('PAIS_CLIENTE_FACTURA').AsString :=
                          unqryCliDataFac.FindField('PAIS_CLIENTE').AsString;
    unqryFac.FindField('TIPOID_INT_CLIENTE_FACTURA').AsString :=
                       unqryCliDataFac.FindField('TIPOID_INT_CLIENTE').AsString;

end;

procedure TdmPre.CopiarOdontologoaLineaFactura;
begin
  if ((dsLinFac.Dataset.State <> dsEdit) or (dsLinFac.Dataset.State <> dsInsert)) then
      dsLinFac.Dataset.Edit;
    dsLinFac.Dataset.FindField('ODONTOLOGO').AsString :=
                                    unqryDocDataFac.FindField('ODONTOLOGO').AsString;
end;

procedure TdmPre.CopiarPaisaCliente;
begin
  if ((unqryFac.State <> dsEdit) or (unqryFac.State <> dsInsert)) then
          unqryFac.Edit;
  unqryFac.FindField('PAIS_CLIENTE_FACTURA').AsString :=
                          unqryPaises.FindField('COD_PAIS_ALPHA2').AsString;
end;

procedure TdmPre.CrearCliente;
begin
    with unstrdprcCrearCliente do
    begin
      ParamByName('pNOMBRE').AsString :=       unqryFac.FieldByName('NOMBRE').AsString;
      ParamByName('pAPELLIDOS').AsString :=  unqryFac.FieldByName('APELLIDOS').AsString;
      ParamByName('pCODIGO_CLIENTE').AsString :=       unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString;
      ParamByName('pRAZONSOCIAL_CLIENTE').AsString :=  unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString;
      ParamByName('pNIF_CLIENTE').AsString :=          unqryFac.FieldByName('NIF_CLIENTE_FACTURA').AsString;
      ParamByName('pMOVIL_CLIENTE').AsString :=        unqryFac.FieldByName('MOVIL_CLIENTE_FACTURA').AsString;
      ParamByName('pEMAIL_CLIENTE').AsString :=        unqryFac.FieldByName('EMAIL_CLIENTE_FACTURA').AsString;
      ParamByName('pDIRECCION1_CLIENTE').AsString :=   unqryFac.FieldByName('DIRECCION1_CLIENTE_FACTURA').AsString;
      ParamByName('pDIRECCION2_CLIENTE').AsString :=   unqryFac.FieldByName('DIRECCION2_CLIENTE_FACTURA').AsString;
      ParamByName('pPOBLACION_CLIENTE').AsString :=    unqryFac.FieldByName('POBLACION_CLIENTE_FACTURA').AsString;
      ParamByName('pPROVINCIA_CLIENTE').AsString :=    unqryFac.FieldByName('PROVINCIA_CLIENTE_FACTURA').AsString;
      ParamByName('pCPOSTAL_CLIENTE').AsString :=      unqryFac.FieldByName('CPOSTAL_CLIENTE_FACTURA').AsString;
      ParamByName('pPAIS_CLIENTE').AsString :=         unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString;
      ParamByName('pTIPOID_INT_CLIENTE').AsString :=   unqryFac.FieldByName('TIPOID_INT_CLIENTE_FACTURA').AsString;
    end;
    unstrdprcCrearCliente.ExecProc;
end;

procedure TdmPre.DataModuleCreate(Sender: TObject);
begin
  bEsNuevoCliente := False;
  with frmopenapp do
  begin
    unqryFac.Connection := FdmConn.conUni;
    unqryLinFac.Connection := FdmConn.conUni;
    unqrySeries.Connection := FDmConn.conUni;
    unqryCliDataFac.Connection := FdmConn.conUni;
    unqryArtDataLinFac.Connection := FDmConn.conUni;
    unqryDocDataFac.Connection := FDmConn.conUni;
    unqryGetLinea.Connection := FdmConn.conUni;
    unqryFormaPago.Connection := FDmConn.conUni;
    unqryRecibos.Connection := FDmConn.conUni;
    unqryDibujos.Connection := FDmConn.conUni;
    unqrySeriesFac.Connection := FDmConn.conUni;
    unqryPaisesCli.Connection := FdmConn.conUni;

    //unstrdprcCrearFacturaAbono.Connection := FDmConn.conUni;
    //unstrdprcDuplicarFactura.Connection := FDmConn.conUni;
    unstrdprcCrearCliente.Connection := FDmConn.conUni;
    unstrdprcGetContadorFactura.Connection := FDmConn.conUni;
    unstrdprcGetContador.Connection := FDmConn.conUni;
    unstrdprcGetDataArticulo.Connection := FDmConn.conUni;
    unstrdprcGetDataCliente.Connection := FDmConn.conUni;
    unstrdprcGetRecibos.Connection := FDmConn.conUni;
    unstrdprcCalcularFactura.Connection := FDmConn.conUni;
    unstrdprcCrearFactura.Connection := FDmConn.conUni;
  end;
  unqryLinFac.MasterSource :=  (Self.Owner as TfrmMtoPre).dsTablaG;
  unqryRecibos.MasterSource := (Self.Owner as TfrmMtoPre).dsTablaG;
  unqryPaisesCli.MasterSource := (Self.Owner as TfrmMtoPre).dsTablaG;
  unqryFac.Open;
  dsLinFac.Dataset.Open;
  unqryDibujos.Open;
  unqrySeries.Open;
  unqryFormaPago.Open;
  unqryRecibos.Open;
  unqrySeriesFac.Open;
  unqryDibujos.Open;
  unqryPaisesCli.Open;
end;

procedure TdmPre.DataModuleDestroy(Sender: TObject);
begin
  dsLinFac.Dataset.Close;
  unqrySeries.Close;
  //unqryHistoria.Close;
  unqryFac.Close;
  unqryFormaPago.Close;
  unqryDibujos.Close;
  unqryPaisesCli.Close;
end;

function TdmPre.FormaPagoDefault: String;
var
  qryFormaPagoFactura : TUniQuery;
  sFormaPago: string;
begin
  qryFormaPagoFactura := TUniQuery.Create(nil);
  with qryFormaPagoFactura do
  begin
    Connection := frmOpenApp.FdmConn.conUni;
    SQL.Text := 'SELECT DESCRIPCION_FORMAPAGO FROM suboc_formapago WHERE DEFAULT_FACTURA = '+ QuotedStr('S') ;
    Open;
    sFormaPago := Fields[0].AsString;
    Close;
    FreeAndNil(qryFormaPagoFactura);
  end;
  Result := sFormaPago;
  //
end;

procedure TdmPre.NuevaFactura;
begin
  if unqryFac.FindField('NRO_FACTURA').AsString = '0' then
  begin
    with unstrdprcGetContadorFactura do
    begin
      //Connection.StartTransaction;
      Params.Clear;
      Params.CreateParam(ftString, 'pserie', ptInput);
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftString, 'pcont', ptOutput);
      ParamByName('pserie').AsString :=  unqryFac.FindField('SERIE_FACTURA').AsString;
      ParamByName('ptipodoc').AsString :=  'PR';
      ExecProc;
      if not ((unqryfac.State = dsInsert) or (unqryFac.State = dsEdit)) then
        unqryFac.Edit;
      unqryFac.FindField('NRO_FACTURA').AsString := ParamByName('pcont').AsString;
      //Connection.Commit;
    end;
  end;
end;

procedure TdmPre.NuevoCliente;
begin
  if unqryFac.FindField('CODIGO_CLIENTE_FACTURA').AsString = '0' then
  begin
    bEsNuevoCliente := True;
    with unstrdprcGetContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      ParamByName('ptipodoc').AsString :=  'CL';
      ExecProc;
      unqryFac.FindField('CODIGO_CLIENTE_FACTURA').AsString := ParamByName('pcont').AsString;
    end;
  end;
end;

procedure TdmPre.unqryFacAfterPost(DataSet: TDataSet);
begin
  bEsNuevoCliente := False;
end;

procedure TdmPre.zqryLinFacBeforeInsert(DataSet: TDataSet);
begin
    if ((unqryFac.State = dsInsert) or (unqryFac.State = dsEdit)) then
      unqryfac.Post;
end;

procedure TdmPre.zqryLinFacBeforePost(DataSet: TDataSet);
begin
  CalcularLinea;
end;

procedure TdmPre.zqryLinFacAfterPost(DataSet: TDataSet);
begin
  unstrdprcCalcularFactura.ParamByName('pidseriefactura').AsString :=
                                 unqryFac.FieldByName('SERIE_FACTURA').AsString;
  unstrdprcCalcularFactura.ParamByName('pidnumfactura').AsString :=
                                 unqryFac.FieldByName('NRO_FACTURA').AsString;
  unstrdprcCalcularFactura.ExecProc;
  unqryFac.Refresh;
  //zspCrearArticulo.ExecProc;
end;

//procedure TdmPre.ActualizarHistoria;
//begin
//  unqryHistoria.Refresh;
//  if unqryHistoria.Locate('NRO_FACTURA;SERIE_FACTURA;LINEA_LINEA',
//                         VarArrayOf([dsLinFac.Dataset.FieldByName('NRO_FACTURA_LINEA').AsString,
//                                     dsLinFac.Dataset.FieldByName('SERIE_FACTURA_LINEA').AsString,
//                                     dsLinFac.Dataset.FieldByName('LINEA_LINEA').AsString]), []) then
//  begin
//    unqryHistoria.Edit;
//  end
//  else
//  begin
//    unqryHistoria.Insert;
//    unqryHistoria.FieldByName('FECHA').AsDatetime :=  unqryFac.FieldByName('FECHA_FACTURA').AsDateTime;
//  end;
////  unqryHistoria.FieldByName('NRO_FACTURA').AsString :=     zqryFac.FieldByName('NRO_FACTURA').AsString;
////  unqryHistoria.FieldByName('SERIE_FACTURA').AsString :=   zqryFac.FieldByName('SERIE_FACTURA').AsString;
//  unqryHistoria.FieldByName('LINEA_LINEA').AsString :=     dsLinFac.Dataset.FieldByName('LINEA_LINEA').AsString;
//  unqryHistoria.FieldByName('CODIGO_ARTICULO').AsString := dsLinFac.Dataset.FieldByName('CODIGO_ARTICULO_LINEA').AsString;
//  unqryHistoria.FieldByName('DESCRIPCION_ARTICULO').AsString := dsLinFac.Dataset.FieldByName('DESCRIPCION_ARTICULO_LINEA').AsString;
//  unqryHistoria.FieldByName('ZONA').AsString :=     dsLinFac.Dataset.FieldByName('ZONA').AsString;
//  unqryHistoria.FieldByName('ODONTOLOGO').AsString := dsLinFac.Dataset.FieldByName('ODONTOLOGO').AsString;
//  unqryHistoria.FieldByName('PRECIOVENTA_ARTICULO').AsCurrency :=  dsLinFac.Dataset.FieldByName('SUM_TOTAL_LINEA').AsCurrency;
//  unqryHistoria.FieldByName('CODIGO_CLIENTE').AsString  :=  unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString;
//  unqryHistoria.Post;
//
//end;

procedure TdmPre.zqryFacAfterDelete(DataSet: TDataSet);
begin
  //frmOpenApp.FDmConn.conUni.Commit;
end;

procedure TdmPre.zqryFacAfterInsert(DataSet: TDataSet);
begin
  unqryFac.FieldByName('NRO_FACTURA').ASSTRING := '0';
  unqryFac.FieldByName('SERIE_FACTURA').AsString := unqrySeries.FieldByName('SERIE_CONTADOR').AsString;
  unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString := '0';
  unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString:= 'PACIENTE NUEVO';
  unqryFac.FieldByName('FECHA_FACTURA').AsDateTime := Trunc(Now);
  unqryFac.FieldByName('FORMA_PAGO_FACTURA').AsString := FormaPagoDefault;
end;

procedure TdmPre.zqryFacBeforeDelete(DataSet: TDataSet);
var
  qryBorrarLineas : TUniQuery;
begin
  qryBorrarLineas := TUniQuery.Create(nil);
  with qryBorrarLineas do
  begin
    Connection := frmOpenApp.FdmConn.conUni;
    SQL.Text := 'DELETE FROM suboc_presupuestos_lineas WHERE SERIE_FACTURA_LINEA = :serie ' +
                ' AND NRO_FACTURA_LINEA = :nrofactura';
    //Connection.StartTransaction;
    Params.Clear;
    Params.CreateParam(ftString, 'serie', ptInput);
    Params.CreateParam(ftString, 'nrofactura', ptInput);
    Params.ParamByName('serie').AsString := unqryFac.FieldByName('SERIE_FACTURA').AsString;
    Params.ParamByName('nrofactura').AsString := unqryFac.FieldByName('NRO_FACTURA').AsString;
    ExecSQL;
    //Connection.Commit;
    Free;
  end;
end;

procedure TdmPre.zqryFacBeforePost(DataSet: TDataSet);
begin
  if ((unqryFac.State = dsEdit) or (unqryFac.State = dsInsert)) then
  begin
    if (unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString = 'PACIENTE NUEVO') OR
        (unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString = 'PACIENTE NO ENCONTRADO') then
      Abort
    else
    begin
      if unqryFac.FieldByName('NRO_FACTURA').AsString='0' then
      NuevaFactura;
      if unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString = '0' then
      NuevoCliente;
    end;
  end;

end;

procedure TdmPre.zqryLinFacAfterDelete(DataSet: TDataSet);
begin
  unstrdprcCalcularFactura.ParamByName('pidseriefactura').AsString :=
                                 unqryFac.FieldByName('SERIE_FACTURA').AsString;
  unstrdprcCalcularFactura.ParamByName('pidnumfactura').AsString :=
                                 unqryFac.FieldByName('NRO_FACTURA').AsString;
  unstrdprcCalcularFactura.ExecProc;
  unqryFac.Refresh;
end;

end.
