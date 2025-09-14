unit UniDataFac;

interface

uses
  SysUtils, Classes,  DB, Controls,  system.DateUtils,
   inMtoPrincipal, DBClient, Provider, frxClass, frxDBSet,
   Windows, Dialogs, System.Variants, MemDS, DBAccess, Uni;

type
  TdmFac = class(TDataModule)
    dsLinFac: TDataSource;
    dsFacPrint: TDataSource;
    dsLinFacPrint: TDataSource;
    dsSeries: TDataSource;
    dsHistoria: TDataSource;
    fxdsPrintFac: TfrxDBDataset;
    fxdstPrintLinFac: TfrxDBDataset;
    unqryFac: TUniQuery;
    unqryFacPrint: TUniQuery;
    unqryLinFacPrint: TUniQuery;
    unqrySeries: TUniQuery;
    unqryHistoria: TUniQuery;
    unqryCliDataFac: TUniQuery;
    unqryArtDataLinFac: TUniQuery;
    unqryDocDataFac: TUniQuery;
    unqryGetLinea: TUniQuery;
    unqryLinFac: TUniQuery;
    unstrdprcCrearFacturaAbono: TUniStoredProc;
    unstrdprcDuplicarFactura: TUniStoredProc;
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
    unqryConsolidacion: TUniQuery;
    dsConsolidacion: TDataSource;
    dsPaises: TDataSource;
    unqryPaisesCli: TUniQuery;
    unqryPaises: TUniQuery;
    dsErrores: TDataSource;
    unqryErrores: TUniQuery;
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
    procedure unqryLinFacAfterInsert(DataSet: TDataSet);
public

    procedure NuevaFactura;
    procedure NuevoCliente;
    procedure CrearCliente;
    procedure ActualizarHistoria;
    procedure CalcularLinea;
    procedure CopiarClienteaFactura;
    procedure CopiarPaisaCliente;
    procedure CopiarArticuloaLineaFactura;
    procedure CopiarOdontologoaLineaFactura;
    function FormaPagoDefault:String;
    procedure SeleccionarSerieSimpl;
    procedure SeleccionarSerie;
    function GetWebServiceInvoice:string;
    function SerieEsSimp(sSerie:string):Boolean;
    function TieneLineas(const ASerie: string;
                         ANumero: Integer): Boolean;
    function GetURLOffLineVerifactu:String;
private
    function ExisteFacturaAnterior(const ASerie: string;
                                   ANumero: Integer): Boolean;
    function fncCalcularFechaMinima:TDateTime;
    function ExisteFechaMayorAnterior(const ASerie: string;
                                   ANumero: Integer;
                                   dtFech:TDateTime): Boolean;
    function ExisteFactura(const ASerie: string;
                                   ANumero: Integer): Boolean;
public
    function fncObtenerQueueIdFactura(const sSerie: string;
                                      const iNumero: Integer): Integer;

  end;

var
  dmFac: TdmFac;

implementation

uses
  inMtoFac, inLibDocumentoValidator;

{$R *.dfm}

function TdmFac.fncCalcularFechaMinima: TDateTime;
var
  iAnoActual, iMesActual, iTrimestreActual: Integer;
  iAnoMinimo: Integer;
  dtFechaMinima: TDateTime;
begin
  // Obtener año y mes actual
  iAnoActual := YearOf(Now);
  iMesActual := MonthOf(Now);
  // Determinar el trimestre actual
  if iMesActual <= 3 then
    iTrimestreActual := 1
  else if iMesActual <= 6 then
    iTrimestreActual := 2
  else if iMesActual <= 9 then
    iTrimestreActual := 3
  else
    iTrimestreActual := 4;
  // Calcular el año mínimo (año pasado)
  iAnoMinimo := iAnoActual - 1;
  // Calcular la fecha mínima según el trimestre actual del año pasado
  case iTrimestreActual of
    1: dtFechaMinima := EncodeDate(iAnoMinimo, 1, 1);   // 1 enero año pasado
    2: dtFechaMinima := EncodeDate(iAnoMinimo, 4, 1);   // 1 abril año pasado
    3: dtFechaMinima := EncodeDate(iAnoMinimo, 7, 1);   // 1 julio año pasado
    4: dtFechaMinima := EncodeDate(iAnoMinimo, 10, 1);  // 1 octubre año pasado
  else
    dtFechaMinima := EncodeDate(iAnoMinimo, 1, 1);
  end;
  Result := dtFechaMinima;
