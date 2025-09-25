unit inMtoModalSubsanacionLineas;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxLabel, Vcl.StdCtrls, cxButtons,
  cxCurrencyEdit, cxGroupBox, Uni, System.JSON, cxGridCustomView, inMtoPrincipal,
  dxDateRanges, dxScrollbarAnnotations, Vcl.Menus, MemDS, DBAccess, cxClasses,
  Datasnap.DBClient, Datasnap.Provider, cxButtonEdit, dxSkinBlue;
type
  TfrmModalSubsanacionLineas = class(TForm)
    pnlMain: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    gbLineasDetalle: TcxGroupBox;
    grdLineas: TcxGrid;
    tvLineas: TcxGridDBTableView;
    lvLineas: TcxGridLevel;
    dsLineas: TDataSource;
    qryLineas: TUniQuery;
    pnlTotales: TPanel;
    lblTotalOriginal: TcxLabel;
    lblTotalActual: TcxLabel;
    lblDiferencia: TcxLabel;
    // Columnas del grid
    colDescripcion: TcxGridDBColumn;
    colCantidad: TcxGridDBColumn;
    colImporteUnitarioOriginal: TcxGridDBColumn;
    colImporteUnitarioActual: TcxGridDBColumn;
    colImporteTotalLinea: TcxGridDBColumn;
    lblStateDataset: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure cdsLineasAfterPost(DataSet: TDataSet);
    procedure colImporteUnitarioActualGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvLineasEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    // Agregamos el manejador del mensaje personalizado
    procedure dsLineasStateChange(Sender: TObject);
    procedure colImporteUnitarioActualPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FConnection: TUniConnection;
    FSerieFactura: string;
    FNumeroFactura: Integer;
    FTotalLiquidoFactura: Currency;
    FLineasModificadas: Boolean;
    FTotalOriginal: Currency;
    // Componentes creados en tiempo de ejecución
    FcdsLineas: TClientDataSet;
    FdpLineas: TDataSetProvider;
    procedure CrearComponentesTemporales;
    procedure LiberarComponentesTemporales;
    procedure CargarLineasDetalle;
    procedure CrearEstructuraClientDataSet;
    procedure CargarDatosEnClientDataSet;
    procedure CalcularTotales;
    function ValidarTotales: Boolean;
    procedure ActualizarLabelsTotal;
    procedure ConfigurarGrid;
    procedure ActualizarLineasEnBD;
    procedure RecalcularImporteTotalLinea;
  public
    constructor Create(AOwner: TComponent; AConnection: TUniConnection;
                      const ASerieFactura: string; ANumeroFactura: Integer;
                      ATotalLiquidoFactura: Currency); reintroduce;
    property LineasModificadas: Boolean read FLineasModificadas;
  end;
implementation
uses
  inLibData, inLibVarGlob;
{$R *.dfm}
constructor TfrmModalSubsanacionLineas.Create(AOwner: TComponent;
  AConnection: TUniConnection; const ASerieFactura: string;
  ANumeroFactura: Integer; ATotalLiquidoFactura: Currency);
begin
  inherited Create(AOwner);
  FConnection := AConnection;
  FSerieFactura := ASerieFactura;
  FNumeroFactura := ANumeroFactura;
  FTotalLiquidoFactura := ATotalLiquidoFactura;
  FLineasModificadas := False;
  FTotalOriginal := 0;
end;

procedure TfrmModalSubsanacionLineas.dsLineasStateChange(Sender: TObject);
begin
case dsLineas.State of
    dsBrowse:
      lblStateDataset.Caption := 'Navegando';
    dsEdit:
      lblStateDataset.Caption := 'Editando';
    dsInsert:
      lblStateDataset.Caption := 'Insertando';
    dsInactive:
      lblStateDataset.Caption := 'Inactivo';
    dsOpening:
      lblStateDataset.Caption := 'Abriendo';
    dsSetKey:
      lblStateDataset.Caption := 'Estableciendo clave';
    dsCalcFields:
      lblStateDataset.Caption := 'Calculando campos';
    dsFilter:
      lblStateDataset.Caption := 'Filtrando';
    dsNewValue:
      lblStateDataset.Caption := 'Nuevo valor';
    dsOldValue:
      lblStateDataset.Caption := 'Valor anterior';
    dsCurValue:
      lblStateDataset.Caption := 'Valor actual';
    dsBlockRead:
      lblStateDataset.Caption := 'Leyendo bloque';
    dsInternalCalc:
      lblStateDataset.Caption := 'Cálculo interno';
  else
    lblStateDataset.Caption := 'Estado desconocido';
  end;
