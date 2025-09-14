unit inMtoSearDocFac;

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
  TfrmMtoSearDocFac = class(TfrmMtoSearch)
    cxgrdbclmnGrdDBTabPrinODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNOMBRE_ODONTOLOGO: TcxGridDBColumn;
//    procedure btn4Click(Sender: TObject);
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
  frmMtoSearDocFac: TfrmMtoSearDocFac;

implementation

uses UniDataFac, inMtoFac;

{$R *.dfm}

//procedure TfrmMtoSearDocFac.btn4Click(Sender: TObject);
//var
//  buttonSelected : Integer;
//begin
//    // Show a confirmation dialog
//    buttonSelected := messagedlg('¿Desea aplicar el odontólogo ' + zqryData.FindField('NOMBRE_ODONTOLOGO').AsString + ' al tratamiento?' ,mtError, mbOKCancel, 0);
//    // Show the button type selected
//    if buttonSelected = mrOK     then
//      begin
//        with dmmFac do
//        begin
//          if ((zqryLinFac.State <> dsEdit) or (zqryLinFac.State <> dsInsert)) then
//            zqryLinFac.Edit;
//          zqryLinFac.FindField('ODONTOLOGO').AsString :=
//                                          zqryData.FindField('ODONTOLOGO').AsString;
//        end;
//      end;
//  inherited;
//end;


procedure TfrmMtoSearDocFac.btnAceptarClick(Sender: TObject);
begin
  with dmmFac do
  begin

  end;
  inherited;

end;

procedure TfrmMtoSearDocFac.tvGrdDBTabPrinCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  btnAceptarClick(Self);
end;

end.
