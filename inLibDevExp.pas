unit inLibDevExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, DB, ADODB, DBCtrls, StdCtrls,
  ExtCtrls, Grids, DBGrids, ComCtrls, Buttons, Mask, UniDataInq, //dxCntner,
  //dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxNavigator, cxLookAndFeelPainters,
  cxButtons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxImage, jpeg, cxCalendar, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,  cxGridCardView,
  cxGridDBCardView, cxGridBandedTableView, cxGridDBBandedTableView, //dxTL,
  //dxDBCtrl, dxDBTL,
  cxGroupBox, cxLabel, cxRadioGroup, cxListBox,
  cxCheckBox, cxMemo, cxCurrencyEdit, ExtDlgs, OleServer, AxCtrls,
  OleCtrls, DBOleCtl, cxLookAndFeels;

  procedure BusqAllGrid(var dbTvGen: TcxGridDBTableView; sDatoBusq:String);
  procedure GrabarGrids(frmMto:TComponent);
  procedure CancelarGrids(frmMto:TComponent);
  procedure SetCaseTcxTextProperty(oControl:TComponent; sCase:TEditCharCase);
  procedure SaveColumnsStateActiveWindow;
  procedure RecoverColumnsStateActiveWindow;
  procedure ResetColumnsStateActiveWindow;
  procedure PonerAnchosTitulos(cxgrdtvVista: TcxGridDBTableView;
  sDes: string);
  //procedure GrabarConfGrid(sUser:String; sFormName: String; sGridName: String);


implementation

uses  inLibUser, inLibWin, inLibtb, inLibDir;

procedure PonerAnchosTitulos(cxgrdtvVista: TcxGridDBTableView;
  sDes: string);
  var
    iAux:Integer;
