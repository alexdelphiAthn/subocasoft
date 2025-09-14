unit inLibWin;

interface

uses
   inMtoPrincipal, Classes, Windows, Forms, jpeg, System.SysUtils,
   System.Net.HttpClient, system.Math,
   idhttp, Vcl.Dialogs,System.Win.Registry, ShellAPI, Winapi.Messages;

type

  TEncodingInfo = record
    Encoding: TEncoding;
    Name: string;
    HasBOM: Boolean;
  end;

  function IsOpenMDI(sCaptionName: String; Owner : TComponent):boolean;
  function EncontrarObjeto(oControl:TComponent; sBusquedaTipo:String):TObject; overload;
  function EncontrarObjeto(oControl:TComponent; sBusquedaTipo:String; sNameObject:String):TObject; overload;

  function GetVolumeID(DriveChar: Char): String;
  function FindFormOwner(oSender: TObject):TComponent;
  procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
  procedure GetImageURL(sUrl: String; var memStream: TMemoryStream);
  procedure ExecuteAndWait(const aCommando: string);
  function GetComputerName: string;
  function GetProgramPath: string;
  function GetWindowsUserName: string;
  function GetWindowsVersion: string;
  function HayInternet:Boolean;
  function HayInternetConPing: Boolean;
  function IsWebServiceUp(const AUrl: string): Boolean;
  function GetTextFile(const rutaArchivo: string): string;
  function DetectarBOM(const rutaArchivo: string): TEncodingInfo;
  function EsProbablementeUTF8(const rutaArchivo: string): Boolean;
  function DetectarEncodingCompleto(const rutaArchivo: string): TEncodingInfo;
implementation

uses
  WinInet, IOUtils;

function GetTextFile(const rutaArchivo: string): string;
var
  contenido: TStringList;
begin
  Result := '';

  if not FileExists(rutaArchivo) then
  begin
    ShowMessage('El archivo no existe: ' + rutaArchivo);
    Exit;
  end;
  contenido := TStringList.Create;
  try
    try
      // Especificar codificaci�n UTF-8 si es necesario
      contenido.LoadFromFile(rutaArchivo);
      Result := contenido.Text;
    except
      on E: Exception do
        ShowMessage('Error al leer el archivo: ' + E.Message);
    end;
  finally
    contenido.Free;
  end;
end;

function HayInternet: Boolean;
var
  dwConnectionTypes: DWORD;
begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM +
                      INTERNET_CONNECTION_LAN +
                      INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

// Versi�n alternativa m�s robusta que hace ping a un servidor
function HayInternetConPing: Boolean;
var
  hSession, hConnection, hRequest: HINTERNET;
begin
  Result := False;
  hSession := InternetOpen('Internet Check',
                           INTERNET_OPEN_TYPE_PRECONFIG,
                           nil,
                           nil,
                           0);
  if hSession <> nil then
  begin
    try
      hConnection := InternetConnect(hSession,
                                     PWideChar('www.google.com'),
                                     INTERNET_DEFAULT_HTTP_PORT,
                                     '',
                                     '',
                                     INTERNET_SERVICE_HTTP,
                                     0,
                                     0);
      if hConnection <> nil then
      begin
        try
          hRequest := HttpOpenRequest(hConnection,
                                      'HEAD', '/', nil, nil, nil,
                                    INTERNET_FLAG_RELOAD, 0);
          if hRequest <> nil then
          begin
            try
              Result := HttpSendRequest(hRequest, nil, 0, nil, 0);
            finally
              InternetCloseHandle(hRequest);
            end;
          end;
        finally
          InternetCloseHandle(hConnection);
        end;
      end;
    finally
      InternetCloseHandle(hSession);
    end;
  end;
end;

function IsWebServiceUp(const AUrl: string): Boolean;
var
  HttpClient: THTTPClient;
  Response: IHTTPResponse;
begin
  Result := False;
  HttpClient := THTTPClient.Create;
  try
    HttpClient.ConnectionTimeout := 5000;  // 5 segundos
    HttpClient.ResponseTimeout := 10000;   // 10 segundos
    try
      Response := HttpClient.Head(AUrl);
      Result := (Response.StatusCode >= 200) and (Response.StatusCode < 400);
    except
      Result := False;
    end;
  finally
    HttpClient.Free;
  end;
