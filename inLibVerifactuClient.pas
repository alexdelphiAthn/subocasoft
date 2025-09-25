unit inLibVerifactuClient;

interface
uses
  System.Classes, System.SysUtils, System.JSON, System.NetEncoding,
  System.Variants, Vcl.Imaging.pngimage, System.Net.Mime,
  IdHTTP, IdSSLOpenSSL, Uni, UniProvider, MySQLUniProvider,
  DB, System.Net.URLClient,    System.Net.HttpClient,
  inLibVarGlob, inLibData, REST.Types, REST.Client, System.StrUtils,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Authenticator.Basic;

type
  // Record para configuración del servicio
  TVerifactuConfig = record
    URL: string;
    URLState:string;
    URLCancel:string;
    Username: string;
    Password: string;
    Timeout: Integer;
    MaxRetries: Integer;
    RetryDelay: Integer;
  end;

  // Record para resultado de la llamada
  TVerifactuResult = record
    Success: Boolean;
    ErrorMessage: string;
    ResponseContent: string;
    HTTPStatusCode: Integer;
  end;

  // Record para datos completos de respuesta de Verifactu
  TVerifactuResponse = record
    RequestId: string;
    QueueId: Integer;
    QRCodeBase64: string;
    ChainNumber: string;
    ChainHash: string;
    IssuerIrsId: string;
    IssuedTime: TDateTime;
    VerifactuURL: string;
    VerifactuXML: string;
    JSONCompleto: string;
    Success: Boolean;
    ErrorCode:integer;
    ErrorMessage: string;
  end;

   TCancelationResponse = record
    Success: Boolean;
    ErrorCode: Integer;
    ErrorMessage: string;
    RequestId: string;
    QueueId: Integer;
    ChainInfo: record
      IssuerIrsId: string;
      IssuedTime: TDateTime;
      Number: string;
      Hash: string;
    end;
    JSONCompleto: string;
  end;

  TVerifactuClient = class(TObject)
  private
    //FHelper: TVerifactuHelper;
    FConnection: TUniConnection;
    FConfig: TVerifactuConfig;
    // Componentes REST
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    //FAuthenticator: THTTPBasicAuthenticator;
    procedure ConfigurarCliente;
    function IsoToDate(const DateTimeStr: string): TDateTime;
    function EnviarPeticionREST(const JSONBody: string): TVerifactuResult;
    function ValidarConfiguracion: Boolean;
    procedure LogError(const Mensaje: string; DatosAdicionales:string = '';
                                       sSerie:string=''; iNumFactura:Integer=0);
    procedure LogOperacion(const Operacion:String;
                           NumFactura:Integer = 0;
                           SerieFactura: string = '';
                           DatosAdicionales:String = '');
  public
    function ParsearRespuestaVerifactu(const JSONResponse: string):
                                                             TVerifactuResponse;
    constructor Create(AConnection: TUniConnection);
    destructor Destroy; override;
    // Configuración
    function CargarConfiguracion: Boolean;
    property Config: TVerifactuConfig read FConfig write FConfig;
    // Métodos principales
    function LlamarWebService(const JSONBody: string): TVerifactuResult;
    function ProcesarRespuestaWebService(const JSONRespuesta: string;
                                        const SerieFactura: string;
                                        NumeroFactura: Integer;
                                        PeticionJSON:String = ''): Boolean;
    // Métodos específicos de la API
    function CrearFacturaVerifactu(const Serie: string; const Numero: Integer;
                                const JSONPeticion: string): TVerifactuResponse;
    function ConsultarEstadoFactura(const QueueId: Integer;
                                    const Serie:string;
                                    const Numero:Integer): string;
    // Persistencia en BD
    function GuardarConsolidacion(const Serie: string; const Numero: Integer;
                                  const Response: TVerifactuResponse;
                                  const PeticionJSON: string): Boolean;
    function ActualizarEstadoFactura(const Serie: string; const Numero: Integer;
                                     const Estado: string): Boolean;
    // Utilidades
    function ValidarFactura(const Serie: string;
                            const Numero: Integer): Boolean;
    function ExisteConsolidacion(const Serie: string;
                                 const Numero: Integer): Boolean;
    function EnviarPeticionGET(const URL: string): TVerifactuResult;
    function CancelarFacturaPorQueueId(const AQueueId: Integer): string;
    function ProcesarRespuestaCancelacion(
                             const sJSONResponse: string): TCancelationResponse;
    procedure ProcesarErrorCancelacion(
                                     const CancelResponse: TCancelationResponse;
                                             const sSerie: string;
                                             const iNumero: Integer);
  end;
// Funciones globales para compatibilidad
function LlamarWebServiceVerifactu(IDConsolidacion: Integer): Boolean;
function CrearYProcesarConsolidacion(const SerieFactura: string;
                                    NumeroFactura: Integer;
                                    const JSONPeticion: string): Boolean;
