unit UniDataPre;

interface

uses
  SysUtils, Classes, DB,
   inMtoPrincipal, DBClient, Provider, frxClass, frxDBSet,
   Windows, Dialogs, System.Variants, MemDS, DBAccess, Uni,
   UniDataDocRecibos;

type
  TdmPre = class(TdmDocConRecibos)
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

  protected
    // Implementación de métodos abstractos de TdmDocBase
    function GetDatasetDocumento: TDataSet; override;
    function GetDatasetLineas: TDataSet; override;
    function GetDatasetClientes: TUniQuery; override;
    function GetDatasetArticulos: TUniQuery; override;
    function GetDatasetOdontologos: TUniQuery; override;
    function GetDatasetPaises: TUniQuery; override;
    function GetStoredProcCrearCliente: TUniStoredProc; override;
    function GetStoredProcGetContador: TUniStoredProc; override;
    function GetStoredProcGetContadorDoc: TUniStoredProc; override;
    function GetStoredProcCalcularDoc: TUniStoredProc; override;

    // Nombres de campos - Presupuestos
    function GetNombreCampoNroDoc: string; override;
    function GetNombreCampoSerieDoc: string; override;
    function GetNombreCampoCodigoCliente: string; override;
    function GetNombreCampoRazonSocialCliente: string; override;
    function GetNombreCampoNombre: string; override;
    function GetNombreCampoApellidos: string; override;
    function GetNombreCampoNIFCliente: string; override;
    function GetNombreCampoMovilCliente: string; override;
    function GetNombreCampoEmailCliente: string; override;
    function GetNombreCampoDireccion1Cliente: string; override;
    function GetNombreCampoDireccion2Cliente: string; override;
    function GetNombreCampoPoblacionCliente: string; override;
    function GetNombreCampoProvinciaCliente: string; override;
    function GetNombreCampoCPostalCliente: string; override;
    function GetNombreCampoPaisCliente: string; override;
    function GetNombreCampoTipoIdIntCliente: string; override;
    function GetNombreCampoFechaDoc: string; override;
    function GetNombreCampoFormaPago: string; override;

    // Nombres de campos de líneas
    function GetNombreCampoSerieLinea: string; override;
    function GetNombreCampoNroLinea: string; override;
    function GetNombreCampoLineaLinea: string; override;
    function GetNombreCampoCodigoArticuloLinea: string; override;
    function GetNombreCampoDescripcionArticuloLinea: string; override;
    function GetNombreCampoPrecioVentaArticuloLinea: string; override;
    function GetNombreCampoCantidadLinea: string; override;
    function GetNombreCampoTotalLinea: string; override;
    function GetNombreCampoOdontologoLinea: string; override;

    function GetNombreTablaLineas: string; override;
    function GetTipoDocumento: string; override;
    function GetNombreFuncionNextLinea: string; override;

    // Implementación de métodos abstractos de TdmDocConRecibos
    function GetDatasetRecibos: TUniQuery; override;
    function GetStoredProcGetRecibos: TUniStoredProc; override;

  public
    bEsNuevoCliente: Boolean;
    // Nota: Los siguientes métodos ahora se heredan de TdmDocBase:
    // - CopiarClienteaDocumento (antes: CopiarClienteaFactura)
    // - CrearCliente
    // - NuevoCliente
    // - CopiarPaisaCliente
    // - CalcularLinea
    // - CopiarArticuloaLinea (antes: CopiarArticuloaLineaFactura)
    // - CopiarOdontologoaLinea (antes: CopiarOdontologoaLineaFactura)
    // - NuevoNumeroDocumento (antes: NuevaFactura)
    // - FormaPagoDefault
    // - BorrarLineasDocumento
    // - RecalcularTotalesDocumento

    // Y de TdmDocConRecibos:
    // - GenerarRecibos
    // - CambiarEstadoRecibo
  end;

var
  dmPre: TdmPre;

implementation

uses
  inMtoPre;

{$R *.dfm}

{ TdmPre }

{ Implementación de métodos abstractos }

function TdmPre.GetDatasetDocumento: TDataSet;
begin
  Result := unqryFac;
end;

function TdmPre.GetDatasetLineas: TDataSet;
begin
  Result := dsLinFac.DataSet;
end;

function TdmPre.GetDatasetClientes: TUniQuery;
begin
  Result := unqryCliDataFac;
end;

function TdmPre.GetDatasetArticulos: TUniQuery;
begin
  Result := unqryArtDataLinFac;
end;

function TdmPre.GetDatasetOdontologos: TUniQuery;
begin
  Result := unqryDocDataFac;
end;

function TdmPre.GetDatasetPaises: TUniQuery;
begin
  Result := unqryPaises;
end;

function TdmPre.GetStoredProcCrearCliente: TUniStoredProc;
begin
  Result := unstrdprcCrearCliente;
end;

function TdmPre.GetStoredProcGetContador: TUniStoredProc;
begin
  Result := unstrdprcGetContador;
end;

function TdmPre.GetStoredProcGetContadorDoc: TUniStoredProc;
begin
  Result := unstrdprcGetContadorFactura;
end;

function TdmPre.GetStoredProcCalcularDoc: TUniStoredProc;
begin
  Result := unstrdprcCalcularFactura;
end;

function TdmPre.GetDatasetRecibos: TUniQuery;
begin
  Result := unqryRecibos;
end;

function TdmPre.GetStoredProcGetRecibos: TUniStoredProc;
begin
  Result := unstrdprcGetRecibos;
end;

