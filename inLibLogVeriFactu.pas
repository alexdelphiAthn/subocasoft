unit inLibLogVeriFactu;

interface
uses
  System.SysUtils, System.Classes, System.Hash, System.JSON,
  System.Win.Registry, Winapi.Messages,
  Uni, MySQLUniProvider, MemDS, Winapi.Windows,  System.StrUtils,
  System.Generics.Collections, System.DateUtils, inLibVarGlob ;
type

  TVeriFactuEventType = (
    vfetArranqueSystem,
    vfetParadaSystem,
    vfetOperacionFactura,
    vfetError,
    vfetAccesoArchivo,
    vfetCambioConfig,
    vfetBackup,
    vfetIntegridad
  );

  TVeriFactuLogEntry = record
    ID: Integer;
    TimeStamp: TDateTime;
    TipoEvento: TVeriFactuEventType;
    Usuario: string;
    Version:string;
    Descripcion: string;
    DatosAdicionales: string;
    HashAnterior: string;
    HashPropio: string;
    FirmaDigital: string;
    function ToJSON: string;
  end;

  TVeriFactuLogComplement = class
  private
    FConnection: TUniConnection;
    FQuery: TUniQuery;
    function CalcularHashSHA256(const Datos: string): string;
    function ObtenerUltimoHash(iCont:Integer): string;
    function GenerarFirmaDigital(const HashEvento: string): string;
    function CrearDatosParaHash(const Entry: TVeriFactuLogEntry): string;
    function EventTypeToString(EventType: TVeriFactuEventType): string;
  public
    constructor Create;
    destructor Destroy; virtual;
    // Métodos principales
    function RegistrarEventoVeriFactu(TipoEvento: TVeriFactuEventType;
      Descripcion: string;
      const DatosAdicionales: string = '';
      Serie: string = ''; NumFactura:integer=0):String;
    function VerificarIntegridadCadena: Boolean;
    procedure RegistrarArranqueSystem;
    procedure RegistrarParadaSystem;
    procedure RegistrarOperacionFactura(Descripcion, Serie:String;
                                        NumFactura:Integer;
                                        DatosAdicionales:String='');
    procedure RegistrarError(Descripcion: string;
                             DatosAdicionales:string = '';
                             Serie: string='';
                             NumFactura:Integer=0);
    procedure RegistrarAccesoArchivo(NombreArchivo, TipoAcceso, DatosAdicionales: string);
    procedure RegistrarCambioConfiguracion(Parametro, ValorAnterior, ValorNuevo: string);
    procedure RegistrarBackup;
    function ObtenerEstadisticasTabla: string;
    function GetComputerName: string;
    function GetWindowsUserName: string;
  end;
implementation

uses
  inMtoPrincipal;

function TVeriFactuLogComplement.GetWindowsUserName: string;
var
  // Buffer para almacenar el nombre de usuario
  UserName: array[0..256] of Char;
  // Variable para almacenar la longitud del nombre de usuario
  UserNameLen: DWord;
begin
  // Inicializamos la longitud del buffer
  UserNameLen := 256 + 1;

  // Llamamos a la función de la API de Windows
  if GetUserName(UserName, UserNameLen) then
    // Si la función tiene éxito, asigna el resultado
    Result := string(UserName)
  else
    // Si falla, devuelve una cadena vacía o un mensaje de error
    Result := '';
end;
function TVeriFactuLogComplement.GetComputerName: string;
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

{ TVeriFactuLogEntry }
function TVeriFactuLogEntry.ToJSON: string;
var
  JsonObj: TJSONObject;
begin
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('id_log', TJSONNumber.Create(ID));
    JsonObj.AddPair('timestamp_log', DateToISO8601(TimeStamp));
    JsonObj.AddPair('tipo_evento_log', TJSONNumber.Create(Ord(TipoEvento)));
    JsonObj.AddPair('usuario_log', Usuario);
    JsonObj.AddPair('version_log', Version);
    JsonObj.AddPair('descripcion_log', Descripcion);
    JsonObj.AddPair('datos_adicionales_log', DatosAdicionales);
    JsonObj.AddPair('hash_anterior_log', HashAnterior);
    JsonObj.AddPair('hash_propio_log', HashPropio);
    JsonObj.AddPair('firma_digital_log', FirmaDigital);
    Result := JsonObj.ToString;
  finally
    JsonObj.Free;
  end;