implementation
uses
  inMtoPrincipal;
{ TVerifactuClient }

constructor TVerifactuClient.Create(AConnection: TUniConnection);
begin
  inherited Create;
  FConnection := AConnection;
  // Inicializar componentes REST
  FRESTClient := TRESTClient.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  CargarConfiguracion;
end;

destructor TVerifactuClient.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  inherited;
end;

procedure TVerifactuClient.ProcesarErrorCancelacion(
                                     const CancelResponse: TCancelationResponse;
                                                    const sSerie: string;
                                                    const iNumero: Integer);
var
  sMensajeError: string;
  sMensajeLog: string;
begin
  case CancelResponse.ErrorCode of
    3013: // The invoice already has a cancellation
      begin
        sMensajeError := 'La factura ya ha sido cancelada previamente';
        sMensajeLog := 'Intento de cancelar factura ya cancelada';
        // Actualizar estado local si no estaba actualizado
        //prcActualizarEstadoConsolidacion(sSerie, iNumero, 'CANCELADA', False);
      end;
    3014: // Origin invoice has refund invoices not cancelled
      begin
        sMensajeError := 'La factura tiene facturas ' +
                        'rectificativas asociadas que deben cancelarse primero';
        sMensajeLog := 'Factura con rectificativas pendientes de cancelar';
      end;
    3019: // Invoice not found in queue
      begin
        sMensajeError := 'No se encontró la factura en la cola de Verifactu';
        sMensajeLog := 'Factura no encontrada en cola para cancelación';
      end;
    2000..2999: // Errores de licencia/configuración
      begin
        sMensajeError := 'Error de configuración: ' +
                                                    CancelResponse.ErrorMessage;
        sMensajeLog := 'Error de configuración en cancelación';
      end;
    else
      begin
        sMensajeError := Format('Error desconocido (%d): %s',
                               [CancelResponse.ErrorCode,
                               CancelResponse.ErrorMessage]);
        sMensajeLog := 'Error no catalogado en cancelación';
      end;
  end;
  // Mostrar mensaje al usuario
  //ShowMessage(sMensajeError);
  // Registrar en log
  frmOpenApp.VeriFactuLog.RegistrarError(
    Format('%s. Código: %d, RequestId: %s',
           [sMensajeLog, CancelResponse.ErrorCode, CancelResponse.RequestId]),
    CancelResponse.JSONCompleto, sSerie, iNumero);
end;

function TVerifactuClient.CargarConfiguracion: Boolean;
var
  qryParams: TUniQuery;
begin
  Result := False;
  qryParams := TUniQuery.Create(nil);
  try
    qryParams.Connection := FConnection;
    qryParams.SQL.Text :=
      'SELECT NOMBRE_PARAM, VALUE_PARAM ' +
      'FROM suboc_param ' +
      'WHERE NOMBRE_PARAM IN (' +
      QuotedStr('URL_VERIFACTU_INVOICE') + ', ' +
      QuotedStr('PASSKEY_VERIFACTU') + ', ' +
      QuotedStr('AUTHKEY_VERIFACTU') + ', ' +
      QuotedStr('VERIFACTU_TIMEOUT') + ', ' +
      QuotedStr('VERIFACTU_MAX_RETRIES') + ', ' +
      QuotedStr('URL_VERIFACTU_CANCEL') + ', ' +
      QuotedStr('URL_VERIFACTU_STATE') + ', ' +
      QuotedStr('VERIFACTU_RETRY_DELAY') + ')';
    qryParams.Open;
    // Inicializar configuración con valores por defecto
    FillChar(FConfig, SizeOf(FConfig), 0);
    FConfig.Timeout := 30000;      // 30 segundos
    FConfig.MaxRetries := 3;       // 3 reintentos
    FConfig.RetryDelay := 2000;    // 2 segundos entre reintentos
    // Leer parámetros
    while not qryParams.Eof do
    begin
      if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                     'URL_VERIFACTU_CANCEL' then
        FConfig.URLCancel := qryParams.FieldByName('VALUE_PARAM').AsString
      else
        if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                   'URL_VERIFACTU_STATE' then
        FConfig.URLState := qryParams.FieldByName('VALUE_PARAM').AsString
      else
      if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                    'URL_VERIFACTU_INVOICE' then
        FConfig.URL := qryParams.FieldByName('VALUE_PARAM').AsString
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                        'PASSKEY_VERIFACTU' then
        FConfig.Password := qryParams.FieldByName('VALUE_PARAM').AsString
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                        'AUTHKEY_VERIFACTU' then
        FConfig.Username := qryParams.FieldByName('VALUE_PARAM').AsString
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                        'VERIFACTU_TIMEOUT' then
        FConfig.Timeout := StrToIntDef(
                           qryParams.FieldByName('VALUE_PARAM').AsString, 30000)
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                    'VERIFACTU_MAX_RETRIES' then
        FConfig.MaxRetries :=
                   StrToIntDef(qryParams.FieldByName('VALUE_PARAM').AsString, 3)
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                    'VERIFACTU_RETRY_DELAY' then
        FConfig.RetryDelay := StrToIntDef(
                           qryParams.FieldByName('VALUE_PARAM').AsString, 2000);
      qryParams.Next;
    end;
    Result := ValidarConfiguracion;
    if Result then
    begin
      ConfigurarCliente;
      //ConfigurarHTTP;
    end;
  finally
    qryParams.Close;
    FreeAndNil(qryParams);
  end;