{ Nombres de campos de documento }

function TdmPre.GetNombreCampoNroDoc: string;
begin
  Result := 'NRO_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoSerieDoc: string;
begin
  Result := 'SERIE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoCodigoCliente: string;
begin
  Result := 'CODIGO_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoRazonSocialCliente: string;
begin
  Result := 'RAZONSOCIAL_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoNombre: string;
begin
  Result := 'NOMBRE';
end;

function TdmPre.GetNombreCampoApellidos: string;
begin
  Result := 'APELLIDOS';
end;

function TdmPre.GetNombreCampoNIFCliente: string;
begin
  Result := 'NIF_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoMovilCliente: string;
begin
  Result := 'MOVIL_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoEmailCliente: string;
begin
  Result := 'EMAIL_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoDireccion1Cliente: string;
begin
  Result := 'DIRECCION1_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoDireccion2Cliente: string;
begin
  Result := 'DIRECCION2_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoPoblacionCliente: string;
begin
  Result := 'POBLACION_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoProvinciaCliente: string;
begin
  Result := 'PROVINCIA_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoCPostalCliente: string;
begin
  Result := 'CPOSTAL_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoPaisCliente: string;
begin
  Result := 'PAIS_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoTipoIdIntCliente: string;
begin
  Result := 'TIPOID_INT_CLIENTE_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoFechaDoc: string;
begin
  Result := 'FECHA_PRESUPUESTO';
end;

function TdmPre.GetNombreCampoFormaPago: string;
begin
  Result := 'FORMA_PAGO_PRESUPUESTO';
end;

{ Nombres de campos de líneas }

function TdmPre.GetNombreCampoSerieLinea: string;
begin
  Result := 'SERIE_PRESUPUESTO_LINEA';
end;

function TdmPre.GetNombreCampoNroLinea: string;
begin
  Result := 'NRO_PRESUPUESTO_LINEA';
end;

function TdmPre.GetNombreCampoLineaLinea: string;
begin
  Result := 'LINEA_LINEA';
end;

function TdmPre.GetNombreCampoCodigoArticuloLinea: string;
begin
  Result := 'CODIGO_ARTICULO_LINEA';
end;

function TdmPre.GetNombreCampoDescripcionArticuloLinea: string;
begin
  Result := 'DESCRIPCION_ARTICULO_LINEA';
end;

function TdmPre.GetNombreCampoPrecioVentaArticuloLinea: string;
begin
  Result := 'PRECIOVENTA_ARTICULO_LINEA';
end;

function TdmPre.GetNombreCampoCantidadLinea: string;
begin
  Result := 'CANTIDAD_LINEA';
end;

function TdmPre.GetNombreCampoTotalLinea: string;
begin
  Result := 'SUM_TOTAL_LINEA';
end;

function TdmPre.GetNombreCampoOdontologoLinea: string;
begin
  Result := 'ODONTOLOGO';
end;

function TdmPre.GetNombreTablaLineas: string;
begin
  Result := 'suboc_presupuestos_lineas';
end;

function TdmPre.GetTipoDocumento: string;
begin
  Result := 'PR';
end;

function TdmPre.GetNombreFuncionNextLinea: string;
begin
  Result := 'FNC_GET_NEXT_LINEA_PRESUPUESTO';
end;

{ Event handlers }

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
  unqryDibujos.MasterSource := (Self.Owner as TfrmMtoPre).dsTablaG;
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
  unqryFac.Close;
  unqryFormaPago.Close;
  unqryDibujos.Close;
  unqryPaisesCli.Close;
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
  RecalcularTotalesDocumento;
end;

procedure TdmPre.zqryFacAfterDelete(DataSet: TDataSet);
begin
  //frmOpenApp.FDmConn.conUni.Commit;
end;

procedure TdmPre.zqryFacAfterInsert(DataSet: TDataSet);
begin
  unqryFac.FieldByName('NRO_FACTURA').ASSTRING := '0';
  unqryFac.FieldByName('SERIE_FACTURA').AsString :=
    unqrySeries.FieldByName('SERIE_CONTADOR').AsString;
  unqryFac.FieldByName('CODIGO_CLIENTE_PRESUPUESTO').AsString := '0';
  unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_PRESUPUESTO').AsString :=
    'PACIENTE NUEVO';
  unqryFac.FieldByName('FECHA_PRESUPUESTO').AsDateTime := Trunc(Now);
  unqryFac.FieldByName('FORMA_PAGO_PRESUPUESTO').AsString := FormaPagoDefault;
end;

procedure TdmPre.zqryFacBeforeDelete(DataSet: TDataSet);
begin
  BorrarLineasDocumento;
end;

procedure TdmPre.zqryFacBeforePost(DataSet: TDataSet);
begin
  if ((unqryFac.State = dsEdit) or (unqryFac.State = dsInsert)) then
  begin
    if (unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_PRESUPUESTO').AsString =
                                                           'PACIENTE NUEVO') OR
       (unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_PRESUPUESTO').AsString =
                                                  'PACIENTE NO ENCONTRADO') then
      Abort
    else
    begin
      if unqryFac.FieldByName('NRO_FACTURA').AsString = '0' then
        NuevoNumeroDocumento;
      if unqryFac.FieldByName('CODIGO_CLIENTE_PRESUPUESTO').AsString = '0' then
        NuevoCliente;
    end;
  end;
end;

procedure TdmPre.zqryLinFacAfterDelete(DataSet: TDataSet);
begin
  RecalcularTotalesDocumento;
end;

end.
