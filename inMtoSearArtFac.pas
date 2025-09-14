unit inMtoSearArtFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGenSearch, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxContainer, cxEdit, Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, DB, cxDBData, cxTextEdit,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, cxMemo, cxRichEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls, cxPC,
  cxCurrencyEdit, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmMtoSearArtFac = class(TfrmMtoSearch)
    cxgrdbclmnGrdDBTabPrinCODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFAMILIA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPRECIOVENTA_ARTICULO: TcxGridDBColumn;
    procedure btnAceptarClick(Sender: TObject);
    procedure tvGrdDBTabPrinCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMtoSearArtFac: TfrmMtoSearArtFac;

implementation

uses UniDataFac, inMtoFac;

{$R *.dfm}



procedure TfrmMtoSearArtFac.btnAceptarClick(Sender: TObject);
begin
  with dmmFac do
  begin

  end;
  inherited;

end;

procedure TfrmMtoSearArtFac.tvGrdDBTabPrinCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnAceptarClick(SELF);
end;

end.
