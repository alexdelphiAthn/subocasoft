unit inMtoGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, ExtCtrls, Buttons,
  DB, ADODB, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxNavigator, cxMaskEdit,
  cxLookAndFeelPainters, cxButtons,
   cxContainer, cxTextEdit,  dxSkinsCore,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLookAndFeels,
  cxCheckBox, cxGridExportLink,  cxMemo, cxDBEdit,
  UniDataConn, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxLocalization,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxLabel, dxBevel,
  cxDBNavigator, dxDateRanges, inMtoPrincipal, dxSkinBlue,
  dxScrollbarAnnotations;

const
  B_NB_SAVE   = 7;
  B_NB_CANCEL = 8;


type
  THackWinControl = class(TWinControl);
  TfrmMtoGen = class(TForm)
    pButtonPage: TPanel;
    pButtonRightBar: TPanel;
    pcPantalla: TPageControl;
    tsLista: TTabSheet;
    tsFicha: TTabSheet;
    pButtonBDStat: TPanel;
    pButtonGen: TPanel;
    sbGrabar: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbSalir: TSpeedButton;
    dsTablaG: TDataSource;
    cxGrdDBTabPrin: TcxGridDBTableView;
    cxGrdLvPrin: TcxGridLevel;
    cxGrdPrincipal: TcxGrid;
    pnTopGrid: TPanel;
    pnTableName: TPanel;
    Panel4: TPanel;
    lblTablaOrigen: TLabel;
    lblEditMode: TLabel;
    btnRestoreWindow: TSpeedButton;
    cxlclzr1: TcxLocalizer;
    dxbvl1: TdxBevel;
    edtBusqGlobal: TcxTextEdit;
    cxlblBusq: TcxLabel;
    cxdbnvgtr1: TcxDBNavigator;
    cxdbnvgtr2: TcxDBNavigator;
    btnExportarExcel: TSpeedButton;
   // procedure DBGClientTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSalirClick(Sender: TObject);
    procedure dbgClientDblClick(Sender: TObject);
    procedure dsTablaGStateChange(Sender: TObject);
    procedure sbGrabarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure syncbuttons;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrdDBTabPrinDblClick(Sender: TObject);
    procedure cxGrabOpcClick(Sender: TObject);
    procedure chkCaseMChange(Sender: TObject);
    procedure edtBusqGlobalKeyPress(Sender: TObject; var Key: Char);
    //procedure BeforePostD(DataSet: TDataSet);
    //procedure dsTablaGDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure chkEditinListChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRestoreWindowClick(Sender: TObject);
    procedure cxGrdDBTabPrinNavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure ChangeListaToFicha;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    //procedure sbGrabarConfClick(Sender: TObject);

  private

    //FDmDatosg:TdmApi;
  public
    FbPermisoEscritura: boolean;
    FbPermisoExcel : boolean;
  end;

var
  oCleaning:boolean;
  frmMtoGen: TfrmMtoGen;

implementation

uses inLibDevExp, inLibUser, inLibDir, inLibWin, inLibtb ;

{$R *.dfm}
{$R CXLOCALIZATION.res}
procedure TfrmMtoGen.FormCreate(Sender: TObject);
begin
//  GetPermisoDataForm(Self, FbPermisoEscritura, FbPermisoExcel);
//  if not FbPermisoExcel then
//  begin
//    btn2.Enabled := false;
//  end;
//  if not FbPermisoEscritura then
//    (dsTablaG.DataSet as TZquery).readonly := True;
//  //En cuanto al comportamiento del form al abrirse



  Position  := poScreenCenter;
  WindowState := wsMaximized;
  dsTablaG.OnStateChange := dsTablaGStateChange;
  pcPantalla.ActivePage := tsLista;

  syncButtons;