end;

constructor TVeriFactuLogComplement.Create;
begin
  inherited Create;
  FConnection := frmOpenApp.FDmConn.conUni;
  FQuery := TUniQuery.Create(nil);
  FQuery.Connection := FConnection;
  if FConnection.Connected = false then
    Fconnection.Connect;
end;
destructor TVeriFactuLogComplement.Destroy;
begin
  FQuery.Free;
  FConnection.Free;
  inherited;
end;

function TVeriFactuLogComplement.CalcularHashSHA256(const Datos: string): string;
begin
  Result := THashSHA2.GetHashString(Datos, THashSHA2.TSHA2Version.SHA256);
end;

function TVeriFactuLogComplement.ObtenerUltimoHash(iCont:Integer): string;
begin
  Result := StringOfChar('0', 64); // Hash inicial
  FQuery.SQL.Text := ' SELECT hash_propio_log ' +
                     '   FROM suboc_verifactu_log_eventos ' +
                     '  WHERE id_log = :lastid' ;
  FQuery.ParamByName('lastid').AsInteger := iCont - 1;
  FQuery.Open;
  if not FQuery.IsEmpty then
    Result := FQuery.FieldByName('hash_propio_log').AsString;
  FQuery.Close;
end;

function TVeriFactuLogComplement.EventTypeToString(EventType: TVeriFactuEventType): string;
begin
  case EventType of
    vfetArranqueSystem: Result := 'ARRANQUE_SISTEMA';
    vfetParadaSystem: Result := 'PARADA_SISTEMA';
    vfetOperacionFactura: Result := 'OPERACION_FACTURA';
    vfetError: Result := 'ERROR_SISTEMA';
    vfetAccesoArchivo: Result := 'ACCESO_ARCHIVO';
    vfetCambioConfig: Result := 'CAMBIO_CONFIGURACION';
    vfetBackup: Result := 'BACKUP';
    vfetIntegridad: Result := 'VERIFICACION_INTEGRIDAD';
  else
    Result := 'EVENTO_DESCONOCIDO';
  end;
end;

function TVeriFactuLogComplement.CrearDatosParaHash(
                                       const Entry: TVeriFactuLogEntry): string;
var
  JsonObj: TJSONObject;
begin
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('id', TJSONNumber.Create(Entry.ID));
    JsonObj.AddPair('timestamp', DateToISO8601(Entry.TimeStamp));
    JsonObj.AddPair('tipo_evento', TJSONNumber.Create(Ord(Entry.TipoEvento)));
    JsonObj.AddPair('usuario', Entry.Usuario);
    JsonObj.AddPair('version', Entry.Version);
    JsonObj.AddPair('descripcion', Entry.Descripcion);
    JsonObj.AddPair('datos_adicionales', Entry.DatosAdicionales);
    JsonObj.AddPair('hash_anterior', Entry.HashAnterior);
    Result := JsonObj.ToString;
  finally
    JsonObj.Free;
  end;
end;

function TVeriFactuLogComplement.GenerarFirmaDigital(
                                              const HashEvento: string): string;
var
  DatosFirma: string;
begin
  // Simulación de firma digital - en producción usar certificado digital real
  DatosFirma := Format('VERIFACTU_%s_%s_%s', [
    HashEvento,
    GetWindowsUserName,
    DateTimeToStr(TTimeZone.Local.ToUniversalTime(Now))
  ]);
  Result := CalcularHashSHA256(DatosFirma);
end;

function TVeriFactuLogComplement.RegistrarEventoVeriFactu(
                                                TipoEvento: TVeriFactuEventType;
                                                Descripcion: string;
                                            const DatosAdicionales: string = '';
                                                Serie: string = '';
                                                NumFactura:integer = 0):String;