end;

function TVerifactuClient.ProcesarRespuestaCancelacion(
                             const sJSONResponse: string): TCancelationResponse;
var
  JsonResponse: TJSONValue;
  JsonChain: TJSONValue;
  sIssuedTime: string;
  sTipoState:string;
begin
  // Inicializar resultado
  FillChar(Result, SizeOf(Result), 0);
  Result.JSONCompleto := sJSONResponse;
  Result.Success := False;
  try
    JsonResponse := TJSONObject.ParseJSONValue(sJSONResponse);
    try
      if Assigned(JsonResponse) then
      begin
        // Verificar si es una respuesta de error
        if (JsonResponse.TryGetValue<Integer>('code', Result.ErrorCode)) then
        begin
          if (JsonResponse.TryGetValue<string>('error', sTipoState)) then
          if sTipoState = 'error' then
          begin
            // Es un error
            Result.Success := False;
            JsonResponse.TryGetValue<string>('message', Result.ErrorMessage);
            JsonResponse.TryGetValue<string>('requestId', Result.RequestId);
          end;
        end
        else
        begin
          // Es una respuesta exitosa
          Result.Success := True;
          JsonResponse.TryGetValue<string>('requestId', Result.RequestId);
          JsonResponse.TryGetValue<Integer>('queueId', Result.QueueId);
          // Procesar chainInfo
          JsonChain := JsonResponse.FindValue('chainInfo');
          if Assigned(JsonChain) then
          begin
            JsonChain.TryGetValue<string>('issuerIrsId',
                                                  Result.ChainInfo.IssuerIrsId);
            JsonChain.TryGetValue<string>('number', Result.ChainInfo.Number);
            JsonChain.TryGetValue<string>('hash', Result.ChainInfo.Hash);
            if JsonChain.TryGetValue<string>('issuedTime', sIssuedTime) then
            begin
              try
                Result.ChainInfo.IssuedTime := ISOToDate(sIssuedTime);
              except
                Result.ChainInfo.IssuedTime := Now;
              end;
            end;
          end;
        end;
      end;
    finally
      JsonResponse.Free;
    end;
  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.ErrorMessage := 'Error procesando respuesta JSON: ' + E.Message;
    end;
  end;
end;

function TVerifactuClient.ValidarConfiguracion: Boolean;
begin
  Result := (FConfig.URL <> '') and
            (FConfig.Username <> '') and
            (FConfig.Password <> '');
  if not Result then
    LogError('Configuración de Verifactu incompleta');
end;

procedure TVerifactuClient.ConfigurarCliente;
begin
  FRESTClient.BaseURL := FConfig.URL;
  FRESTRequest.Method := rmPOST;
  FRESTRequest.Timeout := FConfig.Timeout;
end;

function TVerifactuClient.LlamarWebService(const JSONBody: string):
                                                               TVerifactuResult;
begin
  Result.Success := False;
  Result.ErrorMessage := '';
  Result.ResponseContent := '';
  Result.HTTPStatusCode := 0;
  try
    // Intentar con REST Client
    Result := EnviarPeticionREST(JSONBody);
  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.ErrorMessage := 'Error en llamada al webservice: ' + E.Message;
      LogError(Result.ErrorMessage, JSONBody);
    end;
  end;
end;

function TVerifactuClient.EnviarPeticionGET(const URL: string):
                                                               TVerifactuResult;
var
  OriginalMethod: TRESTRequestMethod;
  OriginalBaseURL: string;
  Reintentos: Integer;