end;

procedure TfrmModalSubsanacionLineas.FormCreate(Sender: TObject);
begin
  Caption := Format('Detalle de Líneas - Factura %s/%d',
                   [FSerieFactura, FNumeroFactura]);
  // Configurar la conexión del query
  qryLineas.Connection := FConnection;
  // Crear componentes temporales
  CrearComponentesTemporales;
  CrearEstructuraClientDataSet;
  ConfigurarGrid;
  CargarLineasDetalle;
  CalcularTotales;
  ActualizarLabelsTotal;
end;

procedure TfrmModalSubsanacionLineas.FormDestroy(Sender: TObject);
begin
  LiberarComponentesTemporales;
  inherited;
end;

procedure TfrmModalSubsanacionLineas.CrearComponentesTemporales;
begin
  // Crear DataSetProvider
  FdpLineas := TDataSetProvider.Create(Self);
  FdpLineas.DataSet := qryLineas;
  FdpLineas.Options := FdpLineas.Options + [poAllowCommandText];
  // Crear ClientDataSet
  FcdsLineas := TClientDataSet.Create(Self);
  FcdsLineas.SetProvider(FdpLineas);
  FcdsLineas.AfterPost := cdsLineasAfterPost;
  // Cambiar el DataSource para que apunte al ClientDataSet
  dsLineas.DataSet := FcdsLineas;
end;

procedure TfrmModalSubsanacionLineas.LiberarComponentesTemporales;
begin
  if Assigned(FcdsLineas) then
  begin
    if FcdsLineas.Active then
      FcdsLineas.Close;
    FreeAndNil(FcdsLineas);
  end;
  if Assigned(FdpLineas) then
    FreeAndNil(FdpLineas);
end;

procedure TfrmModalSubsanacionLineas.CrearEstructuraClientDataSet;
begin
  // Crear la estructura del ClientDataSet manualmente
  if FcdsLineas.Active then
    FcdsLineas.Close;
  FcdsLineas.FieldDefs.Clear;
  FcdsLineas.FieldDefs.Add('ID_LINEA', ftString, 20, False);
  FcdsLineas.FieldDefs.Add('DESCRIPCION_LINEA', ftString, 255, False);
  FcdsLineas.FieldDefs.Add('CANTIDAD_LINEA', ftFloat, 0, False);
  FcdsLineas.FieldDefs.Add('IMPORTE_UNITARIO_ORIGINAL', ftCurrency, 0, False);
  FcdsLineas.FieldDefs.Add('IMPORTE_UNITARIO_ACTUAL', ftCurrency, 0, False);
  FcdsLineas.FieldDefs.Add('IMPORTE_TOTAL_LINEA', ftCurrency, 0, False);
  FcdsLineas.FieldDefs.Add('CODIGO_ARTICULO_LINEA', ftString, 50, False);
  FcdsLineas.FieldDefs.Add('ODONTOLOGO', ftString, 100, False);
  FcdsLineas.CreateDataSet;
end;

procedure TfrmModalSubsanacionLineas.ConfigurarGrid;
begin
  // Configurar el grid para edición
  tvLineas.OptionsData.Editing := True;
  tvLineas.OptionsData.Inserting := False;
  tvLineas.OptionsData.Deleting := False;
  // Solo permitir editar el importe unitario actual
  colDescripcion.Options.Editing := False;
  colCantidad.Options.Editing := False;
  colImporteUnitarioOriginal.Options.Editing := False;
  colImporteUnitarioActual.Options.Editing := True;
  colImporteTotalLinea.Options.Editing := False;
end;

