unit inMtoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoGen, cxGraphics, cxControls, cxLookAndFeels, System.Diagnostics,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue, Uni,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer, Jpeg, SYSTEM.Types,
  cxCheckBox, cxTextEdit, cxGridLevel, cxClasses, DateUtils, GDIPAPI, GDIPOBJ,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  dxBarBuiltInMenu, cxPC, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel, UniDataClientes,
  cxGridBandedTableView, cxGridDBBandedTableView, dxSkinBlack,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, ShellAPI,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dexif,
  dxDateRanges, dxScrollbarAnnotations, Vcl.Menus, cxCalendar, cxButtonEdit,
  cxCurrencyEdit, cxImage, Datasnap.DBClient, dxBar, cxGridCardView, dMetaData,
  cxGridDBCardView, cxGridCustomLayoutView, cxGroupBox, cxRadioGroup, cxDBLabel,
  dxGDIPlusClasses, cxButtons, cxLocalization, dxBevel, cxDBNavigator,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  inMtoPrincipal, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  system.ioutils, system.StrUtils;

type
  TfrmMtoClientes = class(TfrmMtoGen)
    pnl1: TPanel;
    cxdbtxtdtCODIGO_CLIENTE: TcxDBTextEdit;
    cxlbl2: TcxLabel;
    cxdbtxtdtRAZON_SOCIAL: TcxDBTextEdit;
    cxlbl3: TcxLabel;
    cxdbtxtdtTELEFONO2: TcxDBTextEdit;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxdbtxtdtEMAIL: TcxDBTextEdit;
    pnl2: TPanel;
    pcDetalleClientes: TcxPageControl;
    cxtbsht3: TcxTabSheet;
    cxlbl7: TcxLabel;
    cxlbl8: TcxLabel;
    cxdbtxtdt8: TcxDBTextEdit;
    cxlbl9: TcxLabel;
    cxdbtxtdt9: TcxDBTextEdit;
    cxdbtxtdt10: TcxDBTextEdit;
    cxlbl10: TcxLabel;
    cxlbl16: TcxLabel;
    cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNIF_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION_CLIENTE1: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDIRECCION_CLIENTE2: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinOBSERVACIONES_CLIENTE: TcxGridDBColumn;
    cxdbtxtdtDireccion: TcxDBTextEdit;
    cxlbl1: TcxLabel;
    cxlbl4: TcxLabel;
    cxdbtxtdtNIF: TcxDBTextEdit;
    cxtbsht1: TcxTabSheet;
    cxedtRAZONSOCIAL_CLIENTE: TcxDBTextEdit;
    cxlbl11: TcxLabel;
    cxedtPROFESION_CLIENTE: TcxDBTextEdit;
    cxlbl12: TcxLabel;
    cxgrdbclmnGrdDBTabPrinREFERENCIA_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinTELEFONO_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinPROFESION_CLIENTE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinFECHA_NACIMIENTO: TcxGridDBColumn;
    cxlbl13: TcxLabel;
    cxedtPROFESION_CLIENTE1: TcxDBTextEdit;
    cxlbl14: TcxLabel;
    cxdbdtdt1: TcxDBDateEdit;
    cxdbtxtdtMOVIL_CLIENTE: TcxDBTextEdit;
    cxtbsht2: TcxTabSheet;
    cxtbsht4: TcxTabSheet;
    cxgrdbclmnGrdDBTabPrinNOMBRE: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinAPELLIDOS: TcxGridDBColumn;
    cxdbtxtdtNOMBRE: TcxDBTextEdit;
    cxlbl15: TcxLabel;
    cxlbl17: TcxLabel;
    cxdbtxtdtAPELLIDOS: TcxDBTextEdit;
    cxgrd1: TcxGrid;
    tvFacturacion: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvw1NRO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1SERIE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1RAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1NIF_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1MOVIL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1EMAIL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1DIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1DIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1POBLACION_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1PROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1CPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1PAIS_CLIENTE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1FECHA_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1TOTAL_LIQUIDO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1FORMA_PAGO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvw1COMENTARIOS_FACTURA: TcxGridDBColumn;
    cxgrdlvlcxgrd1Level1: TcxGridLevel;
    cxgrdlvlcxgrd1Level2: TcxGridLevel;
    tvLineasFacturacion: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA:
                                                                TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA:
                                                                TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1ZONA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA:
                                                                TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1ODONTOLOGO: TcxGridDBColumn;
    btn1: TSpeedButton;
    cxgrdbclmnGrdDBTabPrinIBAN: TcxGridDBColumn;
    cxlbl18: TcxLabel;
    cxdbtxtdtPAIS_CLIENTE: TcxDBTextEdit;
    img1: TcxImage;
    pnlHistoriaRight: TPanel;
    pnl3: TPanel;
    cxgrd5: TcxGrid;
    tvHistoriasClientes: TcxGridDBTableView;
    cxgrdbclmncxgrdtvtv1FECHA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1CODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1DESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1ZONA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1PRECIOVENTA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1NOMBRE_ODONTOLOGO: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1NRO_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1SERIE_FACTURA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1LINEA_LINEA: TcxGridDBColumn;
    cxgrdbclmncxgrdtvtv1ID: TcxGridDBColumn;
    cxgrdbndtblvwtv2: TcxGridDBBandedTableView;
    cxgrdbndclmntv2PerId: TcxGridDBBandedColumn;
    cxgrdbndclmntv2AppointmentId: TcxGridDBBandedColumn;
    cxgrdbndclmntv2Linea: TcxGridDBBandedColumn;
    cxgrdbndclmntv2clave: TcxGridDBBandedColumn;
    cxgrdbndclmntv2valor: TcxGridDBBandedColumn;
    cxgrdbndclmntv2instantemodif: TcxGridDBBandedColumn;
    cxgrdbndclmntv2descripcion: TcxGridDBBandedColumn;
    cxgrdbndclmntv2parte: TcxGridDBBandedColumn;
    cxgrdlvllv1: TcxGridLevel;
    btnFacturarSeleccionados: TcxButton;
    tsPresupuestos: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridLevel2: TcxGridLevel;
    tsFichaDental: TcxTabSheet;
    cxgrdbclmnHistoriasClientesCANTIDAD: TcxGridDBColumn;
    btnImprimir: TcxButton;
    dxbrmngr1: TdxBarManager;
    dxbrpmn1: TdxBarPopupMenu;
    dxbrlrgbtn1: TdxBarLargeButton;
    dxbrlrgbtnCuestionario: TdxBarLargeButton;
    cxgrd2: TcxGrid;
    tv1: TcxGridDBTableView;
    cxgrdbndtblvw1: TcxGridDBBandedTableView;
    cxgrdbndclmn1: TcxGridDBBandedColumn;
    cxgrdbndclmn2: TcxGridDBBandedColumn;
    cxgrdbndclmn3: TcxGridDBBandedColumn;
    cxgrdbndclmn4: TcxGridDBBandedColumn;
    cxgrdbndclmn5: TcxGridDBBandedColumn;
    cxgrdbndclmn6: TcxGridDBBandedColumn;
    cxgrdbndclmn7: TcxGridDBBandedColumn;
    cxgrdbndclmn8: TcxGridDBBandedColumn;
    cxgrdlvl1: TcxGridLevel;
    cxgrdbclmntv1PREGUNTA: TcxGridDBColumn;
    cxgrdbclmntv1RESPUESTA: TcxGridDBColumn;
    pnl4: TPanel;
    cxdbdtdt2: TcxDBDateEdit;
    lbl1: TLabel;
    btnCrearCuestionario: TButton;
    txtDIRECCION1_CLIENTE: TcxDBTextEdit;
    lblDB1: TcxDBLabel;
    btnCODIGO_CLIENTE: TcxDBButtonEdit;
    rgInternacional: TcxDBRadioGroup;
    tsFotos: TcxTabSheet;
    cxgrdFotos: TcxGrid;
    tvFotos: TcxGridDBTableView;
    dsFotos: TDataSource;
    cdsFotos: TClientDataSet;
    lvCardFotos: TcxGridLevel;
    cxgrdFotosDBCardView1: TcxGridDBCardView;
    cxgrdFotosDBCardView1NombreArchivo: TcxGridDBCardViewRow;
    cxgrdFotosDBCardView1Fecha: TcxGridDBCardViewRow;
    cxgrdFotosDBCardView1Miniatura: TcxGridDBCardViewRow;
    strngfldFotosNombreArchivo: TStringField;
    dtfldFotosFecha: TDateField;
    blbfldFotosMiniatura: TBlobField;
    cdsFotosRutaFoto: TStringField;
    lblProgreso: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIAPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure MostrarBlocdeNotas;
    procedure cxdbtxtdtRAZON_SOCIALEnter(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesEditValueChanged(
      Sender: TObject);
    procedure btnFacturarSeleccionadosClick(Sender: TObject);
    procedure dxbbEtiquetasClick(Sender: TObject);
    procedure dxbrpmn1Show(Sender: TObject);
    procedure btnCrearCuestionarioClick(Sender: TObject);
    procedure dxbrlrgbtnCuestionarioClick(Sender: TObject);
    procedure cxdbtxtdtNIFPropertiesChange(Sender: TObject);
    procedure btnCODIGO_CLIENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnCODIGO_CLIENTEPropertiesChange(Sender: TObject);
    //procedure tsFotosEnter(Sender: TObject);
    procedure cxgrdFotosDBCardView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dsTablaGDataChange(Sender: TObject; Field: TField);
    procedure btnVerGaleriaClick(Sender: TObject);
    //procedure pcDetalleClientesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure pcDetalleClientesChange(Sender: TObject);
    procedure img1DblClick(Sender: TObject);
    procedure lblProgresoDblClick(Sender: TObject);
  private
    function ObtenerOrientacionEXIF(const ARutaImagen: string): Integer;
//    function RotarBitmap(ASource: TBitmap;
//                         AOrientacion: Integer): TBitmap;
    function ObtenerDatosPaciente(const ACodigoPaciente: string;
                                  out ARazonSocial: string): Boolean;
    function RenombrarCarpetaPaciente(const ACarpetaActual: string;
                                      const ACodigoPaciente: string;
                                      const ARazonSocial: string;
                                      out ANuevaCarpeta: string): Boolean;
    procedure CrearTodasMiniaturas;
    procedure CargaFotos;
    procedure SincronizarThumbnails;
    function ObtenerRutaPaciente: string;
    function ObtenerRutaThumbnails: string;
    function ObtenerNombreThumbnail(const ARutaArchivo: string): string;
    function NecesitaActualizacion(const ARutaArchivo,
                                   ARutaThumbnail: string): Boolean;
    function CrearThumbnail(const ARutaImagen: string;
                            ASize: Integer): TBitmap;
    function ObtenerFechaExif(const RutaArchivo: string): TDateTime;
    procedure CargarMiniaturas;
    procedure VerGaleriaFotos;
    procedure MostrarFotoCompleta;
    procedure AgregarFotoAGrid(iIndex:Integer; const ARutaArchivo,
                                                     ARutaJpg: string);
    function ObtenerThumbnail(const ARutaArchivo: string): TBitmap;
    procedure CrearClientDataSetFotos;
    procedure LiberarClientDataSetFotos;
    procedure VaciarClientDataSetFotos;
    procedure RenombrarCarpetasPacientes;
    procedure ProcesarMiniaturasPaciente(
                                      const ARutaPaciente: string;
                                      var ATotalFotos, AFotosGeneradas: Integer;
                                      AErrores: TStringList);
  public
    { Public declarations }
  private
    FRutaPaciente:String;
    Stopwatch: TStopwatch;
  end;
  procedure ShowMtoClientes(Owner       : TComponent); overload;
  procedure ShowMtoClientes(Owner       : TComponent; sEmail: String); overload;
var
  dmmClientes: TDMClientes;
  frmMtoClientes: TfrmMtoClientes;

implementation

uses
  inLibWin, inMtoModalHistoriaCli, inMtoGenSearch, inLibDevExp, inLibVarGlob,
  inMtoModalCliEti, inLibDocumentoValidator, inMtoModalCliCues, inLibtb,
  inMtoModalVisorFoto;

{$R *.dfm}

procedure ShowMtoClientes(Owner       : TComponent); overload;
var
  frmMtoClientes : TfrmMtoClientes;
begin
  if not(IsOpenMDI('Pacientes', Owner)) then
  begin
    Application.CreateForm(TfrmMtoClientes, frmMtoClientes);
    frmMtoClientes.edtBusqGlobal.SetFocus;
  end;
end;

procedure ShowMtoClientes(Owner       : TComponent; sEmail: String); overload;
var
  frmMtoClientes : TfrmMtoClientes;
begin
  if not(IsOpenMDI('Pacientes', Owner)) then
  begin
    Application.CreateForm(TfrmMtoClientes, frmMtoClientes);
  end;
  frmMtoClientes.Show;
  dmmClientes.unqryClientes.Locate('CODIGO_CLIENTE', sEmail, []);
end;

procedure TfrmMtoClientes.FormCreate(Sender: TObject);
begin
  dmmClientes := TDMClientes.Create(nil);
  dsTablaG.DataSet := dmmClientes.unqryClientes;
  tvHistoriasClientes.DataController.DataSource := dmmClientes.dsHistoria;
  tvFacturacion.DataController.DataSource := dmmClientes.dsFacturas;
  tvLineasFacturacion.DataController.DataSource := dmmClientes.dsLinFac;
  cdsFotos := nil;
  inherited;
end;

procedure TfrmMtoClientes.img1DblClick(Sender: TObject);
begin
  inherited;
  CrearTodasMiniaturas;
end;

procedure TfrmMtoClientes.lblProgresoDblClick(Sender: TObject);
begin
  inherited;
  RenombrarCarpetasPacientes;
end;

procedure TfrmMtoClientes.MostrarBlocdeNotas;
  var
    form:TfrmModalHistoriaCli;
begin
  inherited;
   form := TfrmModalHistoriaCli.Create(Application);
   try
          form.ShowModal;
   finally
          form.Free;
          dmmClientes.unqryHistoria.Refresh;
   end;
end;

//procedure TfrmMtoClientes.tsFotosEnter(Sender: TObject);
//
//begin
//  inherited;
//    // *** CREAR cdsFotos SI NO EXISTE ***
//  if cdsFotos = nil then
//    CrearClientDataSetFotos;
//  SincronizarThumbnails;
//  CargarMiniaturas;
//end;

function TfrmMtoClientes.ObtenerRutaPaciente: string;
var
  sRuta: string;
  sCodigo: string;
  SearchRec: TSearchRec;
  bEncontrado: Boolean;
begin
  Result := '';
  sCodigo := Trim(dsTablaG.Dataset.FieldByName('CODIGO_CLIENTE').AsString);
  if sCodigo = '' then
    Exit;
  bEncontrado := False;
  // Buscar carpetas en el directorio base
  if FindFirst(FFotosPath + '*.*', faDirectory, SearchRec) = 0 then
  begin
    try
      repeat
        // Ignorar '.' y '..'
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
           (SearchRec.Attr and faDirectory = faDirectory) then
        begin
          // Buscar si el nombre de la carpeta contiene el código del cliente
          // Por ejemplo: "ALFONSO 32" contiene "32"
          if SameText(sCodigo, SoloNumeros(SearchRec.Name)) then
          begin
            sRuta := IncludeTrailingPathDelimiter(FFotosPath + SearchRec.Name);
            FRutaPaciente := sRuta;
            //ShowMessage('ruta paciente encontrada: ' + FRutaPaciente);
            bEncontrado := True;
            Break;
          end;
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;
  if not bEncontrado then
  begin
    // ShowMessage('Este paciente no tiene carpeta de fotos');
    sRuta := '';
  end;
  Result := sRuta;
end;

procedure TfrmMtoClientes.AgregarFotoAGrid(iIndex: Integer;
                                           const ARutaArchivo,
                                                 ARutaJpg: string);
var
  Miniatura: TBitmap;
  Stream: TMemoryStream;
begin
  if not FileExists(ARutaArchivo) then
    Exit;
  Miniatura := TBitmap.Create;//ObtenerThumbnail(ARutaArchivo);
  Miniatura.LoadFromFile(ARutaArchivo);
  if Miniatura = nil then  // ← Esto ahora funciona correctamente
    Exit;
  Stream := TMemoryStream.Create;
  try
    try
      Miniatura.SaveToStream(Stream);
      Stream.Position := 0;
      cdsFotos.Append;
      cdsFotos.FieldByName('Index').AsInteger := iIndex;
      cdsFotos.FieldByName('RutaFoto').AsString := ARutaJpg;
      cdsFotos.FieldByName('NombreArchivo').AsString :=
                                                      ExtractFileName(ARutaJpg);
      cdsFotos.FieldByName('Fecha').AsDateTime :=
                                            ObtenerFechaExif(ARutaJpg);
      TBlobField(cdsFotos.FieldByName('Miniatura')).LoadFromStream(Stream);
      cdsFotos.Post;
    finally
      Miniatura.Free;  // ← Ahora seguro porque si es nil no llegas aquí
    end;
  finally
    Stream.Free;
  end;
end;

function TfrmMtoClientes.ObtenerFechaExif(const RutaArchivo: string): TDateTime;
var
  ImgData: TImgData;
  DebugMsg: string;
  sNombreFich:string;
  Partes: TArray<string>;
  Dia, Mes, Anio:Word;
begin
  Result := 0;
  if not FileExists(RutaArchivo) then
  begin
    //ShowMessage('Archivo no existe: ' + RutaArchivo);
    Exit;
  end;
  sNombreFich := ExtractFileName(RutaArchivo);
  if StartsText('FE', sNombreFich) then
  begin
    Partes := sNombreFich.Split(['_']);
    if Length(Partes) >= 4 then
    begin
      Dia := StrToInt(Partes[1]);
      Mes := StrToInt(Partes[2]);
      Anio := StrToInt(Partes[3]);
    end;
    Result := EncodeDate(Anio, Mes, Dia);
  end
  else
  begin
    ImgData := TImgData.Create;
    try
      try
  //      DebugMsg := 'Procesando archivo...';
        if ImgData.ProcessFile(RutaArchivo) then
        begin
  //        DebugMsg := DebugMsg + #13#10 + 'Archivo procesado OK';
          if ImgData.HasEXIF then
          begin
  //          DebugMsg := DebugMsg + #13#10 + 'Tiene EXIF';
            with ImgData.ExifObj do
            begin
              // Debug: Mostrar todos los intentos
  //            DebugMsg := DebugMsg + #13#10 + 'DateTimeOriginal: ' + DateTimeToStr(DateTimeOriginal);
  //            DebugMsg := DebugMsg + #13#10 + 'DateTimeDigitized: ' + DateTimeToStr(DateTimeDigitized);
  //            DebugMsg := DebugMsg + #13#10 + 'DateTimeModified: ' + DateTimeToStr(DateTimeModified);
              //DebugMsg := DebugMsg + #13#10 + 'DateTime (string): ' + DateTime;
              // Intentar TagValue
  //            DebugMsg := DebugMsg + #13#10 + 'TagValue[DateTimeOriginal]: ' + VarToStr(TagValue['DateTimeOriginal']);
              Result := DateTimeOriginal;
              if Result = 0 then
                Result := DateTimeDigitized;
              if Result = 0 then
                Result := DateTimeModified;
              if Result = 0 then
                Result := TFile.GetCreationTime(RutaArchivo);
  //            DebugMsg := DebugMsg + #13#10 + 'Resultado final: ' + DateTimeToStr(Result);
            end;
          end
          else
            Result := TFile.GetCreationTime(RutaArchivo);
        end
        else
          Result := TFile.GetCreationTime(RutaArchivo);
        //ShowMessage(DebugMsg);
      except
        on E: Exception do
        begin
          Result := TFile.GetCreationTime(RutaArchivo);
        end;
      end;
    finally
      ImgData.Free;
    end;
  end;
end;

function TfrmMtoClientes.ObtenerThumbnail(const ARutaArchivo: string): TBitmap;
var
  Jpg: TJPEGImage;
  BmpTemp: TBitmap;
  RatioW, RatioH: Double;
  NewWidth, NewHeight: Integer;
begin
  Result := nil;
  if not FileExists(ARutaArchivo) then
    Exit;
  Jpg := nil;
  BmpTemp := nil;
  try
    Jpg := TJPEGImage.Create;
    try
      Jpg.LoadFromFile(ARutaArchivo);
    except
      Exit; // Si falla cargar el JPG, salir
    end;
    BmpTemp := TBitmap.Create;
    // Calcular dimensiones del thumbnail manteniendo proporción
    if Jpg.Width > Jpg.Height then
    begin
      NewWidth := 100;
      NewHeight := Round((Jpg.Height / Jpg.Width) * 100);
    end
    else
    begin
      NewHeight := 100;
      NewWidth := Round((Jpg.Width / Jpg.Height) * 100);
    end;
    BmpTemp.Width := NewWidth;
    BmpTemp.Height := NewHeight;
    BmpTemp.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), Jpg);
    Result := TBitmap.Create;
    Result.Assign(BmpTemp);
  finally
    if Assigned(Jpg) then
      Jpg.Free;
    if Assigned(BmpTemp) then
      BmpTemp.Free;
  end;
