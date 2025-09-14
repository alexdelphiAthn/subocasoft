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
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage, cxDBEdit;

type
  TForm1 = class(TForm)
    rstCliClient: TRESTClient;
    rstReqRequest: TRESTRequest;
    rstResResponse: TRESTResponse;
    synjsnsyn1: TSynJSONSyn;
    con1: TUniConnection;
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
    dbgrdFacturas: TDBGrid;
    mysqlnprvdr1: TMySQLUniProvider;
    dsFacturas: TDataSource;
    unqryFacturas: TUniQuery;
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
    dbgrdConsolidacion: TDBGrid;
    pnl4: TPanel;
    dsConsolidacion: TDataSource;
    img1: TcxDBImage;
    procedure btnCallWSClick(Sender: TObject);
    procedure btnBuildJSONClick(Sender: TObject);
  private
    { Private declarations }

  public
    procedure AsignarDatosBasicos;
    procedure ProcesarRespuestaCompleta;
    procedure ProcesarRespuestaWebService(const JSONRespuesta: string;
                                          SerieFactura: string;
                                          NumeroFactura: Integer;
                                          qryConsolidacion: TUniQuery);

    { Public declarations }
  end;

implementation
{$R *.dfm}

procedure TForm1.AsignarDatosBasicos;
begin
  rstCliClient.BaseURL := edtBaseURL.Text;
  rstReqRequest.Method := rmPOST;
  htBasAuthAutenticator.Username := edtKey.Text;
  htBasAuthAutenticator.Username := edtValue.Text;
end;

procedure TForm1.btnBuildJSONClick(Sender: TObject);
var
  JSONToSend: TJSONObject;
  InvoiceObj: TJSONObject;
  RecipienTForm1: TJSONObject;
  IdObj: TJSONObject;
  DescriptionObj: TJSONObject;
  VatLinesArray: TJSONArray;
  VatLineObj: TJSONObject;
  NumeroFactura, SerieFactura: string;
  bEsSimpl:Boolean;
begin
  JSONToSend := TJSONObject.Create;
  try
    // Crear objeto principal de la factura
    InvoiceObj := TJSONObject.Create;
    bEsSimpl := (unqryFacturas.FieldByName('ESSIMPL_FACTURA').AsString = 'S');
    if not(bEsSimpl) then
    begin
      // --- RECIPIENT (Datos del cliente) ---
      RecipienTForm1 := TJSONObject.Create;
      // IRS ID (NIF del cliente)
      if not unqryFacturas.FieldByName('NIF_CLIENTE_FACTURA').IsNull then
        RecipienTForm1.AddPair('irsId',
                        unqryFacturas.FieldByName('NIF_CLIENTE_FACTURA').AsString)
      else
        RecipienTForm1.AddPair('irsId', '');

      // Name (Razón social del cliente)
      if not unqryFacturas.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').IsNull then
        RecipienTForm1.AddPair('name',
                unqryFacturas.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString)
      else
        RecipienTForm1.AddPair('name', '');

      // Country (País del cliente)
  //    if not unqryFacturas.FieldByName('PAIS_CLIENTE_FACTURA').IsNull then
  //      RecipienTForm1.AddPair('country',
  //                     unqryFacturas.FieldByName('PAIS_CLIENTE_FACTURA').AsString)
  //    else
      RecipienTForm1.AddPair('country', 'ES'); // Valor por defecto España

      InvoiceObj.AddPair('recipient', RecipienTForm1);
    end;
    // --- ID (Identificación de la factura) ---
    IdObj := TJSONObject.Create;

    // Construir número de factura (SERIE/NUMERO)
    SerieFactura := unqryFacturas.FieldByName('SERIE_FACTURA').AsString;
    NumeroFactura := unqryFacturas.FieldByName('NRO_FACTURA').AsString;
    IdObj.AddPair('number', SerieFactura + '/' + NumeroFactura);

    // Fecha de emisión
    if not unqryFacturas.FieldByName('FECHA_FACTURA').IsNull then
      IdObj.AddPair('issuedTime', FormatDateTime('yyyy-mm-dd',
                         unqryFacturas.FieldByName('FECHA_FACTURA').AsDateTime))
    else
      IdObj.AddPair('issuedTime', FormatDateTime('yyyy-mm-dd', Now));

    InvoiceObj.AddPair('id', IdObj);
