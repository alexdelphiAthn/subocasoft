unit inLibJSON;

interface

uses System.SysUtils, System.JSON, Uni, inMtoPrincipal;

type

  TVerifactuErrorInfo = record
    Code: string;
    Description: string;
    UserMessage: string;
    IsTemporary: Boolean;
    RequiresSubsanation: Boolean;
  end;

TVerifactuErrorHandler = class
private
  class function GetErrorInfo(const sErrorCode: string): TVerifactuErrorInfo;
public
  class procedure HandleVerifactuError(const sErrorCode, sMessage, sResponse: string;
                                      const sSerie: string; const iNumero: Integer);
  class function IsTemporaryError(const sErrorCode: string): Boolean;
  class function RequiresSubsanation(const sErrorCode: string): Boolean;
end;

//function BuildJSON(NumeroFactura, SerieFactura:String):String;

implementation

(*function BuildJSON(NumeroFactura, SerieFactura:String):String;
var
  JSONToSend: TJSONObject;
  InvoiceObj: TJSONObject;
  RecipienTForm1: TJSONObject;
  IdObj: TJSONObject;
  DescriptionObj: TJSONObject;
  VatLinesArray: TJSONArray;
  VatLineObj: TJSONObject;
  //NumeroFactura, SerieFactura: string;
  bEsSimpl:Boolean;
  sPaisCliente:String;
  unqryFac, unqryLinFac:TUniQuery;
  sTipoId:String;
  sIdType: String; // Nueva variable para el tipo de ID
begin
  unqryFac := TUniQuery.Create(nil);
  unqryLinFac := TUniQuery.Create(nil);
  unqryFac.Connection := frmOpenApp.FDmConn.conUni;
  unqryLinFac.Connection := frmOpenApp.FDmConn.conUni;
  unqryFac.SQL.Text := 'SELECT * FROM suboc_facturas ' +
                       ' WHERE NRO_FACTURA = :NRO_FACTURA ' +
                       '   AND SERIE_FACTURA = :SERIE_FACTURA';
  unqryFac.Prepare;
  unqryFac.ParamByName('NRO_FACTURA').AsString := NumeroFactura;
  unqryFac.ParamByName('SERIE_FACTURA').AsString := SerieFactura;
  unqryFac.Open;

  unqryLinFac.SQL.Text := 'SELECT * ' +
                          '  FROM suboc_facturas_lineas '  +
                          ' WHERE NRO_FACTURA_LINEA = :NRO_FACTURA ' +
                          '  AND SERIE_FACTURA_LINEA = :SERIE_FACTURA ' +
            '  AND CAST(LINEA_LINEA AS INT) = ( ' +
            '                     SELECT MIN(CAST(LINEA_LINEA AS INT)) ' +
            '                       FROM suboc_facturas_lineas ' +
            '                      WHERE NRO_FACTURA_LINEA =:NRO_FACTURA ' +
            '                        AND SERIE_FACTURA_LINEA = :SERIE_FACTURA)';
  unqryLinFac.Prepare;
  unqryLinFac.ParamByName('NRO_FACTURA').AsString := NumeroFactura;
  unqryLinFac.ParamByName('SERIE_FACTURA').AsString := SerieFactura;
  unqryLinFac.Open;

  sPaisCliente := unqryFac.FieldByName('PAIS_CLIENTE_FACTURA').AsString;
  sTipoId := unqryFac.FieldByName('TIPOID_INT_CLIENTE_FACTURA').AsString;
  JSONToSend := TJSONObject.Create;
  try
    // Crear objeto principal de la factura
    InvoiceObj := TJSONObject.Create;
    bEsSimpl := (unqryFac.FieldByName('ESSIMPL_FACTURA').AsString = 'S');
    if not(bEsSimpl) then
    begin
      // --- RECIPIENT (Datos del cliente) ---
      RecipienTForm1 := TJSONObject.Create;
      // Lógica diferente según sea nacional o internacional
      if sPaisCliente = 'ES' then
      begin
        // Para facturas nacionales (España) - usar irsId
        if not unqryFac.FieldByName('NIF_CLIENTE_FACTURA').IsNull then
          RecipienTForm1.AddPair('irsId',
                          unqryFac.FieldByName('NIF_CLIENTE_FACTURA').AsString)
        else
          RecipienTForm1.AddPair('irsId', '');
      end
      else
      begin
        // Para facturas internacionales - usar id + idType
        if not unqryFac.FieldByName('NIF_CLIENTE_FACTURA').IsNull then
          RecipienTForm1.AddPair('id',
                          unqryFac.FieldByName('NIF_CLIENTE_FACTURA').AsString)
        else
          RecipienTForm1.AddPair('id', '');
        // Determinar el tipo de ID para internacionales
        if UpperCase(sTipoId) = 'ID' then
          sIdType := '04'  // IDEnPaisResidencia
        else if Pos('PASAPORTE', UpperCase(sTipoId)) > 0 then
          sIdType := '03'  // Pasaporte
        else
          sIdType := '06'; // Otro documento probatorio
        RecipienTForm1.AddPair('idType', sIdType);
      end;
      // Name (Razón social del cliente)
      if not unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').IsNull then
        RecipienTForm1.AddPair('name',
                unqryFac.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString)
      else
        RecipienTForm1.AddPair('name', '');
      // Country (País del cliente)
      if sPaisCliente <> '' then
        RecipienTForm1.AddPair('country', sPaisCliente)
      else
        RecipienTForm1.AddPair('country', 'ES'); // Valor por defecto España
      InvoiceObj.AddPair('recipient', RecipienTForm1);
    end;
    // --- ID (Identificación de la factura) ---
    IdObj := TJSONObject.Create;
    IdObj.AddPair('number', SerieFactura + '/' + NumeroFactura);
    // Fecha de emisión
    if not unqryFac.FieldByName('FECHA_FACTURA').IsNull then
      IdObj.AddPair('issuedTime', FormatDateTime('yyyy-mm-dd',
                         unqryFac.FieldByName('FECHA_FACTURA').AsDateTime))
    else
      IdObj.AddPair('issuedTime', FormatDateTime('yyyy-mm-dd', Now));
    InvoiceObj.AddPair('id', IdObj);
    DescriptionObj := TJSONObject.Create;
    DescriptionObj.AddPair('text',
        unqryLinFac.FieldByName('DESCRIPCION_ARTICULO_LINEA').AsString);
    // Operation Date (misma fecha que la factura)
    if not unqryFac.FieldByName('FECHA_FACTURA').IsNull then
      DescriptionObj.AddPair('operationDate', FormatDateTime('yyyy-mm-dd',
                         unqryFac.FieldByName('FECHA_FACTURA').AsDateTime))
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
    if not unqryFac.FieldByName('TOTAL_LIQUIDO_FACTURA').IsNull then
      VatLineObj.AddPair('base',
      TJSONNumber.Create
                   (unqryFac.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat))
    else
      VatLineObj.AddPair('base', TJSONNumber.Create(0));
    VatLineObj.AddPair('rate', TJSONNumber.Create(0)); // IVA 0% por defecto
    VatLineObj.AddPair('amount', TJSONNumber.Create(0)); // Importe IVA 0
    VatLineObj.AddPair('vatKey', '01'); // Clave por defecto
    VatLinesArray.AddElement(VatLineObj);
    InvoiceObj.AddPair('vatLines', VatLinesArray);
    // --- TOTAL y AMOUNT ---
    if not unqryFac.FieldByName('TOTAL_LIQUIDO_FACTURA').IsNull then
    begin
      InvoiceObj.AddPair('total', TJSONNumber.Create(
                   unqryFac.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat));
      InvoiceObj.AddPair('amount', TJSONNumber.Create(0)); // IVA = 0
    end
    else
    begin
      InvoiceObj.AddPair('total', TJSONNumber.Create(0));
      InvoiceObj.AddPair('amount', TJSONNumber.Create(0));
    end;
    // Agregar el objeto invoice al JSON principal
    JSONToSend.AddPair('invoice', InvoiceObj);

    Result := JSONToSend.Format;
    //showmessage('JSON Body Creado correctamente');
  except
    on E: Exception do
      raise Exception.Create('Error generando JSON: ' + E.Message);
  end;
end;  *)

