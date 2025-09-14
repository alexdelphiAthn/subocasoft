unit inMtoSearCliFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, inMtoFac,
  Dialogs, inMtoGenSearch, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxContainer, cxEdit, Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, DB, cxDBData, cxTextEdit,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, cxMemo, cxRichEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls, cxPC, inMtoPrincipal,
  cxDataControllerConditionalFormattingRulesManagerDialog, MemDS, DBAccess, Uni;

type
  TfrmMtoSearchCliFac = class(TfrmMtoSearch)
    cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNIF_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION1_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION2_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinOBSERVACIONES_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinREFERENCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinTELEFONO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROFESION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFECHA_NACIMIENTO: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
  private

  public

    { Public declarations }
  end;

var
  frmMtoSearchCliFac: TfrmMtoSearchCliFac;

implementation

{$R *.dfm}

procedure TfrmMtoSearchCliFac.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
