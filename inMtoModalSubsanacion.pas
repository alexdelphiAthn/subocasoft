unit inMtoModalSubsanacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
                                                                 System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  cxTextEdit, cxLabel, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGroupBox,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxSpinEdit, cxCurrencyEdit,
  cxCheckBox, cxRadioGroup, System.JSON, Data.DB, Uni, inLibVerifactuBuilder,
  inLibVerifactuClient, inMtoPrincipal, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, inMtoModalSubsanacionLineas, dxSkinBlue;

type
  TfrmModalSubsanacion = class(TForm)
    pnlMain: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    // Grupo de datos básicos de la factura
    gbDatosBasicos: TcxGroupBox;
    lblNumeroFacturaOriginal: TcxLabel;
    lblNumeroFactura: TcxLabel;
    txtNumeroFactura: TcxTextEdit;
    lblFechaFacturaOriginal: TcxLabel;
    lblFechaFactura: TcxLabel;
    dteFechaFactura: TcxDateEdit;
    lblTipoFacturaOriginal: TcxLabel;
    lblTipoFactura: TcxLabel;
    cbbTipoFactura: TcxComboBox;
    // Grupo de datos del cliente
    gbDatosCliente: TcxGroupBox;
    lblNIFClienteOriginal: TcxLabel;
    lblNIFCliente: TcxLabel;
    txtNIFCliente: TcxTextEdit;
    lblNombreClienteOriginal: TcxLabel;
    lblNombreCliente: TcxLabel;
    txtNombreCliente: TcxTextEdit;
    lblPaisClienteOriginal: TcxLabel;
    lblPaisCliente: TcxLabel;
    txtPaisCliente: TcxTextEdit;
    lblTipoIdInternacionalOriginal: TcxLabel;
    lblTipoIdInternacional: TcxLabel;
    cbbTipoIdInternacional: TcxComboBox;
    // Grupo de descripción
    gbDescripcion: TcxGroupBox;
    lblDescripcionOriginal: TcxLabel;
    lblDescripcion: TcxLabel;
    memoDescripcion: TcxMemo;
    lblFechaOperacionOriginal: TcxLabel;
    lblFechaOperacion: TcxLabel;
    dteFechaOperacion: TcxDateEdit;
    // Grupo de totales
    cxgrpbxTotales: TcxGroupBox;
    lblTotalFacturaOriginal: TcxLabel;
    lblTotalFactura: TcxLabel;
    currTotalFactura: TcxCurrencyEdit;
    // Checkbox para indicar subsanación
    chkEsSubsanacion: TcxCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure txtPaisClientePropertiesChange(Sender: TObject);
  private
    FConnection: TUniConnection;
    FSerieFactura: string;
    FNumeroFactura: Integer;
    FDatosOriginales: TJSONObject;
    FSubsanacionExitosa: Boolean;
    function HayCambios: Boolean;
    function IsoToDate(const DateTimeStr: string): TDateTime;
    function IfThen(AValue: Boolean; const ATrue: integer;
                                  const AFalse: integer = 0): integer; overload;
    function IfThen(AValue: Boolean; const ATrue: string;
                                   const AFalse: string = ''): string; overload;
    procedure CargarDatosOriginales;
    procedure MostrarDatosOriginales;
    procedure InicializarComboBoxes;
    procedure ActualizarVisibilidadTipoId;
    function ValidarDatos: Boolean;
    function GenerarJSONSubsanacion: string;
    procedure EjecutarSubsanacion;
    procedure ActualizarFacturaOriginal;
    //subsanar lineas de factura
    //FTieneLineasDetalle: Boolean;
    function TieneLineas:Boolean;
    procedure AbrirEditorLineas;
    procedure ActualizarTotalLinea(cPrecioOld,
                                   cPrecioNew: Currency);
public
    constructor Create(AOwner: TComponent;
                      const ASerieFactura: string; ANumeroFactura: Integer);
                                                                    reintroduce;
    property SubsanacionExitosa: Boolean read FSubsanacionExitosa;
  end;

implementation

uses
  inLibData, inLibVarGlob, inLibJSON;

{$R *.dfm}

constructor TfrmModalSubsanacion.Create(AOwner: TComponent;
  const ASerieFactura: string;
  ANumeroFactura: Integer);
begin
  FConnection := frmOpenApp.FDmConn.conUni;
  if (FConnection.Connected = false) then
    FConnection.Connect;
  FSerieFactura := ASerieFactura;
  FNumeroFactura := ANumeroFactura;
  FDatosOriginales := nil;
  FSubsanacionExitosa := False;

  inherited Create(AOwner);
end;

