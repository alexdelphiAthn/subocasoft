
unit UniDataClientes;

interface

uses
  SysUtils, Vcl.Dialogs, Classes, DB, MemDS, inMtoPrincipal,
  DBAccess, Uni, frxClass, frxDBSet, Datasnap.DBClient, Datasnap.Provider;

type
  TDMClientes = class(TDataModule)
    dsFacturas: TDataSource;
    dsLinFac: TDataSource;
    dsHistoria: TDataSource;
    unqryClientes: TUniQuery;
    unqryFacturas: TUniQuery;
    unqryLinFac: TUniQuery;
    unqryHistoria: TUniQuery;
    unstrdprcContador: TUniStoredProc;
    unqryArtDataHisCli: TUniQuery;
    unstrdprcGetDataArticulo: TUniStoredProc;
    dsPresupuestos: TDataSource;
    dsLinPre: TDataSource;
    unqryPresupuestos: TUniQuery;
    unqryLinPre: TUniQuery;
    unstrdprcHistoriaFactura: TUniStoredProc;
    dsCliPrint: TDataSource;
    fxdsPrintCli: TfrxDBDataset;
    unqryCliPrint: TUniQuery;
    cdsEtiquetas: TClientDataSet;
    dtstprvEtiquetas: TDataSetProvider;
    dsEtiquetas: TDataSource;
    unqryGetSerie: TUniQuery;
    dsCuestionario: TDataSource;
    unqryCuestionario: TUniQuery;
    unstrdprcCrearCuestionario: TUniStoredProc;
    dsCuestionarioPreguntas: TDataSource;
    unqryCuestionarioPreguntas: TUniQuery;
    dsCliPrintCues: TDataSource;
    fxdsPrintCliCues: TfrxDBDataset;
    unqryCliPrintCues: TUniQuery;
    dsPaises: TDataSource;
    unqryPaisesCli: TUniQuery;
    unqryPaises: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure unqryClientesAfterInsert(DataSet: TDataSet);
    procedure unqryClientesBeforePost(DataSet: TDataSet);
    procedure unqryHistoriaAfterInsert(DataSet: TDataSet);
    procedure FacturarHistorias(sIdHistoria:string; var sSerie, sNroFac, sNroLin:String);
  public
     procedure NuevoCliente;
     procedure Crear_Cuestionario;
     procedure CopiarPaisaCliente;
  public
    constructor Create(AOwner: TComponent);
    procedure CopiarArticuloaHistoriaCliente;
    procedure CrearDataSetEtiquetas(iNroEspaciosBlanco: Integer; sCodCli:String);
  end;
var
  dmClientes: TDMClientes;

implementation

uses
  inMtoClientes;

{$R *.dfm}

procedure TDMClientes.CopiarArticuloaHistoriaCliente;
begin
   with dsHistoria.Dataset do
   begin
      Edit;
      FindField('CODIGO_ARTICULO').AsString :=
                       unqryArtDataHisCli.FindField('CODIGO_ARTICULO').AsString;
      FindField('DESCRIPCION_ARTICULO').AsString :=
                  unqryArtDataHisCli.FindField('DESCRIPCION_ARTICULO').AsString;
      FindField('PRECIOVENTA_ARTICULO').AsString :=
                  unqryArtDataHisCli.FindField('PRECIOVENTA_ARTICULO').AsString;
      Post;
   end;
end;

procedure CreatePersistentFields(ADataTable: TClientDataSet);
var
  idxField: Integer;
  field: TFieldDef;
begin
  if ADataTable.Active then
    ADataTable.Close;
  try
    if not ADataTable.FieldDefs.Updated then
      ADataTable.FieldDefs.Update;

    for idxField := 0 to Pred(ADataTable.FieldDefs.Count) do
    begin
      field := ADataTable.FieldDefs[idxField];
      if not Assigned(ADataTable.FindField(field.Name)) then
        field.CreateField(ADataTable);
    end;
  finally
    ADataTable.Open;
  end;
end;

procedure TDMClientes.CopiarPaisaCliente;
begin
  if ((unqryClientes.State <> dsEdit) or (unqryClientes.State <> dsInsert)) then
          unqryClientes.Edit;
  unqryClientes.FindField('PAIS_CLIENTE').AsString :=
                              unqryPaises.FindField('COD_PAIS_ALPHA2').AsString;

end;

procedure TDMClientes.CrearDataSetEtiquetas(iNroEspaciosBlanco: Integer;
                                            sCodCli:String);
var
  i:Integer;
begin
  with dmmClientes do
  begin
    unqryCliPrint.SQL.Text := ' SELECT * ' +
                              '   FROM SUBOC_CLIENTES ' +
                              '  WHERE CODIGO_CLIENTE = :CODIGO';
    unqryCliPrint.ParamByName('CODIGO').AsString := sCodCli;
    unqryCliPrint.Open;
  end;
  cdsEtiquetas.Data := dtstprvEtiquetas.Data;
  cdsEtiquetas.ReadOnly := False;
  cdsEtiquetas.Active := True;
  cdsEtiquetas.First;
  cdsEtiquetas.DisableControls;
  cdsEtiquetas.DisableConstraints;
  //cdsEtiquetas.IndexDefs.Clear;
  for i := 0 to (cdsEtiquetas.Fieldcount-1) do
  begin
    cdsEtiquetas.fields[i].ReadOnly := false;
    cdsEtiquetas.Fields[i].Required := false;
    cdsEtiquetas.FieldDefs[i].Attributes := [];
  end;

  for i := 1 to iNroEspaciosBlanco do
  begin
    cdsEtiquetas.Insert;
    cdsEtiquetas.FieldByName('CODIGO_CLIENTE').AsString := '0';
    cdsEtiquetas.Post;
  end;