end;

function TdmFac.fncObtenerQueueIdFactura(const sSerie: string;
  const iNumero: Integer): Integer;
var
  qryConsolidacion: TUniQuery;
  iQueueId: Integer;
begin
  iQueueId := 0;
  qryConsolidacion := TUniQuery.Create(nil);
  try
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text :=
      'SELECT QUEUE_ID ' +
      'FROM suboc_consolidacion ' +
      'WHERE SERIE_FACTURA = :SERIE ' +
      '  AND NRO_FACTURA = :NUMERO ' +
      '  AND QUEUE_ID IS NOT NULL';
    qryConsolidacion.ParamByName('SERIE').AsString := sSerie;
    qryConsolidacion.ParamByName('NUMERO').AsInteger := iNumero;
    qryConsolidacion.Open;
    if not qryConsolidacion.IsEmpty then
      iQueueId := qryConsolidacion.FieldByName('QUEUE_ID').AsInteger
    else
     iQueueId := 0;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
  end;
  Result := iQueueId;
end;


procedure TdmFac.CalcularLinea;
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
      unqryGetLinea.SQL.Text := 'SELECT FNC_GET_NEXT_LINEA_FACTURA(' + QuotedStr(sNumFac) + ',' +
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
    ActualizarHistoria;
  end;
end;

procedure TdmFac.CopiarArticuloaLineaFactura;
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

procedure TdmFac.CopiarClienteaFactura;
begin
  if ((unqryFac.State <> dsEdit) or (dmmFac.unqryFac.State <> dsInsert)) then
          dmmFac.unqryFac.Edit;
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

procedure TdmFac.CopiarOdontologoaLineaFactura;
begin
  if ((dsLinFac.Dataset.State <> dsEdit) or
      (dsLinFac.Dataset.State <> dsInsert)) then
      dsLinFac.Dataset.Edit;
    dsLinFac.Dataset.FindField('ODONTOLOGO').AsString :=
                                    unqryDocDataFac.FindField('ODONTOLOGO').AsString;
end;

procedure TdmFac.CopiarPaisaCliente;
begin
  if ((unqryFac.State <> dsEdit) or (unqryFac.State <> dsInsert)) then
          unqryFac.Edit;
  unqryFac.FindField('PAIS_CLIENTE_FACTURA').AsString :=
                          unqryPaises.FindField('COD_PAIS_ALPHA2').AsString;
end;

procedure TdmFac.CrearCliente;
begin
    with unstrdprcCrearCliente do
    begin
      ParamByName('pNOMBRE').AsString :=               unqryFac.FieldByName('NOMBRE').AsString;
      ParamByName('pAPELLIDOS').AsString :=            unqryFac.FieldByName('APELLIDOS').AsString;
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

procedure TdmFac.DataModuleCreate(Sender: TObject);
begin
  with frmopenapp do
  begin
    unqryFac.Connection := FdmConn.conUni;
    unqryLinFac.Connection := FdmConn.conUni;
    unqrySeries.Connection := FDmConn.conUni;
    unqryHistoria.Connection := FDmConn.conUni;
    unqryCliDataFac.Connection := FdmConn.conUni;
    unqryArtDataLinFac.Connection := FDmConn.conUni;
    unqryDocDataFac.Connection := FDmConn.conUni;
    unstrdprcCrearCliente.Connection := FDmConn.conUni;
    unqryGetLinea.Connection := FdmConn.conUni;
    unqryFormaPago.Connection := FDmConn.conUni;
    unqryRecibos.Connection := FDmConn.conUni;
    unqryConsolidacion.Connection := FdmConn.conUni;
    unqryPaisesCli.Connection := FdmConn.conUni;
    unqryPaises.Connection := FDmConn.conUni;
    unqryErrores.Connection := FDmConn.conUni;
    unstrdprcCrearFacturaAbono.Connection := FDmConn.conUni;
    unstrdprcDuplicarFactura.Connection := FDmConn.conUni;
    unstrdprcGetContadorFactura.Connection := FDmConn.conUni;
    unstrdprcGetContador.Connection := FDmConn.conUni;
    unstrdprcGetDataArticulo.Connection := FDmConn.conUni;
    unstrdprcGetDataCliente.Connection := FDmConn.conUni;
    unstrdprcGetRecibos.Connection := FDmConn.conUni;
    unstrdprcCalcularFactura.Connection := FDmConn.conUni;
  end;
  unqryLinFac.MasterSource := (Self.Owner as TfrmMtoFac).dsTablaG;
  unqryConsolidacion.MasterSource := (Self.Owner as TfrmMtoFac).dsTablaG;
  unqryRecibos.MasterSource := (Self.Owner as TfrmMtoFac).dsTablaG;
  unqryErrores.MasterSource := (Self.Owner as TfrmMtoFac).dsTablaG;
  unqryPaisesCli.MasterSource := (Self.Owner as TfrmMtoFac).dsTablaG;
  unqryHistoria.MasterSource := (Self.Owner as TfrmMtoFac).dsTablaG;
  unqryFac.Open;
  dsLinFac.Dataset.Open;
  unqrySeries.Open;
  unqryHistoria.Open;
  unqryFormaPago.Open;
  unqryRecibos.Open;
  unqryConsolidacion.Open;
  unqryPaisesCli.Open;
  unqryErrores.Open;
