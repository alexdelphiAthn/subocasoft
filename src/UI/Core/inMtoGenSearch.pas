unit inMtoGenSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxPC, ExtCtrls, cxContainer, StdCtrls, inLibDevExp, cxMemo, cxRichEdit,
  Menus, cxButtons,  inMtoPrincipal,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges,
  cxLocalization, dxScrollbarAnnotations;

type
  TfrmMtoSearch = class(TForm)
    cxpgcntrl1: TcxPageControl;
    ts1: TcxTabSheet;
    edtBusqGlobal: TcxTextEdit;
    lbl1: TLabel;
    ts2: TcxTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    cxRichEdit1: TcxRichEdit;
    btn1: TcxButton;
    btn2: TcxButton;
    dsData: TDataSource;
    pnl3: TPanel;
    pnl4: TPanel;
    cxgrdGrdPrincipal: TcxGrid;
    tvGrdDBTabPrin: TcxGridDBTableView;
    lvGrdLvPrin: TcxGridLevel;
    btn3: TcxButton;
    pnl5: TPanel;
    btnAceptar: TcxButton;
    pnlCliPrin: TPanel;
    pnlCliTopPrin: TPanel;
    btnCancelar: TcxButton;
    cxlclzr1: TcxLocalizer;
    procedure edtBusqGlobalKeyPress(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure prcfrmMtoSearchFormClose(Sender: TObject;
                              var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvGrdDBTabPrinCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    sFicha:string;
  end;

var
  frmMtoSearch: TfrmMtoSearch;

implementation

{$R *.dfm}

procedure TfrmMtoSearch.edtBusqGlobalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    BusqAllGrid(tvGrdDBTabPrin, edtBusqGlobal.Text);
end;

procedure TfrmMtoSearch.FormCreate(Sender: TObject);
begin
  cxlclzr1.FileName := 'CXLOCALIZATION.res';
  cxlclzr1.Active := True;
  cxlclzr1.Locale := 1034;
end;

procedure TfrmMtoSearch.FormShow(Sender: TObject);
begin
edtBusqGlobal.SetFocus;
end;

procedure TfrmMtoSearch.btnAceptarClick(Sender: TObject);
begin
  sFicha:= 'S';
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmMtoSearch.prcfrmMtoSearchFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMtoSearch.tvGrdDBTabPrinCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnAceptarClick(Self);
end;

procedure TfrmMtoSearch.btnCancelarClick(Sender: TObject);
begin
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

initialization

end.