procedure TfrmModalSubsanacion.FormCreate(Sender: TObject);
begin
  // Configurar el formulario
  Caption := Format('Subsanación Manual - Factura %s/%d',
                   [FSerieFactura, FNumeroFactura]);
  InicializarComboBoxes;
  CargarDatosOriginales;
  MostrarDatosOriginales;
  // Marcar por defecto como subsanación
  chkEsSubsanacion.Checked := True;
end;

procedure TfrmModalSubsanacion.FormDestroy(Sender: TObject);
begin
  if Assigned(FDatosOriginales) then
    FDatosOriginales.Free;
  inherited;
end;

function TfrmModalSubsanacion.IfThen(AValue: Boolean; const ATrue: string;
                                             const AFalse: string = ''): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function TfrmModalSubsanacion.IfThen(AValue: Boolean; const ATrue: integer;
                                            const AFalse: integer = 0): integer;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function TfrmModalSubsanacion.IsoToDate(const DateTimeStr: string): TDateTime;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings := TFormatSettings.Create;
  FormatSettings.DateSeparator := '-';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  FormatSettings.ShortTimeFormat := 'hh:nn:ss';
  try
    Result := StrToDateTime(
      StringReplace(
        StringReplace(DateTimeStr, 'T', ' ', []),
        'Z', '', []),
      FormatSettings);
  except
    Result := Now; // Valor por defecto si hay error
  end;
end;

procedure TfrmModalSubsanacion.InicializarComboBoxes;
begin
  // Tipos de factura
  cbbTipoFactura.Properties.Items.Clear;
  cbbTipoFactura.Properties.Items.Add('F1 - Factura');
  cbbTipoFactura.Properties.Items.Add('F2 - Factura Simplificada');
  cbbTipoFactura.Properties.Items.Add('F3 - Factura Sustitutiva');
  cbbTipoFactura.Properties.Items.Add('R1 - Rectificativa (Art. 80.1 y 80.2)');
  cbbTipoFactura.Properties.Items.Add('R2 - Rectificativa (Art. 80.3)');
  cbbTipoFactura.Properties.Items.Add('R3 - Rectificativa (Art. 80.4)');
  cbbTipoFactura.Properties.Items.Add('R4 - Rectificativa (Resto)');
  cbbTipoFactura.Properties.Items.Add('R5 - Rectificativa Simplificada');
  // Configurar ComboBox de tipos de ID internacional
  cbbTipoIdInternacional.Properties.Items.Clear;
  cbbTipoIdInternacional.Properties.Items.Add('ID');
  cbbTipoIdInternacional.Properties.Items.Add('PASAPORTE');
  cbbTipoIdInternacional.Properties.Items.Add('CERTIFICADO RESIDENCIA');
  cbbTipoIdInternacional.Properties.Items.Add('OTRO DOCUMENTO');
  // Permitir edición manual
  cbbTipoIdInternacional.Properties.DropDownListStyle := lsEditFixedList;
end;

procedure TfrmModalSubsanacion.CargarDatosOriginales;
var
  Query: TUniQuery;
  InvoiceObj, RecObj, IdObj:TJSONObject;
  JSONPeticion, DescObj:TJSONObject;
  FacType, PaisCliente, fFecha, Total:string;
begin
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT c.PETICION_COMPLETA ' +
      'FROM suboc_consolidacion c ' +
      'WHERE c.NRO_FACTURA = :NRO_FACTURA ' +
      '  AND c.SERIE_FACTURA = :SERIE_FACTURA';
    Query.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
    Query.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
    Query.Open;
    if not Query.IsEmpty then
    begin
      // Crear objeto JSON con los datos originales
      FDatosOriginales := TJSONObject.Create;
//      // Datos básicos
      FDatosOriginales.AddPair('numero_factura',
        Format('%s/%d', [FSerieFactura, FNumeroFactura]));
//      FDatosOriginales.AddPair('fecha_factura',
//        FormatDateTime('dd/mm/yyyy',
//                                Query.FieldByName('FECHA_FACTURA').AsDateTime));
//      FDatosOriginales.AddPair('tipo_factura',
//        Query.FieldByName('ESSIMPL_FACTURA').AsString);
//      // Datos del cliente
//      if Query.FieldByName('ESSIMPL_FACTURA').AsString = 'S' then
//      begin
//        gbDatosCliente.Visible := False;
//      end;

