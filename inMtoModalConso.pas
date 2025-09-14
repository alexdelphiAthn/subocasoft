unit inMtoModalConso;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Net.Mime, System.JSON,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, Vcl.ExtCtrls,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Datasnap.DBClient,
  XMLIntf, XMLDoc, Vcl.ToolWin, Vcl.ComCtrls, REST.Authenticator.Simple,
  REST.Authenticator.Basic, System.NetEncoding,
  Vcl.Imaging.PngImage,
  REST.Authenticator.OAuth, SynEditHighlighter, SynHighlighterXML, SynEdit,
  Data.DB, Vcl.Grids, Vcl.DBGrids, SynEditCodeFolding, SynHighlighterJSON,
  DBAccess, Uni, UniProvider, MySQLUniProvider, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage, cxDBEdit,
  cxMemo, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit;
type
  // Record para configuración del servicio
  TVerifactuConfig = record
    URL: string;
    Username: string;
    Password: string;
  end;
  // Record para resultado de la llamada
  TVerifactuResult = record
    Success: Boolean;
    ErrorMessage: string;
    ResponseContent: string;
  end;
  // Clase para manejo del servicio Verifactu (independiente del formulario)
  TVerifactuService = class
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FAuthenticator: THTTPBasicAuthenticator;
    FConfig: TVerifactuConfig;
    procedure ConfigurarCliente;
    function IsoToDate(const DateTimeStr: string): TDateTime;
  public
    constructor Create;
    destructor Destroy; override;
    function CargarConfiguracion: Boolean;
    function LlamarWebService(const JSONBody: string): TVerifactuResult;
    function ProcesarRespuestaWebService(const JSONRespuesta: string;
                                        SerieFactura: string;
                                        NumeroFactura: Integer): Boolean;
    property Config: TVerifactuConfig read FConfig write FConfig;
  end;

  TfrmMtoModalConso = class(TForm)
    rstCliClient: TRESTClient;
    rstReqRequest: TRESTRequest;
    rstResResponse: TRESTResponse;
    synjsnsyn1: TSynJSONSyn;
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtBaseURL: TEdit;
    edtValue: TEdit;
    edtKey: TEdit;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    pnl3: TPanel;
    pnl2: TPanel;
    btnBuildJSON: TButton;
    tsDefData: TTabSheet;
    pnl1: TPanel;
    btnCallWS: TButton;
    htBasAuthAutenticator: THTTPBasicAuthenticator;
    tsRespuestaWS: TTabSheet;
    unqryConsolidacion: TUniQuery;
    mseBody: TSynEdit;
    mseDialog: TSynEdit;
    pnl4: TPanel;
    img1: TcxDBImage;
    lbl: TLabel;
    spID_CONSOLIDACION: TcxDBSpinEdit;
    lbl4: TLabel;
    txtSERIE_FACTURA: TcxDBTextEdit;
    lbl5: TLabel;
    spNRO_FACTURA: TcxDBSpinEdit;
    lbl6: TLabel;
    txtREQUEST_ID: TcxDBTextEdit;
    lbl7: TLabel;
    spQUEUE_ID: TcxDBSpinEdit;
    lbl8: TLabel;
    txtISSUER_IRS_ID: TcxDBTextEdit;
    lbl9: TLabel;
    dteISSUED_TIME: TcxDBDateEdit;
    lbl10: TLabel;
    txtCHAIN_NUMBER: TcxDBTextEdit;
    lbl11: TLabel;
    txtCHAIN_HASH: TcxDBTextEdit;
    lbl12: TLabel;
    cxdbmVERIFACTU_URL: TcxDBMemo;
    lbl13: TLabel;
    cxdbmQRCODE_BASE64: TcxDBMemo;
    lbl15: TLabel;
    dteFECHA_PROCESAMIENTO: TcxDBDateEdit;
    lbl16: TLabel;
    txtESTADO: TcxDBTextEdit;
    lbl17: TLabel;
    cxdbmRESPUESTA_COMPLETA: TcxDBMemo;
    lbl18: TLabel;
    cxdbmPETICION_COMPLETA: TcxDBMemo;
    unqryFacturas: TUniQuery;
    unqryFacturasLineas: TUniQuery;
    lbl14: TLabel;
    edtNroFactura: TEdit;
    edtSerieFactura: TEdit;
    lbl141: TLabel;
    lbl1411: TLabel;
    edtImporteFactura: TEdit;
