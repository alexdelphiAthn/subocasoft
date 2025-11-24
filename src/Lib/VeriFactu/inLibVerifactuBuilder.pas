unit inLibVerifactuBuilder;

interface
uses
  System.SysUtils, System.Classes, System.JSON, Data.DB, Uni, inMtoPrincipal;
type
  // Enumeraciones para mayor tipo-seguridad
  TVatOperation = (voS1, voS2, voN1, voN2, voE1, voE2, voE3, voE4, voE5, voE6);
  TVatKey = (vk01, vk02, vk03, vk04, vk05, vk06, vk07, vk08, vk09, vk10,
             vk11, vk14, vk15, vk17, vk18, vk19, vk20);
  TInvoiceType = (itF1, itF2, itF3, itR1, itR2, itR3, itR4, itR5);
  TIdType = (id02, id03, id04, id05, id06, id07);
  // Record para configuración de IVA
  TVatConfig = record
    Operation: TVatOperation;
    Key: TVatKey;
    Rate: Double;
    ExemptReason: string; // Solo para operaciones exentas
    class function ForStandardVAT(ARate: Double): TVatConfig; static;
    class function ForExportVAT: TVatConfig; static;
    class function ForIntraEUVAT: TVatConfig; static;
    class function ForNotSubject: TVatConfig; static;
    class function ForExempt(AReason: TVatOperation): TVatConfig; static;
    class function ForExemptE1: TVatConfig; static;
  end;
  // Record para datos del cliente
  TRecipientData = record
    IrsId: string;
    IdType: TIdType;
    Name: string;
    Country: string;
    IsSpanish: Boolean;
    function ToJSON: TJSONObject;
  end;
  // Record para datos de subsanación
  TSubsanacionData = record
    NumeroFactura: string;
    FechaFactura: TDateTime;
    TipoFactura: TInvoiceType;
    NIFCliente: string;
    NombreCliente: string;
    PaisCliente: string;
    TipoIdInternacional: string;
    Descripcion: string;
    FechaOperacion: TDateTime;
    TotalFactura: Double;
    EsSubsanacion: Boolean;
    constructor Create(const ANumeroFactura: string;
                       AFechaFactura: TDateTime;
                       ATipoFactura: TInvoiceType;
                       const ANIFCliente, ANombreCliente,
                       APaisCliente,ATipoIdInternacional, ADescripcion: string;
                       AFechaOperacion: TDateTime;
                       ATotalFactura: Double;
                       AEsSubsanacion: Boolean);
  end;
  // Clase principal del builder
  TVerifactuJSONBuilder = class
  private
    FConnection: TUniConnection;
    // Métodos auxiliares
    function GetRecipientData(const ANroFactura,
                             ASerieFactura: string): TRecipientData;
    function CreateVatLinesArray(const AVatConfigs: array of TVatConfig;
                                ATotalLiquido: Double): TJSONArray;
    function DetermineInvoiceType(AEsSimpl: Boolean): TInvoiceType;
    function CalculateAmount(ABase, ARate: Double): Double;
    // Métodos específicos para subsanación
    function CreateSubsanacionRecipient(const AData: TSubsanacionData):
                                                                    TJSONObject;
    function CreateSubsanacionVatLines(ATotalFactura: Double): TJSONArray;
  public
    constructor Create(AConnection: TUniConnection);
    destructor Destroy; override;
    // Método principal mejorado
    function BuildJSON(const ANumeroFactura, ASerieFactura: string;
                      const AVatConfigs: array of TVatConfig): string;
    // Nuevo método para subsanación
    function BuildSubsanacionJSON(const AData: TSubsanacionData): string;
    // Métodos de conveniencia para casos comunes
    function BuildStandardJSON(const ANumeroFactura,
                              ASerieFactura: string): string;
    function BuildExportJSON(const ANumeroFactura,
                            ASerieFactura: string): string;
    function BuildIntraEUJSON(const ANumeroFactura,
                             ASerieFactura: string): string;
  end;