end;

procedure TfrmMtoClientes.pcDetalleClientesChange(Sender: TObject);
begin
  inherited;
  CargaFotos;
end;

procedure TfrmMtoClientes.CargaFotos;
begin
  if pcDetalleClientes.ActivePage = tsFotos then
  begin
    try
    // CRÍTICO: Limpiar la ruta anterior del paciente
    FRutaPaciente := '';
    // SIEMPRE liberar y recrear para evitar datos antiguos
    LiberarClientDataSetFotos;
    cdsFotos := nil;
    // Recrear todo desde cero
    CrearClientDataSetFotos;
    // Esto actualizará FRutaPaciente con el cliente actual
    if ObtenerRutaPaciente <> '' then
    begin
      SincronizarThumbnails;
      CargarMiniaturas;
    end;
    except
      on E: Exception do
          begin
            ShowMessage('Error ' +  E.Message);
          end;
    end;
    // Si ObtenerRutaPaciente devuelve '', el dataset queda vacío
  end
  else
    LiberarClientDataSetFotos;
end;

procedure TfrmMtoClientes.CargarMiniaturas;
var
  SR: TSearchRec;
  RutaPaciente, RutaThumbnail, NombreArchivo, NombreMini, RutaCompleta: string;
  iIndex:Integer;
  Lista: TStringList;
  i: Integer;
  FechaCreacion: TDateTime;
  PosicionPipe :Integer;