end;

procedure TdmFac.DataModuleDestroy(Sender: TObject);
begin
  dsLinFac.Dataset.Close;
  unqrySeries.Close;
  unqryHistoria.Close;
  unqryFac.Close;
  unqryFormaPago.Close;
  unqryConsolidacion.Close;
  unqryPaisesCli.Close;
end;

function TdmFac.FormaPagoDefault: String;
var
  qryFormaPagoFactura : TUniQuery;
  sFormaPago: string;
begin
  qryFormaPagoFactura := TUniQuery.Create(nil);
  with qryFormaPagoFactura do
  begin
    Connection := frmOpenApp.FdmConn.conUni;
    SQL.Text := 'SELECT DESCRIPCION_FORMAPAGO ' +
                '  FROM suboc_formapago '+
                ' WHERE DEFAULT_FACTURA = '+ QuotedStr('S') ;
    Open;
    sFormaPago := Fields[0].AsString;
    Close;
    FreeAndNil(qryFormaPagoFactura);
  end;
  Result := sFormaPago;
  //
end;

function TdmFac.GetURLOffLineVerifactu: String;
var
  unqrySol: TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  unqrySol.sql.Text := 'SELECT VALUE_PARAM ' +
                       '  FROM suboc_param' +
                       '  WHERE NOMBRE_PARAM ='+  QuotedStr('URL_QR_OFFLINE');
  unqrySol.Open;
  Result := unqrySol.FieldByName('VALUE_PARAM').AsString;
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

function TdmFac.GetWebServiceInvoice: string;
var
  unqryParams: TUniQuery;

begin
  unqryParams := TUniQuery.Create(nil);
  try
    unqryParams.Connection := frmOpenApp.FDmConn.conUni;
    unqryParams.SQL.Text := 'SELECT VALUE_PARAM '+
                            '  FROM suboc_param ' +
                            ' WHERE NOMBRE_PARAM IN ('+
                            '       '+ QuotedStr('URL_VERIFACTU_INVOICE') +')';
    // Ejecutar la consulta
    unqryParams.Open;
    Result := unqryParams.Fields[0].AsString;
    unqryParams.Close;
  finally
    FreeAndNil(unqryParams);
  end;
end;

procedure TdmFac.NuevaFactura;
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
      ParamByName('pserie').AsString :=
                                   unqryFac.FindField('SERIE_FACTURA').AsString;
      ParamByName('ptipodoc').AsString :=  'FC';
      ExecProc;
      if not ((unqryfac.State = dsInsert) or (unqryFac.State = dsEdit)) then
        unqryFac.Edit;
      unqryFac.FindField('NRO_FACTURA').AsString :=
                                                  ParamByName('pcont').AsString;
      //Connection.Commit;
    end;
  end;
end;

procedure TdmFac.NuevoCliente;
begin
  if unqryFac.FindField('CODIGO_CLIENTE_FACTURA').AsString = '0' then
  begin
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

procedure TdmFac.SeleccionarSerieSimpl;
var
  unqrySol: TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  unqrySol.sql.Text := 'SELECT SERIE_CONTADOR ' +
                       '  FROM suboc_contadores' +
                       '  WHERE TIPODOC_CONTADOR =' + QuotedStr('FC') +
                       ' AND DEFSIMPL_CONTADOR = ' + QuotedStr('S');
  unqrySol.Open;
  unqryFac.FieldByName('SERIE_FACTURA').AsString :=
                                unqrySol.FieldByName('SERIE_CONTADOR').AsString;
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

