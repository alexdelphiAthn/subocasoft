unit UniDataConn;

interface

uses
  SysUtils, Classes, DB, ADODB, DBAccess, Uni, Vcl.Forms, Vcl.Dialogs,
  UniProvider, MySQLUniProvider, DASQLMonitor, UniSQLMonitor;

type
  TdmConn = class(TDataModule)

    conUni: TUniConnection;
    procedure connBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure conUniError(Sender: TObject; E: EDAError; var Fail: Boolean);
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
  sPassword :=  leCadINIDir('ConnData', 'Password','Zamora2023', GetUserFolder);
  sPort :=  leCadINIDir('ConnData', 'Puerto','3306', GetUserFolder);
  sUser :=  leCadINIDir('ConnData', 'User', 'root', GetUserFolder);
  FFotosPath := leCadINIDir('ConnData', 'DirFotos', 'c:\Fotos\', GetUserFolder);
  with Conuni do
  begin
    ConnectString := 'Provider Name=MySQL;User ID=' + sUser + ';Password=' +
                     sPassword + ';Data Source=' + sHostName+
                     ';Database=' + sDataBase+ ';Login Prompt=False';
    Server := sHostName;
    Database := sDatabase;
    Username := sUser;
    Password := sPassword;
    Port := StrToIntDef(sPort, 3306);
  end;
end;

procedure TdmConn.conUniError(Sender: TObject; E: EDAError; var Fail: Boolean);
begin
  if Fail = true then
  begin
    ShowMessage('Ha habido un error de conexión: ' + E.Message);
    Application.Terminate;
  end;
end;

procedure TdmConn.DataModuleCreate(Sender: TObject);
begin
  with frmOpenApp do
  begin
    SQLMonitor1.Active := False;
  //oMemoSQL.Visible := False;
  {$IFDEF DEBUG}
    SQLMonitor1.Active := True;
   // oMemoSQL.Visible := True;
  {$ENDIF }
  end;
end;

end.