begin
  Result.Success := False;
  Result.ErrorMessage := '';
  Result.ResponseContent := '';
  Result.HTTPStatusCode := 0;

  // Guardar configuración original
  OriginalMethod := FRESTRequest.Method;
  OriginalBaseURL := FRESTClient.BaseURL;

  Reintentos := 0;

  while (not Result.Success) and (Reintentos <= FConfig.MaxRetries) do
  begin
    try
      // Configurar para GET
      FRESTRequest.Method := rmGET;
      FRESTClient.BaseURL := URL;
      FRESTRequest.Resource := '';
      FRESTRequest.ClearBody;
      // Ejecutar petición
      FRESTRequest.Execute;
      Result.ResponseContent := FRESTResponse.Content;
      Result.HTTPStatusCode := FRESTResponse.StatusCode;
      Result.Success := (FRESTResponse.StatusCode = 200);
      if not Result.Success then
      begin
        Result.ErrorMessage := Format('Error HTTP %d: %s',
          [FRESTResponse.StatusCode, FRESTResponse.StatusText]);
        LogError(Result.ErrorMessage);
      end;
      Break; // Salir del bucle
    except
      on E: Exception do
      begin
        Inc(Reintentos);
        if Reintentos > FConfig.MaxRetries then
        begin
          Result.ErrorMessage := Format('Error después de %d reintentos: %s',
            [FConfig.MaxRetries, E.Message]);
          LogError(Result.ErrorMessage);
          Break;
        end;
        // Esperar antes del siguiente intento
        Sleep(FConfig.RetryDelay);
      end;
    end;
  end;
  // Restaurar configuración original
  FRESTRequest.Method := OriginalMethod;
  FRESTClient.BaseURL := OriginalBaseURL;
end;

function TVerifactuClient.EnviarPeticionREST(const JSONBody: string):
                                                               TVerifactuResult;
var
  Reintentos: Integer;
  AuthHeader:String;
begin
  Result.Success := False;
  Result.ErrorMessage := '';
  Result.ResponseContent := '';
  Reintentos := 0;
  while (not Result.Success) and (Reintentos <= FConfig.MaxRetries) do
  begin
    try
      FRESTRequest.ClearBody;
      FRESTRequest.Params.Clear;
      FRESTRequest.Params.AddHeader('Content-Type', 'application/json');
      FRESTRequest.Params.AddHeader('Accept', '*/*'); // Como en Insomnia
      // AUTENTICACIÓN - La cabecera exacta que funciona en Insomnia
      FRESTRequest.Params.AddHeader(Fconfig.Username, FConfig.Password);
      FRESTRequest.AddBody(JSONBody, ctAPPLICATION_JSON);
      FRESTRequest.Execute;
      Result.ResponseContent := FRESTResponse.Content;
      Result.HTTPStatusCode := FRESTResponse.StatusCode;
      Result.Success := (FRESTResponse.StatusCode = 200) or
                       (FRESTResponse.StatusCode = 201);
      if not Result.Success then
      begin
        Result.ErrorMessage := Format('Error HTTP %d: %s',
                          [FRESTResponse.StatusCode, FRESTResponse.StatusText]);
        LogError(Result.ErrorMessage);
      end;
    except
      on E: Exception do
      begin
        Inc(Reintentos);
        if Reintentos > FConfig.MaxRetries then
        begin
          Result.ErrorMessage := Format('Error después de %d reintentos: %s',
                                               [FConfig.MaxRetries, E.Message]);
          LogError(Result.ErrorMessage);
          Break;
        end;
        // Esperar antes del siguiente intento
        Sleep(FConfig.RetryDelay);
      end;
    end;
  end;
end;

function TVerifactuClient.IsoToDate(const DateTimeStr: string): TDateTime;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings := TFormatSettings.Create;
  FormatSettings.DateSeparator := '-';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  FormatSettings.ShortTimeFormat := 'hh:nn:ss';
  try
    Result := StrToDateTime(
      StringReplace(
        StringReplace(DateTimeStr, 'T', ' ', []),
        'Z', '', []),
      FormatSettings);
  except
    Result := Now; // Valor por defecto si hay error
  end;
end;

function TVerifactuClient.ParsearRespuestaVerifactu(const JSONResponse: string):
                                                             TVerifactuResponse;
var
  JSONObj, ChainInfoObj: TJSONObject;
  IssuedTimeStr: string;
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.JSONCompleto := JSONResponse;
  Result.Success := False;
  try
    JSONObj := TJSONObject.ParseJSONValue(JSONResponse) as TJSONObject;
    try
      if Assigned(JSONObj) then
      begin
        // Datos básicos
        if JSONObj.TryGetValue('requestId', Result.RequestId) and
           JSONObj.TryGetValue('queueId', Result.QueueId) and
           JSONObj.TryGetValue('qrcode', Result.QRCodeBase64) then
        begin
          //Hay chicha y bacalao
          Result.Success := True;
          // Chain info
          if JSONObj.TryGetValue('chainInfo', ChainInfoObj) then
          begin
            ChainInfoObj.TryGetValue('number', Result.ChainNumber);
            ChainInfoObj.TryGetValue('hash', Result.ChainHash);
            ChainInfoObj.TryGetValue('issuerIrsId', Result.IssuerIrsId);
            if ChainInfoObj.TryGetValue('issuedTime', IssuedTimeStr) then
              Result.IssuedTime := ISOToDate(IssuedTimeStr);
          end;
          // URL de Verifactu
          JSONObj.TryGetValue('verifactuUrl', Result.VerifactuURL);
          JSONObj.TryGetValue('verifactuXml', Result.VerifactuXML);
        end
        else
        begin
          // la cosa viene raruna
          // Intentar extraer mensaje de error
          begin
          // Extraer mensaje y código de error de forma independiente
          if not JSONObj.TryGetValue('message', Result.ErrorMessage) then
            if not JSONObj.TryGetValue('error', Result.ErrorMessage) then
              Result.ErrorMessage := 'Error desconocido en la respuesta';
          JSONObj.TryGetValue('code', Result.ErrorCode);
          if Result.ErrorCode = 561112 then
           Result.ErrorMessage := 'La fecha de Factura es superior a la actual';
        end;
        end;
      end
      else
      begin
        Result.ErrorMessage := 'Respuesta JSON inválida';
      end;
    finally
      JSONObj.Free;
    end;
  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.ErrorMessage := 'Error al parsear respuesta JSON: ' + E.Message;
      LogError(Result.ErrorMessage);
    end;
  end;
