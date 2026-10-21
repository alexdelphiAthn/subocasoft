unit inMtoParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxStyles, cxGraphics,
  cxDataStorage, cxEdit, DB, cxDBData,   DBCtrls,
  cxNavigator, ExtCtrls, //dxCntner, dxExEdtr, dxEdLib,
  cxContainer,
  cxTextEdit, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, StdCtrls, Buttons, ADODB, //BetterADODataSet,
  inLibLogVeriFactu,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLookAndFeels,
  cxLookAndFeelPainters, cxCheckBox, cxLabel, cxTimeEdit, cxCalendar, inMtoPrincipal,

  cxDataControllerConditionalFormattingRulesManagerDialog,
  Uni, cxCustomData, cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations,
  MemDS, DBAccess, cxLocalization, dxBevel, cxGridLevel, cxDBNavigator,
  Menus, cxButtons;

type
  TfrmMtoParametros = class(TfrmMtoGen)
    unqryParametros: TUniQuery;
    dbcGrdDBTabPrinNOMBRE_PARAM: TcxGridDBColumn;
    dbcGrdDBTabPrinVALUE_PARAM: TcxGridDBColumn;
    btnSeleccionarCertificado: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure unqryParametrosBeforePost(DataSet: TDataSet);
    procedure btnSeleccionarCertificadoClick(Sender: TObject);
  private
    //FDmConn:TdmConn;
    FException: boolean;
    procedure GuardarParametro(const ANombre, AValor: string);
  public
    { Public declarations }
  end;
  procedure ShowMtoParametros(Owner       : TComponent);


var
  frmMtoParametros: TfrmMtoParametros;

implementation

uses inLibWin, inMtoModalSelCer;

const
  PARAM_CERTIFICADO_SERIE    = 'CERTIFICADO_SERIE_VERIFACTU';
  PARAM_CERTIFICADO_TITULAR  = 'CERTIFICADO_TITULAR_VERIFACTU';
  PARAM_CERTIFICADO_TIPO     = 'CERTIFICADO_TIPO_VERIFACTU';
  PARAM_CERTIFICADO_CADUCIDAD = 'CERTIFICADO_CADUCIDAD_VERIFACTU';

{$R *.dfm}

procedure ShowMtoParametros(Owner       : TComponent);
var
  FfrmUbi : TfrmMtoParametros;
begin
  if not(IsOpenMDI('Parametros', Owner)) then
  begin
    Application.CreateForm(TfrmMtoParametros, FfrmUbi);
  end;
end;

procedure TfrmMtoParametros.FormShow(Sender: TObject);
begin
  inherited;
  if FException then
  begin
     PostMessage( Handle, wm_Close, 0, 0 );
     Exit;
  end;
end;

procedure TfrmMtoParametros.unqryParametrosBeforePost(DataSet: TDataSet);
begin
  inherited;
     if (Dataset.State= dsInsert) then
    frmMtoPrincipal.VeriFactuLog.RegistrarCambioConfiguracion(
                                   DataSet.FieldByName('NOMBRE_PARAM').AsString,
                                   'Registro nuevo',
                                   DataSet.FieldByName('VALUE_PARAM').AsString);
  if (Dataset.State= dsEdit) then
    frmMtoPrincipal.VeriFactuLog.RegistrarCambioConfiguracion(
                                   DataSet.FieldByName('NOMBRE_PARAM').AsString,
                          VarToStr(DataSet.FieldByName('VALUE_PARAM').OldValue),
                                   DataSet.FieldByName('VALUE_PARAM').AsString);
end;

procedure TfrmMtoParametros.GuardarParametro(const ANombre, AValor: string);
begin
  if unqryParametros.Locate('NOMBRE_PARAM', ANombre, [loCaseInsensitive]) then
    unqryParametros.Edit
  else
  begin
    unqryParametros.Append;
    unqryParametros.FieldByName('NOMBRE_PARAM').AsString := ANombre;
  end;
  unqryParametros.FieldByName('VALUE_PARAM').AsString := AValor;
  unqryParametros.Post;
end;

procedure TfrmMtoParametros.btnSeleccionarCertificadoClick(Sender: TObject);
var
  Certificado: TCertificadoSeleccionado;
begin
  if (unqryParametros.State = dsInsert) or
     (unqryParametros.State = dsEdit) then
    unqryParametros.Post;
  if SeleccionarCertificado(Certificado) then
  begin
    GuardarParametro(PARAM_CERTIFICADO_SERIE, Certificado.NumeroSerie);
    GuardarParametro(PARAM_CERTIFICADO_TITULAR, Certificado.Titular);
    GuardarParametro(PARAM_CERTIFICADO_TIPO, Certificado.Tipo);
    GuardarParametro(PARAM_CERTIFICADO_CADUCIDAD, Certificado.FechaHasta);
    if frmMtoPrincipal.FDmConn.conUni.InTransaction then
      frmMtoPrincipal.FDmConn.conUni.Commit;
    ShowMessage('Certificado seleccionado: ' + Certificado.Titular +
                ' (válido hasta ' + Certificado.FechaHasta + ')');
  end;
end;

procedure TfrmMtoParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  unqryParametros.Close;
  inherited;
end;

procedure TfrmMtoParametros.FormCreate(Sender: TObject);
begin
  try
    with frmMtoPrincipal do
    unqryParametros.Connection := FDmConn.conUni;
    dsTablaG.DataSet.Open;
    inherited;
  except
     FException := True;
  raise;

  end;
   //pcDetall.ActivePage := tsDatGen;
end;

end.