begin
  if sDes='Clientes' then
  begin
    cxgrdtvVista.GetColumnByFieldName('CODIGO_CLIENTE').Caption := 'Filiación';
    cxgrdtvVista.GetColumnByFieldName('CODIGO_CLIENTE').Width := 60;
    cxgrdtvVista.GetColumnByFieldName('RAZONSOCIAL_CLIENTE').Caption := 'Razón Social';
    cxgrdtvVista.GetColumnByFieldName('RAZONSOCIAL_CLIENTE').Width := 200;
    cxgrdtvVista.GetColumnByFieldName('NOMBRE').Caption := 'Nombre';
    cxgrdtvVista.GetColumnByFieldName('NOMBRE').Width := 100;
    iAux := cxgrdtvVista.GetColumnByFieldName('NOMBRE').Index;
    cxgrdtvVista.GetColumnByFieldName('NOMBRE').Index :=
                                     cxgrdtvVista.GetColumnByFieldName('NIF_CLIENTE').Index;
    cxgrdtvVista.GetColumnByFieldName('NIF_CLIENTE').Index := iAux;
    cxgrdtvVista.GetColumnByFieldName('APELLIDOS').Caption := 'Apellidos';
    cxgrdtvVista.GetColumnByFieldName('APELLIDOS').Width := 180;
    iAux := cxgrdtvVista.GetColumnByFieldName('APELLIDOS').Index;
    cxgrdtvVista.GetColumnByFieldName('APELLIDOS').Index :=
                                     cxgrdtvVista.GetColumnByFieldName('EMAIL_CLIENTE').Index;
    cxgrdtvVista.GetColumnByFieldName('EMAIL_CLIENTE').Index := iAux;
    cxgrdtvVista.GetColumnByFieldName('MOVIL_CLIENTE').Caption := 'Teléfono Móvil';
    cxgrdtvVista.GetColumnByFieldName('MOVIL_CLIENTE').Width := 135;
    iAux := cxgrdtvVista.GetColumnByFieldName('APELLIDOS').Index;
    cxgrdtvVista.GetColumnByFieldName('APELLIDOS').Index :=
                                     cxgrdtvVista.GetColumnByFieldName('MOVIL_CLIENTE').Index;
    cxgrdtvVista.GetColumnByFieldName('MOVIL_CLIENTE').Index := iAux;
    cxgrdtvVista.GetColumnByFieldName('DIRECCION1_CLIENTE').Caption := 'Dirección';
    cxgrdtvVista.GetColumnByFieldName('DIRECCION1_CLIENTE').Width := 264;
    cxgrdtvVista.GetColumnByFieldName('DIRECCION2_CLIENTE').Caption := 'Más Dirección';
    cxgrdtvVista.GetColumnByFieldName('DIRECCION2_CLIENTE').Width := 102;
    cxgrdtvVista.GetColumnByFieldName('POBLACION_CLIENTE').Caption := 'Población';
    cxgrdtvVista.GetColumnByFieldName('POBLACION_CLIENTE').Width := 175;
    cxgrdtvVista.GetColumnByFieldName('PROVINCIA_CLIENTE').Caption := 'Provincia';
    cxgrdtvVista.GetColumnByFieldName('PROVINCIA_CLIENTE').Width := 135;
    cxgrdtvVista.GetColumnByFieldName('CPOSTAL_CLIENTE').Caption := 'Código Postal';
    cxgrdtvVista.GetColumnByFieldName('CPOSTAL_CLIENTE').Width := 95;
    cxgrdtvVista.GetColumnByFieldName('REFERENCIA_CLIENTE').Caption := 'Referencia';
    cxgrdtvVista.GetColumnByFieldName('REFERENCIA_CLIENTE').Width := 204;
    cxgrdtvVista.GetColumnByFieldName('OBSERVACIONES_CLIENTE').Caption := 'Observaciones';
    cxgrdtvVista.GetColumnByFieldName('OBSERVACIONES_CLIENTE').Width := 144;
    cxgrdtvVista.GetColumnByFieldName('PROFESION_CLIENTE').Caption := 'Profesión';
    cxgrdtvVista.GetColumnByFieldName('PROFESION_CLIENTE').Width := 168;
    cxgrdtvVista.GetColumnByFieldName('FECHA_NACIMIENTO').Caption := 'Fecha Nacimiento';
    cxgrdtvVista.GetColumnByFieldName('FECHA_NACIMIENTO').Width := 166;
    cxgrdtvVista.GetColumnByFieldName('NIF_CLIENTE').Caption := 'NIF';
    cxgrdtvVista.GetColumnByFieldName('NIF_CLIENTE').Width := 115;
    cxgrdtvVista.GetColumnByFieldName('EMAIL_CLIENTE').Caption := 'Email';
    cxgrdtvVista.GetColumnByFieldName('EMAIL_CLIENTE').Width := 171;
  end;
  if sDes='Productos' then
  begin
     cxgrdtvVista.GetColumnByFieldName('CODIGO_ARTICULO').Caption := 'Código';
     cxgrdtvVista.GetColumnByFieldName('CODIGO_ARTICULO').Width := 58;
     cxgrdtvVista.GetColumnByFieldName('DESCRIPCION_ARTICULO').Caption := 'Tratamiento';
     cxgrdtvVista.GetColumnByFieldName('DESCRIPCION_ARTICULO').Width := 260;
     cxgrdtvVista.GetColumnByFieldName('FAMILIA_ARTICULO').Caption := 'Familia';
     cxgrdtvVista.GetColumnByFieldName('FAMILIA_ARTICULO').Width := 58;
     cxgrdtvVista.GetColumnByFieldName('PRECIOVENTA_ARTICULO').Caption := 'Precio';
     cxgrdtvVista.GetColumnByFieldName('PRECIOVENTA_ARTICULO').Width := 70;
     cxgrdtvVista.GetColumnByFieldName('PRECIOVENTA_ARTICULO').PropertiesClass := TcxCustomCurrencyEditProperties;
  end;
end;



procedure BusqAllGrid(var dbTvGen: TcxGridDBTableView; sDatoBusq:String);
var
 i:Integer;
begin
  if sDatoBusq <> '' then
   begin
     with dbTvGen.DataController.Filter do
     begin
       BeginUpdate;
       Options := Options + [fcoCaseInsensitive];
       try
         Root.Clear;
         Root.BoolOperatorKind := fboOr;
         for i := 0 to dbTvGen.ColumnCount -1 do
         begin
           //cxGrdPrincipal.
           Root.AddItem((dbTvGen.Columns[i] as TObject) , foLike,      sDatoBusq +'%',      sDatoBusq +'%' );
           Root.AddItem((dbTvGen.Columns[i] as TObject) , foLike,'%' + sDatoBusq +'%', '%' +sDatoBusq +'%' );
           Root.AddItem((dbTvGen.Columns[i] as TObject) , foLike,'%' + sDatoBusq, '%' +     sDatoBusq  );

         end;

       finally
         EndUpdate;
       end;
       Active := true;
     end;
   end
   else
      dbTvGen.DataController.Filter.Root.Clear;