function TdmFac.SerieEsSimp(sSerie: string): Boolean;
var
  unqrySol: TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  unqrySol.sql.Text := 'SELECT SERIE_CONTADOR ' +
                       '  FROM suboc_contadores' +
                       '  WHERE SERIE_CONTADOR =' + QuotedStr(sSerie) +
                       ' AND DEFSIMPL_CONTADOR = ' + QuotedStr('S');
  unqrySol.Open;
  Result := (unqrySol.RecordCount >= 1);
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

function TdmFac.TieneLineas(const ASerie: string; ANumero: Integer): Boolean;
var
  unqrySol: TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  unqrySol.sql.Text := 'SELECT COUNT(*) as NROLINEAS ' +
                       '  FROM suboc_facturas_lineas' +
                       '  WHERE SERIE_FACTURA_LINEA =' + QuotedStr(ASerie) +
                       ' AND NRO_FACTURA_LINEA = ' + IntToStr(ANumero);
  unqrySol.Open;
  Result := unqrySol.FieldByName('NROLINEAS').AsInteger > 0;
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

procedure TdmFac.unqryLinFacAfterInsert(DataSet: TDataSet);
begin
  unqryLinFac.FieldByName('SERIE_FACTURA_LINEA').AsString :=
                                 unqryFac.FieldByName('SERIE_FACTURA').AsString;
  unqryLinFac.FieldByName('NRO_FACTURA_LINEA').AsString :=
                                 unqryFac.FieldByName('NRO_FACTURA').AsString;

end;

procedure TdmFac.SeleccionarSerie;
var
  unqrySol: TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  unqrySol.sql.Text := 'SELECT SERIE_CONTADOR ' +
                       '  FROM suboc_contadores' +
                       '  WHERE TIPODOC_CONTADOR =' + QuotedStr('FC') +
                       ' AND DEFAULT_CONTADOR = ' + QuotedStr('S');
  unqrySol.Open;
  unqryFac.FieldByName('SERIE_FACTURA').AsString :=
                                unqrySol.FieldByName('SERIE_CONTADOR').AsString;
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

procedure TdmFac.zqryLinFacBeforeInsert(DataSet: TDataSet);
begin
    if ((unqryFac.State = dsInsert) or (unqryFac.State = dsEdit)) then
      unqryfac.Post;
end;

procedure TdmFac.zqryLinFacBeforePost(DataSet: TDataSet);
begin
  if Trim(unqryLinFac.FieldByName('DESCRIPCION_ARTICULO_LINEA').AsString) = '' then
  begin
    ShowMessage('No se puede añadir linea con descripción vacía.' + sLineBreak +
                 'La línea no se grabará');
    Abort;
  end;
  CalcularLinea;
end;

procedure TdmFac.zqryLinFacAfterPost(DataSet: TDataSet);
begin
  unstrdprcCalcularFactura.ParamByName('pidseriefactura').AsString :=
                                 unqryFac.FieldByName('SERIE_FACTURA').AsString;
  unstrdprcCalcularFactura.ParamByName('pidnumfactura').AsString :=
                                 unqryFac.FieldByName('NRO_FACTURA').AsString;
  unstrdprcCalcularFactura.ExecProc;
  unqryFac.Refresh;
  //zspCrearArticulo.ExecProc;
end;