var
  Entry: TVeriFactuLogEntry;
  DatosHash: string;
  unstdprocNextCont:TUniStoredProc;
  iContador : Integer;
begin
  try
    //FQuery.Connection.StartTransaction;
    try
      unstdprocNextCont := TUniStoredProc.Create(nil);
      unstdprocNextCont.Connection := FQuery.Connection;
      unstdprocNextCont.StoredProcName := 'GET_NEXT_CONT';
      unstdprocNextCont.Prepare;
      unstdprocNextCont.ParamByName('pTipoDoc').AsString := 'CC';
      unstdprocNextCont.ExecProc;
      iContador := unstdprocNextCont.ParamByName('pcont').AsLargeInt;
    finally
      unstdprocNextCont.Free;
    end;
    // Preparar entrada
    Entry.TimeStamp := TTimeZone.Local.ToUniversalTime(Now);
    Entry.TipoEvento := TipoEvento;
    Entry.Usuario := GetComputerName + '\'+ GetWindowsUserName;
    Entry.Version:= Fversion;
    Entry.Descripcion := Descripcion;
    Entry.DatosAdicionales := DatosAdicionales;
    Entry.HashAnterior := ObtenerUltimoHash(iContador);
    // Calcular hash
    DatosHash := CrearDatosParaHash(Entry);
    Entry.HashPropio := CalcularHashSHA256(DatosHash);
    Entry.FirmaDigital := GenerarFirmaDigital(Entry.HashPropio);
    // Guardar en base de datos
    FQuery.SQL.Text :=
      'INSERT INTO suboc_verifactu_log_eventos ' +
      '(id_log, timestamp_log, tipo_evento_log, usuario_log, version_log, '+
      'descripcion_log, ' +
      ' datos_adicionales_log, hash_anterior_log, hash_propio_log,'+
      ' firma_digital_log, nro_factura_log, serie_factura_log) ' +
      'VALUES (:id, :ts, :tipo, :usr, :ver, :desc, :datos, :hash_ant, '+
      '        :hash_prop, :firma, :nro_fac, :ser_fac)';
    FQuery.ParamByName('id').AsLargeInt := iContador;
    FQuery.ParamByName('ts').AsDateTime := Entry.TimeStamp;
    FQuery.ParamByName('tipo').AsInteger := Ord(Entry.TipoEvento);
    FQuery.ParamByName('usr').AsString := Entry.Usuario;
    FQuery.ParamByName('ver').AsString := Entry.Version;
    FQuery.ParamByName('desc').AsString := Entry.Descripcion;
    FQuery.ParamByName('datos').AsString := Entry.DatosAdicionales;
    FQuery.ParamByName('hash_ant').AsString := Entry.HashAnterior;
    FQuery.ParamByName('hash_prop').AsString := Entry.HashPropio;
    FQuery.ParamByName('firma').AsString := Entry.FirmaDigital;
    FQuery.ParamByName('nro_fac').AsInteger := NumFactura;
    FQuery.ParamByName('ser_fac').AsString := Serie;
  //  FQuery.ParamByName('created_at').AsDateTime := TTimeZone.Local.ToUniversalTime(Now);
    FQuery.ExecSQL;
//    FQuery.Connection.Commit;
    Result := Entry.HashPropio;
  except on E: Exception do
    begin
//      if FQuery.Connection.InTransaction then
//        FQuery.Connection.Rollback;
      raise Exception.Create('Error creando log verifactu: ' + E.Message);
    end;
  end;
end;
// Métodos específicos de eventos VeriFact.u

procedure TVeriFactuLogComplement.RegistrarArranqueSystem;
var
  DatosAdicionales: string;
begin
  DatosAdicionales := Format('{"maquina":"%s","usuario":"%s","ruta":"%s"}', [
                              GetComputerName,
                              GetWindowsUserName,
                              ParamStr(0)
                            ]);
  RegistrarEventoVeriFactu(vfetArranqueSystem,
    'Sistema de facturación iniciado', DatosAdicionales);