procedure TfrmModalSubsanacionLineas.CargarLineasDetalle;
begin
  qryLineas.SQL.Text :=
    'SELECT ' +
    '  fl.LINEA_LINEA as ID_LINEA, ' +
    '  COALESCE(fl.DESCRIPCION_ARTICULO_LINEA,'+
                '''Sin descripción'') as DESCRIPCION_LINEA, ' +
    '  fl.CANTIDAD_LINEA, ' +
    '  fl.PRECIOVENTA_ARTICULO_LINEA as IMPORTE_UNITARIO_ORIGINAL, ' +
    '  fl.PRECIOVENTA_ARTICULO_LINEA as IMPORTE_UNITARIO_ACTUAL, ' +
    '  fl.SUM_TOTAL_LINEA as IMPORTE_TOTAL_LINEA, ' +
    '  fl.CODIGO_ARTICULO_LINEA, ' +
    '  fl.ODONTOLOGO ' +
    'FROM suboc_facturas_lineas fl ' +
    'WHERE fl.NRO_FACTURA_LINEA = :NRO_FACTURA ' +
    '  AND fl.SERIE_FACTURA_LINEA = :SERIE_FACTURA ' +
    'ORDER BY fl.LINEA_LINEA';
  qryLineas.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
  qryLineas.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
  qryLineas.Open;
  CargarDatosEnClientDataSet;
end;

procedure TfrmModalSubsanacionLineas.CargarDatosEnClientDataSet;
begin
  if not FcdsLineas.Active then
    FcdsLineas.Open;
  FcdsLineas.EmptyDataSet;
  // Copiar datos del query al ClientDataSet
  qryLineas.First;
  FTotalOriginal := 0;
  while not qryLineas.Eof do
  begin
    FcdsLineas.Append;
    FcdsLineas.FieldByName('ID_LINEA').AsString := qryLineas.FieldByName('ID_LINEA').AsString;
    FcdsLineas.FieldByName('DESCRIPCION_LINEA').AsString := qryLineas.FieldByName('DESCRIPCION_LINEA').AsString;
    FcdsLineas.FieldByName('CANTIDAD_LINEA').AsFloat := qryLineas.FieldByName('CANTIDAD_LINEA').AsFloat;
    FcdsLineas.FieldByName('IMPORTE_UNITARIO_ORIGINAL').AsCurrency := qryLineas.FieldByName('IMPORTE_UNITARIO_ORIGINAL').AsCurrency;
    FcdsLineas.FieldByName('IMPORTE_UNITARIO_ACTUAL').AsCurrency := qryLineas.FieldByName('IMPORTE_UNITARIO_ACTUAL').AsCurrency;
    FcdsLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency := qryLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency;
    FcdsLineas.FieldByName('CODIGO_ARTICULO_LINEA').AsString := qryLineas.FieldByName('CODIGO_ARTICULO_LINEA').AsString;
    FcdsLineas.FieldByName('ODONTOLOGO').AsString := qryLineas.FieldByName('ODONTOLOGO').AsString;
    FcdsLineas.Post;
    FTotalOriginal := FTotalOriginal +
      (qryLineas.FieldByName('CANTIDAD_LINEA').AsFloat *
       qryLineas.FieldByName('IMPORTE_UNITARIO_ORIGINAL').AsCurrency);
    qryLineas.Next;
  end;
  FcdsLineas.First;
  qryLineas.Close; // Ya no necesitamos el query abierto
end;

procedure TfrmModalSubsanacionLineas.RecalcularImporteTotalLinea;
var
  NuevoTotal: Currency;
  WasEditing: Boolean;
begin
  if FcdsLineas.Active and not FcdsLineas.IsEmpty then
  begin
    WasEditing := FcdsLineas.State in [dsEdit, dsInsert];
    // Si no está en modo edición, ponerlo
    if not WasEditing then
      FcdsLineas.Edit;
    try
      NuevoTotal := FcdsLineas.FieldByName('CANTIDAD_LINEA').AsFloat *
                   FcdsLineas.FieldByName('IMPORTE_UNITARIO_ACTUAL').AsCurrency;
      FcdsLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency := NuevoTotal;
    except
      // Si hay error, cancelar la edición
      if not WasEditing and (FcdsLineas.State in [dsEdit, dsInsert]) then
        FcdsLineas.Cancel;
      raise;
    end;
  end;
end;
procedure TfrmModalSubsanacionLineas.CalcularTotales;
var
  TotalActual, ImporteLinea: Currency;
  BookmarkPos: TBookmark;
begin
  TotalActual := 0;
  if FcdsLineas.Active and not FcdsLineas.IsEmpty then
  begin
    BookmarkPos := FcdsLineas.GetBookmark;
    FcdsLineas.DisableControls;
    try
      FcdsLineas.First;
      while not FcdsLineas.Eof do
      begin
        // Recalcular importe total de cada línea
         ImporteLinea := FcdsLineas.FieldByName('CANTIDAD_LINEA').AsFloat *
                   FcdsLineas.FieldByName('IMPORTE_UNITARIO_ACTUAL').AsCurrency;
        // Actualizar el campo solo si es necesario
        if FcdsLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency <>
                                                               ImporteLinea then
        begin
          if FcdsLineas.State <> dsEdit then
            FcdsLineas.Edit;
          FcdsLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency := ImporteLinea;
          FcdsLineas.Post;
        end;
        TotalActual := TotalActual + ImporteLinea;
        FcdsLineas.Next;
      end;
    finally
      FcdsLineas.EnableControls;
      if FcdsLineas.BookmarkValid(BookmarkPos) then
      begin
        FcdsLineas.GotoBookmark(BookmarkPos);
        FcdsLineas.FreeBookmark(BookmarkPos);
      end;
    end;
  end;
  ActualizarLabelsTotal;
end;

procedure TfrmModalSubsanacionLineas.ActualizarLabelsTotal;
var
  TotalActual: Currency;
  Diferencia: Currency;
  BookmarkPos: TBookmark;
begin
  TotalActual := 0;
  if FcdsLineas.Active and not FcdsLineas.IsEmpty then
  begin
    BookmarkPos := FcdsLineas.GetBookmark;
    FcdsLineas.DisableControls;
    try
      FcdsLineas.First;
      while not FcdsLineas.Eof do
      begin
        TotalActual := TotalActual + FcdsLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency;
        FcdsLineas.Next;
      end;
    finally
      FcdsLineas.EnableControls;
      if FcdsLineas.BookmarkValid(BookmarkPos) then
      begin
        FcdsLineas.GotoBookmark(BookmarkPos);
        FcdsLineas.FreeBookmark(BookmarkPos);
      end;
    end;
  end;
  Diferencia := TotalActual - FTotalLiquidoFactura;
  lblTotalOriginal.Caption := Format('Total Objetivo: %s €',
    [FormatFloat('#,##0.00', FTotalLiquidoFactura)]);
  lblTotalActual.Caption := Format('Total Actual: %s €',
    [FormatFloat('#,##0.00', TotalActual)]);
  lblDiferencia.Caption := Format('Diferencia: %s €',
    [FormatFloat('#,##0.00', Diferencia)]);
  // Colorear la diferencia según sea positiva o negativa
  if Diferencia = 0 then
    lblDiferencia.Style.TextColor := clGreen
  else if Diferencia > 0 then
    lblDiferencia.Style.TextColor := clRed
  else
    lblDiferencia.Style.TextColor := clBlue;
end;

function TfrmModalSubsanacionLineas.ValidarTotales: Boolean;
var
  TotalActual: Currency;
  Diferencia: Currency;
begin
  TotalActual := 0;
  if FcdsLineas.Active and not FcdsLineas.IsEmpty then
  begin
    FcdsLineas.DisableControls;
    try
      FcdsLineas.First;
      while not FcdsLineas.Eof do
      begin
        TotalActual := TotalActual +
                       FcdsLineas.FieldByName('IMPORTE_TOTAL_LINEA').AsCurrency;
        FcdsLineas.Next;
      end;
    finally
      FcdsLineas.EnableControls;
    end;
  end;
  Diferencia := TotalActual - FTotalLiquidoFactura;
  Result := Diferencia = 0;
  if not Result then
  begin
    ShowMessage(Format('El total de las líneas (%s €) debe ser igual al total'+
                       ' líquido de la factura (%s €).' + sLineBreak +
                       'Diferencia: %s €',
                      [FormatFloat('#,##0.00', TotalActual),
                       FormatFloat('#,##0.00', FTotalLiquidoFactura),
                       FormatFloat('#,##0.00', Diferencia)]));
    Exit;
  end;
end;

procedure TfrmModalSubsanacionLineas.cdsLineasAfterPost(DataSet: TDataSet);
begin
  // Forzar el recálculo de totales después de cada post
  CalcularTotales;
  FLineasModificadas := True;
end;

procedure TfrmModalSubsanacionLineas.tvLineasEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  if AItem = colImporteUnitarioActual then
  begin
    // Asegurarse de que el dataset esté en modo de edición
    if not (FcdsLineas.State in [dsEdit, dsInsert]) then
      FcdsLineas.Edit;
    RecalcularImporteTotalLinea;
    FLineasModificadas := True;
  end;
end;

procedure TfrmModalSubsanacionLineas.colImporteUnitarioActualGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  Value: Currency;
begin
  if VarIsNumeric(ARecord.Values[Sender.Index]) then
  begin
    Value := ARecord.Values[Sender.Index];
    AText := FormatFloat('#,##0.0000', Value);
  end;
end;

procedure TfrmModalSubsanacionLineas.colImporteUnitarioActualPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if FcdsLineas.State in [dsEdit, dsInsert] then
    FcdsLineas.Post;
end;

procedure TfrmModalSubsanacionLineas.btnAceptarClick(Sender: TObject);
begin
  // Asegurarse de que los cambios pendientes se confirmen
  if FcdsLineas.State in [dsEdit, dsInsert] then
    FcdsLineas.Post;
  if ValidarTotales then
  begin
    // Actualizar los importes en la base de datos si hay cambios
    if FLineasModificadas then
    begin
      try
        ActualizarLineasEnBD;
        ShowMessage('Las líneas han sido actualizadas correctamente.');
      except
        on E: Exception do
        begin
          ShowMessage('Error al actualizar las líneas: ' + E.Message);
          Exit;
        end;
      end;
    end;
    ModalResult := mrOk;
  end;
end;

procedure TfrmModalSubsanacionLineas.ActualizarLineasEnBD;
var
  UpdateQuery: TUniQuery;
  LogCambios: string;
  BookmarkPos: TBookmark;
  NumeroLinea: string;
  ImporteOriginal, ImporteActual, NuevoTotal: Currency;
begin
  UpdateQuery := TUniQuery.Create(nil);
  try
    UpdateQuery.Connection := FConnection;
    LogCambios := '';
    if FcdsLineas.Active and not FcdsLineas.IsEmpty then
    begin
      BookmarkPos := FcdsLineas.GetBookmark;
      FcdsLineas.DisableControls;
      try
        FcdsLineas.First;
        while not FcdsLineas.Eof do
        begin
          ImporteOriginal :=
                 FcdsLineas.FieldByName('IMPORTE_UNITARIO_ORIGINAL').AsCurrency;
          ImporteActual :=
                   FcdsLineas.FieldByName('IMPORTE_UNITARIO_ACTUAL').AsCurrency;
          NumeroLinea := FcdsLineas.FieldByName('ID_LINEA').AsString;
          // Solo actualizar si hay cambios
          if Abs(ImporteOriginal - ImporteActual) > 0.0001 then
          begin
            NuevoTotal := FcdsLineas.FieldByName('CANTIDAD_LINEA').AsFloat *
                                                                  ImporteActual;
            UpdateQuery.SQL.Text :=
              'UPDATE suboc_facturas_lineas SET ' +
              'PRECIOVENTA_ARTICULO_LINEA = :NUEVO_PRECIO, ' +
              'SUM_TOTAL_LINEA = :NUEVO_TOTAL ' +
              'WHERE SERIE_FACTURA_LINEA = :SERIE_FACTURA ' +
              'AND NRO_FACTURA_LINEA = :NRO_FACTURA ' +
              'AND LINEA_LINEA = :LINEA';
            UpdateQuery.ParamByName('NUEVO_PRECIO').AsCurrency := ImporteActual;
            UpdateQuery.ParamByName('NUEVO_TOTAL').AsCurrency := NuevoTotal;
            UpdateQuery.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
            UpdateQuery.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
            UpdateQuery.ParamByName('LINEA').AsString := NumeroLinea;
            UpdateQuery.ExecSQL;
            LogCambios := LogCambios +
              Format('Línea %s: %.4f -> %.4f (Total: %.2f); ',
                     [NumeroLinea, ImporteOriginal, ImporteActual, NuevoTotal]);
          end;
          FcdsLineas.Next;
        end;
      finally
        FcdsLineas.EnableControls;
        if FcdsLineas.BookmarkValid(BookmarkPos) then
        begin
          FcdsLineas.GotoBookmark(BookmarkPos);
          FcdsLineas.FreeBookmark(BookmarkPos);
        end;
      end;
    end;
    // Registrar cambios en el log si está disponible
    if (LogCambios <> '') and Assigned(frmOpenApp) and Assigned(frmOpenApp.VeriFactuLog) then
    begin
      frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
        'Líneas modificadas en subsanación: ' + LogCambios,
        FSerieFactura, FNumeroFactura);
    end;
  finally
    UpdateQuery.Free;
  end;
end;

end.