end;

procedure CancelarGrids(frmMto:TComponent);
var
  i:Integer;
begin

  for i:= 0 to frmMto.Componentcount - 1 do
  begin
    if frmMto.Components[i].ClassNameis('TcxGridDBTableView') then
    begin
     // ShowMessage((frmMto.Components[i] as TcxGridDBTableView).Name);
    if ( (frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource <> nil ) then
      if ( ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.State = dsInsert) or
           ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.State = dsEdit)
         ) then
      begin
        (frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.Cancel;
      end;
    end;
  end;
end;

procedure GrabarGrids(frmMto:TComponent);
var
  i:Integer;
begin

  for i:= 0 to frmMto.Componentcount - 1 do
  begin
    if frmMto.Components[i].ClassNameis('TcxGridDBTableView') then
    begin
     // ShowMessage((frmMto.Components[i] as TcxGridDBTableView).Name);
    if ( (frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource <> nil ) then
      if ( ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.State = dsInsert) or
           ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.State = dsEdit)
         ) then
      begin
        (frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.Post;
      end;
    end;
  end;
end;

//procedure AplicarPermisos(frmMto:TComponent);
//var
//  i:Integer;
//begin
//
//  for i:= 0 to frmMto.Componentcount - 1 do
//  begin
//    if frmMto.Components[i].ClassNameis('TcxGridDBTableView') then
//    begin
//     // ShowMessage((frmMto.Components[i] as TcxGridDBTableView).Name);
//    if ( (frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource <> nil ) then
//      if ( ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.State = dsInsert) or
//           ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet.State = dsEdit)
//         ) then
//      begin
//        ((frmMto.Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet as TZquery).ReadOnly := True;
//      end;
//    end;
//  end;
//end;

procedure GrabarConfGrid(frmFormName: TForm; sVistaGridName: String; dsTabla: TDataSource);
var
  i,j     : Integer;

  //qyTabla : TZTable ;
  //spIndex : TADOStoredProc    ;

  //cdIndex : TZTable ;

  sTabla,
  sColumn,
  sTipo,
  sDesc,
  sAncho,
  sUser,
  sMascara: String;
  bPK     : boolean;
  iLong   : Integer;

  bActivos: Boolean;
  bCaps   : Boolean;
  bEdits  : Boolean;

  //FdmDatosg : TdmApi;

  cxgdbVista: TcxGridDBTableView;

begin

  //grabacion de los campos de la bbdd y columnas del grid, máscaras...
  {
  if Assigned(dsTabla.DataSet) then
    if dsTabla.DataSet.ClassName = 'TZTable' then
    begin
      FdmDatosg := TdmApi.Create(Application);

      FdmDatosg.qyDescColumn.Open;

      sTipo := '';
      sTabla := '';
      sUser := oUser;

      qyTabla := (dsTabla.DataSet as TZTable);
      sTabla := qyTabla.tablename;
      if (sTabla <> '') then
      begin
        spIndex := TADOStoredProc.Create(Application);
        cdIndex := TBetterADODataSet.Create(Application);


        //hay problema al asignar la conexión
        if EsBBDDPerfil(sTabla) then
          spIndex.Connection := FdmDatosg.qyDescColumn.Connection
        else
          spIndex.Connection := FdmDatosg.qyInq.Connection;

        //Seleccionamos columnas de todos los índices.

        spIndex.ProcedureName := 'sp_helpindex';
        spIndex.Parameters.Refresh;
        spIndex.Parameters.ParamByName('@objname').Value := sTabla;

        spIndex.Open;

        cdIndex.Recordset := spIndex.Recordset;

        spIndex.Close;

        spIndex.Destroy;


        for i:= 0 to qyTabla.FieldCount - 1  do
        begin
          iLong := 0;
          sColumn := qyTabla.Fields[i].FieldName;

          if qyTabla.Fields[i].ClassName = 'TWideStringField' then
          begin
            sTipo := 'Texto';
            iLong := qyTabla.Fields[i].Size;
          end
          else
            if qyTabla.Fields[i].ClassName = 'TBooleanField' then
              sTipo := 'Check'
            else
              if (
                   (qyTabla.Fields[i].ClassName = 'TSmallintField') or
                   (qyTabla.Fields[i].ClassName = 'TIntegerField')
                 )
              then
                sTipo := 'Entero'
              else
                if qyTabla.Fields[i].ClassName = 'TMemoField' then
                  sTipo := 'Memo'
                else
                  if qyTabla.Fields[i].ClassName = 'TDateTimeField' then
                    sTipo := 'FechaHora'
                  else
                    sTipo := '';

          cxgdbVista := (EncontrarObjeto(frmFormName,
                                         'TcxGridDBTableView',
                                         sVistaGridName) as TcxGridDBTableView);

          bPK := false; //NO FUNCIONA
          if cdIndex.Locate('index_keys', sColumn, []) then
            if Pos(sTabla + '_PK', cdIndex.FieldByName('index_name').AsString) > 0 then
              bPK := true;




          j := 0;
          while (   ( j <= cxgdbVista.ColumnCount - 1                        )
                and ( cxgdbVista.Columns[j].DataBinding.FieldName <> sColumn )
                ) do
            j := j + 1;

          if (j <= cxgdbVista.ColumnCount - 1) then
          begin
            sDesc := cxgdbVista.Columns[j].Caption;
            sAncho := IntToStr(cxgdbVista.Columns[j].width);
            if cxgdbVista.Columns[j].PropertiesClassName = 'TcxMaskEditProperties' then
            begin
              sTipo := 'Mask';
              sMascara := ((cxgdbVista.Columns[j]).Properties as TcxMaskEditProperties).EditMask;
            end
            else
              sMascara := '';
          end
          else
            begin
              sDesc := '';
              sAncho := '0';
            end;

          //insertamos info metadatos
          with FdmDatosg do
          begin
            if qyDescColumn.Locate('Usuario;VistaGrid;Form;Columna',
                                   VarArrayOf([sUser,sVistaGridName, frmFormName.Name, sColumn]), []) then
              qyDescColumn.Delete;

            qyDescColumn.Insert;

            qyDescColumnNomTabla.AsString     := sTabla;
            qyDescColumnColumna.AsString      := sColumn;
            qyDescColumnDescripcion.AsString  := sDesc;
            qyDescColumnAncho.AsString        := sAncho;
            qyDescColumnTipo.AsString         := sTipo;
            qyDescColumnUsuario.AsString      := sUser;
            qyDescColumnMascara.AsString      := sMascara;
            qyDescColumnLongitud.AsInteger    := iLong;
            qyDescColumnPK.AsBoolean          := bPK;
            qyDescColumnVistaGrid.AsString    := sVistaGridName;
            qyDescColumnForm.AsString         := frmFormName.Name;

            qyDescColumn.Post;

          end;
        end;
        //CagarIndices(cdIndex, FdmDatosg.tbIndex, sTabla);
      end;

     //Grabación de las características de la ventana y splitters

     //sFormName := frm;
     //bActivos  := chkSoloActivos.Checked;
     //bEdits    := chkEditInList.Checked ;
     //bCaps     := chkCaseM.Checked;

    // sFormName := frmFormName.Name;


     // if ( FdmDatosg.qyParam.Locate('NomUser;Clave', VarArrayOf([oUser, ]), []) )



    end;
    }
end;


 {
AItemList: TcxFilterCriteriaItemList;
...
  <DataController>.Filter.BeginUpdate;
  try
    <DataController>.Filter.Root.Clear;
    <DataController>.Filter.Root.AddItem(colCustNo, foLess, 1000, '1000');
    AItemList := <DataController>.Filter.Root.AddItemList(fboOr);
    AItemList.AddItemcolName, foLike, 'A%', 'A%');
    AItemList.AddItem(colName, foLike, 'Z%', 'Z%');
  finally
    <DataController>.Filter.EndUpdate;
  end;
                                                   );
  finally
    cxGridDBTableView.DataController.Filter.EndUpdate;
  end;
  cxGridDBTableView.DataController.Filter.Active := True;



  //filter complex
  Never mind, I figured it out. It would be :
  with tvCustomers.DataController.Filter.Root do
  begin
    BoolOperatorKind := fboOr;
    with AddItemList(fboOr) do
    begin
      Clear;
      BoolOperatorKind := fboAnd;
      AddItem(tvCustomersPRODUCTID, foEqual, cExpressQuantumGridID,
'ExpressQuantumGrid');
      AddItem(tvCustomersPAYMENTTYPE, foEqual, cCashID, 'Cash');
    end; //End With
  end; //End With .Root

  with tvCustomers.DataController.Filter.Root do
  begin
    BoolOperatorKind := fboOr;
    with AddItemList(fboOr) do
    begin
      Clear;
      BoolOperatorKind := fboAnd;
      AddItem(tvCustomersPRODUCTID, foEqual, cExpressQuantumGridID,
'XpressQuantumGrid');
      AddItem(tvCustomersPAYMENTTYPE, foEqual, cCashID, 'American Express');
    end; //End With
  end; //End With .Root
    }