end;

function TVerifactuClient.ProcesarRespuestaWebService(
                                             const JSONRespuesta: string;
                                             const SerieFactura: string;
                                             NumeroFactura: Integer;
                                             PeticionJSON:String = ''): Boolean;
var
  Response: TVerifactuResponse;
begin
  Result := False;
  try
    Response := ParsearRespuestaVerifactu(JSONRespuesta);
    if Response.Success then
    begin
      // Guardar consolidación exitosa
      Result := GuardarConsolidacion(SerieFactura,
                                     NumeroFactura,
                                     Response,
                                     PeticionJSON);
      if Result then
      begin
        LogOperacion('Consolidadación ONLINE OK',
                      NumeroFactura, SerieFactura, Response.JSONCompleto);
        // Actualizar estado de la factura
        ActualizarEstadoFactura(SerieFactura, NumeroFactura, 'ONLINE');
      end;
    end
    else
    begin
      // Determinar el tipo de error y actualizar estado
      if ExisteConsolidacion(SerieFactura, NumeroFactura) then
      begin
        SetConsolidationFase(NumeroFactura, SerieFactura, 'ERROR', 'S');
      end
      else
      begin
       SetConsolidationFase(NumeroFactura, SerieFactura, 'ERROR_BORRADOR', 'N');
      end;
      frmOpenApp.VeriFactuLog.RegistrarError('ERROR WS: ' +
                                                          Response.ErrorMessage,
                                             JSONRespuesta,
                                             SerieFactura,
                                             NumeroFactura);
    end;
  except
    on E: Exception do
    begin
      LogError('Error procesando respuesta del webservice: ' + E.Message);
      raise;
    end;
  end;
end;

function TVerifactuClient.GuardarConsolidacion(
                                           const Serie: string;
                                           const Numero: Integer;
                                           const Response: TVerifactuResponse;
                                           const PeticionJSON: string): Boolean;
var
  qryConsolidacion: TUniQuery;
  DecodedStream: TMemoryStream;
  Base64Data, Base64Clean: string;
  DecodedBytes: TBytes;
  IDConsolidacion: Integer;