//    procedure btnCallWSClick(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
//    procedure FormDestroy(Sender: TObject);
  private
    FVerifactuService: TVerifactuService;
  public
//    procedure ConstruirFactura(const NumeroFactura,
//                               SerieFactura,
//                               ImporteFactura: string);
//    procedure AsignarDatosBasicos;
//    procedure ProcesarRespuestaCompleta;
  end;
// Funciones globales para usar desde otras unidades
function LlamarWebServiceVerifactu(IDConsolidacion: Integer): Boolean;
function CrearYProcesarConsolidacion(SerieFactura: string;
                                     NumeroFactura: Integer;
                                     JSONPeticion: string): Boolean;
var
  frmMtoModalConso: TfrmMtoModalConso;
implementation
uses
  inMtoPrincipal, inLibJSON, inLibData;
{$R *.dfm}
// ============================================================================
// Implementación de TVerifactuService
// ============================================================================
constructor TVerifactuService.Create;
begin
  inherited;
  FRESTClient := TRESTClient.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);
  FAuthenticator := THTTPBasicAuthenticator.Create(nil);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTClient.Authenticator := FAuthenticator;
end;

destructor TVerifactuService.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  FreeAndNil(FAuthenticator);
  inherited;
end;

function TVerifactuService.CargarConfiguracion: Boolean;
var
  qryParams: TUniQuery;
begin
  Result := False;
  qryParams := TUniQuery.Create(nil);
  try
    qryParams.Connection := frmOpenApp.FDmConn.conUni;
    qryParams.SQL.Text := 'SELECT NOMBRE_PARAM, VALUE_PARAM ' +
                         'FROM suboc_param ' +
                         'WHERE NOMBRE_PARAM IN (' +
                         QuotedStr('URL_VERIFACTU_INVOICE') + ', ' +
                         QuotedStr('PASSKEY_VERIFACTU') + ', ' +
                         QuotedStr('AUTHKEY_VERIFACTU') + ')';
    qryParams.Open;
    // Inicializar configuración
    FConfig.URL := '';
    FConfig.Username := '';
    FConfig.Password := '';
    // Leer parámetros
    while not qryParams.Eof do
    begin
      if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                    'URL_VERIFACTU_INVOICE' then
        FConfig.URL := qryParams.FieldByName('VALUE_PARAM').AsString
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                        'PASSKEY_VERIFACTU' then
        FConfig.Username := qryParams.FieldByName('VALUE_PARAM').AsString
      else if qryParams.FieldByName('NOMBRE_PARAM').AsString =
                                                        'AUTHKEY_VERIFACTU' then
        FConfig.Password := qryParams.FieldByName('VALUE_PARAM').AsString;
      qryParams.Next;
    end;
    Result := (FConfig.URL <> '') and (FConfig.Username <> '') and
                                                       (FConfig.Password <> '');
    if Result then
      ConfigurarCliente;
  finally
    qryParams.Close;
    FreeAndNil(qryParams);
  end;
end;

procedure TVerifactuService.ConfigurarCliente;
begin
  FRESTClient.BaseURL := FConfig.URL;
  FRESTRequest.Method := rmPOST;
  FAuthenticator.Username := FConfig.Username;
  FAuthenticator.Password := FConfig.Password;
end;

function TVerifactuService.LlamarWebService(
                                      const JSONBody: string): TVerifactuResult;
begin
  Result.Success := False;
  Result.ErrorMessage := '';
  Result.ResponseContent := '';
  try
    if not CargarConfiguracion then
    begin
    frmOpenApp.VeriFactuLog.RegistrarError('', 'No se han podido cargar' +
                                                       ' parámetros Verifactu');
      Result.ErrorMessage := 'Error al cargar configuración de Verifactu';
      Exit;
    end;
    FRESTRequest.ClearBody;
    FRESTRequest.AddBody(JSONBody, ctAPPLICATION_JSON);
    FRESTRequest.Execute;
    Result.ResponseContent := FRESTResponse.Content;
    Result.Success := (FRESTResponse.StatusCode = 200) or
                                               (FRESTResponse.StatusCode = 201);
    if not Result.Success then
    begin
      frmOpenApp.VeriFactuLog.RegistrarError('', Format('Error HTTP %d: %s',
                         [FRESTResponse.StatusCode, FRESTResponse.StatusText]));
      Result.ErrorMessage := Format('Error HTTP %d: %s',
                          [FRESTResponse.StatusCode, FRESTResponse.StatusText]);
    end;
  except
    on E: Exception do
    begin
      Result.Success := False;
      frmOpenApp.VeriFactuLog.RegistrarError('', 'Error en llamada ' +
                                                 'al webservice: ' + E.Message);
      Result.ErrorMessage := 'Error en llamada al webservice: ' + E.Message;
    end;
  end;