//    if bEsSimpl then
//      InvoiceObj.AddPair('type', 'F2')
//    else
//      InvoiceObj.AddPair('type', 'F1');
    DescriptionObj := TJSONObject.Create;

    DescriptionObj.AddPair('text',
                               'Factura ' + SerieFactura + '/' + NumeroFactura);

    // Operation Date (misma fecha que la factura)
    if not unqryFacturas.FieldByName('FECHA_FACTURA').IsNull then
      DescriptionObj.AddPair('operationDate', FormatDateTime('yyyy-mm-dd',
                         unqryFacturas.FieldByName('FECHA_FACTURA').AsDateTime))
    else
      DescriptionObj.AddPair('operationDate', FormatDateTime('yyyy-mm-dd', Now));
    InvoiceObj.AddPair('description', DescriptionObj);
    // --- TYPE (Tipo de factura) ---
    if bEsSimpl then
      InvoiceObj.AddPair('type', 'F2')
    else
      InvoiceObj.AddPair('type', 'F1');

    // --- VAT LINES (Líneas de IVA) ---
    VatLinesArray := TJSONArray.Create;
    VatLineObj := TJSONObject.Create;
    VatLineObj.AddPair('vatOperation', 'E1'); // Valor por defecto
    // Base imponible (usar el total líquido)
    if not unqryFacturas.FieldByName('TOTAL_LIQUIDO_FACTURA').IsNull then
      VatLineObj.AddPair('base',
      TJSONNumber.Create
                   (unqryFacturas.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat))
    else
      VatLineObj.AddPair('base', TJSONNumber.Create(0));
    VatLineObj.AddPair('rate', TJSONNumber.Create(0)); // IVA 0% por defecto
    VatLineObj.AddPair('amount', TJSONNumber.Create(0)); // Importe IVA 0
    VatLineObj.AddPair('vatKey', '01'); // Clave por defecto
    VatLinesArray.AddElement(VatLineObj);
    InvoiceObj.AddPair('vatLines', VatLinesArray);
    // --- TOTAL y AMOUNT ---
    if not unqryFacturas.FieldByName('TOTAL_LIQUIDO_FACTURA').IsNull then
    begin
      InvoiceObj.AddPair('total', TJSONNumber.Create(
                   unqryFacturas.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat));
      InvoiceObj.AddPair('amount', TJSONNumber.Create(0)); // IVA = 0
    end
    else
    begin
      InvoiceObj.AddPair('total', TJSONNumber.Create(0));
      InvoiceObj.AddPair('amount', TJSONNumber.Create(0));
    end;
    // Agregar el objeto invoice al JSON principal
    JSONToSend.AddPair('invoice', InvoiceObj);

    mseBody.Text := JSONToSend.Format;
    showmessage('JSON Body Creado correctamente');
  except
    on E: Exception do
      ShowMessage('Error generando JSON: ' + E.Message);
  end;
end;

procedure TForm1.btnCallWSClick(Sender: TObject);
begin
  AsignarDatosBasicos;
  rstReqRequest.ClearBody;
  rstReqRequest.AddBody(mseBody.text, ctAPPLICATION_JSON);
  rstReqRequest.Execute;
  mseDialog.Text := rstResResponse.Content + '   ' + mseDialog.Text;
  ProcesarRespuestaCompleta;
end;

// Procedimiento para procesar la respuesta del webservice
procedure TForm1.ProcesarRespuestaWebService(const JSONRespuesta: string;
                                     SerieFactura: string;
                                     NumeroFactura: Integer;
                                     qryConsolidacion: TUniQuery);
  //Función para convertir fecha ISO8601 a TDateTime
function IsoToDate(DateTimeStr: string): TDateTime;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings := TFormatSettings.Create;
  FormatSettings.DateSeparator := '-';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  FormatSettings.ShortTimeFormat := 'hh:nn:ss';
  try
    // Remover la 'T' y la 'Z' o información de zona horaria
    Result := StrToDateTime(StringReplace(
        StringReplace(DateTimeStr, 'T', ' ', []), 'Z', '', []), FormatSettings);
  except
    Result := Now; // Valor por defecto si hay error
  end;