{
 View.OnMouseMove:
var HT: TcxCustomGridHitTest;
begin
  HT := TcxGridSite(Sender).ViewInfo.GetHitTest(x,y);
  if (HT is TcxGridColumnHeaderHitTest) then begin
    cxGrid.ShowHint := True;
    cxGrid.Hint := TcxGridColumnHeaderHitTest(HT).Column.Caption;
  end else cxGrid.ShowHint := False;
end;
}



procedure SetCaseTcxTextProperty(oControl:TComponent; sCase:TEditCharCase);
var
  i:Integer;
begin

  for i:= 0 to oControl.Componentcount - 1 do
  begin
    if oControl.Components[i].ClassNameis('TcxDBTextEdit') then
      (oControl.Components[i] as TcxDBTextEdit).Properties.CharCase := sCase;

    if oControl.Components[i].ClassNameis('TcxTextEdit') then
      (oControl.Components[i] as TcxTextEdit).Properties.CharCase := sCase;

    if oControl.Components[i].ClassNameIs('TcxDBMaskEdit') then
      (oControl.Components[i] as TcxDBMaskEdit).Properties.CharCase := sCase;

    if oControl.Components[i].ClassNameIs('TcxDBMemo') then
      (oControl.Components[i] as TcxDBMemo).Properties.CharCase := sCase;

    if oControl.Components[i].ClassNameIs('TcxGridDBColumn') then
      if (oControl.Components[i] as TcxGridDBColumn).PropertiesClassName = ('TcxTextEditProperties') then
      begin
           ((oControl.Components[i] as TcxGridDBColumn).Properties as TcxTextEditProperties).CharCase := sCase;
      end
      else
      begin
        //ShowMessage( ((oControl.Components[i] as TcxGridDBColumn).PropertiesClassName));
      end;

  end;