begin
  Result := False;
  qryConsolidacion := TUniQuery.Create(nil);
  try
    qryConsolidacion.Connection := FConnection;
    qryConsolidacion.SQL.Text :=
      'SELECT * FROM suboc_consolidacion ' +
      'WHERE NRO_FACTURA = :NRO_FACTURA ' +
      'AND SERIE_FACTURA = :SERIE_FACTURA';
    qryConsolidacion.ParamByName('NRO_FACTURA').AsInteger := Numero;
    qryConsolidacion.ParamByName('SERIE_FACTURA').AsString := Serie;
    qryConsolidacion.ReadOnly := False;
    qryConsolidacion.Open;
    try
      if qryConsolidacion.IsEmpty then
      begin
        // Crear nuevo registro
        IDConsolidacion := inLibData.GetNextCont('CS');
        qryConsolidacion.Insert;
        qryConsolidacion.FieldByName('ID_CONSOLIDACION').AsInteger :=
                                                                IDConsolidacion;
        qryConsolidacion.FieldByName('SERIE_FACTURA').AsString := Serie;
        qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger := Numero;
      end
      else
      begin
        // Actualizar registro existente
        qryConsolidacion.Edit;
      end;
      with qryConsolidacion do
      begin
      // Asignar campos de la respuesta
        FieldByName('ESTADO').AsString := 'PROCESADO';
        FieldByName('REQUEST_ID').AsString    := Response.RequestId;
        FieldByName('QUEUE_ID').AsInteger     := Response.QueueId;
        FieldByName('ISSUER_IRS_ID').AsString := Response.IssuerIrsId;
        FieldByName('ISSUED_TIME').AsDateTime := Response.IssuedTime;
        FieldByName('CHAIN_NUMBER').AsString  := Response.ChainNumber;
        FieldByName('CHAIN_HASH').AsString    := Response.ChainHash;
        FieldByName('VERIFACTU_URL').AsString := Response.VerifactuURL;
        FieldByName('FECHA_PROCESAMIENTO').AsDateTime := Now;
        FieldByName('RESPUESTA_COMPLETA').AsString    := Response.JSONCompleto;
        if (Trim(PeticionJSON) <> '') then
          FieldByName('PETICION_COMPLETA').AsString    := PeticionJSON;
      end;
      // Procesar QR Code
      if Response.QRCodeBase64 <> '' then
      begin
        qryConsolidacion.FieldByName('QRCODE_BASE64').AsString :=
                                                          Response.QRCodeBase64;
        // Decodificar y guardar imagen PNG
        Base64Data := Response.QRCodeBase64;
        Base64Clean := Base64Data;
        if Pos('data:image/png;base64,', Base64Data) = 1 then
          Base64Clean := Copy(Base64Data, 23, Length(Base64Data));
        DecodedStream := TMemoryStream.Create;
        try
          DecodedBytes := TNetEncoding.Base64.DecodeStringToBytes(Base64Clean);
          DecodedStream.WriteBuffer(DecodedBytes, Length(DecodedBytes));
          DecodedStream.Position := 0;
          (qryConsolidacion.FieldByName('QRCODE_PNG') as
                                      TBlobField).LoadFromStream(DecodedStream);
        finally
          DecodedStream.Free;
        end;
      end;
      qryConsolidacion.Post;
      Result := True;
    except
      on E: Exception do
      begin
//        if qryConsolidacion.Connection.InTransaction then
//          qryConsolidacion.Connection.Rollback;
        LogError('Error guardando consolidación: ' + E.Message);
        raise;
      end;
    end;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
  end;
end;

function TVerifactuClient.ActualizarEstadoFactura(const Serie: string;
                                                  const Numero: Integer;
                                                 const Estado: string): Boolean;
  function IfThen(AValue: Boolean;
                  const ATrue: string;
                  const AFalse: string = ''): string;
  begin
    if AValue then
      Result := ATrue
    else
      Result := AFalse;
  end;
var
  Query: TUniQuery;
begin
  Result := False;
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'UPDATE suboc_facturas '+
      '   SET ' +
      '       CONSOLIDACION_FACTURA = :consolidada, ' +
      '       FECHA_ULT_CONSO_FACTURA = NOW(), ' +
      '       FASE_CONSOLIDACION_FACTURA = :fase ' +
      'WHERE SERIE_FACTURA = :serie'+
      '  AND NRO_FACTURA = :numero';
    Query.ParamByName('consolidada').AsString :=
                                            IfThen(Estado = 'ONLINE', 'S', 'N');
    Query.ParamByName('fase').AsString := Estado;
    Query.ParamByName('serie').AsString := Serie;
    Query.ParamByName('numero').AsInteger := Numero;
    Query.Execute;
    Result := Query.RowsAffected > 0;
  finally
    Query.Free;
  end;
end;

function TVerifactuClient.CrearFacturaVerifactu( const Serie: string;
                                                 const Numero: Integer;
                                                 const JSONPeticion: string):
                                                 TVerifactuResponse;
var
  WSResult: TVerifactuResult;
begin
  // Validar factura antes de enviar
  if not ValidarFactura(Serie, Numero) then
    raise Exception.Create('Datos de factura no válidos para Verifactu');
  // Enviar a Verifactu
  WSResult := LlamarWebService(JSONPeticion);
  // Parsear respuesta
  Result := ParsearRespuestaVerifactu(WSResult.ResponseContent);
  // Guardar en base de datos si fue exitoso
  if Result.Success then
    GuardarConsolidacion(Serie, Numero, Result, JSONPeticion);
end;

function TVerifactuClient.CancelarFacturaPorQueueId(
                                               const AQueueId: Integer): string;
var
  HTTPClient: THTTPClient;
  Response: IHTTPResponse;
  RequestBody: string;
begin
  HTTPClient := THTTPClient.Create;
  try
    HTTPClient.ContentType := 'application/json';
    HTTPClient.CustomHeaders[FConfig.Username] := FConfig.Password;
    RequestBody := IntToStr(AQueueId); // Solo el número
    Response := HTTPClient.Post(FConfig.URLCancel,
                             TStringStream.Create(RequestBody, TEncoding.UTF8));
    if Response.StatusCode = 200 then
      Result := Response.ContentAsString()
    else
      Result := '';
  finally
    HTTPClient.Free;
  end;
end;