// Funciones auxiliares globales
function IdTypeToString(AIdType: TIdType): string;
function VatOperationToString(AVatOp: TVatOperation): string;
function VatKeyToString(AVatKey: TVatKey): string;
function InvoiceTypeToString(AType: TInvoiceType): string;
// Función de compatibilidad global
function BuildInvoiceJSON(NumeroFactura, SerieFactura: String): String;

implementation
{ Funciones auxiliares globales }

function IdTypeToString(AIdType: TIdType): string;
const
  ID_TYPES: array[TIdType] of string = (
    '02', '03', '04', '05', '06', '07'
  );
begin
  Result := ID_TYPES[AIdType];
end;

function VatOperationToString(AVatOp: TVatOperation): string;
const
  VAT_OPERATIONS: array[TVatOperation] of string = (
    'S1', 'S2', 'N1', 'N2', 'E1', 'E2', 'E3', 'E4', 'E5', 'E6'
  );
begin
  Result := VAT_OPERATIONS[AVatOp];
end;

function VatKeyToString(AVatKey: TVatKey): string;
const
  VAT_KEYS: array[TVatKey] of string = (
    '01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
    '11', '14', '15', '17', '18', '19', '20'
  );
begin
  Result := VAT_KEYS[AVatKey];
end;

function InvoiceTypeToString(AType: TInvoiceType): string;
const
  INVOICE_TYPES: array[TInvoiceType] of string = (
    'F1', 'F2', 'F3', 'R1', 'R2', 'R3', 'R4', 'R5'
  );
begin
  Result := INVOICE_TYPES[AType];
end;

{ TSubsanacionData }
constructor TSubsanacionData.Create(const ANumeroFactura: string;
  AFechaFactura: TDateTime; ATipoFactura: TInvoiceType;
  const ANIFCliente, ANombreCliente, APaisCliente, ATipoIdInternacional, ADescripcion: string;
  AFechaOperacion: TDateTime; ATotalFactura: Double; AEsSubsanacion: Boolean);
begin
  NumeroFactura := ANumeroFactura;
  FechaFactura := AFechaFactura;
  TipoFactura := ATipoFactura;
  NIFCliente := ANIFCliente;
  NombreCliente := ANombreCliente;
  PaisCliente := APaisCliente;
  TipoIdInternacional := ATipoIdInternacional;
  Descripcion := ADescripcion;
  FechaOperacion := AFechaOperacion;
  TotalFactura := ATotalFactura;
  EsSubsanacion := AEsSubsanacion;
end;

{ TVatConfig }
class function TVatConfig.ForStandardVAT(ARate: Double): TVatConfig;
begin
  Result.Operation := voS1;
  Result.Key := vk01;
  Result.Rate := ARate;
  Result.ExemptReason := '';
end;

class function TVatConfig.ForExportVAT: TVatConfig;
begin
  Result.Operation := voE2;
  Result.Key := vk02;
  Result.Rate := 0;
  Result.ExemptReason := '';
end;

class function TVatConfig.ForIntraEUVAT: TVatConfig;
begin
  Result.Operation := voE5;
  Result.Key := vk01;
  Result.Rate := 0;
  Result.ExemptReason := '';
end;

class function TVatConfig.ForNotSubject: TVatConfig;
begin
  Result.Operation := voN2;
  Result.Key := vk01;
  Result.Rate := 0;
  Result.ExemptReason := '';
end;

class function TVatConfig.ForExempt(AReason: TVatOperation): TVatConfig;
begin
  Result.Operation := AReason;
  Result.Key := vk01;
  Result.Rate := 0;
  Result.ExemptReason := '';
end;

class function TVatConfig.ForExemptE1: TVatConfig;
begin
  Result.Operation := voE1;
  Result.Key := vk01;
  Result.Rate := 0;
  Result.ExemptReason := '';
end;

{ TRecipientData }
function TRecipientData.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  if IsSpanish then
  begin
    // Para clientes españoles usar irsId
    Result.AddPair('irsId', IrsId);
  end
  else
  begin
    // Para clientes internacionales usar id + idType
    Result.AddPair('id', IrsId);
    Result.AddPair('idType', IdTypeToString(IdType));
  end;
  Result.AddPair('name', Name);
  Result.AddPair('country', Country);