end;

function TVerifactuService.IsoToDate(const DateTimeStr: string): TDateTime;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings := TFormatSettings.Create;
  FormatSettings.DateSeparator := '-';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  FormatSettings.ShortTimeFormat := 'hh:nn:ss';
  try
    Result := StrToDateTime(StringReplace(StringReplace(DateTimeStr,
                                                        'T',
                                                        '',
                                                        []
                                                        ),
                                          'Z',
                                          '',
                                          []
                                          ),
                            FormatSettings);
  except
    Result := Now; // Valor por defecto si hay error
  end;
end;

function TVerifactuService.ProcesarRespuestaWebService(
                                                    const JSONRespuesta: string;
                                                           SerieFactura: string;
                                               NumeroFactura: Integer): Boolean;
var
  JSONResponse: TJSONObject;
  ChainInfo: TJSONObject;
  qryConsolidacion: TUniQuery;
  PngImage: TPngImage;
  DecodedStream: TMemoryStream;
  Base64Data, Base64Clean: string;
  DecodedBytes: TBytes;
  IDConsolidacion: Integer;
begin
  Result := False;
  qryConsolidacion := TUniQuery.Create(nil);
  try
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text := 'SELECT * FROM suboc_consolidacion ' +
                                'WHERE NRO_FACTURA = :NRO_FACTURA ' +
                                'AND SERIE_FACTURA = :SERIE_FACTURA';
    qryConsolidacion.ParamByName('NRO_FACTURA').AsInteger := NumeroFactura;
    qryConsolidacion.ParamByName('SERIE_FACTURA').AsString := SerieFactura;
    qryConsolidacion.ReadOnly := False;
    qryConsolidacion.Open;
    try
      // Parsear JSON de respuesta
      JSONResponse := TJSONObject.ParseJSONValue(JSONRespuesta) as TJSONObject;
      if JSONResponse = nil then
        raise Exception.Create('Respuesta JSON inválida');
      try
        // Extraer chainInfo
        ChainInfo := JSONResponse.GetValue('chainInfo') as TJSONObject;
        if ChainInfo = nil then
        begin
         if ((qryConsolidacion.RecordCount = 0) or
            (qryConsolidacion.FieldByName('ESTADO').AsString =
                                                              'PENDIENTE')) then
         begin
          frmOpenApp.VeriFactuLog.RegistrarError( '',
                                         'Error al recibir JSon de Borrador: ' +
                   SerieFactura + '\' + IntToStr(NumeroFactura) + ' JSON: ' +
                                                                 JSONRespuesta);
          SetConsolidationFase(NumeroFactura, SerieFactura,
                                                         'ERROR_BORRADOR', 'N');
          InsertarError(JSONRespuesta, NumeroFactura, SerieFactura, 'S');
         end
         else if (
               qryConsolidacion.FieldByName('ESTADO').AsString = 'OFFLINE') then
         begin
           frmOpenApp.VeriFactuLog.RegistrarError('', 'Error al recibir JSon' +
                      ' de Factura Consolidada OFFLINE: ' + SerieFactura + '\' +
                          IntToStr(NumeroFactura)+ '  JSON: ' + JSONRespuesta);
        SetConsolidationFase(NumeroFactura, SerieFactura, 'ERROR_OFFLINE', 'S');
           InsertarError(JSONRespuesta, NumeroFactura, SerieFactura, 'N');
         end;
        end
        else
        begin
          // Crear o actualizar registro
          try
            //qryConsolidacion.Connection.StartTransaction;
            if qryConsolidacion.IsEmpty then
            begin
              // Crear nuevo registro
              IDConsolidacion := inLibData.GetNextCont('CS');
              qryConsolidacion.Insert;
              qryConsolidacion.FieldByName('ID_CONSOLIDACION').AsInteger :=
                                                                IDConsolidacion;
              qryConsolidacion.FieldByName('SERIE_FACTURA').AsString :=
                                                                   SerieFactura;
              qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger :=
                                                                  NumeroFactura;
            end
            else
            begin
              // Actualizar registro existente
              qryConsolidacion.Edit;
            end;
            qryConsolidacion.FieldByName('ESTADO').AsString := 'PROCESADO';
            // Extraer y asignar campos de la respuesta
            if JSONResponse.GetValue('requestId') <> nil then
              qryConsolidacion.FieldByName('REQUEST_ID').AsString :=
                                        JSONResponse.GetValue('requestId').Value
            else
              qryConsolidacion.FieldByName('REQUEST_ID').Clear;
            if JSONResponse.GetValue('queueId') <> nil then
              qryConsolidacion.FieldByName('QUEUE_ID').AsInteger :=
                          StrToIntDef(JSONResponse.GetValue('queueId').Value, 0)
            else
              qryConsolidacion.FieldByName('QUEUE_ID').Clear;
            // Campos de chainInfo
            if ChainInfo.GetValue('issuerIrsId') <> nil then
              qryConsolidacion.FieldByName('ISSUER_IRS_ID').AsString :=
                                         ChainInfo.GetValue('issuerIrsId').Value
            else
              qryConsolidacion.FieldByName('ISSUER_IRS_ID').Clear;
            if ChainInfo.GetValue('issuedTime') <> nil then
            begin
              var sFecha := ChainInfo.GetValue('issuedTime').Value;
              qryConsolidacion.FieldByName('ISSUED_TIME').AsDateTime :=
                                                              IsoToDate(sFecha);
            end
            else
              qryConsolidacion.FieldByName('ISSUED_TIME').Clear;
            if ChainInfo.GetValue('number') <> nil then
              qryConsolidacion.FieldByName('CHAIN_NUMBER').AsString :=
                                              ChainInfo.GetValue('number').Value
            else
              qryConsolidacion.FieldByName('CHAIN_NUMBER').Clear;
            if ChainInfo.GetValue('hash') <> nil then
              qryConsolidacion.FieldByName('CHAIN_HASH').AsString :=
                                                ChainInfo.GetValue('hash').Value
            else
              qryConsolidacion.FieldByName('CHAIN_HASH').Clear;
            // URL de verificación
            if JSONResponse.GetValue('verifactuUrl') <> nil then
              qryConsolidacion.FieldByName('VERIFACTU_URL').AsString :=
                                     JSONResponse.GetValue('verifactuUrl').Value
            else
              qryConsolidacion.FieldByName('VERIFACTU_URL').Clear;
            qryConsolidacion.FieldByName('FECHA_PROCESAMIENTO').AsDateTime :=
                                                                            Now;
            // QR Code en Base64
            if JSONResponse.GetValue('qrcode') <> nil then
            begin
              qryConsolidacion.FieldByName('QRCODE_BASE64').AsString :=
                                          JSONResponse.GetValue('qrcode').Value;
              // Decodificar QR y guardarlo como imagen
              Base64Data := JSONResponse.GetValue('qrcode').Value;
              Base64Clean := Base64Data;
              if Pos('data:image/png;base64,', Base64Data) = 1 then
                Base64Clean := Copy(Base64Data, 23, Length(Base64Data));
              DecodedStream := TMemoryStream.Create;
              try
                DecodedBytes := TNetEncoding.Base64.DecodeStringToBytes(
                                                                   Base64Clean);
                DecodedStream.WriteBuffer(DecodedBytes, Length(DecodedBytes));
                DecodedStream.Position := 0;
                // Cargar imagen PNG
                PngImage := TPngImage.Create;
                try
                  PngImage.LoadFromStream(DecodedStream);
                  (qryConsolidacion.FieldByName('QRCODE_PNG') as
                                      TBlobField).LoadFromStream(DecodedStream);
                finally
                  PngImage.Free;
                end;
              finally
                DecodedStream.Free;
              end;
            end
            else
              qryConsolidacion.FieldByName('QRCODE_BASE64').Clear;
            qryConsolidacion.FieldByName('RESPUESTA_COMPLETA').AsString :=
                                                                  JSONRespuesta;
            qryConsolidacion.Post;
            frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
                                         'Consolidada ONLINE',
                                         SerieFactura + '\' +
                                         IntToStr(NumeroFactura), '');
            Result := True;
          except
          end;
        end;
      finally
        JSONResponse.Free;
      end;
    except
      on E: Exception do
      begin
        if qryConsolidacion.Connection.InTransaction then
          qryConsolidacion.Connection.Rollback;
          frmOpenApp.VeriFactuLog.RegistrarError('', 'Error procesando' +
                                     ' respuesta del webservice: ' + E.Message);
        raise Exception.Create('Error procesando respuesta del webservice: ' +
                                                                     E.Message);
      end;
    end;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
  end;