function TVerifactuClient.ConsultarEstadoFactura(const QueueId: Integer;
                                                 const Serie:string;
                                                 const Numero:Integer): string;
var
  URL: string;
  HTTPResult: TVerifactuResult;
begin
  Result := '';
  try
//    // Cargar configuración si es necesario
//    if not CargarConfiguracion then
//    begin
//      LogError('Error al cargar configuración para consulta de estado');
//      Exit;
//    end;
    // Obtener URL del endpoint
    URL := FConfig.URLState;
    if not EndsStr('/', URL) then
      URL := URL + '/';
    URL := URL + (IntToStr(QueueId));
//    if URL = '' then
//    begin
//      LogError('URL de consulta de estado está vacía');
//      Exit;
//    end;

    // Enviar petición GET usando REST
    HTTPResult := EnviarPeticionGET(URL);

    if HTTPResult.Success then
    begin
      Result := HTTPResult.ResponseContent;
//      LogOperacion('Consulta Estado QueueId: ' + IntToStr(QueueId),
//                                                              Numero, Serie );
    end
    else
    begin
      LogError(Format('Error consultando estado factura QueueId %d: %s',
        [QueueId, HTTPResult.ErrorMessage]));
    end;
  except
    on E: Exception do
    begin
      LogError('Excepción en ConsultarEstadoFactura: ' + E.Message);
      Result := '';
    end;
  end;
end;

function TVerifactuClient.ValidarFactura(const Serie: string;
                                         const Numero: Integer): Boolean;
var
  Query: TUniQuery;
begin
  Result := False;
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      '   SELECT COUNT(*) as LINEAS_COUNT, ' +
      '          COALESCE(TOTAL_LIQUIDO_FACTURA, 0) as TOTAL ' +
      '     FROM suboc_facturas f ' +
      'LEFT JOIN suboc_lineas_facturas l'+
      '       ON f.SERIE_FACTURA = l.SERIE_FACTURA ' +
      '      AND f.NRO_FACTURA = l.NRO_FACTURA ' +
      '    WHERE f.SERIE_FACTURA = :serie AND f.NRO_FACTURA = :numero ' +
      ' GROUP BY f.SERIE_FACTURA, f.NRO_FACTURA';
    Query.ParamByName('serie').AsString := Serie;
    Query.ParamByName('numero').AsInteger := Numero;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Result := (Query.FieldByName('LINEAS_COUNT').AsInteger > 0);// and
                //(Query.FieldByName('TOTAL').AsFloat > 0);
    end;
  finally
    Query.Free;
  end;
end;

function TVerifactuClient.ExisteConsolidacion(const Serie: string;
                                              const Numero: Integer): Boolean;
var
  Query: TUniQuery;
begin
  Result := False;
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT ESTADO as ESTADO ' +
      '  FROM suboc_consolidacion ' +
      ' WHERE SERIE_FACTURA = :serie'+
      '   AND NRO_FACTURA = :numero';
    Query.ParamByName('serie').AsString := Serie;
    Query.ParamByName('numero').AsInteger := Numero;
    Query.Open;
    if (Query.RecordCount > 0)  then
      Result := ((Query.FieldByName('ESTADO').AsString <> 'PENDIENTE'))
    else
       Result := False;
  finally
    Query.Free;
  end;
end;

procedure TVerifactuClient.LogError(const Mensaje: string;
                                    DatosAdicionales:string = '';
                                    sSerie:string='';
                                    iNumFactura:Integer=0);
begin
  if Assigned(frmOpenApp) and Assigned(frmOpenApp.VeriFactuLog) then
    frmOpenApp.VeriFactuLog.RegistrarError(Mensaje,
                                           DatosAdicionales,
                                           sSerie,
                                           iNumFactura);
end;

procedure TVerifactuClient.LogOperacion(const Operacion:String;
                                        NumFactura:Integer = 0;
                                        SerieFactura: string = '';
                                        DatosAdicionales:string='');
begin
  if Assigned(frmOpenApp) and Assigned(frmOpenApp.VeriFactuLog) then
    frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(Operacion,
                                                      SerieFactura,
                                                      NumFactura,
                                                      DatosAdicionales);
end;

// ============================================================================
// Funciones globales para compatibilidad con código existente
// ============================================================================

function LlamarWebServiceVerifactu(IDConsolidacion: Integer): Boolean;
var
  VerifactuClient: TVerifactuClient;
  qryConsolidacion: TUniQuery;
  JSONPeticion, SerieFactura: string;
  NumeroFactura: Integer;
  WSResult: TVerifactuResult;