//      FDatosOriginales.AddPair('nif_cliente',
//        Query.FieldByName('NIF_CLIENTE_FACTURA').AsString);
//      FDatosOriginales.AddPair('nombre_cliente',
//        Query.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString);
//      FDatosOriginales.AddPair('pais_cliente',
//        Query.FieldByName('PAIS_CLIENTE_FACTURA').AsString);
//      // Tipo ID Internacional desde BD
//      FDatosOriginales.AddPair('tipo_id_internacional',
//        Query.FieldByName('TIPOID_INT_CLIENTE_FACTURA').AsString);
//      // Datos financieros
//      FDatosOriginales.AddPair('total_liquido',
//        Query.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat);
//      FDatosOriginales.AddPair('total_factura',
//                    Query.FieldByName('TOTAL_LIQUIDO_FACTURA').AsFloat);
//      // Si hay petición completa, intentar extraer más datos
      if not Query.FieldByName('PETICION_COMPLETA').IsNull then
      begin
        try
          JSONPeticion := TJSONObject.ParseJSONValue(
                Query.FieldByName('PETICION_COMPLETA').AsString) as TJSONObject;
          if Assigned(JSONPeticion) then
          begin
            try
              // Extraer datos adicionales del JSON original
              InvoiceObj := JSONPeticion.GetValue('invoice') as TJSONObject;
              if Assigned(InvoiceObj) then
              begin
                // Extraer idType del recipient si existe
//                var RecipientObj := InvoiceObj.GetValue('recipient')
//                                                               as TJSONObject;
//                if Assigned(RecipientObj) then
//                begin
//                  var IdTypeValue := RecipientObj.GetValue('idType');
//                  if Assigned(IdTypeValue) then
//                  begin
//                    FDatosOriginales.AddPair('id_type_original',
//                                                             IdTypeValue.Value);
//                  end;
//                end;

                // Extraer datos de VAT lines
//                var VatLinesArray := InvoiceObj.GetValue('vatLines')
//                                                                  as TJSONArray;
//                if Assigned(VatLinesArray) and (VatLinesArray.Count > 0) then
//                begin
//                  var VatLine := VatLinesArray.Items[0] as TJSONObject;
//                  FDatosOriginales.AddPair('base_imponible',
//                    (VatLine.GetValue('base') as TJSONNumber).AsDouble);
//                  FDatosOriginales.AddPair('tipo_iva',
//                    (VatLine.GetValue('rate') as TJSONNumber).AsDouble);
//                  FDatosOriginales.AddPair('cuota_iva',
//                    (VatLine.GetValue('amount') as TJSONNumber).AsDouble);
//                  FDatosOriginales.AddPair('zoperacion_iva',
//                    VatLine.GetValue('vatOperation').Value);
//                  FDatosOriginales.AddPair('clave_regimen',
//                    VatLine.GetValue('vatKey').Value);
//                end;

                // Datos del cliente

                FacType := InvoiceObj.GetValue('type').Value;
                FDatosOriginales.AddPair('tipo_factura', FacType);
                if FacType = 'F2' then
                  gbDatosCliente.Visible := False
                else
                begin
                  gbDatosCliente.Visible := True;
                  RecObj := InvoiceObj.GetValue('recipient') as TJSONObject;
                  if Assigned(RecObj) then
                  begin
                    FDatosOriginales.AddPair('nombre_cliente',
                                                 RecObj.GetValue('name').Value);
                    FDatosOriginales.AddPair('pais_cliente',
                                              RecObj.GetValue('country').Value);
                    PaisCliente :=
                                FDatosOriginales.GetValue('pais_cliente').Value;
                    if PaisCliente = 'ES' then
                      begin
                        FDatosOriginales.AddPair('nif_cliente',
                                                RecObj.GetValue('irsId').Value);
                      end
                    else
                    begin
                      FDatosOriginales.AddPair('nif_cliente',
                                                  RecObj.GetValue('id').Value);
                      FDatosOriginales.AddPair('tipo_id_internacional',
                                               RecObj.GetValue('idType').Value);
                      FDatosOriginales.AddPair('id_type_original',
                                               RecObj.GetValue('idType').Value);
                    end;
                  end;
                end;

                idObj := InvoiceObj.GetValue('id') as TJSONObject;
                fFecha := idObj.GetValue('issuedTime').Value;
                FDatosOriginales.AddPair('fecha_factura',
                         FormatDateTime('dd/mm/yyyy', IsoToDate(fFecha)));
                DescObj := InvoiceObj.GetValue('description')
                                                                 as TJSONObject;
                if Assigned(DescObj) then
                begin
                  FDatosOriginales.AddPair('descripcion',
                    DescObj.GetValue('text').Value);
                  FDatosOriginales.AddPair('fecha_operacion',
                    DescObj.GetValue('operationDate').Value);
                end;

                // Totales
                Total := InvoiceObj.GetValue('total').Value;
                FDatosOriginales.AddPair('total_factura',
                                         TJSONNumber.Create(StrToFloat(Total)));
                FDatosOriginales.AddPair('total_liquido',
                                         TJSONNumber.Create(StrToFloat(Total)));
//                var AmountValue := InvoiceObj.GetValue('amount');
//                if Assigned(AmountValue) then
//                  FDatosOriginales.AddPair('importe_total',
//                    (AmountValue as TJSONNumber).AsDouble);
              end;
            finally
              JSONPeticion.Free;
            end;
          end;

        except
          // Si hay error al parsear JSON, continúa con datos básicos
        end;
      end;
    end;

  finally
    Query.Free;
  end;