end;

//// Ejemplo de uso
//procedure TForm1.Button1Click(Sender: TObject);
//begin
//  if HayInternet then
//    ShowMessage('Hay conexi�n a Internet')
//  else
//    ShowMessage('No hay conexi�n a Internet');
//
//  // Para la versi�n m�s robusta:
//  if HayInternetConPing then
//    ShowMessage('Hay conexi�n real a Internet')
//  else
//    ShowMessage('No hay conexi�n real a Internet');
//end;

function GetComputerName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: DWORD;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  if Winapi.Windows.GetComputerName(Buffer, Size) then
    Result := Buffer
  else
    Result := 'Unknown';
end;

function GetWindowsUserName: string;
var
  Buffer: array[0..255] of Char;
  Size: DWORD;
begin
  Size := 256;
  if Winapi.Windows.GetUserName(Buffer, Size) then
    Result := Buffer
  else
    Result := 'Unknown';
end;

function GetProgramPath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function GetWindowsVersion: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
    begin
      Result := Reg.ReadString('ProductName');
      if Reg.ValueExists('DisplayVersion') then
        Result := Result + ' ' + Reg.ReadString('DisplayVersion')
      else if Reg.ValueExists('ReleaseId') then
        Result := Result + ' ' + Reg.ReadString('ReleaseId');
    end
    else
      Result := 'Unknown';
  finally
    Reg.Free;
  end;
end;


procedure ExecuteAndWait(const aCommando: string);
var
  tmpStartupInfo: TStartupInfo;
  tmpProcessInformation: TProcessInformation;
  tmpProgram: String;
begin
  tmpProgram := trim(aCommando);
  FillChar(tmpStartupInfo, SizeOf(tmpStartupInfo), 0);
  with tmpStartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    wShowWindow := SW_HIDE;
  end;

  if CreateProcess(nil, pchar(tmpProgram), nil, nil, true, CREATE_NO_WINDOW,
    nil, nil, tmpStartupInfo, tmpProcessInformation) then
  begin
    // loop every 10 ms
    while WaitForSingleObject(tmpProcessInformation.hProcess, 10) > 0 do
    begin
      Application.ProcessMessages;
    end;
    CloseHandle(tmpProcessInformation.hProcess);
    CloseHandle(tmpProcessInformation.hThread);
  end
  else
  begin
    RaiseLastOSError;
  end;
end;

procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
var
  NewDateTime: TSystemTime;
begin
  FillChar(NewDateTime, SizeOf(NewDateTime), #0);

  NewDateTime.wYear := Year;
  NewDateTime.wMonth := Month;
  NewDateTime.wDay := Day;
  NewDateTime.wHour := Hour;
  NewDateTime.wMinute := Minu;
  NewDateTime.wSecond := Sec;
  NewDateTime.wMilliseconds := MSec;
  SetLocalTime(NewDateTime);
end;

function GetVolumeID(DriveChar: Char): String;
var
   MaxFileNameLength, VolFlags, SerNum: DWord;
begin
   if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0,
      @SerNum, MaxFileNameLength, VolFlags, nil, 0)
   then
   begin
     Result := IntToHex(SerNum,8);
     Insert('-', Result, 5);
   end
   else
       Result := '';
end;

function FindFormOwner(oSender: TObject):TComponent;
begin
  while not oSender.InheritsFrom(TForm) do
    oSender := TObject((oSender as TComponent).Owner);
  if Assigned(oSender) then
    Result := (oSender as Tcomponent);

end;

function IsOpenMDI(sCaptionName: String; Owner : TComponent):boolean;
var
  i       : Integer;
  bfound  : boolean;
begin
  bfound := false;
    for i:= 0 to frmOpenApp.MDIChildCount - 1 do
      if frmOpenApp.MDIChildren[i].Caption = sCaptionName then
      begin
        bFound := true;
        frmOpenApp.MDIChildren[i].BringToFront  ;
      end;
  Result := bFound;
end;

function EncontrarObjeto(oControl:TComponent; sBusquedaTipo:String):TObject; overload;
var
  i:Integer;