end;

// ============================================================================
// Funciones globales para usar desde otras unidades
// ============================================================================
function LlamarWebServiceVerifactu(IDConsolidacion: Integer): Boolean;
var
  VerifactuService: TVerifactuService;
  qryConsolidacion: TUniQuery;
  JSONPeticion, SerieFactura: string;
  NumeroFactura: Integer;
  WSResult: TVerifactuResult;
begin
  Result := False;
  VerifactuService := TVerifactuService.Create;
  qryConsolidacion := TUniQuery.Create(nil);
  try
    // Obtener la petición JSON de la base de datos
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text := 'SELECT PETICION_COMPLETA, ' +
                                 '       SERIE_FACTURA, '+
                                 '       NRO_FACTURA ' +
                                'FROM suboc_consolidacion ' +
                                'WHERE ID_CONSOLIDACION = :ID_CONSOLIDACION';
    qryConsolidacion.ParamByName('ID_CONSOLIDACION').AsInteger :=
                                                                IDConsolidacion;
    qryConsolidacion.Open;
    if (qryConsolidacion.RecordCount = 0) then
    begin
      frmOpenApp.VeriFactuLog.RegistrarError('', 'No se encontró registro de' +
                     ' consolidación con ID: ' + IntToStr(IDConsolidacion));
      raise Exception.Create('No se encontró registro de consolidación con ID: '
                                                   + IntToStr(IDConsolidacion));
    end;
    JSONPeticion := qryConsolidacion.FieldByName('PETICION_COMPLETA').AsString;
    SerieFactura := qryConsolidacion.FieldByName('SERIE_FACTURA').AsString;
    NumeroFactura := qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger;
    if Trim(JSONPeticion) = '' then
    begin
      frmOpenApp.VeriFactuLog.RegistrarError('', 'La petición JSON está vacía ' +
                   ' para el ID: ' + IntToStr(IDConsolidacion));
      raise Exception.Create('La petición JSON está vacía para el ID: ' +
                                                     IntToStr(IDConsolidacion));
    end;
    // Llamar al webservice
    WSResult := VerifactuService.LlamarWebService(JSONPeticion);
    if WSResult.Success then
    begin
      // Procesar la respuesta
      Result := VerifactuService.ProcesarRespuestaWebService(
                         WSResult.ResponseContent, SerieFactura, NumeroFactura);
    end
    else
    begin
      frmOpenApp.VeriFactuLog.RegistrarError('',
                               'Error en webservice: ' + WSResult.ErrorMessage);

      raise Exception.Create('Error en webservice: ' + WSResult.ErrorMessage);
    end;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
    FreeAndNil(VerifactuService);
  end;