end;

procedure TfrmModalSubsanacion.MostrarDatosOriginales;
var
  TipoOriginal, FechaOpValue, TotalValue,
  PaisCliente, TipoIdValue, DescValue:string;
begin
  if not Assigned(FDatosOriginales) then
    Exit;
  // Número de factura
  lblNumeroFacturaOriginal.Caption := 'Original: ' +
    FDatosOriginales.GetValue('numero_factura').Value;
  txtNumeroFactura.Text := Format('%s/%d', [FSerieFactura, FNumeroFactura]);
  // Fecha factura
  lblFechaFacturaOriginal.Caption := 'Original: ' +
    FDatosOriginales.GetValue('fecha_factura').Value;
    dteFechaFactura.Date := StrToDate(FDatosOriginales.GetValue('fecha_factura')
                                                                        .Value);
  // Tipo factura
  TipoOriginal := FDatosOriginales.GetValue('tipo_factura').Value;
  lblTipoFacturaOriginal.Caption := 'Original: ' +
    IfThen(TipoOriginal = 'F2', 'F2 - Simplificada', 'F1 - Normal');
  cbbTipoFactura.ItemIndex := IfThen(TipoOriginal = 'F2', 1, 0);
  // Datos del cliente
  if TipoOriginal <> 'F2' then
  begin
    lblNIFClienteOriginal.Caption := 'Original: ' +
      FDatosOriginales.GetValue('nif_cliente').Value;
    txtNIFCliente.Text := FDatosOriginales.GetValue('nif_cliente').Value;
    lblNombreClienteOriginal.Caption := 'Original: ' +
      FDatosOriginales.GetValue('nombre_cliente').Value;
    txtNombreCliente.Text := FDatosOriginales.GetValue('nombre_cliente').Value;
    lblPaisClienteOriginal.Caption := 'Original: ' +
      FDatosOriginales.GetValue('pais_cliente').Value;
    txtPaisCliente.Text := FDatosOriginales.GetValue('pais_cliente').Value;
    // Manejo del tipo ID internacional
    PaisCliente := FDatosOriginales.GetValue('pais_cliente').Value;
    if (PaisCliente <> 'ES') or (PaisCliente <> '') then
    begin
      // Cliente extranjero - obtener tipo ID
      TipoIdValue := FDatosOriginales.GetValue('tipo_id_internacional').Value;
      lblTipoIdInternacionalOriginal.Caption := 'Original: ' + TipoIdValue;
      if TipoIdValue = '03' then
        cbbTipoIdInternacional.Text := 'PASAPORTE'
      else if TipoIdValue = '04' then
        cbbTipoIdInternacional.Text := 'ID';
    end;
    // Actualizar visibilidad de tipo de id extranjero
    ActualizarVisibilidadTipoId;
  end;

  // Descripción
  DescValue := FDatosOriginales.GetValue('descripcion').Value;
  lblDescripcionOriginal.Caption := 'Original: ' + DescValue;
  memoDescripcion.Text := DescValue;
  if DescValue = '' then
    memoDescripcion.Text := 'Subsanación de factura ' +
                                 FSerieFactura + '/' + IntToStr(FNumeroFactura);
  // Fecha operación
  FechaOpValue := FDatosOriginales.GetValue('fecha_operacion').Value;
//  if Assigned(FechaOpValue) then
//  begin
    lblFechaOperacionOriginal.Caption := 'Original: ' +
                                       DateToStr(IsoToDate(FechaOpValue));
    dteFechaOperacion.Date := IsoToDate(FechaOpValue);
//  end
//  else
//  begin
//    lblFechaOperacionOriginal.Caption := 'Original: ' +
//                                                DateToStr(dteFechaFactura.Date);
//    dteFechaOperacion.Date := dteFechaFactura.Date;
//  end;
  // Totales
  TotalValue := FDatosOriginales.GetValue('total_factura').Value;
    lblTotalFacturaOriginal.Caption := 'Original: ' +
      FormatFloat('#,##0.00', StrToFloatDef(TotalValue, 0));
    currTotalFactura.Value := StrToFloatDef(TotalValue, 0);

end;

procedure TfrmModalSubsanacion.ActualizarVisibilidadTipoId;
var
  EsExtranjero: Boolean;
begin
  EsExtranjero := (Trim(txtPaisCliente.Text)
                                 <> 'ES') and (Trim(txtPaisCliente.Text) <> '');
  lblTipoIdInternacionalOriginal.Visible := EsExtranjero;
  lblTipoIdInternacional.Visible := EsExtranjero;
  cbbTipoIdInternacional.Visible := EsExtranjero;
  if not EsExtranjero then
    cbbTipoIdInternacional.Text := '';