end;

procedure TVeriFactuLogComplement.RegistrarParadaSystem;
var
  DatosAdicionales: string;
begin
  DatosAdicionales := Format('{"maquina":"%s","usuario":"%s","ruta":"%s"}', [
                              GetComputerName,
                              GetWindowsUserName,
                              ParamStr(0)
                            ]);
  RegistrarEventoVeriFactu(vfetParadaSystem,
    'Sistema de facturación cerrado', DatosAdicionales);
end;

procedure TVeriFactuLogComplement.RegistrarOperacionFactura(Descripcion,
                                                            Serie:String;
                                                            NumFactura:Integer;
                                                            DatosAdicionales:String = ''
                                                            );
begin
  RegistrarEventoVeriFactu(vfetOperacionFactura,Descripcion,
                           DatosAdicionales, Serie, NumFactura);
end;

procedure TVeriFactuLogComplement.RegistrarError(Descripcion: string;
                                                 DatosAdicionales:string = '';
                                                 Serie:String = '';
                                                 NumFactura:Integer = 0);
begin
  RegistrarEventoVeriFactu(vfetError,
    Format('Error: - %s', [Descripcion]),
    DatosAdicionales, Serie, NumFactura);
end;

procedure TVeriFactuLogComplement.RegistrarAccesoArchivo(
                           NombreArchivo, TipoAcceso, DatosAdicionales: string);
//var
//  DatosAdicionales: string;
begin
//  DatosAdicionales := Format('{"archivo":"%s","tipo_acceso":"%s"}', [
//    NombreArchivo, TipoAcceso
//  ]);
  RegistrarEventoVeriFactu(vfetAccesoArchivo,
    Format('Acceso archivo: %s (%s)', [NombreArchivo, TipoAcceso]),
    DatosAdicionales);
end;

procedure TVeriFactuLogComplement.RegistrarCambioConfiguracion(
                                                               Parametro,
                                             ValorAnterior, ValorNuevo: string);
var
  DatosAdicionales: string;
begin
  DatosAdicionales := Format('{"parametro":"%s","valor_anterior":"%s",'+
                             '"valor_nuevo":"%s"}', [Parametro,
                                                     ValorAnterior,
                                                     ValorNuevo]);
  RegistrarEventoVeriFactu(vfetCambioConfig,
    Format('Cambio configuración: %s', [Parametro]),
    DatosAdicionales);
end;

procedure TVeriFactuLogComplement.RegistrarBackup;
var
  DatosAdicionales: string;
begin
  RegistrarEventoVeriFactu(vfetBackup,
   'Copia de Seguridad completa',
   '');
end;

function TVeriFactuLogComplement.VerificarIntegridadCadena: Boolean;
var
  HashAnteriorEsperado: string;
  id, TipoEvento: Integer;
  TimeStamp: TDateTime;
  Usuario, Version, Descripcion, DatosAdicionales: string;
  HashAnterior, HashPropio, FirmaDigital: string;
  Entry: TVeriFactuLogEntry;
  DatosRecalculados: string;
  HashRecalculado: string;
  ErrorCount: Integer;