end;

function CrearYProcesarConsolidacion(SerieFactura: string;
                                     NumeroFactura: Integer;
                                     JSONPeticion: string): Boolean;
var
  VerifactuService: TVerifactuService;
  qryConsolidacion: TUniQuery;
  WSResult: TVerifactuResult;
  IDConsolidacion: Integer;
begin
  Result := False;
  VerifactuService := TVerifactuService.Create;
  qryConsolidacion := TUniQuery.Create(nil);
  try
    // Verificar si ya existe consolidación para esta factura
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text := 'SELECT * FROM suboc_consolidacion ' +
                                '  WHERE NRO_FACTURA = :NRO_FACTURA ' +
                                '    AND SERIE_FACTURA = :SERIE_FACTURA';
    qryConsolidacion.ParamByName('NRO_FACTURA').AsInteger := NumeroFactura;
    qryConsolidacion.ParamByName('SERIE_FACTURA').AsString := SerieFactura;
    qryConsolidacion.ReadOnly := False;
    qryConsolidacion.Open;
    // Si no existe, crear registro inicial con la petición
    if (qryConsolidacion.RecordCount = 0) then
    begin
      IDConsolidacion := inLibData.GetNextCont('CS');
      qryConsolidacion.Connection.StartTransaction;
      try
        qryConsolidacion.Insert;
        qryConsolidacion.FieldByName('ID_CONSOLIDACION').AsInteger :=
                                                                IDConsolidacion;
        qryConsolidacion.FieldByName('SERIE_FACTURA').AsString := SerieFactura;
        qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger := NumeroFactura;
        qryConsolidacion.FieldByName('ESTADO').AsString := 'PENDIENTE';
        qryConsolidacion.FieldByName('PETICION_COMPLETA').AsString :=
                                                                   JSONPeticion;
        qryConsolidacion.Post;
        qryConsolidacion.Connection.Commit;
      except
        if qryConsolidacion.Connection.InTransaction then
          qryConsolidacion.Connection.Rollback;
        raise;
      end;
    end;
    qryConsolidacion.Close;
    // Llamar al webservice
    WSResult := VerifactuService.LlamarWebService(JSONPeticion);
    if WSResult.Success then
    begin
      // Procesar la respuesta
      Result := VerifactuService.ProcesarRespuestaWebService(
                         WSResult.ResponseContent, SerieFactura, NumeroFactura);
    end
    else
    begin
      raise Exception.Create('Error en webservice: ' + WSResult.ErrorMessage);
    end;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
    FreeAndNil(VerifactuService);
  end;