procedure TdmFac.ActualizarHistoria;
begin
  unqryHistoria.Refresh;
  if unqryHistoria.Locate('NRO_FACTURA;SERIE_FACTURA;LINEA_LINEA',
                         VarArrayOf([dsLinFac.Dataset.FieldByName('NRO_FACTURA_LINEA').AsString,
                                     dsLinFac.Dataset.FieldByName('SERIE_FACTURA_LINEA').AsString,
                                     dsLinFac.Dataset.FieldByName('LINEA_LINEA').AsString]), []) then
  begin
    unqryHistoria.Edit;
  end
  else
  begin
    unqryHistoria.Insert;
    unqryHistoria.FieldByName('FECHA').AsDatetime :=  unqryFac.FieldByName('FECHA_FACTURA').AsDateTime;
  end;
  //unqryHistoria.FieldByName('NRO_FACTURA').AsString :=     zqryFac.FieldByName('NRO_FACTURA').AsString;
  //unqryHistoria.FieldByName('SERIE_FACTURA').AsString :=   zqryFac.FieldByName('SERIE_FACTURA').AsString;
  unqryHistoria.FieldByName('LINEA_LINEA').AsString :=     dsLinFac.Dataset.FieldByName('LINEA_LINEA').AsString;
  unqryHistoria.FieldByName('CODIGO_ARTICULO').AsString := dsLinFac.Dataset.FieldByName('CODIGO_ARTICULO_LINEA').AsString;
  unqryHistoria.FieldByName('DESCRIPCION_ARTICULO').AsString := dsLinFac.Dataset.FieldByName('DESCRIPCION_ARTICULO_LINEA').AsString;
  unqryHistoria.FieldByName('ZONA').AsString :=     dsLinFac.Dataset.FieldByName('ZONA').AsString;
  unqryHistoria.FieldByName('ODONTOLOGO').AsString := dsLinFac.Dataset.FieldByName('ODONTOLOGO').AsString;
  unqryHistoria.FieldByName('PRECIOVENTA_ARTICULO').AsCurrency :=  dsLinFac.Dataset.FieldByName('SUM_TOTAL_LINEA').AsCurrency;
  unqryHistoria.FieldByName('CODIGO_CLIENTE').AsString  :=  unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString;
  unqryHistoria.Post;
end;

procedure TdmFac.zqryFacAfterDelete(DataSet: TDataSet);
begin
  //frmOpenApp.FDmConn.conUni.Commit;
end;

procedure TdmFac.zqryFacAfterInsert(DataSet: TDataSet);
begin
  unqryFac.FieldByName('NRO_FACTURA').ASSTRING := '0';
  unqryFac.FieldByName('SERIE_FACTURA').AsString :=
                             unqrySeries.FieldByName('SERIE_CONTADOR').AsString;
  unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString := '0';
  unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString:= 'PACIENTE NUEVO';
  unqryFac.FieldByName('FECHA_FACTURA').AsDateTime := Trunc(Now);
  unqryFac.FieldByName('FORMA_PAGO_FACTURA').AsString := FormaPagoDefault;
  unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString := 'ES';
  unqryFac.FieldByName('CONSOLIDACION_FACTURA').AsString := 'N';
  unqryFac.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString := 'BORRADOR';
  unqryFac.FieldByName('FECHA_ULT_CONSO_FACTURA').AsDateTime := Now;
  unqryFac.FieldByName('ESSIMPL_FACTURA').AsString := 'N';
end;

procedure TdmFac.zqryFacBeforeDelete(DataSet: TDataSet);
var
  qryBorrarLineas : TUniQuery;
begin
  qryBorrarLineas := TUniQuery.Create(nil);
  with qryBorrarLineas do
  begin
    Connection := frmOpenApp.FdmConn.conUni;
    SQL.Text := 'DELETE '+
                '  FROM suboc_facturas_lineas '+
                ' WHERE SERIE_FACTURA_LINEA = :serie ' +
                '   AND NRO_FACTURA_LINEA = :nrofactura';
    //Connection.StartTransaction;
    Params.Clear;
    Params.CreateParam(ftString, 'serie', ptInput);
    Params.CreateParam(ftString, 'nrofactura', ptInput);
    Params.ParamByName('serie').AsString :=
                                 unqryFac.FieldByName('SERIE_FACTURA').AsString;
    Params.ParamByName('nrofactura').AsString :=
                                   unqryFac.FieldByName('NRO_FACTURA').AsString;
    ExecSQL;
    //Connection.Commit;
    FreeAndNil(qryBorrarLineas);
  end;
end;

function TdmFac.ExisteFactura(const ASerie: string; ANumero: Integer): Boolean;
var
  unqrySol:TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  Result := False;
  try
    with unqrySol do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NRO_FACTURA as EXISTE');
      SQL.Add('FROM SUBOC_FACTURAS');
      SQL.Add('WHERE SERIE_FACTURA = :SERIE');
      SQL.Add('AND NRO_FACTURA = :NUMERO');
      ParamByName('SERIE').AsString := ASerie;
      ParamByName('NUMERO').AsInteger := ANumero;
      Open;
    end;
    Result := unqrySol.FieldByName('EXISTE').AsInteger > 0;
    unqrySol.Close;
    FreeAndNil(unqrySol);
  except
    on E: Exception do
    begin
      raise Exception.CreateFmt('Error al verificar documento : %s', [E.Message]);
    end;
  end;
end;

function TdmFac.ExisteFacturaAnterior(const ASerie: string;
                                      ANumero: Integer): Boolean;
