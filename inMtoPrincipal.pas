unit inMtoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, UniDataConn,
  ExtCtrls, inLibLogVeriFactu,
  cxGraphics, cxControls, cxLookAndFeels,MemDS, DBAccess, Uni,
  cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlue, dxStatusBar, DADump, UniDump, Vcl.StdCtrls,
  DASQLMonitor, UniSQLMonitor, dxSkinsDefaultPainters, Data.DB, JvMenus,
  cxContainer, cxEdit, dxGDIPlusClasses, cxImage, cxStyles, cxClasses,
  cxTextEdit, cxMemo, dxSkinBasic, dxSkinBlack, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmOpenApp = class(TForm)
    dxstsbr1: TdxStatusBar;
    tmr1: TTimer;
    undmp1: TUniDump;
    mnPrincipal: TJvMainMenu;
    mnArchivo: TMenuItem;
    mnClientes: TMenuItem;
    mnOdontologos: TMenuItem;
    mnTratamientos: TMenuItem;
    mnHistoriasDentales: TMenuItem;
    mnSalir: TMenuItem;
    mnDocumentos: TMenuItem;
    mnFacturas: TMenuItem;
    mnPresupuestos: TMenuItem;
    mnUtilidades: TMenuItem;
    mnContadores: TMenuItem;
    mnFormaPago: TMenuItem;
    mnCopiadeSeguridad: TMenuItem;
    mnEjecutarScript: TMenuItem;
    mnOtros: TMenuItem;
    mnPreguntas: TMenuItem;
    cxdtstylcntrlrEditStyleController: TcxEditStyleController;
    cxlkndflcntrlrLookAndFeelController1: TcxLookAndFeelController;
    cxstylrpstryStyleRepository1: TcxStyleRepository;
    cxstylStylCab: TcxStyle;
    mnuParametros: TMenuItem;
    mnuPaises: TMenuItem;
    SQLMonitor1: TUniSQLMonitor;
    Memo: TcxMemo;
    mnAyuda: TMenuItem;
    mnNotaLegal: TMenuItem;
    mnRegVer: TMenuItem;
    procedure sbAppCreatePanelClass(Sender: TCustomStatusBar;
      var PanelClass: TStatusPanelClass);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mnClientesClick(Sender: TObject);
    procedure mnArchivoSalirClick(Sender: TObject);
    //procedure mnuContadoresClick(Sender: TObject);
    procedure mnFacturasClick(Sender: TObject);
   // procedure mnuTiposdeIVAClick(Sender: TObject);
    procedure mnArticulosClick(Sender: TObject);
    procedure mnContadoresClick(Sender: TObject);
    procedure mnPresupuestosClick(Sender: TObject);
    procedure mnHistoriasDentalesClick(Sender: TObject);
    procedure mnOdontologosClick(Sender: TObject);
    procedure mnFormaPagoClick(Sender: TObject);
    procedure CopiasdeSeguridad1Click(Sender: TObject);
    procedure CopiaSeguridad;
    procedure mnEjecutarScriptClick(Sender: TObject);
    procedure UniSQLMonitor1SQL(Sender: TObject; Text: string;
      Flag: TDATraceFlag);
    procedure tmr1Timer(Sender: TObject);
    procedure mnPreguntasClick(Sender: TObject);
    procedure mnuParametrosClick(Sender: TObject);
    procedure mnuPaisesClick(Sender: TObject);
    procedure SQLMonitor1SQL(Sender: TObject; Text: string; Flag: TDATraceFlag);
    procedure mnNotaLegalClick(Sender: TObject);
    procedure mnRegVerClick(Sender: TObject);
  private

    //FDmConn:TdmConn;
    //FDmDatos:TdmApi;
    FException:boolean;
    //procedure SetPermisosMenu(Menu:TMainMenu; sUser:String; sGrupo:String);
    //function GetPermisoMenu(sMenu, sUser, sGrupo:String):boolean;
    //function GetGrupo(sUser:String):String;

  public
    FDmConn:TdmConn;
    VeriFactuLog: TVeriFactuLogComplement;
    { Public declarations }
  private
   procedure GlobalExceptionHandler(Sender: TObject; E: Exception);
  end;

//  procedure ShowMtoPrin(Owner       : TComponent);

var
  frmOpenApp: TfrmOpenApp;

implementation

uses inLibUser,
     inLibVarGlob,
     inLibWin,
     inMtoClientes,
     inMtoFac,
     inMtoPre,
     inMtoContadores,
     inMtoArticulos,
     inMtoHistoriaClientes,
     inMtoOdontologos,
     inMtoPreguntas,
     inMtoParametros,
     inMtoPaises,
     inMtoRegVer,
     inMtoModalNotaLegal,
     inMtoFormasdePago;

{$R *.dfm}
{$IFDEF WINDOWSXP}
{$R WindowsXP.res}
{$ENDIF}



procedure TfrmOpenApp.sbAppCreatePanelClass(Sender: TCustomStatusBar;
  var PanelClass: TStatusPanelClass);
begin
  //sbApp := GetAppFolder;
end;

procedure TfrmOpenApp.SQLMonitor1SQL(Sender: TObject; Text: string;
  Flag: TDATraceFlag);
begin
  {$IFDEF DEBUG}
    Memo.Visible := True;
    Memo.Lines.Add(Text);
    //inLibLog.Log.LogSQL(Text);
  {$ENDIF }
end;

procedure TfrmOpenApp.tmr1Timer(Sender: TObject);
var
  ADateStr:string;
  ATimeStr:string;
begin
   ADateStr := DateToStr(Now);
   ATimeStr := TimeToStr(Now);
   dxstsbr1.Panels.Items[2].Text := 'Fecha: ' + ADateStr + ' Hora: ' + ATimeStr
   + '    ';