begin
    for i := 0 to oControl.ComponentCount - 1 do
      if oControl.Components[i].ClassName = sBusquedaTipo then
        Result := oControl.Components[i];
end;

function EncontrarObjeto(oControl:TComponent; sBusquedaTipo:String; sNameObject:STring):TObject; overload;
var
  i:Integer;

begin
    for i := 0 to oControl.ComponentCount - 1 do
      if oControl.Components[i].ClassName = sBusquedaTipo then
        if oControl.Components[i].Name = sNameObject then
          Result := oControl.Components[i];
end;

procedure GetImageURL(sUrl: String; var memStream: TMemoryStream);
var
  strStream: String;

  //jpegimg: TJPEGImage;
  idhttp1 : Tidhttp;
begin
  idhttp1 := Tidhttp.Create(nil);
  try
   strStream :=  idhttp1.Get(sUrl);

  except
    Raise Exception.Create('La imagen no existe');
    Exit;
  end;
  memStream := TMemoryStream.Create;
  //jpegimg   := TJPEGImage.Create;
  try
    //memStream.CopyFrom(strStream, );
    memStream.Write(strStream[1], Length(strStream));
    memStream.Position := 0;
    //.Picture.Assign(jpegimg);
  finally
    //memStream.Free;
    //jpegimg.Free;
    idhttp1.Free;
  end;
end;

function DetectarEncodingCompleto(const rutaArchivo: string): TEncodingInfo;
var
  contenido: TStringList;
  detectedEncoding: TEncoding;
  bomInfo: TEncodingInfo;
begin
  // Valores por defecto
  Result.Encoding := TEncoding.Default;
  Result.Name := 'ANSI/Default';
  Result.HasBOM := False;

  if not FileExists(rutaArchivo) then
    Exit;

  // Primero detectar BOM manualmente
  bomInfo := DetectarBOM(rutaArchivo);

  if bomInfo.HasBOM then
  begin
    // Si tiene BOM, usar esa informaci�n
    Result := bomInfo;
  end
  else
  begin
    // Si no tiene BOM, intentar detecci�n autom�tica de Delphi
    contenido := TStringList.Create;
    try
      detectedEncoding := nil;
      contenido.LoadFromFile(rutaArchivo, detectedEncoding);

      if Assigned(detectedEncoding) then
      begin
        Result.Encoding := detectedEncoding;
        Result.HasBOM := False;

        if detectedEncoding = TEncoding.UTF8 then
          Result.Name := 'UTF-8 (sin BOM)'
        else if detectedEncoding = TEncoding.Unicode then
          Result.Name := 'UTF-16 LE (sin BOM)'
        else if detectedEncoding = TEncoding.BigEndianUnicode then
          Result.Name := 'UTF-16 BE (sin BOM)'
        else if detectedEncoding = TEncoding.Default then
        begin
          // Intentar detecci�n heur�stica de UTF-8
          if EsProbablementeUTF8(rutaArchivo) then
          begin
            Result.Encoding := TEncoding.UTF8;
            Result.Name := 'UTF-8 (detectado heur�sticamente)';
          end
          else
            Result.Name := 'ANSI/Default';
        end
        else
          Result.Name := 'Codificaci�n desconocida';
      end;

    finally
      contenido.Free;
    end;
  end;
end;

function DetectarBOM(const rutaArchivo: string): TEncodingInfo;
var
  stream: TFileStream;
  bom: array[0..3] of Byte;
  bytesLeidos: Integer;
begin
  Result.Encoding := nil;
  Result.Name := '';
  Result.HasBOM := False;

  stream := TFileStream.Create(rutaArchivo, fmOpenRead);
  try
    if stream.Size < 2 then
      Exit;

    bytesLeidos := stream.Read(bom, Min(4, stream.Size));

    // Verificar BOMs en orden de longitud (m�s largo primero)