end;

procedure TfrmModalSubsanacion.txtPaisClientePropertiesChange(Sender: TObject);
begin
  ActualizarVisibilidadTipoId;
end;

function TfrmModalSubsanacion.ValidarDatos: Boolean;
var
  EsExtranjero:Boolean;
begin
  Result := False;
  // Validar campos obligatorios
  if Trim(txtNumeroFactura.Text) = '' then
  begin
    ShowMessage('El número de factura es obligatorio');
    txtNumeroFactura.SetFocus;
    Exit;
  end;

//  if dteFechaFactura.Date = 0 then
//  begin
//    ShowMessage('La fecha de factura es obligatoria');
//    dteFechaFactura.SetFocus;
//    Exit;
//  end;
  if cbbTipoFactura.ItemIndex = -1 then
  begin
    ShowMessage('Debe seleccionar un tipo de factura');
    cbbTipoFactura.SetFocus;
    Exit;
  end;

  // Validar datos del cliente
  if (cbbTipoFactura.ItemIndex <> 1) then
  begin
    if Trim(txtNIFCliente.Text) = '' then
    begin
      ShowMessage('El NIF/ID del cliente es obligatorio');
      txtNIFCliente.SetFocus;
      Exit;
    end;

    if Trim(txtNombreCliente.Text) = '' then
    begin
      ShowMessage('El nombre del cliente es obligatorio');
      txtNombreCliente.SetFocus;
      Exit;
    end;

    // Validar tipo ID para clientes extranjeros
    EsExtranjero := (Trim(txtPaisCliente.Text) <> 'ES') and
    (Trim(txtPaisCliente.Text) <> '');
    if EsExtranjero and (Trim(cbbTipoIdInternacional.Text) = '') then
    begin
      ShowMessage('El tipo de ID internacional es obligatorio para' +
                                                       ' clientes extranjeros');
      cbbTipoIdInternacional.SetFocus;
      Exit;
    end;
  end;

  // Validar descripción
//  if Trim(memoDescripcion.Text) = '' then
//  begin
//    ShowMessage('La descripción es obligatoria');
//    memoDescripcion.SetFocus;
//    Exit;
//  end;
  if dteFechaOperacion.Date = 0 then
  begin
    ShowMessage('La fecha de operación es obligatoria');
    dteFechaOperacion.SetFocus;
    Exit;
  end;

//  if currTotalFactura.Value <= 0 then
//  begin
//    ShowMessage('El total de la factura debe ser mayor que cero');
//    currTotalFactura.SetFocus;
//    Exit;
//  end;
  Result := True;
end;

function TfrmModalSubsanacion.GenerarJSONSubsanacion: string;
var
  Builder: TVerifactuJSONBuilder;
  SubsanacionData: TSubsanacionData;
  TipoFactura: TInvoiceType;
begin
  Builder := TVerifactuJSONBuilder.Create(FConnection);
  try
    // Determinar tipo de factura basado en selección
    case cbbTipoFactura.ItemIndex of
      0: TipoFactura := itF1; // Factura normal
      1: TipoFactura := itF2; // Factura simplificada
      2: TipoFactura := itF3; // Factura sustitutiva
      3: TipoFactura := itR1; // Rectificativa Art. 80.1 y 80.2
      4: TipoFactura := itR2; // Rectificativa Art. 80.3
      5: TipoFactura := itR3; // Rectificativa Art. 80.4
      6: TipoFactura := itR4; // Rectificativa Resto
      7: TipoFactura := itR5; // Rectificativa Simplificada
    else
      TipoFactura := itF1; // Por defecto
    end;

    // Crear estructura de datos para la subsanación
    SubsanacionData := TSubsanacionData.Create(
      Trim(txtNumeroFactura.Text),
      dteFechaFactura.Date,
      TipoFactura,
      Trim(txtNIFCliente.Text),
      Trim(txtNombreCliente.Text),
      Trim(txtPaisCliente.Text),
      Trim(cbbTipoIdInternacional.Text),
      Trim(memoDescripcion.Text),
      dteFechaOperacion.Date,
      currTotalFactura.Value,
      True);
    // Generar JSON usando el builder
    Result := Builder.BuildSubsanacionJSON(SubsanacionData);
  finally
    Builder.Free;
  end;
end;

procedure TfrmModalSubsanacion.EjecutarSubsanacion;
var
  JSONSubsanacion: string;
  VerifactuClient: TVerifactuClient;
  WSResult: TVerifactuResult;
  bProcesarOK: Boolean;