class function TVerifactuErrorHandler.GetErrorInfo(
                                 const sErrorCode: string): TVerifactuErrorInfo;
begin
  // Inicializar valores por defecto
  Result.Code := sErrorCode;
  Result.IsTemporary := False;
  Result.RequiresSubsanation := False;
  if sErrorCode = '1110' then
  begin
    Result.Description := 'NIF/CIF no válido o no encontrado en censo AEAT';
    Result.UserMessage := 'El NIF/CIF del cliente no es válido o no está registrado en Hacienda';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1115' then
  begin
    Result.Description := 'Razón social no coincide con NIF en censo AEAT';
    Result.UserMessage := 'La razón social no coincide con el NIF registrado en Hacienda';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1120' then
  begin
    Result.Description := 'Error en validación de campos obligatorios';
    Result.UserMessage := 'Faltan datos obligatorios en la factura';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1130' then
  begin
    Result.Description := 'Fecha de factura posterior a fecha actual';
    Result.UserMessage := 'La fecha de la factura no puede ser posterior a hoy';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1131' then
  begin
    Result.Description := 'Fecha de factura muy antigua (más de 20 años)';
    Result.UserMessage := 'La fecha de la factura es demasiado antigua';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1140' then
  begin
    Result.Description := 'Error en cálculo de IVA';
    Result.UserMessage := 'Los importes de IVA no son correctos';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1142' then
  begin
    Result.Description := 'Diferencia superior a 10€ en cálculo de IVA';
    Result.UserMessage := 'Hay una diferencia significativa en el cálculo del IVA';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '1150' then
  begin
    Result.Description := 'Factura simplificada supera límite de 3.000€';
    Result.UserMessage := 'Las facturas simplificadas no pueden superar los 3.000€';
    Result.RequiresSubsanation := True;
  end
  else if sErrorCode = '2001' then
  begin
    Result.Description := 'Servicio temporalmente no disponible';
    Result.UserMessage := 'El servicio de Hacienda no está disponible temporalmente. Reintente más tarde';
    Result.IsTemporary := True;
  end
  else if sErrorCode = '2002' then
  begin
    Result.Description := 'Error de comunicación con AEAT';
    Result.UserMessage := 'Error de comunicación con Hacienda. Reintente en unos minutos';
    Result.IsTemporary := True;
  end
  else if sErrorCode = '3010' then
  begin
    Result.Description := 'Factura duplicada';
    Result.UserMessage := 'Esta factura ya ha sido enviada anteriormente';
    Result.RequiresSubsanation := False;
  end
  else if sErrorCode = '3011' then
  begin
    Result.Description := 'Certificado digital expirado';
    Result.UserMessage := 'El certificado digital ha caducado. Renueve su certificado';
    Result.RequiresSubsanation := False;
  end
  else
  begin
    Result.Description := 'Error no catalogado: ' + sErrorCode;
    Result.UserMessage := 'Error desconocido. Código: ' + sErrorCode;
    Result.RequiresSubsanation := False;
  end;
