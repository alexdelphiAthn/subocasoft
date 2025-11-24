unit inLibJSONState;

interface
uses
  System.JSON, System.SysUtils, System.Classes;
type
  TVerificationState = (vsVerified, vsPending, vsErrorFatal, vsUnknown);
  TStateHandler = class
  private
    function ParseJSONResponse(const JSONString: string): TJSONObject;
    function GetStateFromJSON(JSONObj: TJSONObject): string;
    function GetErrorMessage(JSONObj: TJSONObject): string;
    function GetErrorCode(JSONObj: TJSONObject): string;
  public
    function ProcessResponse(const JSONResponse: string): TVerificationState;
    function GetStateDescription(State: TVerificationState): string;
    procedure HandleResponse(const JSONResponse: string;
                            out State: TVerificationState; out Message: string);
    procedure HandleResponseWithCode(const JSONResponse: string;
                                     var State: TVerificationState;
                                     var sMessage: string;
                                     var sErrorCode: string);
  end;
implementation
{ TStateHandler }
function TStateHandler.ParseJSONResponse(const JSONString: string): TJSONObject;
begin
  Result := nil;
  try
    Result := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  except
    on E: Exception do
    begin
      // Log error si es necesario
      Result := nil;
    end;
  end;
end;

function TStateHandler.GetStateFromJSON(JSONObj: TJSONObject): string;
var
  StateValue: TJSONValue;
begin
  Result := '';
  if Assigned(JSONObj) then
  begin
    StateValue := JSONObj.GetValue('state');
    if Assigned(StateValue) then
      Result := StateValue.Value;
  end;
end;

function TStateHandler.GetErrorMessage(JSONObj: TJSONObject): string;
var
  ResponsesArray: TJSONArray;
  FirstResponse: TJSONObject;
  MessageValue: TJSONValue;
begin
  Result := '';
  if Assigned(JSONObj) then
  begin
    ResponsesArray := JSONObj.GetValue('responses') as TJSONArray;
    if Assigned(ResponsesArray) and (ResponsesArray.Count > 0) then
    begin
      FirstResponse := ResponsesArray.Items[0] as TJSONObject;
      if Assigned(FirstResponse) then
      begin
        MessageValue := FirstResponse.GetValue('message');
        if Assigned(MessageValue) then
          Result := MessageValue.Value;
      end;
    end;
  end;
end;

function TStateHandler.GetErrorCode(JSONObj: TJSONObject): string;
var
  ResponsesArray: TJSONArray;
  FirstResponse: TJSONObject;
  CodeValue: TJSONValue;
begin
  Result := '';
  if Assigned(JSONObj) then
  begin
    ResponsesArray := JSONObj.GetValue('responses') as TJSONArray;
    if Assigned(ResponsesArray) and (ResponsesArray.Count > 0) then
    begin
      FirstResponse := ResponsesArray.Items[0] as TJSONObject;
      if Assigned(FirstResponse) then
      begin
        CodeValue := FirstResponse.GetValue('code');
        if Assigned(CodeValue) then
          Result := CodeValue.Value;
      end;
    end;
  end;
end;

function TStateHandler.ProcessResponse(const JSONResponse: string):
                                                             TVerificationState;
var
  JSONObj: TJSONObject;
  State: string;
begin
  Result := vsUnknown;
  JSONObj := ParseJSONResponse(JSONResponse);
  try
    if Assigned(JSONObj) then
    begin
      State := GetStateFromJSON(JSONObj);
      if SameText(State, 'sent') then
        Result := vsVerified
      else if SameText(State, 'pending') then
        Result := vsPending
      else if SameText(State, 'error') then
        Result := vsErrorFatal
      else
        Result := vsUnknown;
    end;
  finally
    if Assigned(JSONObj) then
      JSONObj.Free;
  end;
end;

function TStateHandler.GetStateDescription(State: TVerificationState): string;
begin
  case State of
    vsVerified: Result := 'Verificada';
    vsPending: Result := 'Pendiente de verificación';
    vsErrorFatal: Result := 'ERROR FATAL';
    vsUnknown: Result := 'Estado desconocido';
  end;
end;

procedure TStateHandler.HandleResponse(const JSONResponse: string; out State: TVerificationState; out Message: string);
var
  JSONObj: TJSONObject;
begin
  State := vsUnknown;
  Message := '';
  JSONObj := ParseJSONResponse(JSONResponse);
  try
    if Assigned(JSONObj) then
    begin
      State := ProcessResponse(JSONResponse);
      case State of
        vsVerified:
          Message := 'Documento verificado correctamente';
        vsPending:
          Message := 'Documento pendiente de verificación';
        vsErrorFatal:
          begin
            Message := 'ERROR FATAL: ' + GetErrorMessage(JSONObj);
            if Message = 'ERROR FATAL: ' then
              Message := 'ERROR FATAL: Error no especificado';
          end;
        vsUnknown:
          Message := 'Estado de respuesta no reconocido';
      end;
    end
    else
    begin
      State := vsErrorFatal;
      Message := 'ERROR FATAL: No se pudo procesar la respuesta JSON';
    end;
  finally
    if Assigned(JSONObj) then
      JSONObj.Free;
  end;
end;

procedure TStateHandler.HandleResponseWithCode(const JSONResponse: string;
                                               var State: TVerificationState;
                                               var sMessage: string;
                                               var sErrorCode: string);
var
  JSONObj: TJSONObject;
begin
  State := vsUnknown;
  sMessage := '';
  sErrorCode := '';
  JSONObj := ParseJSONResponse(JSONResponse);
  try
    if Assigned(JSONObj) then
    begin
      State := ProcessResponse(JSONResponse);
      case State of
        vsVerified:
          sMessage := 'Documento verificado correctamente';
        vsPending:
          sMessage := 'Documento pendiente de verificación';
        vsErrorFatal:
          begin
            sErrorCode := GetErrorCode(JSONObj);
            sMessage := 'ERROR FATAL: ' + GetErrorMessage(JSONObj);
            if sMessage = 'ERROR FATAL: ' then
              sMessage := 'ERROR FATAL: Error no especificado';
          end;
        vsUnknown:
          sMessage := 'Estado de respuesta no reconocido';
      end;
    end
    else
    begin
      State := vsErrorFatal;
      sMessage := 'ERROR FATAL: No se pudo procesar la respuesta JSON';
      sErrorCode := 'JSON_PARSE_ERROR';
    end;
  finally
    if Assigned(JSONObj) then
      JSONObj.Free;
  end;
end;
end.