begin
  JSONSubsanacion := GenerarJSONSubsanacion;
  VerifactuClient := TVerifactuClient.Create(FConnection);
  try
    Screen.Cursor := crHourGlass;
      // Enviar la subsanación a Verifactu
      frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
                                          'Enviando petición de subsanación. ',
                                                 FSerieFactura, FNumeroFactura,
                                                 JSONSubsanacion);
      WSResult := VerifactuClient.LlamarWebService(JSONSubsanacion);
      if WSResult.Success then
      begin
        // Procesar respuesta del WebService
        bProcesarOK := VerifactuClient.ProcesarRespuestaWebService(
                                                      WSResult.ResponseContent,
                                                      FSerieFactura,
                                                      FNumeroFactura,
                                                      JSONSubsanacion);
        if bProcesarOK then
        begin
          FSubsanacionExitosa := True;
          ShowMessage('Subsanación enviada y procesada correctamente.');
          frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
            'Subsanación manual ejecutada correctamente',
            FSerieFactura, FNumeroFactura, JSONSubsanacion);
        end
        else
        begin
          ShowMessage('Error al procesar la respuesta de la subsanación.'
                       + sLineBreak +
                     'Consulte la pestaña de eventos para más detalles.');
        end
      end
      else
      begin
          // Error en la comunicación HTTP
          ShowMessage('Error de comunicación: ' + WSResult.ErrorMessage);
          frmOpenApp.VeriFactuLog.RegistrarError(
            'Error HTTP en subsanación: ' + WSResult.ErrorMessage,
            WSResult.ResponseContent, FSerieFactura, FNumeroFactura);
      end;

  finally
    Screen.Cursor := crDefault;
    VerifactuClient.Free;
  end;
end;

function TfrmModalSubsanacion.HayCambios:Boolean;
var
  bHayCambios:Boolean;
  TotalFactura:Currency;
  sLogCambios, TipoIdValue: string;
  FechaOperacion: TDateTime;
  TipoIdIntSc:string;
  RazonSocialOriginal, NIFOriginal, PaisOriginal, TipoIdOriginal: string;
begin
  bHayCambios:=False;
//  if Assigned(FDatosOriginales) then
//  begin
//      try
        FechaOperacion :=
                  IsoToDate(FDatosOriginales.GetValue('fecha_operacion').Value);
        RazonSocialOriginal :=
                              FDatosOriginales.GetValue('nombre_cliente').Value;
        TotalFactura :=
                    StrToCurr(FDatosOriginales.GetValue('total_factura').Value);
        NIFOriginal := FDatosOriginales.GetValue('nif_cliente').Value;
        PaisOriginal := FDatosOriginales.GetValue('pais_cliente').Value;
        if PaisOriginal <> 'ES' then
        begin
          TipoIdValue :=
                       FDatosOriginales.GetValue('tipo_id_internacional').Value;
          TipoIdOriginal := TipoIdValue;
        end;
//      except
//        // Si hay error al obtener datos originales, asumir que hay cambios
//        bHayCambios := True;
//      end;
//    end
//    else
//    begin
//      bHayCambios := True; // Sin datos originales, asumir cambios
//    end;

    if TotalFactura <> currTotalFactura.Value then
    begin
      bHayCambios := True;
    end;

    if dteFechaOperacion.Date <> FechaOperacion then
    begin
      bHayCambios := True;
    end;

    if Trim(txtNombreCliente.Text) <> RazonSocialOriginal then
    begin
      bHayCambios := True;
    end;
    if (PaisOriginal <> txtPaisCliente.Text) then
      bHayCambios := True;
    if (txtPaisCliente.Text <> 'ES') then
    begin
      if cbbTipoIdInternacional.Text = 'ID' then
      TipoIdIntSc := '04';
      if cbbTipoIdInternacional.Text = 'PASAPORTE' then
      TipoIdIntSc := '03';
      if TipoIdIntSc <> TipoIdOriginal then
        bHayCambios := True;
    end;


    Result := bHayCambios;
end;

procedure TfrmModalSubsanacion.ActualizarFacturaOriginal;
var
  Query: TUniQuery;
  bHayCambios:Boolean;
  TotalFactura:Currency;
  sLogCambios, TipoIdValue, TipoIdIntSc: string;
  FechaOperacion: TDateTime;
  RazonSocialOriginal, NIFOriginal, PaisOriginal, TipoIdOriginal: string;