end;

class procedure TVerifactuErrorHandler.HandleVerifactuError(
  const sErrorCode, sMessage, sResponse: string;
  const sSerie: string; const iNumero: Integer);
var
  ErrorInfo: TVerifactuErrorInfo;
  sCompleteMessage: string;
begin
  ErrorInfo := GetErrorInfo(sErrorCode);
  // Construir mensaje completo
  sCompleteMessage := ErrorInfo.UserMessage;
  if ErrorInfo.RequiresSubsanation then
    sCompleteMessage := sCompleteMessage + ' ' +
                       'Esta factura requiere subsanación para ser corregida.';
  if ErrorInfo.IsTemporary then
    sCompleteMessage := sCompleteMessage + ' ' +
                       'Este es un error temporal. Puede reintentar más tarde.';
  // Mostrar al usuario
  //ShowMessage(Format('Error %s: %s', [sErrorCode, sCompleteMessage]));
  // Registrar en log
  frmOpenApp.VeriFactuLog.RegistrarError(
    Format('ERROR VERIFACTU [%s]: %s',
           [sErrorCode, sCompleteMEssage]),
            sResponse, sSerie, iNumero);
end;
class function TVerifactuErrorHandler.IsTemporaryError(const sErrorCode: string): Boolean;
var
  ErrorInfo: TVerifactuErrorInfo;
begin
  ErrorInfo := GetErrorInfo(sErrorCode);
  Result := ErrorInfo.IsTemporary;
end;
class function TVerifactuErrorHandler.RequiresSubsanation(const sErrorCode: string): Boolean;
var
  ErrorInfo: TVerifactuErrorInfo;
begin
  ErrorInfo := GetErrorInfo(sErrorCode);
  Result := ErrorInfo.RequiresSubsanation;
end;


end.