end;

{ TVerifactuJSONBuilder }
constructor TVerifactuJSONBuilder.Create(AConnection: TUniConnection);
begin
  inherited Create;
  FConnection := AConnection;
end;

destructor TVerifactuJSONBuilder.Destroy;
begin
  inherited;
end;

function TVerifactuJSONBuilder.GetRecipientData(const ANroFactura,
  ASerieFactura: string): TRecipientData;
var
  Query: TUniQuery;
  sTipoId: string;
begin
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT NIF_CLIENTE_FACTURA, RAZONSOCIAL_CLIENTE_FACTURA, ' +
      '       PAIS_CLIENTE_FACTURA, TIPOID_INT_CLIENTE_FACTURA ' +
      'FROM suboc_facturas ' +
      'WHERE NRO_FACTURA = :NRO_FACTURA ' +
      '  AND SERIE_FACTURA = :SERIE_FACTURA';
    Query.ParamByName('NRO_FACTURA').AsString := ANroFactura;
    Query.ParamByName('SERIE_FACTURA').AsString := ASerieFactura;
    Query.Open;
    try
      if Query.IsEmpty then
      begin
        Result.IrsId := '';
        Result.Name := '';
        Result.Country := 'ES';
        Result.IsSpanish := True;
        Exit;
      end;
      Result.IrsId := Query.FieldByName('NIF_CLIENTE_FACTURA').AsString;
      Result.Name := Query.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString;
      Result.Country := Query.FieldByName('PAIS_CLIENTE_FACTURA').AsString;
      if Result.Country = '' then
        Result.Country := 'ES';
      Result.IsSpanish := SameText(Result.Country, 'ES');
      // Determinar tipo de ID para clientes internacionales
      if not Result.IsSpanish then
      begin
        sTipoId := UpperCase(Query.FieldByName('TIPOID_INT_CLIENTE_FACTURA')
                                  .AsString);
        if sTipoId = 'ID' then
          Result.IdType := id04
        else if Pos('PASAPORTE', sTipoId) > 0 then
          Result.IdType := id03
        else
          Result.IdType := id06;
      end;
    finally
      Query.Close;
    end;
  finally
    Query.Free;
  end;
end;

function TVerifactuJSONBuilder.CreateVatLinesArray(
         const AVatConfigs: array of TVatConfig; ATotalLiquido: Double):
                                                                     TJSONArray;
var
  i: Integer;
  VatLine: TJSONObject;
  BaseAmount: Double;
begin
  Result := TJSONArray.Create;
  // Si solo hay una configuración de IVA, usar todo el importe
  if Length(AVatConfigs) = 1 then
    BaseAmount := ATotalLiquido
  else
    // Si hay múltiples configuraciones, dividir equitativamente
    BaseAmount := ATotalLiquido / Length(AVatConfigs);
  for i := 0 to High(AVatConfigs) do
  begin
    VatLine := TJSONObject.Create;
    VatLine.AddPair('vatOperation',
                                VatOperationToString(AVatConfigs[i].Operation));
    VatLine.AddPair('base', TJSONNumber.Create(BaseAmount));
    VatLine.AddPair('rate', TJSONNumber.Create(AVatConfigs[i].Rate));
    VatLine.AddPair('amount', TJSONNumber.Create(CalculateAmount(BaseAmount,
                                                         AVatConfigs[i].Rate)));
    VatLine.AddPair('vatKey', VatKeyToString(AVatConfigs[i].Key));
    Result.AddElement(VatLine);
  end;
end;

function TVerifactuJSONBuilder.CreateSubsanacionRecipient(
                                    const AData: TSubsanacionData): TJSONObject;
var
  IdType: TIdType;
  sTipoId: string;