begin
  Screen.Cursor := crHourGlass;
  cdsFotos.DisableControls;
  cdsFotos.EmptyDataSet;
  iIndex := 0;
  // CRÍTICO: Obtener la ruta del cliente ACTUAL,
  RutaPaciente := ObtenerRutaPaciente;
  RutaThumbnail := ObtenerRutaThumbnails;
  // Si no hay ruta, salir sin mostrar error (cliente sin fotos)
  if RutaPaciente = '' then
  begin
    cdsFotos.EnableControls;
    Screen.Cursor := crDefault;
  end
  else
  begin
    try
    // Cargar Miniaturas
    Lista := TStringList.Create;
    if ( (FindFirst(RutaPaciente + '*.jpg', faAnyFile, SR) = 0) ) then
    begin
  //      repeat
  //        if (SR.Name <> '.') and (SR.Name <> '..') then
  //          AgregarFotoAGrid(iIndex, RutaPaciente + SR.Name);
  //        Inc(iIndex);
  //      until FindNext(SR) <> 0;
        repeat
          if (SR.Name <> '.') and (SR.Name <> '..') then
          begin
            //FechaCreacion := TFile.GetCreationTime(RutaPaciente + SR.Name);
            // Guardar con formato que permite ordenar: fecha + nombre
            Lista.Add(SR.Name);
          end;
        until FindNext(SR) <> 0;
        FindClose(SR);
      end;
      Lista.Sort;
  // Agregar al grid
      for i := 0 to Lista.Count - 1 do
      begin
        NombreArchivo := Lista[i];
        RutaCompleta := RutaThumbnail + ObtenerNombreThumbnail(NombreArchivo);
        //OutputDebugString(PChar('Procesando: ' + IntToStr(i) +
                                                      // ' - ' + RutaCompleta));
        try
          //var aStopWatch := TStopWatch.StartNew;
          //ShowMessage('Cargando miniatura: ' + RutaCompleta);
          AgregarFotoAGrid(i, RutaCompleta, ObtenerRutaPaciente + NombreArchivo);
          //aStopWatch.Stop;