end;

// ============================================================================
// Implementación del formulario (funcionalidad existente)
// ============================================================================
//procedure TfrmMtoModalConso.AsignarDatosBasicos;
//begin
//  if not Assigned(FVerifactuService) then
//    Exit;
//  if FVerifactuService.CargarConfiguracion then
//  begin
//    edtBaseURL.Text := FVerifactuService.Config.URL;
//    edtKey.Text := FVerifactuService.Config.Password;
//    edtValue.Text := FVerifactuService.Config.Password;
//  end;
//end;

//procedure TfrmMtoModalConso.btnCallWSClick(Sender: TObject);
//var
//  WSResult: TVerifactuResult;
//begin
//  AsignarDatosBasicos;
//  WSResult := FVerifactuService.LlamarWebService(mseBody.Text);
//  if WSResult.Success then
//  begin
//    mseDialog.Text := WSResult.ResponseContent + '   ' + mseDialog.Text;
//    ProcesarRespuestaCompleta;
//  end
//  else
//  begin
//    ShowMessage('Error en webservice: ' + WSResult.ErrorMessage);
//  end;
//end;

//procedure TfrmMtoModalConso.ConstruirFactura(const NumeroFactura,
//                                             SerieFactura,
//                                             ImporteFactura: string);
//begin
//  mseBody.Text := BuildJSON(NumeroFactura, SerieFactura);
//  edtSerieFactura.Text := SerieFactura;
//  edtNroFactura.Text := NumeroFactura;
//  edtImporteFactura.Text := ImporteFactura;
//end;

////procedure TfrmMtoModalConso.FormCreate(Sender: TObject);
////begin
////  FVerifactuService := TVerifactuService.Create;
////  unqryFacturas.Connection := frmOpenApp.FDmConn.conUni;
////  unqryFacturasLineas.Connection := frmOpenApp.FDmConn.conUni;
////  unqryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
////
////end;
//
//procedure TfrmMtoModalConso.FormDestroy(Sender: TObject);
//begin
//  FreeAndNil(FVerifactuService);
//end;

//procedure TfrmMtoModalConso.ProcesarRespuestaCompleta;
//var
//  SerieFactura: string;
//  NumeroFactura: Integer;
//begin
//  // Obtener datos de la factura actual
//  SerieFactura := edtSerieFactura.Text;
//  NumeroFactura := StrToInt(edtNroFactura.Text);
//  try
//    // Procesar respuesta usando el servicio
//    if FVerifactuService.ProcesarRespuestaWebService(rstResResponse.Content,
//                                                     SerieFactura,
//                                                     NumeroFactura) then
//    begin
//      //ShowMessage('Conexión con Verifactu procesada. Factura creada.');
//    end
//    else
//    begin
//      frmOpenApp.VeriFactuLog.RegistrarError( '', 'Error al procesar' +
//                          ' respuesta del WS, JSON: ' + rstResResponse.Content);
//      ShowMessage('Error al procesar la respuesta del webservice.');
//    end;
//  except
//    on E: Exception do
//    begin
//      frmOpenApp.VeriFactuLog.RegistrarError( '', E.Message);
//      ShowMessage('Error: ' + E.Message);
//    end;
//  end;
//end;
end.