begin
  Result := TJSONObject.Create;

  // Determinar si es cliente español o extranjero
  if SameText(Trim(AData.PaisCliente), 'ES') or
     (Trim(AData.PaisCliente) = '') then
  begin
    // Cliente español - usar irsId
    Result.AddPair('irsId', Trim(AData.NIFCliente));
  end
  else
  begin
    // Cliente extranjero - usar id + idType
    Result.AddPair('id', Trim(AData.NIFCliente));

    // Determinar tipo de ID usando la misma lógica que GetRecipientData
    sTipoId := UpperCase(Trim(AData.TipoIdInternacional));
    if ((sTipoId = 'ID') or (sTipoId = '04')) then
      IdType := id04
    else if ((Pos('PASAPORTE', sTipoId) > 0) or (sTipoId = '03')) then
      IdType := id03
    else if sTipoId = '02' then
      IdType := id02
    else if sTipoId = '03' then
      IdType := id03
    else if sTipoId = '04' then
      IdType := id04
    else if sTipoId = '05' then
      IdType := id05
    else if sTipoId = '06' then
      IdType := id06
    else if sTipoId = '07' then
      IdType := id07
    else
      IdType := id06; // Por defecto: Documento oficial de identificación expedido por el país o territorio de residencia

    Result.AddPair('idType', IdTypeToString(IdType));
  end;

  Result.AddPair('name', Trim(AData.NombreCliente));
  Result.AddPair('country', Trim(AData.PaisCliente));
end;

function TVerifactuJSONBuilder.CreateSubsanacionVatLines(
  ATotalFactura: Double): TJSONArray;
var
  VatLineObj: TJSONObject;
begin
  Result := TJSONArray.Create;
  VatLineObj := TJSONObject.Create;
  VatLineObj.AddPair('vatOperation', 'E1');
  VatLineObj.AddPair('base', TJSONNumber.Create(ATotalFactura));
  VatLineObj.AddPair('rate', TJSONNumber.Create(0));
  VatLineObj.AddPair('amount', TJSONNumber.Create(0));
  VatLineObj.AddPair('vatKey', '01');
  Result.AddElement(VatLineObj);
end;

function TVerifactuJSONBuilder.BuildSubsanacionJSON(
  const AData: TSubsanacionData): string;
var
  JSONRoot, InvoiceObj, IdObj, DescObj, RecipientObj: TJSONObject;
  VatLinesArray: TJSONArray;
begin
  JSONRoot := TJSONObject.Create;
  try
    InvoiceObj := TJSONObject.Create;
    // Datos del destinatario (solo si no es simplificada)
    if AData.TipoFactura <> itF2 then
    begin
      RecipientObj := CreateSubsanacionRecipient(AData);
      InvoiceObj.AddPair('recipient', RecipientObj);
    end;
    // ID de la factura
    IdObj := TJSONObject.Create;
    IdObj.AddPair('number', Trim(AData.NumeroFactura));
    IdObj.AddPair('issuedTime', FormatDateTime('yyyy-mm-dd',
                                                           AData.FechaFactura));
    InvoiceObj.AddPair('id', IdObj);
    // Descripción
    DescObj := TJSONObject.Create;
    DescObj.AddPair('text', Trim(AData.Descripcion));
    DescObj.AddPair('operationDate', FormatDateTime('yyyy-mm-dd',
                                                         AData.FechaOperacion));
    InvoiceObj.AddPair('description', DescObj);
    if AData.EsSubsanacion then
      InvoiceObj.AddPair('isFix', TJSONTrue.Create);
    // Tipo de factura
    InvoiceObj.AddPair('type', InvoiceTypeToString(AData.TipoFactura));
    // Marcar como subsanación si está marcado

    // Si es factura simplificada
//    if AData.TipoFactura = itF2 then
//      InvoiceObj.AddPair('simple', TJSONTrue.Create);
    // Líneas de IVA
    VatLinesArray := CreateSubsanacionVatLines(AData.TotalFactura);
    InvoiceObj.AddPair('vatLines', VatLinesArray);
    // Totales
    InvoiceObj.AddPair('total', TJSONNumber.Create(AData.TotalFactura));
    InvoiceObj.AddPair('amount', TJSONNumber.Create(0));
    JSONRoot.AddPair('invoice', InvoiceObj);
    Result := JSONRoot.Format;
  finally
    JSONRoot.Free;
  end;