begin
  Result := False;
  if ((not Assigned(frmOpenApp)) or
      (not Assigned(frmOpenApp.FDmConn)) or
      (not frmOpenApp.FDmConn.conUni.Connected)) then
    raise Exception.Create('Conexión a base de datos no disponible');
  VerifactuClient := TVerifactuClient.Create(frmOpenApp.FDmConn.conUni);
  qryConsolidacion := TUniQuery.Create(nil);
  try
    // Obtener la petición JSON de la base de datos
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text :=
      'SELECT PETICION_COMPLETA, '+
      '       SERIE_FACTURA, '+
      '       NRO_FACTURA ' +
      '  FROM suboc_consolidacion ' +
      ' WHERE ID_CONSOLIDACION = :ID_CONSOLIDACION';
    qryConsolidacion.ParamByName('ID_CONSOLIDACION').AsInteger := IDConsolidacion;
    qryConsolidacion.Open;
    if qryConsolidacion.RecordCount = 0 then
    begin
      VerifactuClient.LogError('No se encontró registro de consolidación con ID: ' +
        IntToStr(IDConsolidacion));
      raise Exception.Create('No se encontró registro de consolidación con ID: ' +
        IntToStr(IDConsolidacion));
    end;
    JSONPeticion := qryConsolidacion.FieldByName('PETICION_COMPLETA').AsString;
    SerieFactura := qryConsolidacion.FieldByName('SERIE_FACTURA').AsString;
    NumeroFactura := qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger;
    if Trim(JSONPeticion) = '' then
    begin
      VerifactuClient.LogError('La petición JSON está vacía para el ID: ' +
        IntToStr(IDConsolidacion));
      raise Exception.Create('La petición JSON está vacía para el ID: ' +
        IntToStr(IDConsolidacion));
    end;
    // Llamar al webservice
    WSResult := VerifactuClient.LlamarWebService(JSONPeticion);
    if WSResult.Success then
    begin
      // Procesar la respuesta
      Result := VerifactuClient.ProcesarRespuestaWebService(
                         WSResult.ResponseContent, SerieFactura, NumeroFactura);
    end
    else
    begin
      VerifactuClient.LogError('Error en webservice: ' + WSResult.ErrorMessage);
      raise Exception.Create('Error en webservice: ' + WSResult.ErrorMessage);
    end;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
    FreeAndNil(VerifactuClient);
  end;
end;

function CrearYProcesarConsolidacion(const SerieFactura: string;
                                     NumeroFactura: Integer;
                                     const JSONPeticion: string): Boolean;
var
  VerifactuClient: TVerifactuClient;
  qryConsolidacion: TUniQuery;
  WSResult: TVerifactuResult;
  IDConsolidacion: Integer;
begin
  Result := False;
  if ((not Assigned(frmOpenApp)) or
      (not Assigned(frmOpenApp.FDmConn)) or
      (not frmOpenApp.FDmConn.conUni.Connected)) then
    raise Exception.Create('Conexión a base de datos no disponible');
  VerifactuClient := TVerifactuClient.Create(frmOpenApp.FDmConn.conUni);
  qryConsolidacion := TUniQuery.Create(nil);
  try
    // Verificar si ya existe consolidación para esta factura
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text :=
      'SELECT * '+
      '  FROM suboc_consolidacion ' +
      ' WHERE NRO_FACTURA = :NRO_FACTURA'+
      '   AND SERIE_FACTURA = :SERIE_FACTURA';
    qryConsolidacion.ParamByName('NRO_FACTURA').AsInteger := NumeroFactura;
    qryConsolidacion.ParamByName('SERIE_FACTURA').AsString := SerieFactura;
    qryConsolidacion.ReadOnly := False;
    qryConsolidacion.Open;
    // Si no existe, crear registro inicial con la petición
    if qryConsolidacion.RecordCount = 0 then
    begin
      IDConsolidacion := inLibData.GetNextCont('CS');
      qryConsolidacion.Insert;
      qryConsolidacion.FieldByName('ID_CONSOLIDACION').AsInteger :=
                                                                IDConsolidacion;
      qryConsolidacion.FieldByName('SERIE_FACTURA').AsString := SerieFactura;
      qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger := NumeroFactura;
      qryConsolidacion.FieldByName('ESTADO').AsString := 'PENDIENTE';
      qryConsolidacion.FieldByName('PETICION_COMPLETA').AsString := JSONPeticion;
      qryConsolidacion.Post;
    end;
    qryConsolidacion.Close;
    // Llamar al webservice
    WSResult := VerifactuClient.LlamarWebService(JSONPeticion);
    if WSResult.Success then
    begin
      // Procesar la respuesta
      Result := VerifactuClient.ProcesarRespuestaWebService(
                         WSResult.ResponseContent, SerieFactura, NumeroFactura,
                         JSONPeticion);
    end
    else
    begin
      VerifactuClient.LogError('Error en webservice: ' + WSResult.ErrorMessage);
      raise Exception.Create('Error en webservice: ' + WSResult.ErrorMessage);
    end;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
    FreeAndNil(VerifactuClient);
  end;
end;
end.