begin
  bHayCambios := False;
  sLogCambios := '';
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    // Obtener datos originales
    if Assigned(FDatosOriginales) then
    begin
      try
        FechaOperacion :=
                  IsoToDate(FDatosOriginales.GetValue('fecha_operacion').Value);
        RazonSocialOriginal :=
                              FDatosOriginales.GetValue('nombre_cliente').Value;
        TotalFactura :=
                    StrToCurr(FDatosOriginales.GetValue('total_liquido').Value);
        NIFOriginal := FDatosOriginales.GetValue('nif_cliente').Value;
        PaisOriginal := FDatosOriginales.GetValue('pais_cliente').Value;
        if PaisOriginal <> 'ES' then
        begin
          TipoIdValue := FDatosOriginales.GetValue('tipo_id_internacional').Value;
          TipoIdOriginal := TipoIdValue;
        end;
      except
        // Si hay error al obtener datos originales, asumir que hay cambios
        bHayCambios := True;
      end;
    end
    else
    begin
      bHayCambios := True; // Sin datos originales, asumir cambios
    end;

    // Comparar y registrar cambios
    if TotalFactura <> currTotalFactura.Value then
    begin
      bHayCambios := True;
      sLogCambios := sLogCambios +
        Format('TOTAL_FACTURA: %s -> %s; ',
               [FloatToStr(TotalFactura), FloatToStr(currTotalFactura.Value)]);
      if TieneLineas then
        AbrirEditorLineas
      else
        ActualizarTotalLinea(TotalFactura, currTotalFactura.Value);
    end;

    if dteFechaOperacion.Date <> FechaOperacion then
    begin
      bHayCambios := True;
      sLogCambios := sLogCambios +
        Format('FECHA: %s -> %s; ',
               [DateToStr(FechaOperacion), DateToStr(dteFechaOperacion.Date)]);
    end;

    if Trim(txtNombreCliente.Text) <> RazonSocialOriginal then
    begin
      bHayCambios := True;
      sLogCambios := sLogCambios +
        Format('RAZÓN SOCIAL: "%s" -> "%s"; ',
               [RazonSocialOriginal, Trim(txtNombreCliente.Text)]);
    end;

    if Trim(txtNIFCliente.Text) <> NIFOriginal then
    begin
      bHayCambios := True;
      sLogCambios := sLogCambios +
        Format('NIF: "%s" -> "%s"; ',
               [NIFOriginal, Trim(txtNIFCliente.Text)]);
    end;

    if Trim(txtPaisCliente.Text) <> PaisOriginal then
    begin
      bHayCambios := True;
      sLogCambios := sLogCambios +
        Format('PAÍS: "%s" -> "%s"; ',
               [PaisOriginal, Trim(txtPaisCliente.Text)]);
    end;

    if (txtPaisCliente.Text <> 'ES') then
    begin
      if cbbTipoIdInternacional.Text = 'ID' then
      TipoIdIntSc := '04';
      if cbbTipoIdInternacional.Text = 'PASAPORTE' then
      TipoIdIntSc := '03';
      if TipoIdIntSc <> TipoIdOriginal then
        bHayCambios := True;
        sLogCambios := sLogCambios +
      Format('TIPO ID: "%s" -> "%s"; ', [TipoIdOriginal, TipoIdIntSc]);
    end;
    // Solo actualizar si hay cambios
    if bHayCambios then
    begin
      Query.SQL.Text :=
        'UPDATE suboc_facturas SET ' +
        'RAZONSOCIAL_CLIENTE_FACTURA = :RAZONSOCIAL_CLIENTE, ' +
        'NIF_CLIENTE_FACTURA = :NIF_CLIENTE, ' +
        'PAIS_CLIENTE_FACTURA = :PAIS_CLIENTE, ' +
        'TOTAL_LIQUIDO_FACTURA = :TOTAL_LIQUIDO_FACTURA, ' +
        'TIPOID_INT_CLIENTE_FACTURA = :TIPO_ID_CLIENTE ' +
        'WHERE NRO_FACTURA = :NRO_FACTURA ' +
        'AND SERIE_FACTURA = :SERIE_FACTURA';
      Query.ParamByName('RAZONSOCIAL_CLIENTE').AsString :=
                                                    Trim(txtNombreCliente.Text);
      Query.ParamByName('NIF_CLIENTE').AsString := Trim(txtNIFCliente.Text);
      Query.ParamByName('PAIS_CLIENTE').AsString := Trim(txtPaisCliente.Text);
      Query.ParamByName('TIPO_ID_CLIENTE').AsString :=
                                              Trim(cbbTipoIdInternacional.Text);
      Query.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
      Query.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
      qUERY.ParamByName('TOTAL_LIQUIDO_FACTURA').AsCurrency :=
                                                         currTotalFactura.Value;
      Query.ExecSQL;
      // Log de los cambios realizados
      frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
        'Datos actualizados por subsanación: ' + sLogCambios,
        FSerieFactura, FNumeroFactura);
      ShowMessage(Format('Factura %s/%d actualizada correctamente.'
      + sLineBreak + 'Cambios realizados: %s',
                        [FSerieFactura, FNumeroFactura, sLogCambios]));
    end
    else
    begin
      // Log indicando que no hubo cambios
      frmOpenApp.VeriFactuLog.RegistrarOperacionFactura(
                          'Subsanación completada sin cambios en datos locales',
                                                 FSerieFactura, FNumeroFactura);
    end;

  finally
    Query.Free;
  end;