//    if (bytesLeidos >= 4) and (bom[0] = $FF) and (bom[1] = $FE) and
//       (bom[2] = $00) and (bom[3] = $00) then
//    begin
//      // UTF-32 LE BOM
//      Result.Encoding := TEncoding.�.UTF32;
//      Result.Name := 'UTF-32 LE (con BOM)';
//      Result.HasBOM := True;
//    end   else
    if (bytesLeidos >= 4) and (bom[0] = $00) and (bom[1] = $00) and
            (bom[2] = $FE) and (bom[3] = $FF) then
    begin
      // UTF-32 BE BOM
      Result.Encoding := TEncoding.GetEncoding('UTF-32BE');
      Result.Name := 'UTF-32 BE (con BOM)';
      Result.HasBOM := True;
    end
    else if (bytesLeidos >= 3) and (bom[0] = $EF) and (bom[1] = $BB) and (bom[2] = $BF) then
    begin
      // UTF-8 BOM
      Result.Encoding := TEncoding.UTF8;
      Result.Name := 'UTF-8 (con BOM)';
      Result.HasBOM := True;
    end
    else if (bytesLeidos >= 2) and (bom[0] = $FF) and (bom[1] = $FE) then
    begin
      // UTF-16 LE BOM
      Result.Encoding := TEncoding.Unicode;
      Result.Name := 'UTF-16 LE (con BOM)';
      Result.HasBOM := True;
    end
    else if (bytesLeidos >= 2) and (bom[0] = $FE) and (bom[1] = $FF) then
    begin
      // UTF-16 BE BOM
      Result.Encoding := TEncoding.BigEndianUnicode;
      Result.Name := 'UTF-16 BE (con BOM)';
      Result.HasBOM := True;
    end;

  finally
    stream.Free;
  end;
end;

function EsProbablementeUTF8(const rutaArchivo: string): Boolean;
var
  stream: TFileStream;
  buffer: array[0..2047] of Byte; // Muestra m�s grande
  bytesLeidos, i, secuenciasUTF8, totalBytes: Integer;
  esValido: Boolean;
begin
  Result := False;
  secuenciasUTF8 := 0;
  totalBytes := 0;

  stream := TFileStream.Create(rutaArchivo, fmOpenRead);
  try
    bytesLeidos := stream.Read(buffer, SizeOf(buffer));
    if bytesLeidos = 0 then
      Exit;

    i := 0;
    esValido := True;

    while (i < bytesLeidos) and esValido do
    begin
      if buffer[i] < $80 then
      begin
        // ASCII v�lido
        Inc(i);
      end
      else if (buffer[i] and $E0) = $C0 then
      begin
        // Secuencia de 2 bytes UTF-8: 110xxxxx 10xxxxxx
        if (i + 1 < bytesLeidos) and ((buffer[i + 1] and $C0) = $80) then
        begin
          Inc(secuenciasUTF8);
          Inc(i, 2);
        end
        else
          esValido := False;
      end
      else if (buffer[i] and $F0) = $E0 then
      begin
        // Secuencia de 3 bytes UTF-8: 1110xxxx 10xxxxxx 10xxxxxx
        if (i + 2 < bytesLeidos) and
           ((buffer[i + 1] and $C0) = $80) and
           ((buffer[i + 2] and $C0) = $80) then
        begin
          Inc(secuenciasUTF8);
          Inc(i, 3);
        end
        else
          esValido := False;
      end
      else if (buffer[i] and $F8) = $F0 then
      begin
        // Secuencia de 4 bytes UTF-8: 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
        if (i + 3 < bytesLeidos) and
           ((buffer[i + 1] and $C0) = $80) and
           ((buffer[i + 2] and $C0) = $80) and
           ((buffer[i + 3] and $C0) = $80) then
        begin
          Inc(secuenciasUTF8);
          Inc(i, 4);
        end
        else
          esValido := False;
      end
      else
      begin
        // Byte inv�lido para UTF-8
        esValido := False;
      end;

      Inc(totalBytes);
    end;

    // Es probablemente UTF-8 si:
    // 1. Todas las secuencias son v�lidas
    // 2. Tiene al menos algunas secuencias UTF-8 multibyte
    // 3. O si no hay bytes > 127 (ASCII puro, compatible con UTF-8)
    Result := esValido and ((secuenciasUTF8 > 0) or (totalBytes > 0));

  finally
    stream.Free;
  end;
end;

end.