end;
function TVerifactuJSONBuilder.DetermineInvoiceType(
  AEsSimpl: Boolean): TInvoiceType;
begin
  if AEsSimpl then
    Result := itF2
  else
    Result := itF1;
end;
function TVerifactuJSONBuilder.CalculateAmount(ABase, ARate: Double): Double;
begin
  Result := ABase * (ARate / 100);
end;
function TVerifactuJSONBuilder.BuildJSON(const ANumeroFactura,
  ASerieFactura: string; const AVatConfigs: array of TVatConfig): string;
var
  JSONToSend, InvoiceObj, IdObj, DescriptionObj: TJSONObject;
  VatLinesArray: TJSONArray;
  RecipientData: TRecipientData;
  InvoiceQuery, LinesQuery: TUniQuery;
  bEsSimpl: Boolean;
  dTotalLiquido, dTotalAmount: Double;
  dtFechaFactura: TDateTime;
  sDescripcionLinea: string;
  i: Integer;
begin
  // Crear consulta local para datos básicos de la factura
  InvoiceQuery := TUniQuery.Create(nil);
  try
    InvoiceQuery.Connection := FConnection;
    InvoiceQuery.SQL.Text :=
      'SELECT ESSIMPL_FACTURA, FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA ' +
      'FROM suboc_facturas ' +
      'WHERE NRO_FACTURA = :NRO_FACTURA ' +
      '  AND SERIE_FACTURA = :SERIE_FACTURA';
    InvoiceQuery.ParamByName('NRO_FACTURA').AsString := ANumeroFactura;
    InvoiceQuery.ParamByName('SERIE_FACTURA').AsString := ASerieFactura;
    InvoiceQuery.Open;
    if InvoiceQuery.IsEmpty then
      raise Exception.Create('Factura no encontrada: ' +
                            ASerieFactura + '/' + ANumeroFactura);
    // Extraer datos básicos
    bEsSimpl := (InvoiceQuery.FieldByName('ESSIMPL_FACTURA').AsString = 'S');
    dTotalLiquido := InvoiceQuery.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat;
    dtFechaFactura := InvoiceQuery.FieldByName('FECHA_FACTURA').AsDateTime;
    InvoiceQuery.Close;
  finally
    InvoiceQuery.Free;
  end;
  // Crear consulta local para descripción de líneas
  LinesQuery := TUniQuery.Create(nil);
  try
    LinesQuery.Connection := FConnection;
    LinesQuery.SQL.Text :=
      'SELECT DESCRIPCION_ARTICULO_LINEA ' +
      'FROM suboc_facturas_lineas ' +
      'WHERE NRO_FACTURA_LINEA = :NRO_FACTURA ' +
      '  AND SERIE_FACTURA_LINEA = :SERIE_FACTURA ' +
      '  AND CAST(LINEA_LINEA AS INT) = (' +
      '    SELECT MIN(CAST(LINEA_LINEA AS INT)) ' +
      '    FROM suboc_facturas_lineas ' +
      '    WHERE NRO_FACTURA_LINEA = :NRO_FACTURA ' +
      '      AND SERIE_FACTURA_LINEA = :SERIE_FACTURA)';
    LinesQuery.ParamByName('NRO_FACTURA').AsString := ANumeroFactura;
    LinesQuery.ParamByName('SERIE_FACTURA').AsString := ASerieFactura;
    LinesQuery.Open;
    if not LinesQuery.IsEmpty then
      sDescripcionLinea := LinesQuery.FieldByName('DESCRIPCION_ARTICULO_LINEA')
                                    .AsString
    else
      sDescripcionLinea := 'Descripción general de la factura';
    LinesQuery.Close;
  finally
    LinesQuery.Free;
  end;
  // Obtener datos del cliente solo para facturas no simplificadas
  if not bEsSimpl then
    RecipientData := GetRecipientData(ANumeroFactura, ASerieFactura);
  // Construir JSON con los datos obtenidos
  JSONToSend := TJSONObject.Create;
  try
    InvoiceObj := TJSONObject.Create;
    // RECIPIENT (solo para facturas no simplificadas)
    if not bEsSimpl then
      InvoiceObj.AddPair('recipient', RecipientData.ToJSON);
    // ID
    IdObj := TJSONObject.Create;
    IdObj.AddPair('number', ASerieFactura + '/' + ANumeroFactura);
    IdObj.AddPair('issuedTime',
                 FormatDateTime('yyyy-mm-dd', dtFechaFactura));
    InvoiceObj.AddPair('id', IdObj);
    // DESCRIPTION
    DescriptionObj := TJSONObject.Create;
    DescriptionObj.AddPair('text', sDescripcionLinea);
    DescriptionObj.AddPair('operationDate',
                          FormatDateTime('yyyy-mm-dd', dtFechaFactura));
    InvoiceObj.AddPair('description', DescriptionObj);
    // TYPE
    InvoiceObj.AddPair('type',
                      InvoiceTypeToString(DetermineInvoiceType(bEsSimpl)));
    // VAT LINES
    VatLinesArray := CreateVatLinesArray(AVatConfigs, dTotalLiquido);
    InvoiceObj.AddPair('vatLines', VatLinesArray);
    // TOTAL y AMOUNT
    dTotalAmount := 0;
    for i := 0 to High(AVatConfigs) do
      dTotalAmount := dTotalAmount +
                     CalculateAmount(dTotalLiquido / Length(AVatConfigs),
                                   AVatConfigs[i].Rate);
    InvoiceObj.AddPair('total',
                      TJSONNumber.Create(dTotalLiquido + dTotalAmount));
    InvoiceObj.AddPair('amount', TJSONNumber.Create(dTotalAmount));
    JSONToSend.AddPair('invoice', InvoiceObj);
    Result := JSONToSend.Format;
  finally
    JSONToSend.Free;
  end;