end;

procedure TfrmModalSubsanacion.ActualizarTotalLinea(cPrecioOld,
                                                    cPrecioNew: Currency);
var
  UpdateQuery:TUniQuery;
  QtyQuery:TUniQuery;
  fCantidad:Currency;
begin
  try
    QtyQuery := TUniQuery.Create(nil);
    QtyQuery.Connection := FConnection;
    QtyQuery.SQL.Text := 'SELECT CANTIDAD_LINEA ' +
                       '    FROM suboc_facturas_lineas ' +
                       '   WHERE SERIE_FACTURA_LINEA = :SERIE_FACTURA ' +
                       '     AND NRO_FACTURA_LINEA = :NRO_FACTURA; ';
    QtyQuery.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
    QtyQuery.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
    QtyQuery.Open;
    fCantidad := QtyQuery.FieldByName('CANTIDAD_LINEA').AsFloat;
    UpdateQuery := TUniQuery.Create(nil);
    UpdateQuery.Connection := FConnection;
    UpdateQuery.SQL.Text :=
       'UPDATE suboc_facturas_lineas SET ' +
       'PRECIOVENTA_ARTICULO_LINEA = :NUEVO_PRECIO, ' +
       'SUM_TOTAL_LINEA = :NUEVO_TOTAL ' +
       'WHERE SERIE_FACTURA_LINEA = :SERIE_FACTURA ' +
       'AND NRO_FACTURA_LINEA = :NRO_FACTURA; ';
     UpdateQuery.ParamByName('NUEVO_PRECIO').AsCurrency := cPrecioNew/fCantidad;
     UpdateQuery.ParamByName('NUEVO_TOTAL').AsCurrency := cPrecioNew;
     UpdateQuery.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
     UpdateQuery.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
     UpdateQuery.ExecSQL;
  finally
    FreeAndNil(QtyQuery);
    FreeAndNil(UpdateQuery);
  end;
end;

procedure TfrmModalSubsanacion.btnAceptarClick(Sender: TObject);
begin
  if not ValidarDatos then
    Exit;
  if MessageDlg(Format('¿Está seguro de subsanar la factura %s/%d?' +
                                                                    sLineBreak +
                      'Esta acción enviará los datos corregidos a Verifactu.',
                      [FSerieFactura, FNumeroFactura]),
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if HayCambios then
    begin
      FConnection.StartTransaction;
      ActualizarFacturaOriginal;
      EjecutarSubsanacion;
    end
    else
      ShowMessage('No hay cambios que subsanar');

    if FSubsanacionExitosa then
    begin
      Fconnection.Commit;
      ModalResult := mrOk;
    end
    else
      if Fconnection.InTransaction then
        Fconnection.Rollback;
  end;
end;

procedure TfrmModalSubsanacion.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('¿Está seguro de cancelar la subsanación?' + sLineBreak +
               'Se perderán todos los cambios realizados.',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ModalResult := mrCancel;
  end;
end;

function TfrmModalSubsanacion.TieneLineas:Boolean;
var
  Query: TUniQuery;
  NumeroLineas: Integer;
begin
  //FTieneLineasDetalle := False;
  Query := TUniQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT COUNT(*) as TOTAL_LINEAS ' +
      'FROM suboc_facturas_lineas ' +
      'WHERE NRO_FACTURA_LINEA = :NRO_FACTURA ' +
      '  AND SERIE_FACTURA_LINEA = :SERIE_FACTURA';
    Query.ParamByName('NRO_FACTURA').AsInteger := FNumeroFactura;
    Query.ParamByName('SERIE_FACTURA').AsString := FSerieFactura;
    Query.Open;
    NumeroLineas := Query.FieldByName('TOTAL_LINEAS').AsInteger;
    // Solo mostrar el editor si hay MÁS de una línea
    // Si hay 0 líneas o 1 sola línea, no hace falta editor especial
    Result := NumeroLineas > 1;
  finally
    Query.Close;
    Query.Free;
  end;
end;

procedure TfrmModalSubsanacion.AbrirEditorLineas;
var
  frmLineas: TfrmModalSubsanacionLineas;
//  Query: TUniQuery;
//  NumeroLineas: Integer;
begin
    frmLineas := TfrmModalSubsanacionLineas.Create(Self,
                                                   FConnection,
                                                   FSerieFactura,
                                                   FNumeroFactura,
                                                   currTotalFactura.Value);
    try
      if frmLineas.ShowModal = mrOk then
      begin
        if frmLineas.LineasModificadas then
        begin
          ShowMessage('Las líneas han sido modificadas correctamente.');
        end;
      end;

    finally
      frmLineas.Free;
    end;
end;
end.