end;

procedure SaveColumnsStateActiveWindow;
var X:integer;
  GridTV:TcxGridDBTableView;
  Name : string;
  Form : Tform;
begin
  Form := screen.ActiveForm;
  Name := screen.activeform.name;
  for x:=0 to Form.ComponentCount - 1 do
  begin
    if (Form.Components[x] is tcxGridDBTableView) then
    begin
      GridTV := TcxGridDBTableView(Form.Components[x]);
      GridTV.storetoIniFile(DirIni + oUser + '_' + Form.caption + '_' + GridTV.name + '.ini' ) ;
    end;
  end;
end;

procedure RecoverColumnsStateActiveWindow;
var X:integer;
  GridTV:TcxGridDBTableView;
  Name : string;
  Form : Tform;
begin
  Form := screen.ActiveForm;
  Name := screen.activeform.name;
  for x:=0 to Form.ComponentCount - 1 do
  begin
    if (Form.Components[x] is tcxGridDBTableView) then
    begin
      GridTV := TcxGridDBTableView(Form.Components[x]);
      If FileExists(DirIni + oUser +'_'+ Form.Caption + '_' + GridTV.name + '.ini') then
        GridTV.RestoreFromIniFile(DirIni + oUser + '_' +Form.caption + '_' + GridTV.name + '.ini' ) ;
    end;
  end;
end;

procedure ResetColumnsStateActiveWindow;
var X:integer;
  Grid:TcxGridDBTableView;
  Name : string;
  Form : Tform;
begin
  Form := screen.ActiveForm;
  Name := screen.activeform.name;
  for x:=0 to Form.ComponentCount - 1 do
  begin
    if (Form.Components[x] is tcxGridDBTableView) then
    begin
      Grid := TcxGridDBTableView(Form.Components[x]);
      If FileExists(DirIni + oUser +'_'+ Form.Caption + '_' + Grid.name + '.ini') then
        DeleteFile(DirIni + oUser + '_' +Form.caption + '_' + Grid.name + '.ini' ) ;
    end;
  end;
end;

end.

