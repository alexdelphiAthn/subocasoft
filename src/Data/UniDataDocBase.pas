unit UniDataDocBase;

interface

uses
  SysUtils, Classes, DB, inMtoPrincipal, System.Variants,
  MemDS, DBAccess, Uni, Dialogs;

type
  TdmDocBase = class(TDataModule)
  private
    function GetConnection: TUniConnection;
  protected
    // Métodos abstractos que deben implementar las clases hijas
    // para proporcionar acceso a sus datasets y campos específicos
    function GetDatasetDocumento: TDataSet; virtual; abstract;
    function GetDatasetLineas: TDataSet; virtual; abstract;
    function GetDatasetClientes: TUniQuery; virtual; abstract;
    function GetDatasetArticulos: TUniQuery; virtual; abstract;
    function GetDatasetOdontologos: TUniQuery; virtual; abstract;
    function GetDatasetPaises: TUniQuery; virtual; abstract;
    function GetStoredProcCrearCliente: TUniStoredProc; virtual; abstract;
    function GetStoredProcGetContador: TUniStoredProc; virtual; abstract;
    function GetStoredProcGetContadorDoc: TUniStoredProc; virtual; abstract;
    function GetStoredProcCalcularDoc: TUniStoredProc; virtual; abstract;

    // Nombres de campos que varían entre presupuestos y facturas
    function GetNombreCampoNroDoc: string; virtual; abstract;
    function GetNombreCampoSerieDoc: string; virtual; abstract;
    function GetNombreCampoCodigoCliente: string; virtual; abstract;
    function GetNombreCampoRazonSocialCliente: string; virtual; abstract;
    function GetNombreCampoNombre: string; virtual; abstract;
    function GetNombreCampoApellidos: string; virtual; abstract;
    function GetNombreCampoNIFCliente: string; virtual; abstract;
    function GetNombreCampoMovilCliente: string; virtual; abstract;
    function GetNombreCampoEmailCliente: string; virtual; abstract;
    function GetNombreCampoDireccion1Cliente: string; virtual; abstract;
    function GetNombreCampoDireccion2Cliente: string; virtual; abstract;
    function GetNombreCampoPoblacionCliente: string; virtual; abstract;
    function GetNombreCampoProvinciaCliente: string; virtual; abstract;
    function GetNombreCampoCPostalCliente: string; virtual; abstract;
    function GetNombreCampoPaisCliente: string; virtual; abstract;
    function GetNombreCampoTipoIdIntCliente: string; virtual; abstract;
    function GetNombreCampoFechaDoc: string; virtual; abstract;
    function GetNombreCampoFormaPago: string; virtual; abstract;

    // Nombres de campos de líneas
    function GetNombreCampoSerieLinea: string; virtual; abstract;
    function GetNombreCampoNroLinea: string; virtual; abstract;
    function GetNombreCampoLineaLinea: string; virtual; abstract;
    function GetNombreCampoCodigoArticuloLinea: string; virtual; abstract;
    function GetNombreCampoDescripcionArticuloLinea: string; virtual; abstract;
    function GetNombreCampoPrecioVentaArticuloLinea: string; virtual; abstract;
    function GetNombreCampoCantidadLinea: string; virtual; abstract;
    function GetNombreCampoTotalLinea: string; virtual; abstract;
    function GetNombreCampoOdontologoLinea: string; virtual; abstract;

    // Nombre de la tabla de líneas para borrado
    function GetNombreTablaLineas: string; virtual; abstract;

    // Tipo de documento para el contador ('PR' o 'FC')
    function GetTipoDocumento: string; virtual; abstract;

    // Nombre de la función SQL para obtener siguiente línea
    function GetNombreFuncionNextLinea: string; virtual; abstract;

  public
    // Métodos comunes implementados que usan los métodos abstractos
    procedure CopiarClienteaDocumento;
    procedure CrearCliente;
    procedure NuevoCliente;
    procedure CopiarPaisaCliente;
    procedure CalcularLinea;
    procedure CopiarArticuloaLinea;
    procedure CopiarOdontologoaLinea;
    procedure NuevoNumeroDocumento;
    function FormaPagoDefault: String;
    procedure BorrarLineasDocumento;
    procedure RecalcularTotalesDocumento;

    // Propiedades de ayuda
    property Connection: TUniConnection read GetConnection;
  end;