begin
  Result := True;
  ErrorCount := 0;
  HashAnteriorEsperado := StringOfChar('0', 64);
  FQuery.SQL.Text :=
    'SELECT id_log, ' +
    '       timestamp_log, ' +
    '       tipo_evento_log, ' +
    '       usuario_log, ' +
    '       version_log, ' +
    '       descripcion_log, ' +
    '       datos_adicionales_log,' +
    '       hash_anterior_log, ' +
    '       hash_propio_log, ' +
    '       firma_digital_log ' +
    '  FROM suboc_verifactu_log_eventos ORDER BY id_log';
  FQuery.Open;
  try
    while not FQuery.Eof do
    begin
      // Leer datos del registro
      id := FQuery.FieldByName('id_log').AsInteger;
      TimeStamp := FQuery.FieldByName('timestamp_log').AsDateTime;
      TipoEvento := FQuery.FieldByName('tipo_evento_log').AsInteger;
      Usuario := FQuery.FieldByName('usuario_log').AsString;
      Version := FQuery.FieldByName('version_log').AsString;
      Descripcion := FQuery.FieldByName('descripcion_log').AsString;
      DatosAdicionales := FQuery.FieldByName('datos_adicionales_log').AsString;
      HashAnterior := FQuery.FieldByName('hash_anterior_log').AsString;
      HashPropio := FQuery.FieldByName('hash_propio_log').AsString;
      FirmaDigital := FQuery.FieldByName('firma_digital_log').AsString;
      // Verificar hash anterior
      if HashAnterior <> HashAnteriorEsperado then
      begin
//        if Assigned(FOriginalLog) then
//          FOriginalLog.LogError(Format('[VERIFACTU] Error integridad secuencia %d: hash anterior incorrecto', [Secuencia]));
        Result := False;
        Inc(ErrorCount);
      end;
      // Recalcular hash propio
      Entry.id := id;
      Entry.TimeStamp := TimeStamp;
      Entry.TipoEvento := TVeriFactuEventType(TipoEvento);
      Entry.Usuario := Usuario;
      Entry.Version := version;
      Entry.Descripcion := Descripcion;
      Entry.DatosAdicionales := DatosAdicionales;
      Entry.HashAnterior := HashAnterior;
      DatosRecalculados := CrearDatosParaHash(Entry);
      HashRecalculado := CalcularHashSHA256(DatosRecalculados);
      if HashRecalculado <> HashPropio then
      begin
//        if Assigned(FOriginalLog) then
//          FOriginalLog.LogError(Format('[VERIFACTU] Error integridad secuencia %d: hash propio alterado', [Secuencia]));
        Result := False;
        Inc(ErrorCount);
      end;
      HashAnteriorEsperado := HashPropio;
      FQuery.Next;
    end;
  finally
    FQuery.Close;
  end;
end;

function TVeriFactuLogComplement.ObtenerEstadisticasTabla: string;
var
  JsonObj: TJSONObject;
begin
  JsonObj := TJSONObject.Create;
  try
    // Total de eventos
    FQuery.SQL.Text := 'SELECT COUNT(*) as total FROM suboc_verifactu_log_eventos';
    FQuery.Open;
    JsonObj.AddPair('total_eventos', TJSONNumber.Create(FQuery.FieldByName('total').AsLargeInt));
    FQuery.Close;
    // Primer evento
    FQuery.SQL.Text := 'SELECT MIN(timestamp_log) as primer_evento FROM suboc_verifactu_log_eventos';
    FQuery.Open;
    if not FQuery.FieldByName('primer_evento').IsNull then
      JsonObj.AddPair('primer_evento', DateTimeToStr(FQuery.FieldByName('primer_evento').AsDateTime));
    FQuery.Close;
    // Último evento
    FQuery.SQL.Text := 'SELECT MAX(timestamp) as ultimo_evento FROM suboc_verifactu_log_eventos';
    FQuery.Open;
    if not FQuery.FieldByName('ultimo_evento').IsNull then
      JsonObj.AddPair('ultimo_evento', DateTimeToStr(FQuery.FieldByName('ultimo_evento').AsDateTime));
    FQuery.Close;
    // Tamaño de tabla
    FQuery.SQL.Text :=
      'SELECT ROUND(((data_length + index_length) / 1024 / 1024), 2) AS size_mb ' +
      'FROM information_schema.tables ' +
      'WHERE table_schema = DATABASE() AND table_name = "verifactu_log_eventos"';
    FQuery.Open;
    if not FQuery.IsEmpty then
      JsonObj.AddPair('tamano_mb', TJSONNumber.Create(FQuery.FieldByName('size_mb').AsFloat));
    FQuery.Close;
    Result := JsonObj.ToString;
  finally
    JsonObj.Free;
  end;
end;

end.