var
  unqrySol:TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  Result := False;
  if ANumero = 1 then
  begin
    Result := True; // El número 1 siempre es válido (inicio de serie)
    Exit;
  end;
  try
    with unqrySol do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NRO_FACTURA as EXISTE');
      SQL.Add('FROM SUBOC_FACTURAS');
      SQL.Add('WHERE SERIE_FACTURA = :SERIE');
      SQL.Add('AND NRO_FACTURA = :NUMERO');
      SQL.Add('AND CONSOLIDACION_FACTURA =' + QuotedStr('S'));
      ParamByName('SERIE').AsString := ASerie;
      ParamByName('NUMERO').AsInteger := ANumero - 1;
      Open;
    end;
    Result := unqrySol.FieldByName('EXISTE').AsInteger > 0;
    unqrySol.Close;
    FreeAndNil(unqrySol);
  except
    on E: Exception do
    begin
      raise Exception.CreateFmt('Error al verificar factura anterior: %s',
                                [E.Message]);
    end;
  end;
end;

function TdmFac.ExisteFechaMayorAnterior(const ASerie: string;
                                   ANumero: Integer; dtFech:TDateTime): Boolean;
var
  unqrySol:TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  Result := False;
  if ANumero = 1 then
  begin
    Result := False; // El número 1 siempre es válido (inicio de serie)
    Exit;
  end;
  try
    with unqrySol do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FECHA_FACTURA ');
      SQL.Add('FROM SUBOC_FACTURAS F1 ');
      SQL.Add('WHERE F1.SERIE_FACTURA = :SERIE');
      SQL.Add('AND F1.NRO_FACTURA = :NUMERO_ANTERIOR');
      SQL.Add('AND F1.CONSOLIDACION_FACTURA =' + QuotedStr('S'));
      ParamByName('SERIE').AsString := ASerie;
      ParamByName('NUMERO_ANTERIOR').AsInteger := ANumero - 1;
      Open;
    end;
    // Si el resultado es 'S', hay error (fecha menor que la anterior)
    Result := (unqrySol.FieldByName('FECHA_FACTURA').AsDateTime > dtFech);
    unqrySol.Close;
    FreeAndNil(unqrySol);
  except
    on E: Exception do
    begin
      raise Exception.CreateFmt('Error al verificar fecha anterior: %s', [E.Message]);
    end;
  end;
end;

procedure TdmFac.zqryFacBeforePost(DataSet: TDataSet);
var
  MensajeError:string;
  Serie :String;
  bAbort, bEsSimpl:Boolean;
  Numero, NumeroAnterior:String;
  iNumero:Integer;
  dtFecha:TDateTime;
  validator: TDocumentoValidator;