//  if dsTablaG.DataSet.ClassName = 'TZTable' then
//  begin
//    lblTablaOrigen.Caption := (dsTablaG.DataSet as TZTable).TableName;
//    spRecord.Caption := 'Registro ' + IntToStr((dsTablaG.DataSet as TZTable).RecNo)
//                      + ' de ' + IntToStr((dsTablaG.DataSet as TZTable).RecordCount);
//  end;


  //chkSoloActivosPropertiesOnChange(Sender);

  //dsTablaG.Dataset.BeforePost := BeforePostD;

   //dsTablaG.DataSet := DBNControlBD.DataSource.DataSet;

   //cxGrdDBTabPrin.DataController.CreateAllItems;
end;

procedure TfrmMtoGen.syncbuttons;
begin
  //sbGrabar.Enabled   := DBNControlDB1.Buttons.Post.Enabled;
  //sbCancelar.Enabled := DBNControlDB1.Buttons.Cancel.Enabled;
end;

procedure TfrmMtoGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin

//  if oCleaning = false then
//  begin
//    SaveColumnsStateActiveWindow;
//    SaveWindowSettingsGen;
//  end
//  else
//  begin
//    ResetColumnsStateActiveWindow;
//    //ResetWindowSettings
//  end;
  //sbSalirClick(Self);
  Action := caFree;
end;

procedure TfrmMtoGen.sbSalirClick(Sender: TObject);
begin
  if ( dsTablaG.DataSet.State = dsInsert ) or
     ( dsTablaG.DataSet.State = dsEdit ) then
  begin
     if ( Application.MessageBox( '¿Desea cancelar la entrada de datos?',
                                 'Mensaje Advertencia',
                                 MB_YESNO ) = ID_YES ) then
       Close;
  end
  else
    Close;
end;

procedure TfrmMtoGen.dbgClientDblClick(Sender: TObject);
begin
  pcPantalla.ActivePage := tsFicha;
end;

procedure TfrmMtoGen.dsTablaGStateChange(Sender: TObject);

begin
  syncButtons;
  //lblEditMode.Caption  := DatasetStates[dsTablaG.DataSet.State];

  if ( dsTablaG.DataSet.State = dsInsert ) then
  begin
    lblEditMode.Caption := 'Insertando';
    if tsFicha.Visible = True then
      pcPantalla.ActivePage := tsFicha;
  end;
  if ( dsTablaG.DataSet.State = dsEdit ) then
  begin
    lblEditMode.Caption := 'Editando';
    //pcPantalla.ActivePage := tsFicha;
  end;
  if ( dsTablaG.DataSet.State = dsBrowse ) then
  begin
    lblEditMode.Caption := 'Navegando';
    //pcPantalla.ActivePage := tsFicha;
  end;
    if ( dsTablaG.DataSet.State = dsInactive ) then
  begin
    lblEditMode.Caption := 'Inactivo';
    //pcPantalla.ActivePage := tsFicha;
  end;

end;

procedure TfrmMtoGen.sbGrabarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  GrabarGrids(Screen.ActiveForm);
  if frmOpenApp.FDmConn.conUni.InTransaction = True then
    frmOpenApp.FDmConn.conUni.Commit;
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoGen.sbCancelarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  CancelarGrids(Screen.ActiveForm);
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoGen.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if (Key in ['.', ',']) then Key := FormatSettings.DecimalSeparator;
//  if Ord(Key) = VK_RETURN then
//    if not(ActiveControl is TDBMEMO) and not (ActiveControl is TMEMO) and not
//        (ActiveControl is TcxDBMEMO) then
//          Perform(WM_NEXTDLGCTL, 0, 0);
  if Ord(Key) = VK_ESCAPE then
  begin
    Key := #0;
    if ( (dsTablaG.State = dsInsert) or (dsTablaG.State = dsEdit) ) then
      dsTablaG.DataSet.Cancel
    else
      if (pcPantalla.ActivePage = tsFicha) then
        pcPantalla.ActivePage := tsLista
      else
        Close;
  end;
//  if (Ord(Key) = VK_NEXT) then
//  begin
//    Key := #0;
//    dsTablaG.DataSet.Next;
//  end;
//  if (Ord(Key) = VK_PRIOR) then
//  begin
//    Key := #0;
//    dsTablaG.DataSet.Prior;
//  end;
end;