end;

procedure TDMClientes.Crear_Cuestionario;
begin
  with unstrdprcCrearCuestionario do
  begin
    ParamByName('pCODIGO_CLIENTE').AsString := unqryClientes.FindField('CODIGO_CLIENTE').AsString;
    ParamByName('pFECHA').AsDate := Now;
    ParamByName('pNOMBRE').AsString := unqryClientes.FindField('NOMBRE').AsString;
    ParamByName('pAPELLIDOS').AsString := unqryClientes.FindField('APELLIDOS').AsString;
    ExecProc;
  end;
  unqryCuestionario.Refresh;
  unqryCuestionarioPreguntas.Refresh;
end;

constructor TDMClientes.Create(AOwner: TComponent);
begin
  //dmConn := TdmConn.Create(dmConn);
  //dmConn.ZconnGlent.Connect;
  inherited;
end;

procedure TDMClientes.DataModuleCreate(Sender: TObject);
begin
  inherited;
  with frmopenapp do
  begin
      unqryClientes.Connection              := FDmConn.conUni;
      unqryLinFac.Connection                := FDmConn.conUni;
      unqryFacturas.Connection              := FDmConn.conUni;
      unqryLinFac.Connection                := FDmConn.conUni;
      unqryHistoria.Connection              := FDmConn.conUni;
      unstrdprcContador.Connection          := FDmConn.conUni;
      unqryArtDataHisCli.Connection         := FDmConn.conUni;
      unstrdprcGetDataArticulo.Connection   := FDmConn.conUni;
      unqryPresupuestos.Connection          := FDmConn.conUni;
      unqryLinPre.Connection                := FDmConn.conUni;
      unstrdprcHistoriaFactura.Connection   := FDmConn.conUni;
      unqryGetSerie.Connection              := FDmConn.conUni;
      unqryCuestionario.Connection          := FDmConn.conUni;
      unqryCuestionarioPreguntas.Connection := FDmConn.conUni;
      unstrdprcCrearCuestionario.Connection := FDmConn.conUni;
      unqryPaises.Connection := Fdmconn.conUni;
  end;
  unqryClientes.Open;
  unqryHistoria.Open;
  unqryFacturas.Open;
  unqryLinFac.Open;
  unqryPresupuestos.Open;
  unqryLinPre.Open;
  unqryCuestionario.Open;
  unqryCuestionarioPreguntas.Open;
  unqryPaisesCli.Open;
end;

procedure TDMClientes.DataModuleDestroy(Sender: TObject);
begin
  unqryHistoria.Close;
  unqryFacturas.Close;
  unqryLinFac.Close;
  unqryClientes.Close;
  unqryPresupuestos.Close;
  unqryLinPre.Close;
  unqryCuestionario.Close;
  unqryCuestionarioPreguntas.Close;
  unqryPaisesCli.Close;
end;

procedure TDMClientes.FacturarHistorias(sIdHistoria:string;
                                          var sSerie, sNroFac, sNroLin:String );
begin
//
  unqryGetSerie.SQL.Text := 'SELECT FNC_GET_SERIE_TIPODOC(' + QuotedStr('FC') +')';
  unqryGetSerie.Open;
  with unstrdprcHistoriaFactura do
  begin
      ParamByName('pID_HISTORIA').AsString := sIdHistoria;
      ParamByName('pSERIEin').AsString := unqryGetSerie.Fields[0].AsString;
      ParamByName('pFechaIn').AsDate := Now;
      ParamByName('PFacturain').AsString := '0';
      ExecProc;
      sNroFac := ParamByName('pNroFactura').AsString;
      sSerie := ParamByName('pSERIEin').AsString;
      sNroLin := ParamByName('pNroLinea').AsString;
  end;
  unqryHistoria.Refresh;
end;

procedure TDMClientes.NuevoCliente;
begin
  if (unqryClientes.FindField('CODIGO_CLIENTE').AsString = '0') then
  begin
    with unstrdprcContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      ParamByName('ptipodoc').AsString :=  'CL';
      ExecProc;
      unqryClientes.FindField('CODIGO_CLIENTE').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
end;

procedure TDMClientes.unqryClientesAfterInsert(DataSet: TDataSet);
begin
  unqryClientes.FieldByName('CODIGO_CLIENTE').ASSTRING := '0';
  unqryClientes.FieldByName('PAIS_CLIENTE').AsString := 'ES';
end;

procedure TDMClientes.unqryClientesBeforePost(DataSet: TDataSet);
begin
  NuevoCliente;
end;

procedure TDMClientes.unqryHistoriaAfterInsert(DataSet: TDataSet);
begin
  unqryHistoria.FieldByName('FECHA').AsDateTime := Now;
end;

end.