end;

var
  JSONResponse: TJSONObject;
  ChainInfo: TJSONObject;
  Base64QR: string;
  QRImage: TPngImage;
  Stream: TStringStream;
  MemStream: TMemoryStream;
  dFecha:TDateTime;
begin
  try
    // Parsear JSON de respuesta
    JSONResponse := TJSONObject.ParseJSONValue(JSONRespuesta) as TJSONObject;
    if JSONResponse = nil then
      raise Exception.Create('Respuesta JSON inválida');
    try
      // Extraer chainInfo
      ChainInfo := JSONResponse.GetValue('chainInfo') as TJSONObject;
      if ChainInfo = nil then
        raise Exception.Create('No se encontró chainInfo en la respuesta');
      // Asignar parámetros básicos
      qryConsolidacion.Insert;
      qryConsolidacion.FieldByName('SERIE_FACTURA').AsString := SerieFactura;
      qryConsolidacion.FieldByName('NRO_FACTURA').AsInteger := NumeroFactura;
      qryConsolidacion.FieldByName('ESTADO').AsString := 'PROCESADO';
      // Extraer y asignar campos de la respuesta
      if JSONResponse.GetValue('requestId') <> nil then
        qryConsolidacion.FieldByName('REQUEST_ID').AsString := JSONResponse.GetValue('requestId').Value
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
      qryConsolidacion.FieldByName('FECHA_PROCESAMIENTO').AsDateTime := Now;
      // QR Code en Base64
      if JSONResponse.GetValue('qrcode') <> nil then
        qryConsolidacion.FieldByName('QRCODE_BASE64').AsString :=
                                           JSONResponse.GetValue('qrcode').Value
      else
        qryConsolidacion.FieldByName('QRCODE_BASE64').Clear;
      //decodifico el qr y lo guardo como imagen
      var PngImage: TPngImage;
      var DecodedStream: TMemoryStream;
      var Base64Data : String := JSONResponse.GetValue('qrcode').Value;
      var Base64Clean : String;
      if Pos('data:image/png;base64,', Base64Data) = 1 then
        Base64Clean := Copy(Base64Data, 23, Length(Base64Data));
      DecodedStream := TMemoryStream.Create;
      var  DecodedBytes: TBytes;
      DecodedBytes := TNetEncoding.Base64.DecodeStringToBytes(Base64Clean);
      DecodedStream.WriteBuffer(DecodedBytes, Length(DecodedBytes));
      DecodedStream.Position := 0;
      // Cargar imagen PNG
      PngImage := TPngImage.Create;
      try
        PngImage.LoadFromStream(DecodedStream);
        //ImageControl.Picture.Assign(PngImage);
        (qryConsolidacion.FieldByName('QRCODE_PNG') as
                                      TBlobField).LoadFromStream(DecodedStream);
        qryConsolidacion.FieldByName('RESPUESTA_COMPLETA').AsString :=
                                                                  JSONRespuesta;
        qryConsolidacion.FieldByName('PETICION_COMPLETA').AsString :=
                                                                   mseBody.text;
        qryConsolidacion.Post;
      finally
        PngImage.Free;
        DecodedStream.Free;
      end;
    finally
      JSONResponse.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error procesando respuesta del webservice: ' +
                             E.Message);
  end;
end;

procedure TForm1.ProcesarRespuestaCompleta;
var
  RespuestaJSON: string;
  SerieFactura: string;
  NumeroFactura: Integer;
begin
  // Ejemplo de respuesta (la que proporcionaste)
  RespuestaJSON := rstResResponse.Content;

  // Obtener datos de la factura actual
  SerieFactura := unqryFacturas.FieldByName('SERIE_FACTURA').AsString;
  NumeroFactura := unqryFacturas.FieldByName('NRO_FACTURA').AsInteger;

  try
    // Procesar respuesta y guardar en base de datos
    ProcesarRespuestaWebService(RespuestaJSON,
                                SerieFactura,
                                NumeroFactura,
                                unqryConsolidacion);

    // Cargar datos de consolidación recién insertados
    // CargarDatosConsolidacion(SerieFactura, NumeroFactura);

    ShowMessage('Respuesta procesada correctamente');

  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

end.