procedure TfrmMtoGen.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  AContainer: TcxCustomEdit;
begin
  if ((Key = VK_RETURN) and (Shift <> [ssCtrl])) then
  if Assigned(Parent) then
    THackWinControl(Parent).SelectNext(Self, True, False)
  else
    if not (Screen.ActiveControl.Name = 'edtBusqGlobal') then
      if (Screen.ActiveControl.Parent <> nil) and
         (Screen.ActiveControl.Parent is TcxCustomEdit) then
      begin
        AContainer :=  TcxCustomEdit(Screen.ActiveControl.Parent);
        if not(AContainer.Parent is TcxGridSite) then
          Perform(CM_DIALOGKEY, VK_TAB, 0);
      end
      else
        Perform(CM_DIALOGKEY, VK_TAB, 0);
  //  if not(Sender is TcxGridDBTableView) then
  //    Perform(CM_DIALOGKEY, VK_TAB, 0);
end;

procedure TfrmMtoGen.cxGrdDBTabPrinDblClick(Sender: TObject);
begin
  pcPantalla.ActivePage := tsFicha;
end;

procedure TfrmMtoGen.cxGrabOpcClick(Sender: TObject);
begin
  //PutIniControlSettings(Sender);
end;

procedure TfrmMtoGen.edtBusqGlobalKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    BusqAllGrid(cxGrddbTabPrin, edtBusqGlobal.Text);
end;

procedure TfrmMtoGen.FormShow(Sender: TObject);
begin
  cxlclzr1.StorageType := lstResource;
  cxlclzr1.FileName := 'CXLOCALIZATION.res';
  cxlclzr1.Active := True;
  cxlclzr1.Locale := 1034;

  if oCaps = 'S' then
  begin
    //SetCaseTcxTextProperty(Sender as TComponent, ecUpperCase );
    //chkCaseM.Checked := true;
  end
  else
    begin
      //SetCaseTcxTextProperty(Sender as TComponent, ecNormal);
      //chkCaseM.Checked := false;
    end;
end;

procedure TfrmMtoGen.chkEditinListChange(Sender: TObject);
begin
//  if (chkEditinList.Checked = true) then
//    cxGrdDBTabPrin.OptionsData.Editing := true
//  else
//    cxGrdDBTabPrin.OptionsData.Editing := false
end;

procedure TfrmMtoGen.chkCaseMChange(Sender: TObject);
var
  cForm : Tcomponent;
begin
//  cForm := FindFormOwner(Sender);
//  if chkCaseM.Checked = true then
//  begin
//    SetCaseTcxTextProperty(cForm, ecUpperCase );
//    oCaps := 'S';
//  end
//  else
//  begin
//    SetCaseTcxTextProperty(cForm, ecNormal);
//    oCaps := 'N';
//  end;
end;

procedure TfrmMtoGen.FormActivate(Sender: TObject);
begin
  //RecoverColumnsStateActiveWindow;
  //RecoverWindowSettingsGen;
  //if edtBusqGlobal.Text <> '' then
  //  BusqAllGrid(cxGrddbTabPrin, edtBusqGlobal.Text);
end;

procedure TfrmMtoGen.btnRestoreWindowClick(Sender: TObject);
begin
  oCleaning := true;
end;

procedure TfrmMtoGen.ChangeListaToFicha;
begin
      if (pcPantalla.ActivePage = tsLista) then
        pcPantalla.ActivePage := tsFicha
end;

procedure TfrmMtoGen.cxGrdDBTabPrinNavigatorButtonsButtonClick(
  Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  syncButtons;
end;

procedure TfrmMtoGen.btnExportarExcelClick(Sender: TObject);
var
  saveDialog : tsavedialog;
begin
  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title := 'Guardar Rejilla a Excel';
  saveDialog.InitialDir := GetCurrentDir;
  saveDialog.Filter := 'Archivo Excel|*.xlsx';
  saveDialog.DefaultExt := 'xlsx';
  saveDialog.FilterIndex := 1;
  if saveDialog.Execute then
    ExportGridToXLSX(saveDialog.FileName, cxGrdPrincipal);
  saveDialog.Free;
end;

initialization
  oCleaning := false;
end.