end;

procedure TfrmOpenApp.UniSQLMonitor1SQL(Sender: TObject; Text: string;
  Flag: TDATraceFlag);
begin
  //m1.Lines.Add(Text);
end;

procedure TfrmOpenApp.mnArchivoSalirClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmOpenApp.FormCreate(Sender: TObject);
begin
  //oUser := rkUser.Caption;
  FdmConn := TdmConn.Create(FdmConn);
  FdmConn.conUni.Connect;
  VeriFactuLog := TVeriFactuLogComplement.Create;
  VeriFactuLog.RegistrarArranqueSystem;
  Application.OnException := GlobalExceptionHandler;
  dxstsbr1.Panels[1].Text := FdmConn.conUni.Server + ':'+
                                                   IntToStr(fdmconn.conUni.Port)
                                         + ' (' + FdmConn.conUni.Database + ')';
  Screen.MenuFont.Name := 'Lucida Sans';
  Screen.MenuFont.Size := 13;
  Self.Caption := Self.Caption+ FVersion;
end;

procedure TfrmOpenApp.CopiasdeSeguridad1Click(Sender: TObject);
begin
  CopiaSeguridad;
end;

procedure TfrmOpenApp.CopiaSeguridad;
var
   savedialog : TSaveDialog;
begin
   savedialog := TSaveDialog.Create(nil);
   saveDialog.Title := 'Guardar copia de seguridad';
   saveDialog.InitialDir := GetCurrentDir;
   savedialog.FileName := 'copia_seguridad'+FormatDateTime('_dd_mm', Now)+'.sql';
   undmp1.Connection := FDmConn.conUni;
   if (saveDialog.Execute) then
   begin
     //FDmConn.conUni.Disconnect;
     undmp1.BackupToFile(savedialog.FileName);
     VerifactuLog.RegistrarBackup;
     ShowMessage('La copia se guardó exitosamente');
   end
   else ShowMessage('La copia se canceló');
   FreeAndNil(savedialog);
end;

procedure TfrmOpenApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VeriFactuLog.RegistrarParadaSystem;
  FdmConn.conUni.Disconnect;
  FreeAndNil(FdmConn);
  FreeAndNil(VeriFactuLog);
end;

procedure TfrmOpenApp.mnArticulosClick(Sender: TObject);
begin
   ShowMtoArticulos(Self);
end;

procedure TfrmOpenApp.FormShow(Sender: TObject);
begin
  //si ocurre una excepción durante la carga, se fuerza el cierre de la ventana
  if FException then
  begin
     PostMessage( Handle, wm_Close, 0, 0 );
     Exit;
  end;
end;

procedure TfrmOpenApp.GlobalExceptionHandler(Sender: TObject; E: Exception);
begin
  VeriFactuLog.RegistrarError(E.ClassName, E.Message);
end;

procedure TfrmOpenApp.mnClientesClick(Sender: TObject);
begin
  if mnClientes.Visible then
    ShowMtoClientes(Self);
end;

procedure TfrmOpenApp.mnContadoresClick(Sender: TObject);
begin
  if mnContadores.Visible then
    ShowMtoContadores(Self);
end;

procedure TfrmOpenApp.mnEjecutarScriptClick(Sender: TObject);
var
    openDialog : topendialog;
begin
   opendialog := TOpenDialog.Create(nil);
   opendialog.Title := 'Cargar script';
   openDialog.InitialDir := GetCurrentDir;
   undmp1.Connection := FDmConn.conUni;
   if openDialog.Execute
   then
   begin
     undmp1.RestoreFromFile(opendialog.FileName);
     VeriFactuLog.RegistrarAccesoArchivo(opendialog.filename,
             'Ejecución Script',
             GetTextFile(openDialog.FileName));
     ShowMessage('El script se ejecutó exitosamente');
   end
   else ShowMessage('El script no fue ejecutado');
   FreeAndNil(opendialog);
end;

procedure TfrmOpenApp.mnFacturasClick(Sender: TObject);
begin
  if mnFacturas.Visible then
  ShowMtoFac(Self);
end;

procedure TfrmOpenApp.mnFormaPagoClick(Sender: TObject);
begin
  if mnFormaPago.Visible then
    ShowMtoFormasdePago(Self);
end;

procedure TfrmOpenApp.mnHistoriasDentalesClick(Sender: TObject);
begin
if mnHistoriasDentales.Visible then
  ShowMtoHistoriaClientes(Self);

end;

procedure TfrmOpenApp.mnNotaLegalClick(Sender: TObject);
begin
  ShowMtoNotaLegal(Self);
end;

procedure TfrmOpenApp.mnOdontologosClick(Sender: TObject);
begin
    if mnOdontologos.Visible then
    ShowMtoOdontologos(Self);
end;

procedure TfrmOpenApp.mnPreguntasClick(Sender: TObject);
begin
   if mnPreguntas.Visible then
     ShowMtoPreguntas(Self);
end;

procedure TfrmOpenApp.mnPresupuestosClick(Sender: TObject);
begin
  if mnPresupuestos.Visible then
    ShowMtoPre(Self);
end;

procedure TfrmOpenApp.mnRegVerClick(Sender: TObject);
begin
  ShowMtoRegVer(Self);
end;

procedure TfrmOpenApp.mnuPaisesClick(Sender: TObject);
begin
    if mnuPaises.Visible then
      ShowMtoPaises(Self);
end;

procedure TfrmOpenApp.mnuParametrosClick(Sender: TObject);
begin
  if mnuParametros.Visible then
    ShowMtoParametros(Self);
end;

end.