//          inMtoPrincipal.frmOpenApp.Memo.Lines.Add(
//                                  Format('%.2f mseg en cargar  %s',
//                                        [aStopwatch.Elapsed.TotalMilliseconds,
//                                         RutaCompleta]));
          //OutputDebugString(PChar('OK: ' + IntToStr(i)));
        except
          on E: Exception do
          begin
            ShowMessage('Error en archivo #' + IntToStr(i) + ': ' +
                         RutaCompleta + #13#10 + E.Message);
            Break;
          end;
        end;
      end;
    finally
      Lista.Free;
      cdsFotos.EnableControls;
      cdsFotos.First;
      Screen.Cursor := crDefault;
    end;
  end;
end;

function TfrmMtoClientes.ObtenerRutaThumbnails: string;
begin
  Result := FFotosPath+'.thumbnails\' +
                  dsTablaG.Dataset.FieldByName('CODIGO_CLIENTE').AsString + '\';
  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function TfrmMtoClientes.ObtenerNombreThumbnail(
                                            const ARutaArchivo: string): string;
begin
  // Convertir foto1.jpg a foto1_thumb.bmp
  Result := ChangeFileExt(ExtractFileName(ARutaArchivo), '_thumb.bmp');
end;

function TfrmMtoClientes.NecesitaActualizacion(const ARutaArchivo,
                                               ARutaThumbnail: string): Boolean;
var
  FechaOriginal, FechaThumbnail: TDateTime;
begin
  // Si no existe el thumbnail, necesita crearse
  if not FileExists(ARutaThumbnail) then
  begin
    Result := True;
  end
  else
  begin
    // Si el archivo original es más nuevo que el thumbnail, necesita actualizarse
    FechaOriginal := FileDateToDateTime(FileAge(ARutaArchivo));
    FechaThumbnail := FileDateToDateTime(FileAge(ARutaThumbnail));
    Result := FechaOriginal > FechaThumbnail;
  end;
end;

procedure TfrmMtoClientes.MostrarFotoCompleta;
var
  RutaArchivo: string;
  VisorFoto: TfrmMtoVisorFoto;
begin
  if cdsFotos.IsEmpty then
  begin
    ShowMessage('No hay ninguna foto seleccionada');
    Exit;
  end;
  RutaArchivo := FRutaPaciente + cdsFotos.FieldByName('NombreArchivo').AsString;
  if not FileExists(RutaArchivo) then
  begin
    ShowMessage('El archivo no existe: ' + RutaArchivo);
    Exit;
  end;
  VisorFoto := TfrmMtoVisorFoto.Create(Self);
  try
    VisorFoto.MostrarImagen(RutaArchivo);
  finally
    VisorFoto.Free;
  end;
end;

procedure TfrmMtoClientes.CrearClientDataSetFotos;
begin
  // Si ya está creado, salir
  if cdsFotos <> nil then
    Exit;
  // Crear el ClientDataSet
  cdsFotos := TClientDataSet.Create(Self);
  // Configurar los campos
  with cdsFotos.FieldDefs do
  begin
    Clear;
    Add('Index', ftInteger);
    Add('RutaFoto', ftString, 500);
    Add('NombreArchivo', ftString, 255);
    Add('Fecha', ftDate);
    Add('Miniatura', ftBlob);
  end;
  // Crear el dataset en memoria
  cdsFotos.CreateDataSet;
//  cdsFotos.AddIndex('idxFecha', 'Fecha', [ixDescending], '', '', 0);
//  cdsFotos.IndexName := 'idxFecha';
  // Conectar al DataSource existente
  if (dsFotos <> nil) then
    dsFotos.DataSet := cdsFotos;
end;

procedure TfrmMtoClientes.VaciarClientDataSetFotos;
begin
  if cdsFotos <> nil then
  begin
    // *** CLAVE: Desconectar DataSource para forzar actualización visual ***
    if dsFotos <> nil then
      dsFotos.DataSet := nil;
    // Cerrar y recrear vacío
    if cdsFotos.Active then
      cdsFotos.Close;
    cdsFotos.CreateDataSet;
    // Reconectar DataSource
    if dsFotos <> nil then
      dsFotos.DataSet := cdsFotos;
  end;
end;

procedure TfrmMtoClientes.LiberarClientDataSetFotos;
begin
  if cdsFotos <> nil then
  begin
    // Desconectar del DataSource
    if dsFotos <> nil then
      dsFotos.DataSet := nil;
    // Cerrar si está activo
    if cdsFotos.Active then
      cdsFotos.Close;
    // Liberar
    FreeAndNil(cdsFotos);
  end;
end;

procedure TfrmMtoClientes.CrearTodasMiniaturas;
var
  SearchRec: TSearchRec;
  CarpetaPaciente, CarpetaThumbnails: string;
  TotalPacientes, PacientesProcesados: Integer;
  TotalFotos, FotosGeneradas: Integer;
  Errores: TStringList;
  Inicio: TDateTime;
begin
  if (MessageDlg('Este proceso generará miniaturas para TODOS los pacientes. ' +
                'Puede tardar varios minutos. ¿Continuar?',
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    Exit;
  Screen.Cursor := crHourGlass;
  Errores := TStringList.Create;
  try
    Inicio := Now;
    TotalPacientes := 0;
    PacientesProcesados := 0;
    TotalFotos := 0;
    FotosGeneradas := 0;
    // Contar total de carpetas de pacientes
    if FindFirst(FFotosPath + '*.*', faDirectory, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
           (SearchRec.Attr and faDirectory = faDirectory) then
          Inc(TotalPacientes);
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
    if TotalPacientes = 0 then
    begin
      ShowMessage('No se encontraron carpetas de pacientes');
      Exit;
    end;
    // Recorrer todas las carpetas de pacientes
    if FindFirst(FFotosPath + '*.*', faDirectory, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
           (SearchRec.Attr and faDirectory = faDirectory) then
        begin
          Inc(PacientesProcesados);
          CarpetaPaciente :=
                      IncludeTrailingPathDelimiter(FFotosPath + SearchRec.Name);
          // Actualizar estado en pantalla
          Application.ProcessMessages;
          // Si tienes un label de estado:
           lblProgreso.Caption := Format('Procesando paciente %d de %d: %s',
                         [PacientesProcesados, TotalPacientes, SearchRec.Name]);
          try
            // Procesar este paciente
            ProcesarMiniaturasPaciente(CarpetaPaciente,
                                       TotalFotos,
                                       FotosGeneradas, Errores);
          except
            on E: Exception do
              Errores.Add(Format('Error en carpeta %s: %s',
                                 [SearchRec.Name, E.Message]));
          end;
        end;
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
    // Mostrar resumen
    ShowMessage(Format('Proceso completado en %d segundos:%s' +
                      'Pacientes procesados: %d%s' +
                      'Total fotos encontradas: %d%s' +
                      'Miniaturas generadas: %d%s' +
                      'Errores: %d',
                      [SecondsBetween(Now, Inicio), sLineBreak,
                       PacientesProcesados, sLineBreak,
                       TotalFotos, sLineBreak,
                       FotosGeneradas, sLineBreak,
                       Errores.Count]));
    // Si hubo errores, mostrarlos
    if Errores.Count > 0 then
    begin
      if MessageDlg('Hubo errores durante el proceso. ¿Desea ver el detalle?',
                    mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        // Guardar log de errores
        Errores.SaveToFile(FFotosPath + 'errores_miniaturas.txt');
        ShellExecute(0, 'open', PChar(FFotosPath + 'errores_miniaturas.txt'),
                     nil, nil, SW_SHOW);
      end;
    end;
  finally
    Errores.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMtoClientes.ProcesarMiniaturasPaciente(
                                      const ARutaPaciente: string;
                                      var ATotalFotos, AFotosGeneradas: Integer;
                                      AErrores: TStringList);
var
  SR: TSearchRec;
  RutaThumbnails: string;
  ARutaArchivo, ARutaThumbnail: string;
  Thumbnail: TBitmap;
  CodigoPaciente: string;
begin
  // Extraer código de paciente del nombre de carpeta
  CodigoPaciente :=
      SoloNumeros(ExtractFileName(ExcludeTrailingPathDelimiter(ARutaPaciente)));
  // Crear carpeta de thumbnails
  RutaThumbnails := FFotosPath + '.thumbnails\' + CodigoPaciente + '\';
  if not DirectoryExists(RutaThumbnails) then
    ForceDirectories(RutaThumbnails);
  // Procesar JPG
  if FindFirst(ARutaPaciente + '*.jpg', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        Inc(ATotalFotos);
        ARutaArchivo := ARutaPaciente + SR.Name;
        ARutaThumbnail := RutaThumbnails + ChangeFileExt(SR.Name, '_thumb.bmp');
        // Generar solo si no existe o está desactualizado
        if NecesitaActualizacion(ARutaArchivo, ARutaThumbnail) then
        begin
          try
            Thumbnail := CrearThumbnail(ARutaArchivo, 160);
            try
              if Thumbnail <> nil then
              begin
                Thumbnail.SaveToFile(ARutaThumbnail);
                Inc(AFotosGeneradas);
              end;
            finally
              Thumbnail.Free;
            end;
          except
            on E: Exception do
              AErrores.Add(Format('%s\%s: %s',
                                  [CodigoPaciente, SR.Name, E.Message]));
          end;
        end;
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;
// *** FUNCIÓN PARA OBTENER DATOS DEL PACIENTE ***
function TfrmMtoClientes.ObtenerDatosPaciente(const ACodigoPaciente: string;
                                             out ARazonSocial: string): Boolean;
var
  qryTemp: TUniQuery;
begin
  Result := False;
  ARazonSocial := '';
  if Trim(ACodigoPaciente) = '' then
    Exit;
  qryTemp := TUniQuery.Create(nil);
  try
    qryTemp.Connection := dmmClientes.unqryClientes.Connection;
    qryTemp.SQL.Text := 'SELECT RAZONSOCIAL_CLIENTE ' +
                        'FROM suboc_clientes ' +
                        'WHERE CODIGO_CLIENTE = :pCodigo';
    qryTemp.ParamByName('pCodigo').AsString := ACodigoPaciente;
    try
      qryTemp.Open;
      if not qryTemp.IsEmpty then
      begin
        ARazonSocial :=
                      Trim(qryTemp.FieldByName('RAZONSOCIAL_CLIENTE').AsString);
        Result := True;
      end;
      qryTemp.Close;
    except
      on E: Exception do
      begin
        Result := False;
      end;
    end;
  finally
    qryTemp.Free;
  end;
end;
// *** FUNCIÓN PARA RENOMBRAR CARPETA ***
function TfrmMtoClientes.RenombrarCarpetaPaciente( const ACarpetaActual: string;
                                                  const ACodigoPaciente: string;
                                                     const ARazonSocial: string;
                                            out ANuevaCarpeta: string): Boolean;
var
  NombreLimpio: string;
  RutaBase: string;
begin
  Result := False;
  ANuevaCarpeta := '';
  // Obtener ruta base (sin el nombre de la carpeta actual)
  RutaBase := ExtractFilePath(ExcludeTrailingPathDelimiter(ACarpetaActual));
  // Limpiar caracteres inválidos del nombre
  NombreLimpio := ARazonSocial;
  // Crear nuevo nombre: "CODIGO RAZONSOCIAL"
  ANuevaCarpeta := RutaBase + ACodigoPaciente + ' ' + NombreLimpio + '\';
  // Si ya tiene el nombre correcto, no hacer nada
  if SameText(ACarpetaActual, ANuevaCarpeta) then
  begin
    Result := True;
    Exit;
  end;
  // Si ya existe una carpeta con ese nombre, no renombrar
  if DirectoryExists(ANuevaCarpeta) then
  begin
    // Solo retornar true si es exactamente la misma carpeta
    Result := SameText(ACarpetaActual, ANuevaCarpeta);
    Exit;
  end;
  // Intentar renombrar
  try
    Result := RenameFile(ExcludeTrailingPathDelimiter(ACarpetaActual),
                        ExcludeTrailingPathDelimiter(ANuevaCarpeta));
  except
    on E: Exception do
      Result := False;
  end;
end;
// *** VERSIÓN SOLO PARA RENOMBRAR (SIN GENERAR MINIATURAS) ***
procedure TfrmMtoClientes.RenombrarCarpetasPacientes;
var
  SearchRec: TSearchRec;
  CarpetaActual, NuevaCarpeta: string;
  TotalCarpetas, CarpetasRenombradas, CarpetasNoEncontradas: Integer;
  Errores: TStringList;
  CodigoPaciente, RazonSocial: string;
  ListaCarpetas: TStringList;
  i: Integer;
begin
  if MessageDlg('Este proceso renombrará TODAS las carpetas de pacientes ' +
                'al formato: CODIGOPACIENTE RAZONSOCIAL' +
                 sLineBreak + sLineBreak +
                '¿Continuar?',
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  Screen.Cursor := crHourGlass;
  Errores := TStringList.Create;
  ListaCarpetas := TStringList.Create;
  try
    TotalCarpetas := 0;
    CarpetasRenombradas := 0;
    CarpetasNoEncontradas := 0;
    // Recopilar carpetas
    if FindFirst(FFotosPath + '*.*', faDirectory, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
           (SearchRec.Attr and faDirectory = faDirectory) then
        begin
          ListaCarpetas.Add(SearchRec.Name);
          Inc(TotalCarpetas);
        end;
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
    // Procesar carpetas
    for i := 0 to ListaCarpetas.Count - 1 do
    begin
      CarpetaActual := IncludeTrailingPathDelimiter(FFotosPath + ListaCarpetas[i]);
      CodigoPaciente := SoloNumeros(ListaCarpetas[i]);
      if ObtenerDatosPaciente(CodigoPaciente, RazonSocial) then
      begin
        if RenombrarCarpetaPaciente(CarpetaActual, CodigoPaciente,
                                    RazonSocial, NuevaCarpeta) then
        begin
          if not SameText(CarpetaActual, NuevaCarpeta) then
          begin
            Inc(CarpetasRenombradas);
            Errores.Add(Format('✓ RENOMBRADO: "%s" -> "%s"',
                              [ListaCarpetas[i],
                               ExtractFileName(ExcludeTrailingPathDelimiter(
                                                              NuevaCarpeta))]));
          end;
        end
        else
        begin
          Errores.Add(Format('✗ ERROR: No se pudo renombrar "%s"',
                             [ListaCarpetas[i]]));
        end;
      end
      else
      begin
        Inc(CarpetasNoEncontradas);
        Errores.Add(Format('⚠ NO ENCONTRADO EN BD: "%s" (Código: %s)',
                          [ListaCarpetas[i], CodigoPaciente]));
      end;
    end;
    ShowMessage(Format('Proceso completado:%s' +
                      'Total carpetas: %d%s' +
                      'Carpetas renombradas: %d%s' +
                      'No encontradas en BD: %d',
                      [sLineBreak, TotalCarpetas, sLineBreak,
                       CarpetasRenombradas, sLineBreak,
                       CarpetasNoEncontradas]));
    if Errores.Count > 0 then
    begin
      if MessageDlg('¿Ver log de cambios?', mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        Errores.SaveToFile(FFotosPath + 'log_renombrado_carpetas.txt');
        ShellExecute(Application.Handle, 'open',
                     PChar(FFotosPath + 'log_renombrado_carpetas.txt'),
                     nil, nil, SW_SHOWNORMAL);
      end;
    end;
  finally
    Errores.Free;
    ListaCarpetas.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMtoClientes.SincronizarThumbnails;
var
  SR: TSearchRec;
  RutaPaciente, RutaThumbnails: string;
  ARutaArchivo, ARutaThumbnail: string;
  Thumbnail: TBitmap;
  TotalFotos, FotosProcesadas: Integer;
begin
//  if FCodPaciente = '' then Exit;
//  if FSincronizando then Exit;
  //FSincronizando := True;
  Screen.Cursor:= crHourGlass;
  try
    RutaPaciente := ObtenerRutaPaciente;
    if RutaPaciente = '' then
      Exit;
    RutaThumbnails := ObtenerRutaThumbnails;
    // Contar total de fotos
    TotalFotos := 0;
    if FindFirst(RutaPaciente + '*.jpg', faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Name <> '.') and (SR.Name <> '..') then
          Inc(TotalFotos);
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
//    if FindFirst(RutaPaciente + '*.jpeg', faAnyFile, SR) = 0 then
//    begin
//      repeat
//        if (SR.Name <> '.') and (SR.Name <> '..') then
//          Inc(TotalFotos);
//      until FindNext(SR) <> 0;
//      FindClose(SR);
//    end;
    if TotalFotos = 0 then
    begin
      ShowMessage('No hay fotos para sincronizar');
      Exit;
    end;
    //ActualizarEstado(Format('Sincronizando %d fotos...', [TotalFotos]));
    FotosProcesadas := 0;
    // Procesar archivos JPG
    if FindFirst(RutaPaciente + '*.jpg', faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Name <> '.') and (SR.Name <> '..') then
        begin
          ARutaArchivo := RutaPaciente + SR.Name;
          ARutaThumbnail := RutaThumbnails +
                                           ObtenerNombreThumbnail(ARutaArchivo);
          if NecesitaActualizacion(ARutaArchivo, ARutaThumbnail) then
          begin
            Inc(FotosProcesadas);
//            ActualizarEstado(Format('Generando thumbnail %d/%d: %s',
//              [FotosProcesadas, TotalFotos, SR.Name]));
            Thumbnail := CrearThumbnail(ARutaArchivo, 160); //Más grande para cards
            try
              if Thumbnail <> nil then
              begin
                try
                  Thumbnail.SaveToFile(ARutaThumbnail);
                except
                  // Error al guardar
                end;
              end;
            finally
              Thumbnail.Free;
            end;
          end;
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
    // Procesar archivos JPEG
    if FindFirst(RutaPaciente + '*.jpeg', faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Name <> '.') and (SR.Name <> '..') then
        begin
          ARutaArchivo := RutaPaciente + SR.Name;
          ARutaThumbnail := RutaThumbnails + ObtenerNombreThumbnail(ARutaArchivo);
          if NecesitaActualizacion(ARutaArchivo, ARutaThumbnail) then
          begin
            Inc(FotosProcesadas);
//            ActualizarEstado(Format('Generando thumbnail %d/%d: %s',
//              [FotosProcesadas, TotalFotos, SR.Name]));
            Thumbnail := CrearThumbnail(ARutaArchivo, 160);
            try
              if Thumbnail <> nil then
              begin
                try
                  Thumbnail.SaveToFile(ARutaThumbnail);
                except
                  // Error al guardar
                end;
              end;
            finally
              Thumbnail.Free;
            end;
          end;
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
//    if FotosProcesadas > 0 then
//      ActualizarEstado(Format('Sincronización completa: %d thumbnails generados', [FotosProcesadas]))
//    else
//      ActualizarEstado('Thumbnails ya están actualizados');
  finally
//    FSincronizando := False;
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmMtoClientes.btn1Click(Sender: TObject);
begin
  inherited;
  dsTablaG.DataSet.Insert;
  pcPantalla.ActivePage := tsFicha;
  tsFicha.SetFocus;
  cxdbtxtdtNOMBRE.SetFocus;
end;

procedure TfrmMtoClientes.btnCODIGO_CLIENTEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Application);
  try
    formulario.dsData.DataSet := dmmClientes.unqryPaises;
    formulario.dsData.DataSet.Open;
    formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
    PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Paises');
    formulario.Caption := 'Búsqueda de Paises en Clientes';
    formulario.ShowModal;
  finally
      inherited;
      if formulario.sFicha = 'S' then
        dmmClientes.CopiarPaisaCliente;
      formulario.dsData.DataSet.Close;
      FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.btnCODIGO_CLIENTEPropertiesChange(Sender: TObject);
begin
  inherited;
  if dsTablaG.State in [dsEdit, dsInsert, dsBrowse] then
    if dsTablaG.DataSet.FieldByName('PAIS_CLIENTE').AsString <> 'ES' then
      rgInternacional.Visible := True
    else
      rgInternacional.Visible := False;
end;

procedure TfrmMtoClientes.btnCrearCuestionarioClick(Sender: TObject);
begin
  inherited;
  dmmClientes.Crear_Cuestionario;
end;

procedure TfrmMtoClientes.btnFacturarSeleccionadosClick(Sender: TObject);
var
  I, RecordIndex, ColumnIndex: Integer;
  sIdHistoria, sResul, sNroFac, sNroLin, sSerie: string;
begin
  if ((dmmClientes.unqryHistoria.State = dsInsert)
   or (dmmClientes.unqryHistoria.State = dsEdit))  then
    dmmClientes.unqryHistoria.Post;
  for I := 0 to tvHistoriasClientes.Controller.SelectedRecordCount - 1 do
  begin
    ColumnIndex := cxgrdbclmncxgrdtvtv1ID.Index;
    RecordIndex :=
         tvHistoriasClientes.Controller.SelectedRecords[I].RecordIndex;
    sIdHistoria :=
     VarToStr(tvHistoriasClientes.DataController.Values[RecordIndex,
                                                                  ColumnIndex]);
    dmmClientes.FacturarHistorias(sIdHistoria, sSerie, sNroFac, sNroLin);
    sResul := sResul + sSerie +'\'+ sNroFac + ' linea ' + sNroLin + sLineBreak;
  end;
  dmmClientes.unqryFacturas.Refresh;
  dmmClientes.unqryLinFac.Refresh;
  ShowMessage('Se ha/n creado los documentos de borrador de venta ' +
                                         'correctamente '+ sLineBreak + sResul);
end;

procedure TfrmMtoClientes.btnVerGaleriaClick(Sender: TObject);
begin
  VerGaleriaFotos;
end;

procedure TfrmMtoClientes.VerGaleriaFotos;
var
  iIndex:Integer;
//  ListaFotos: TStringList;
//  ListaMiniaturas: TStringList;
//  Marca: TBookmark;
begin
    if (cdsFotos = nil) or (cdsFotos.IsEmpty) then
  begin
    ShowMessage('No hay fotos para mostrar');
    Exit;
  end;
//  ListaFotos := TStringList.Create;
//  ListaMiniaturas := TStringList.Create;
//  try
//    Marca := cdsFotos.GetBookmark;
//    cdsFotos.DisableControls;
//    try
//      cdsFotos.First;
//      while not cdsFotos.Eof do
//      begin
//        if FileExists(cdsFotos.FieldByName('RutaFoto').AsString) then
//        begin
//          ListaFotos.Add(cdsFotos.FieldByName('RutaFoto').AsString);
//          ListaMiniaturas.Add(cdsFotos.FieldByName('RutaMiniatura').AsString);
//        end;
//        cdsFotos.Next;
//      end;
//      cdsFotos.GotoBookmark(Marca);
//      cdsFotos.FreeBookmark(Marca);
//    finally
//      cdsFotos.EnableControls;
//    end;
    if cdsFotos.RecordCount > 0 then
    begin
      Application.CreateForm(TfrmMtoVisorFoto, frmMtoVisorFoto);
      try
        iIndex := cdsFotos.FieldByName('Index').AsInteger;
        frmMtoVisorFoto.MostrarImagenes(cdsFotos, iIndex);
      finally
        frmMtoVisorFoto.Free;
        frmMtoVisorFoto := nil;
      end;
    end;
//  finally
//    ListaFotos.Free;
//    ListaMiniaturas.Free;
//  end;
end;
procedure TfrmMtoClientes.cxButton1Click(Sender: TObject);
begin
  inherited;

  if pcDetalleClientes.ActivePage = tsFotos then
  begin
    STopWatch := TStopWatch.StartNew;
    CrearClientDataSetFotos;
    StopWatch.Stop;
    inMtoPrincipal.frmOpenApp.Memo.Lines.Add(
                                  Format('%.2f mseg en CrearClientDataSetFotos',
                                        [Stopwatch.Elapsed.TotalMilliseconds]));
    STopWatch := TStopWatch.StartNew;
    SincronizarThumbnails;
    StopWatch.Stop;
    inMtoPrincipal.frmOpenApp.Memo.Lines.Add(
                                  Format('%.2f mseg en SincronizarThumnails',
                                        [Stopwatch.Elapsed.TotalMilliseconds]));
    STopWatch := TStopWatch.StartNew;
    cxgrdFotosDBCardView1.DataController.DataSource := nil;
    CargarMiniaturas;
    cxgrdFotosDBCardView1.DataController.DataSource := dsFotos;
    StopWatch.Stop;
    inMtoPrincipal.frmOpenApp.Memo.Lines.Add(
                                  Format('%.2f mseg en CargarMiniaturas',
                                        [Stopwatch.Elapsed.TotalMilliseconds]));
  end;
end;

procedure TfrmMtoClientes.cxdbtxtdtNIFPropertiesChange(Sender: TObject);
//var
//  validator: TDocumentoValidator;
begin
//  if ((dsTablaG.State = dsEdit) or (dsTablaG.State = dsInsert)) then
//  begin
//    validator := TDocumentoValidator.Create;
//    try
//      if not validator.ValidarDocumento(cxdbtxtdtNIF.Text) then
//        ShowMessage('NIF inválido');
//    finally
//      validator.Free;
//    end;
//  end;
end;

procedure TfrmMtoClientes.cxdbtxtdtRAZON_SOCIALEnter(Sender: TObject);
var
  buttonSelected : Integer;
begin
   if ( (dmmClientes.unqryClientes.State = dsEdit) or
        (dmmClientes.unqryClientes.State = dsInsert)) then
  begin
    inherited;
    with dmmClientes do
    begin
      begin
        buttonSelected := messagedlg('¿Desea copiar los datos de nombre y apellidos?',mtConfirmation, mbYesNo, 0);
        if buttonSelected = mrYes     then
        begin
          with unqryClientes do
            FieldByName('RAZONSOCIAL_CLIENTE').AsString := FieldByName('NOMBRE').AsString + ' ' +
                                                           FieldByName('APELLIDOS').AsString;
        end;
      end;
    end;
  end;
end;

procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Application);
  try
    formulario.dsData.DataSet := dmmClientes.unqryArtDataHisCli;
    formulario.dsData.DataSet.Open;
    formulario.tvGrdDBTabPrin.DataController.CreateAllItems();
    PonerAnchosTitulos(formulario.tvGrdDBTabPrin, 'Productos');
    formulario.Caption := 'Búsqueda de Tratamientos en Historia de Clientes';
    formulario.ShowModal;
  finally
    inherited;
    if formulario.sFicha = 'S' then
      dmmClientes.CopiarArticuloaHistoriaCliente;
    formulario.dsData.DataSet.Close;
    FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesEditValueChanged(
  Sender: TObject);
  var
  E : TcxCustomEdit;
begin
  inherited;
  if ((dmmClientes.unqryHistoria.State = dsInsert)) then
  begin
     with dmmClientes.unstrdprcGetDataArticulo do
     begin
       e := Sender as TcxCustomEdit;
       ParamByName('pidcodarticulo').AsString :=  VarToStr(e.EditingValue);
       ExecProc;
       dmmClientes.unqryHistoria.FindField('CODIGO_ARTICULO').AsString := VarToStr(e.EditingValue);
       dmmClientes.unqryHistoria.FindField('DESCRIPCION_ARTICULO').AsString := ParamByName('pidnomarticulo').AsString;
       dmmClientes.unqryHistoria.FindField('PRECIOVENTA_ARTICULO').AsFloat := ParamByName('pidprecioventa').AsFloat;
     end;
  end;
end;

procedure TfrmMtoClientes.cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  MostrarBlocdeNotas;
end;

procedure TfrmMtoClientes.cxgrdFotosDBCardView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  VerGaleriaFotos;
end;

procedure TfrmMtoClientes.dsTablaGDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned(dsTablaG) then
    if Assigned(dsTablaG.Dataset) then
    begin
      if (dsTablaG.DataSet.State = dsBrowse) then
      begin
        // Desconectar el datasource del grid de fotos
        if Assigned(dsFotos) then
          dsFotos.DataSet := nil;
        // Liberar completamente
        //LiberarClientDataSetFotos;
        cdsFotos := nil;
        // Si estamos en la pestaña de fotos, recargar
        if pcDetalleClientes.ActivePage = tsFotos then
          CargaFotos;
      end;
    end;
end;

procedure TfrmMtoClientes.dxbbEtiquetasClick(Sender: TObject);
var
  formulario : TfrmPrintCliEti;
begin
  formulario := TfrmPrintCliEti.Create(Application);
  try
    formulario.edtCodCli.Text := dsTablaG.Dataset.FieldByName('CODIGO_CLIENTE').AsString;
    formulario.ShowModal;
  finally
    inherited;
    FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.dxbrlrgbtnCuestionarioClick(Sender: TObject);
var
  formulario : TfrmPrintCliCues;
begin
  formulario := TfrmPrintCliCues.Create(Application);
  try
    if dmmClientes.unqryCuestionario.RecordCount = 0 then
      dmmClientes.Crear_Cuestionario;
    formulario.edtCodCli.Text := dsTablaG.Dataset.FieldByName('CODIGO_CLIENTE').AsString;
    formulario.ShowModal;
  finally
    inherited;
    FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoClientes.dxbrpmn1Show(Sender: TObject);
begin
  inherited;
  (Sender as TdxBarPopupMenu).SubMenuControl.Width := btnImprimir.Width;
end;

procedure TfrmMtoClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LiberarClientDataSetFotos;
  FreeAndNil(dmmClientes);
end;

function TfrmMtoClientes.ObtenerOrientacionEXIF(const ARutaImagen: string): Integer;
var
  Image: TGPImage;
  PropItem: PPropertyItem;
  PropSize: UINT;
begin
  Result := 1; // Valor por defecto (sin rotación)
  Image := TGPImage.Create(ARutaImagen);
  try
    // PropertyTagOrientation = $0112
    PropSize := Image.GetPropertyItemSize($0112);
    if PropSize > 0 then
    begin
      GetMem(PropItem, PropSize);
      try
        if Image.GetPropertyItem($0112, PropSize, PropItem) = Ok then
        begin
          if PropItem.type_ = PropertyTagTypeShort then
            Result := PWord(PropItem.value)^;
        end;
      finally
        FreeMem(PropItem);
      end;
    end;
  finally
    Image.Free;
  end;
end;

function TfrmMtoClientes.CrearThumbnail(const ARutaImagen: string;
                                        ASize: Integer): TBitmap;
var
  GPBitmap: TGPBitmap;
  GPGraphics: TGPGraphics;
  Orientacion: Integer;
  NuevoAncho, NuevoAlto: Integer;
  Proporcion: Double;
begin
  Result := TBitmap.Create;
  try
    // 1. Leer orientación EXIF
    Orientacion := ObtenerOrientacionEXIF(ARutaImagen);
    // 2. Cargar con GDI+ (mucho más rápido que TJPEGImage)
    GPBitmap := TGPBitmap.Create(ARutaImagen);
    try
      // 3. Aplicar rotación según EXIF
      case Orientacion of
        3: GPBitmap.RotateFlip(Rotate180FlipNone);
        6: GPBitmap.RotateFlip(Rotate90FlipNone);
        8: GPBitmap.RotateFlip(Rotate270FlipNone);
      end;
      // 4. Calcular tamaño del thumbnail
      if GPBitmap.GetWidth > GPBitmap.GetHeight then
      begin
        Proporcion := ASize / GPBitmap.GetWidth;
        NuevoAncho := ASize;
        NuevoAlto := Round(GPBitmap.GetHeight * Proporcion);
      end
      else
      begin
        Proporcion := ASize / GPBitmap.GetHeight;
        NuevoAlto := ASize;
        NuevoAncho := Round(GPBitmap.GetWidth * Proporcion);
      end;
      if (NuevoAncho < 1) then NuevoAncho := 1;
      if (NuevoAlto < 1) then NuevoAlto := 1;
      // 5. Crear thumbnail
      Result.Width := NuevoAncho;
      Result.Height := NuevoAlto;
      Result.PixelFormat := pf24bit;
      // 6. Dibujar con GDI+ (ALTA CALIDAD)
      GPGraphics := TGPGraphics.Create(Result.Canvas.Handle);
      try
        GPGraphics.SetInterpolationMode(InterpolationModeHighQualityBicubic);
        GPGraphics.SetSmoothingMode(SmoothingModeHighQuality);
        GPGraphics.DrawImage(GPBitmap, 0, 0, NuevoAncho, NuevoAlto);
      finally
        GPGraphics.Free;
      end;
    finally
      GPBitmap.Free;
    end;
  except
    on E: Exception do
    begin
      // En caso de error, devolver thumbnail vacío
      Result.Width := ASize;
      Result.Height := ASize;
      Result.Canvas.Brush.Color := clWhite;
      Result.Canvas.FillRect(Rect(0, 0, ASize, ASize));
    end;
  end;
end;

end.