end;
// Métodos de conveniencia
function TVerifactuJSONBuilder.BuildStandardJSON(const ANumeroFactura,
  ASerieFactura: string): string;
var
  VatConfigs: array of TVatConfig;
begin
  SetLength(VatConfigs, 1);
  VatConfigs[0] := TVatConfig.ForStandardVAT(21); // IVA estándar 21%
  Result := BuildJSON(ANumeroFactura, ASerieFactura, VatConfigs);
end;
function TVerifactuJSONBuilder.BuildExportJSON(const ANumeroFactura,
  ASerieFactura: string): string;
var
  VatConfigs: array of TVatConfig;
begin
  SetLength(VatConfigs, 1);
  VatConfigs[0] := TVatConfig.ForExportVAT;
  Result := BuildJSON(ANumeroFactura, ASerieFactura, VatConfigs);
end;
function TVerifactuJSONBuilder.BuildIntraEUJSON(const ANumeroFactura,
  ASerieFactura: string): string;
var
  VatConfigs: array of TVatConfig;
begin
  SetLength(VatConfigs, 1);
  VatConfigs[0] := TVatConfig.ForIntraEUVAT;
  Result := BuildJSON(ANumeroFactura, ASerieFactura, VatConfigs);
end;
// Función de compatibilidad global
function BuildInvoiceJSON(NumeroFactura, SerieFactura: String): String;
var
  Builder: TVerifactuJSONBuilder;
  VatConfigs: array of TVatConfig;
begin
  Builder := TVerifactuJSONBuilder.Create(frmOpenApp.FDmConn.conUni);
  try
    // Replicar comportamiento original: IVA 0%, operación E1, clave 01
    SetLength(VatConfigs, 1);
    VatConfigs[0] := TVatConfig.ForExemptE1;
    Result := Builder.BuildJSON(NumeroFactura, SerieFactura, VatConfigs);
  finally
    Builder.Free;
  end;
end;
end.