implementation

{ TdmDocBase }

function TdmDocBase.GetConnection: TUniConnection;
begin
  Result := frmOpenApp.FdmConn.conUni;
end;

procedure TdmDocBase.CopiarClienteaDocumento;
var
  dsDoc: TDataSet;
  qryCli: TUniQuery;
begin
  dsDoc := GetDatasetDocumento;
  qryCli := GetDatasetClientes;

  if ((dsDoc.State <> dsEdit) and (dsDoc.State <> dsInsert)) then
    dsDoc.Edit;

  dsDoc.FieldByName(GetNombreCampoCodigoCliente).AsString :=
    qryCli.FindField('CODIGO_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoRazonSocialCliente).AsString :=
    qryCli.FindField('RAZONSOCIAL_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoNombre).AsString :=
    qryCli.FindField('NOMBRE').AsString;
  dsDoc.FieldByName(GetNombreCampoApellidos).AsString :=
    qryCli.FindField('APELLIDOS').AsString;
  dsDoc.FieldByName(GetNombreCampoNIFCliente).AsString :=
    qryCli.FindField('NIF_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoMovilCliente).AsString :=
    qryCli.FindField('MOVIL_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoEmailCliente).AsString :=
    qryCli.FindField('EMAIL_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoDireccion1Cliente).AsString :=
    qryCli.FindField('DIRECCION1_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoDireccion2Cliente).AsString :=
    qryCli.FindField('DIRECCION2_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoPoblacionCliente).AsString :=
    qryCli.FindField('POBLACION_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoProvinciaCliente).AsString :=
    qryCli.FindField('PROVINCIA_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoCPostalCliente).AsString :=
    qryCli.FindField('CPOSTAL_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoPaisCliente).AsString :=
    qryCli.FindField('PAIS_CLIENTE').AsString;
  dsDoc.FieldByName(GetNombreCampoTipoIdIntCliente).AsString :=
    qryCli.FindField('TIPOID_INT_CLIENTE').AsString;
end;

procedure TdmDocBase.CrearCliente;
var
  dsDoc: TDataSet;
  stpCrearCli: TUniStoredProc;
begin
  dsDoc := GetDatasetDocumento;
  stpCrearCli := GetStoredProcCrearCliente;

  with stpCrearCli do
  begin
    ParamByName('pNOMBRE').AsString :=
      dsDoc.FieldByName(GetNombreCampoNombre).AsString;
    ParamByName('pAPELLIDOS').AsString :=
      dsDoc.FieldByName(GetNombreCampoApellidos).AsString;
    ParamByName('pCODIGO_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoCodigoCliente).AsString;
    ParamByName('pRAZONSOCIAL_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoRazonSocialCliente).AsString;
    ParamByName('pNIF_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoNIFCliente).AsString;
    ParamByName('pMOVIL_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoMovilCliente).AsString;
    ParamByName('pEMAIL_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoEmailCliente).AsString;
    ParamByName('pDIRECCION1_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoDireccion1Cliente).AsString;
    ParamByName('pDIRECCION2_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoDireccion2Cliente).AsString;
    ParamByName('pPOBLACION_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoPoblacionCliente).AsString;
    ParamByName('pPROVINCIA_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoProvinciaCliente).AsString;
    ParamByName('pCPOSTAL_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoCPostalCliente).AsString;
    ParamByName('pPAIS_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoPaisCliente).AsString;
    ParamByName('pTIPOID_INT_CLIENTE').AsString :=
      dsDoc.FieldByName(GetNombreCampoTipoIdIntCliente).AsString;
  end;
  stpCrearCli.ExecProc;
end;

procedure TdmDocBase.NuevoCliente;
var
  dsDoc: TDataSet;
  stpContador: TUniStoredProc;
begin
  dsDoc := GetDatasetDocumento;

  if dsDoc.FieldByName(GetNombreCampoCodigoCliente).AsString = '0' then
  begin
    stpContador := GetStoredProcGetContador;
    with stpContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      ParamByName('ptipodoc').AsString := 'CL';
      ExecProc;
      dsDoc.FieldByName(GetNombreCampoCodigoCliente).AsString :=
        ParamByName('pcont').AsString;
    end;
  end;
end;

procedure TdmDocBase.CopiarPaisaCliente;
var
  dsDoc: TDataSet;
  qryPaises: TUniQuery;
begin
  dsDoc := GetDatasetDocumento;
  qryPaises := GetDatasetPaises;

  if ((dsDoc.State <> dsEdit) and (dsDoc.State <> dsInsert)) then
    dsDoc.Edit;

  dsDoc.FieldByName(GetNombreCampoPaisCliente).AsString :=
    qryPaises.FindField('COD_PAIS_ALPHA2').AsString;
end;

procedure TdmDocBase.CalcularLinea;
var
  dsLineas: TDataSet;
  dsDoc: TDataSet;
  sNumDoc, sSerie: String;
  qryGetLinea: TUniQuery;
begin
  dsLineas := GetDatasetLineas;
  dsDoc := GetDatasetDocumento;

  if ((dsLineas.State = dsInsert) or (dsLineas.State = dsEdit)) then
  begin
    sNumDoc := dsDoc.FindField(GetNombreCampoNroDoc).AsString;
    sSerie := dsDoc.FindField(GetNombreCampoSerieDoc).AsString;

    // Obtener siguiente número de línea si está vacío
    if (dsLineas.FindField(GetNombreCampoLineaLinea).AsString = '') then
    begin
      qryGetLinea := TUniQuery.Create(nil);
      try
        qryGetLinea.Connection := Connection;
        qryGetLinea.SQL.Text := 'SELECT ' + GetNombreFuncionNextLinea +
                                '(' + QuotedStr(sNumDoc) + ',' +
                                QuotedStr(sSerie) + ')';
        qryGetLinea.Open;
        dsLineas.FindField(GetNombreCampoLineaLinea).AsString :=
          qryGetLinea.Fields[0].AsString;
        qryGetLinea.Close;
      finally
        FreeAndNil(qryGetLinea);
      end;
    end;

    // Establecer cantidad por defecto
    if dsLineas.FindField(GetNombreCampoCantidadLinea).AsCurrency = 0 then
      dsLineas.FindField(GetNombreCampoCantidadLinea).AsCurrency := 1;

    // Calcular total de línea
    dsLineas.FindField(GetNombreCampoTotalLinea).AsCurrency :=
      dsLineas.FindField(GetNombreCampoCantidadLinea).AsCurrency *
      dsLineas.FindField(GetNombreCampoPrecioVentaArticuloLinea).AsCurrency;
  end;
end;

procedure TdmDocBase.CopiarArticuloaLinea;
var
  dsLineas: TDataSet;
  qryArt: TUniQuery;
begin
  dsLineas := GetDatasetLineas;
  qryArt := GetDatasetArticulos;

  with dsLineas do
  begin
    Edit;
    FindField(GetNombreCampoCodigoArticuloLinea).AsString :=
      qryArt.FindField('CODIGO_ARTICULO').AsString;
    FindField(GetNombreCampoDescripcionArticuloLinea).AsString :=
      qryArt.FindField('DESCRIPCION_ARTICULO').AsString;
    FindField(GetNombreCampoPrecioVentaArticuloLinea).AsString :=
      qryArt.FindField('PRECIOVENTA_ARTICULO').AsString;
    Post;
  end;
end;

procedure TdmDocBase.CopiarOdontologoaLinea;
var
  dsLineas: TDataSet;
  qryDoc: TUniQuery;
begin
  dsLineas := GetDatasetLineas;
  qryDoc := GetDatasetOdontologos;

  if ((dsLineas.State <> dsEdit) and (dsLineas.State <> dsInsert)) then
    dsLineas.Edit;

  dsLineas.FindField(GetNombreCampoOdontologoLinea).AsString :=
    qryDoc.FindField('ODONTOLOGO').AsString;
end;

procedure TdmDocBase.NuevoNumeroDocumento;
var
  dsDoc: TDataSet;
  stpContadorDoc: TUniStoredProc;
begin
  dsDoc := GetDatasetDocumento;

  if dsDoc.FindField(GetNombreCampoNroDoc).AsString = '0' then
  begin
    stpContadorDoc := GetStoredProcGetContadorDoc;
    with stpContadorDoc do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'pserie', ptInput);
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftString, 'pcont', ptOutput);
      ParamByName('pserie').AsString :=
        dsDoc.FindField(GetNombreCampoSerieDoc).AsString;
      ParamByName('ptipodoc').AsString := GetTipoDocumento;
      ExecProc;

      if not ((dsDoc.State = dsInsert) or (dsDoc.State = dsEdit)) then
        dsDoc.Edit;

      dsDoc.FindField(GetNombreCampoNroDoc).AsString :=
        ParamByName('pcont').AsString;
    end;
  end;
end;

function TdmDocBase.FormaPagoDefault: String;
var
  qryFormaPago: TUniQuery;
  sFormaPago: string;
begin
  qryFormaPago := TUniQuery.Create(nil);
  try
    with qryFormaPago do
    begin
      Connection := Self.Connection;
      SQL.Text := 'SELECT DESCRIPCION_FORMAPAGO ' +
                  '  FROM suboc_formapago ' +
                  ' WHERE DEFAULT_FACTURA = ' + QuotedStr('S');
      Open;
      sFormaPago := Fields[0].AsString;
      Close;
    end;
  finally
    FreeAndNil(qryFormaPago);
  end;
  Result := sFormaPago;
end;

procedure TdmDocBase.BorrarLineasDocumento;
var
  dsDoc: TDataSet;
  qryBorrar: TUniQuery;
begin
  dsDoc := GetDatasetDocumento;
  qryBorrar := TUniQuery.Create(nil);
  try
    with qryBorrar do
    begin
      Connection := Self.Connection;
      SQL.Text := 'DELETE FROM ' + GetNombreTablaLineas +
                  ' WHERE ' + GetNombreCampoSerieLinea + ' = :serie ' +
                  '   AND ' + GetNombreCampoNroLinea + ' = :nrodoc';
      Params.Clear;
      Params.CreateParam(ftString, 'serie', ptInput);
      Params.CreateParam(ftString, 'nrodoc', ptInput);
      Params.ParamByName('serie').AsString :=
        dsDoc.FieldByName(GetNombreCampoSerieDoc).AsString;
      Params.ParamByName('nrodoc').AsString :=
        dsDoc.FieldByName(GetNombreCampoNroDoc).AsString;
      ExecSQL;
    end;
  finally
    FreeAndNil(qryBorrar);
  end;
end;

procedure TdmDocBase.RecalcularTotalesDocumento;
var
  dsDoc: TDataSet;
  stpCalcular: TUniStoredProc;
begin
  dsDoc := GetDatasetDocumento;
  stpCalcular := GetStoredProcCalcularDoc;

  stpCalcular.ParamByName('pidseriefactura').AsString :=
    dsDoc.FieldByName(GetNombreCampoSerieDoc).AsString;
  stpCalcular.ParamByName('pidnumfactura').AsString :=
    dsDoc.FieldByName(GetNombreCampoNroDoc).AsString;
  stpCalcular.ExecProc;
  dsDoc.Refresh;
end;

end.
