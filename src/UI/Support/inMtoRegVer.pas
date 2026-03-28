unit inMtoRegVer;

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
  MemDS, DBAccess, cxLocalization, dxBevel, cxGridLevel, cxDBNavigator;

type
  TfrmMtoRegVer = class(TfrmMtoGen)
    unqryRegVer: TUniQuery;
    dbcGrdDBTabPrinID_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinTIMESTAMP_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinTIPO_EVENTO_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinUSUARIO_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinVERSION_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinDESCRIPCION_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinDATOS_ADICIONALES_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinHASH_ANTERIOR_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinHASH_PROPIO_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinFIRMA_DIGITAL_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinCREATED_AT_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinNRO_FACTURA_LOG: TcxGridDBColumn;
    dbcGrdDBTabPrinSERIE_FACTURA_LOG: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //FDmConn:TdmConn;
    FException: boolean;
  public
    { Public declarations }
  end;
  procedure ShowMtoRegVer(Owner       : TComponent);


var
  frmMtoRegVer: TfrmMtoRegVer;

implementation

uses inLibWin;

{$R *.dfm}

procedure ShowMtoRegVer(Owner       : TComponent);
var
  FfrmUbi : TfrmMtoRegVer;
begin
  if not(IsOpenMDI('Registro VeriFactu', Owner)) then
  begin
    Application.CreateForm(TfrmMtoRegVer, FfrmUbi);
  end;
end;

procedure TfrmMtoRegVer.FormShow(Sender: TObject);
begin
  inherited;
  if FException then
  begin
     PostMessage( Handle, wm_Close, 0, 0 );
     Exit;
  end;
end;

procedure TfrmMtoRegVer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  unqryRegVer.Close;
  inherited;
end;

procedure TfrmMtoRegVer.FormCreate(Sender: TObject);
begin
  try
    with frmMtoPrincipal do
    unqryRegVer.Connection := FDmConn.conUni;
    dsTablaG.DataSet.Open;
    inherited;
  except
     FException := True;
  raise;

  end;
   //pcDetall.ActivePage := tsDatGen;
end;

end.