begin
  bEsSimpl := (unqryFac.FieldByName('ESSIMPL_FACTURA').AsString = 'S');
  if ((not bEsSimpl) and
      (unqryFac.FieldByName('CODIGO_CLIENTE_FACTURA').AsString = '0')) then
    NuevoCliente;
  bAbort := False;
  if (not bEsSimpl) and
     ((unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString =
                                                            'PACIENTE NUEVO') OR
    (Trim(unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString) = '') OR
        (unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString =
                                                 'PACIENTE NO ENCONTRADO')) then
  begin
    ShowMessage('Faltan datos de cliente');
    bAbort := True;
  end;
  if ((bEsSimpl) and (unqryFac.FieldByName(
                                  'TOTAL_LIQUIDO_FACTURA').AsFloat > 400)) then
  begin
    ShowMessage('El importe excede el límite legal para facturas simplificadas');
    bAbort := True;
  end;
    if ((bAbort = False) and  (not(bEsSimpl)) and
       (unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString <> 'ES') and
   (Trim(unqryFac.FieldByName('TIPOID_INT_CLIENTE_FACTURA').AsString) = '')) then
  begin
    ShowMessage('El paciente requiere el tipo de identificación internacional');
    bAbort := True;
  end;
  if ((bAbort = False) and  (not(bEsSimpl)) and
     (Trim(unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString) = '')) then
  begin
    ShowMessage('El país no puede estar vacío');
    bAbort := True;
  end;
  if ((bAbort = False) and  (not(bEsSimpl)) and (
                unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString ='ES') and
      ((Self.Owner as TfrmMtoFac).cxchkNoNIFControl.Checked = False)) then
  begin
    validator := TDocumentoValidator.Create;
    try
      if not validator.ValidarDocumento(
                     unqryFac.FieldByName('NIF_CLIENTE_FACTURA').AsString) then
      begin
        ShowMessage('NIF/CIF inválido: ' +
                       unqryFac.FieldByName('NIF_CLIENTE_FACTURA').AsString);
        bAbort := True;
      end;
    finally
      validator.Free;
    end;
  end;
  if ((bAbort = False) and  (not(bEsSimpl)) and
      (Trim(unqryFac.FieldByName('NIF_CLIENTE_FACTURA').AsString) = '') and
      (unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString <> 'ES')) then
  begin
    ShowMessage('Identificación internacional inválida.');
    bAbort := True;
  end;
  if (bAbort = False) and
                         (unqryFac.FieldByName('NRO_FACTURA').AsString='0') then
    NuevaFactura;
  iNumero :=  unqryFac.FieldByName('NRO_FACTURA').AsInteger;
  Serie := unqryFac.FieldByName('SERIE_FACTURA').AsString;
  Numero := unqryFac.FieldByName('NRO_FACTURA').AsString;
  NumeroAnterior := IntToStr(StrtoInt(Numero) - 1);
  if ((bAbort = False) and
      (unqryFac.State = dsInsert) and
      (ExisteFactura(Serie, iNumero))) then
  begin
    ShowMessage(Format('El número de documento %s/%s ' +
                       ' ya existe en la base de datos', [Serie, Numero]));
    bAbort := True;
  end;
  if ((bAbort = False) and not(ExisteFacturaAnterior(Serie, iNumero)))  then
  begin
    MensajeError := Format(
            'ERROR DE SECUENCIA: No existe el documento anterior' +
            ' o el documento anterior no está consolidado. %s' +
            'Error en la secuencia numérica verifactu.%s' +
            'Serie: %s%s' +
            'Número faltante: %s%s' +
            'Número actual: %s%s',
            [sLineBreak,
             sLineBreak,
             Serie,
             sLineBreak,
             NumeroAnterior,
             sLineBreak,
             Numero,
             sLineBreak]);
      ShowMessage(MensajeError);
      ShowMessage('El documento no se grabará, corrija el contador');
      bAbort := True; // Cancela la operación BeforePost
  end;
  dtFecha := unqryFac.FieldByName('FECHA_FACTURA').AsDateTime;
  if ((bAbort = False) and (dtFecha < fncCalcularFechaMinima))  then
  begin
    MensajeError := Format(
            'ERROR DE SECUENCIA: Hay un error en la fecha %s' +
            'La fecha de la factura no puede ser tan antigua.%s' +
            'Serie: %s%s' +
            'Número actual: %s%s',
            [sLineBreak, sLineBreak, Serie, sLineBreak, Numero, sLineBreak,
             Numero, sLineBreak]);
      ShowMessage(MensajeError);
      ShowMessage('El documento no se grabará, corrija la fecha');
      bAbort := True; // Cancela la operación BeforePost
  end;
  if ((bAbort = False) and (ExisteFechaMayorAnterior(Serie,
                                                     iNumero,
                                                     dtFecha)))  then
  begin
    MensajeError := Format(
            'ERROR DE SECUENCIA: Hay un error en la fecha %s' +
            'La fecha de la factura verifactu anterior no puede ser mayor.%s' +
            'Serie: %s%s' +
            'Número actual: %s%s',
            [sLineBreak, sLineBreak, Serie, sLineBreak, Numero, sLineBreak,
             Numero, sLineBreak]);
      ShowMessage(MensajeError);
      ShowMessage('El documento no se grabará, corrija la fecha');
      bAbort := True; // Cancela la operación BeforePost
  end;
  if (bAbort = True) then
  begin
    ShowMessage('La cabecera del documento no se ha grabado');
    Abort;
  end
  else
    unqryLinFac.Refresh;
end;

procedure TdmFac.zqryLinFacAfterDelete(DataSet: TDataSet);
begin
  unstrdprcCalcularFactura.ParamByName('pidseriefactura').AsString :=
                                 unqryFac.FieldByName('SERIE_FACTURA').AsString;
  unstrdprcCalcularFactura.ParamByName('pidnumfactura').AsString :=
                                 unqryFac.FieldByName('NRO_FACTURA').AsString;
  unstrdprcCalcularFactura.ExecProc;
  unqryFac.Refresh;
end;

end.
