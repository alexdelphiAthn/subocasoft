unit UniDataConn;

interface

uses
  SysUtils, Classes, DB, ADODB, DBAccess, Uni, Vcl.Forms, Vcl.Dialogs,
  DASQLMonitor, MySQLUniProvider, Vcl.ExtCtrls, IdSSLOpenSSLHeaders, inLibLog;

type
  TdmConn = class(TDataModule)
    conUni: TUniConnection;
    tmrKeepAlive: TTimer;
    procedure connBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure conUniError(Sender: TObject; E: EDAError; var Fail: Boolean);
//    procedure tmrKeepAliveTimer(Sender: TObject);
    procedure conUniAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConn: TdmConn;

implementation

uses inLibDir, inLibtb, inMtoPrincipal, inLibVarGlob;

{$R *.dfm}

procedure TdmConn.connBeforeConnect(Sender: TObject);
var
  sDatabase         ,
  sHostName         ,
  sPassword         ,
  sPort             ,
  sUser: string;
begin
  sDatabase := leCadINIDir('ConnData', 'Database','subocasana', GetUserFolder);
  sHostName :=  leCadINIDir('ConnData', 'HostName','127.0.0.1', GetUserFolder);
  sPassword :=  leCadINIDir('ConnData', 'Passord','Zamora2023', GetUserFolder);
  sPort :=  leCadINIDir('ConnData', 'Puerto','3306', GetUserFolder);
  sUser :=  leCadINIDir('ConnData', 'User', 'root', GetUserFolder);
  FFotosPath := leCadINIDir('ConnData', 'DirFotos', 'c:\Fotos\', GetUserFolder);
  with Conuni do
  begin
    ConnectString := 'Provider Name=MySQL;User ID=' + sUser + ';Password=' +
                     sPassword + ';Data Source=' + sHostName+
                     ';Database=' + sDataBase+ ';Login Prompt=False';
    //Pooling activado para rendimiento
    //SpecificOptions.Values['Pooling'] := 'True';
    Pooling := True;
    // IMPORTANTE: 0 significa que la conexión física vive indefinidamente en el pool.
    //SpecificOptions.Values['ConnectionLifetime'] := '0';
    PoolingOptions.ConnectionLifetime := 0;
    PoolingOptions.Validate := True;
    // Pide al servidor usar 'interactive_timeout' en vez de 'wait_timeout'
    // Esto suele darte 8 horas (28800s) si el servidor lo permite.
    SpecificOptions.Values['MySQL.Interactive'] := 'True';
    // Tiempo máximo para intentar establecer la conexión inicial
    SpecificOptions.Values['ConnectionTimeout'] := '30';
    // 3. LA CLAVE: AUTO-RECONEXIÓN (LocalFailover)
    // Esto hace que si se cae la red o el servidor patea la conexión,
    // UniDAC se reconecta sola y reintenta la consulta sin dar error al usuario.
    Options.LocalFailover := True;
    Options.DisconnectedMode := True;
    // Opcional: Si la red es muy mala, esto comprime los datos
    // SpecificOptions.Values['MySQL.Compress'] := 'True';
    Server := sHostName;
    Database := sDatabase;
    Username := sUser;
    Password := sPassword;
    Port := StrToIntDef(sPort, 3306);
  end;
end;

procedure TdmConn.conUniAfterConnect(Sender: TObject);
begin
  // Ejecutamos un comando SQL directo al servidor nada más conectar.
  // 28800 segundos = 8 horas.
  try
    conUni.ExecSQL('SET SESSION wait_timeout = 28800, '+
                   'session interactive_timeout = 28800');
  except
    // Si falla (por permisos), no bloqueamos la app, pero queda registrado.
    on E: Exception do
      {$IFDEF DEBUG}
      ShowMessage('No se pudo establecer el timeout del servidor: ' + E.Message);
      {$ENDIF}
  end;
end;

procedure TdmConn.conUniError(Sender: TObject; E: EDAError; var Fail: Boolean);
var
  sMensaje: string;
  bEsErrorGenerico: Boolean;
begin
  bEsErrorGenerico := False;
  case E.ErrorCode of
    1062: sMensaje := 'Ya existe un registro con ese valor (entrada duplicada).';
    1048,
    1364: sMensaje := 'Hay campos obligatorios sin rellenar.';
    1054: sMensaje := 'Campo desconocido en la consulta SQL.';
    1146: sMensaje := 'La tabla consultada no existe en la base de datos.';
    1142,
    1143: sMensaje := 'No tiene permisos suficientes para realizar esta acción en la base de datos.';
    1216,
    1452: sMensaje := 'El valor no existe en la tabla relacionada (clave foránea).';
    1217,
    1451: sMensaje := 'No se puede eliminar: existen registros que dependen de este.';
    1406: sMensaje := 'El dato introducido es demasiado largo para el campo.';
    1045: sMensaje := 'Acceso denegado: usuario o contraseña incorrectos.';
    2003: sMensaje := 'No se puede conectar al servidor MySQL. Comprueba la red y el puerto.';
    2006: sMensaje := 'La conexión con el servidor MySQL se ha perdido.';
    2013: sMensaje := 'Se perdió la conexión durante la ejecución de la consulta.';
    1205: sMensaje := 'El servidor está ocupado (Tiempo de espera de bloqueo). Inténtalo de nuevo.';
    1213: sMensaje := 'Se ha producido un bloqueo cruzado (Deadlock). Inténtalo de nuevo.';
  else
    // Errores no catalogados: mostrar mensaje original
    sMensaje := Format('Error en base de datos [%d]:%s%s', [E.ErrorCode, sLineBreak, E.Message]);
    bEsErrorGenerico := True;
  end;
  {$IFDEF DEBUG}
    // En debug mostramos el original SOLO si no lo hemos puesto ya en el 'else'
    if (not bEsErrorGenerico) and (E.ErrorCode <> 0) then
      sMensaje := sMensaje + Format('%s(MySQL %d: %s)', [sLineBreak, E.ErrorCode, E.Message]);
  {$ENDIF}
  // Guardamos en el log siempre el error real
  inLibLog.Log.LogError(Format('MySQL %d: %s', [E.ErrorCode, E.Message]));
  Fail := False;
  raise Exception.Create(sMensaje);
end;

procedure TdmConn.DataModuleCreate(Sender: TObject);
begin
  with frmMtoPrincipal do
  begin
    SQLMonitor1.Active := False;
  {$IFDEF DEBUG}
    SQLMonitor1.Active := True;
  {$ENDIF }
  end;
end;

//procedure TdmConn.tmrKeepAliveTimer(Sender: TObject);
//begin
//  // Solo intentamos hacer ping si la conexión dice estar activa
//  if conUni.Connected then
//  begin
//    try
//      // El método Ping envía un comando ligero al servidor.
//      // Si el servidor responde, resetea el 'wait_timeout' del lado del servidor
//      // y mantiene abierto el puerto en el Firewall/NAT.
//      conUni.Ping;
//    except
//      // Si falla el ping (ej. cable desconectado), no hacemos nada.
//      // Dejamos que el 'LocalFailover' maneje el error cuando el usuario
//      // intente hacer una consulta real.
//      on E: Exception do
//      begin
//      {$IFDEF DEBUG}
//        ShowMessage('Error al hacer ping al server: ' + E.Message);
//      {$ENDIF}
//      end;
//    end;
//  end;
//end;

end.
