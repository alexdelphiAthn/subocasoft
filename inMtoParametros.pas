unit inMtoParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData,   DBCtrls,
  cxNavigator, ExtCtrls, //dxCntner, dxExEdtr, dxEdLib,
  cxContainer, unidataconn,
  cxTextEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, StdCtrls, Buttons, ADODB, //BetterADODataSet,
  cxDBEdit, inLibLogVeriFactu,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLookAndFeels,
  cxLookAndFeelPainters, cxCheckBox, cxLabel, cxDBLabel, cxTimeEdit, cxCalendar, inMtoPrincipal,
   cxLocalization,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges, MemDS,
  DBAccess, Uni, dxBevel, cxDBNavigator, dxScrollbarAnnotations;

type
  TfrmMtoParametros = class(TfrmMtoGen)
    unqryParametros: TUniQuery;
    dbcGrdDBTabPrinNOMBRE_PARAM: TcxGridDBColumn;
    dbcGrdDBTabPrinVALUE_PARAM: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure unqryParametrosBeforePost(DataSet: TDataSet);
  private
    //FDmConn:TdmConn;
    FException: boolean;
  public
    { Public declarations }
  end;
  procedure ShowMtoParametros(Owner       : TComponent);


var
  frmMtoParametros: TfrmMtoParametros;

implementation

uses inLibWin;

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
    frmOpenApp.VeriFactuLog.RegistrarCambioConfiguracion(
                                   DataSet.FieldByName('NOMBRE_PARAM').AsString,
                                   'Registro nuevo',
                                   DataSet.FieldByName('VALUE_PARAM').AsString);
  if (Dataset.State= dsEdit) then
    frmOpenApp.VeriFactuLog.RegistrarCambioConfiguracion(
                                   DataSet.FieldByName('NOMBRE_PARAM').AsString,
                          VarToStr(DataSet.FieldByName('VALUE_PARAM').OldValue),
                                   DataSet.FieldByName('VALUE_PARAM').AsString);
end;

procedure TfrmMtoParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  unqryParametros.Close;
  inherited;
end;

procedure TfrmMtoParametros.FormCreate(Sender: TObject);
begin
  try
    with frmopenapp do
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

