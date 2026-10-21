{******************************************************************************}
{                                                                              }
{  Módulo:       inLibVerifactuAeat                                            }
{    Tipo:       Librería                                                      }
{ Versión:       1.0.0                                                         }
{   Fecha:       21/10/2026                                                    }
{   Autor:       Alejandro Laorden Hidalgo                                     }
{                                                                              }
{  Copyright (c) Alejandro Laorden Hidalgo. Todos los derechos reservados.     }
{                                                                              }
{  Descripción:                                                                }
{    Envío directo de registros de facturación a la AEAT (VERI*FACTU),         }
{    portado del cliente de Factuzam (inLibVerifactuEnvio).                    }
{    Compone el XML de alta/anulación con su huella SHA-256 encadenada         }
{    (suboc_verifactu_cadena), lo remite por SOAP con el certificado del       }
{    almacén de Windows elegido en Parámetros (CERTIFICADO_*_VERIFACTU),       }
{    interpreta la respuesta y genera el QR de cotejo.                         }
{******************************************************************************}
unit inLibVerifactuAeat;

interface

uses
  System.SysUtils, Uni;

type
  TOperacionAeat = (opAeatAlta, opAeatSubsanacion, opAeatAnulacion);

  TResultadoEnvioAeat = record
    Ok:               Boolean;
    MensajeError:     string;
    EstadoEnvio:      string;  // Correcto / ParcialmenteCorrecto / Incorrecto
    EstadoRegistro:   string;  // Correcto / AceptadoConErrores / Incorrecto
    CodigoError:      string;
    DescripcionError: string;
    Duplicado:        Boolean;
    EsperaSegundos:   Integer; // TiempoEsperaEnvio devuelto por la AEAT
    Csv:              string;
    NifEmisor:        string;
    NumSerieFactura:  string;
    Huella:           string;
    Contador:         Int64;   // eslabón de la cadena del registro
    FechaHoraGen:     string;
    VerifactuUrl:     string;
    QRCodePng:        TBytes;
    QRCodeBase64:     string;
    Peticion:         string;  // SOAP enviado
    Respuesta:        string;  // SOAP recibido
    EstadoHttp:       Integer;
  end;

  // La AEAT no respondió de forma definitiva (corte de red, proxy, timeout):
  // el registro pudo quedar registrado. Se reintenta con la misma huella.
  EVerifactuAeatIncierto = class(Exception);

// Envía a la AEAT el registro de la factura y guarda el resultado en
// suboc_consolidacion / suboc_facturas. Si la conexión ya está en una
// transacción (subsanación) trabaja dentro de ella y no la confirma; si
// no, abre la suya. ATipoFactura fuerza F1/F2/F3/R1..R5 (subsanación).
function EnviarFacturaAeat(AConn: TUniConnection;
                           const ASerie: string;
                           ANumero: Integer;
                           AOperacion: TOperacionAeat;
                           const ATipoFactura: string = ''):
                           TResultadoEnvioAeat;

// Segundos que faltan para poder enviar otro registro (TiempoEsperaEnvio
// del último envío). 0 si se puede enviar ya.
function SegundosEsperaEnvioAeat(AConn: TUniConnection): Integer;

// Espera hasta que se pueda enviar. AProgreso recibe los segundos que
// faltan cada 200 ms (para refrescar la pantalla).
procedure EsperarTurnoEnvioAeat(AConn: TUniConnection;
                                const AProgreso: TProc<Integer> = nil);

// URL de cotejo del QR tributario y su imagen PNG para la factura
function ConstruirUrlQRFacturaAeat(AConn: TUniConnection;
                                   const ASerie: string;
                                   ANumero: Integer): string;
function GenerarQRPngVerifactu(const AUrl: string;
                               AEscala: Integer = 4): TBytes;

// Formato del número de factura enviado a la AEAT y en el QR
function ComponerNumSerieFacturaAeat(const ASerie: string;
                                     ANumero: Integer): string;

implementation

uses
  Winapi.Windows, System.Classes, System.StrUtils, System.Hash, System.DateUtils,
  System.TimeSpan, System.NetEncoding, System.JSON, System.Net.HttpClient,
  System.Net.URLClient, Data.DB, Vcl.Imaging.pngimage, DelphiZXIngQRCode;

const
  // Endpoints oficiales del servicio SOAP de Verifactu
  cUrlEnvioPre =
    'https://prewww1.aeat.es/wlpl/TIKE-CONT/ws/SistemaFacturacion/' +
    'VerifactuSOAP';
  cUrlEnvioPro =
    'https://www1.agenciatributaria.gob.es/wlpl/TIKE-CONT/ws/' +
    'SistemaFacturacion/VerifactuSOAP';
  cUrlQRPre = 'https://prewww2.aeat.es/wlpl/TIKE-CONT/ValidarQR';
  cUrlQRPro =
    'https://www2.agenciatributaria.gob.es/wlpl/TIKE-CONT/ValidarQR';
  cNsSoap = 'http://schemas.xmlsoap.org/soap/envelope/';
  cNsLR =
    'https://www2.agenciatributaria.gob.es/static_files/common/internet/' +
    'dep/aplicaciones/es/aeat/tike/cont/ws/SuministroLR.xsd';
  cNsInf =
    'https://www2.agenciatributaria.gob.es/static_files/common/internet/' +
    'dep/aplicaciones/es/aeat/tike/cont/ws/SuministroInformacion.xsd';
  // Espera por defecto entre envíos si la AEAT no indica otra
  cEsperaEnvioDefecto = 60;

type
  // Configuración leída de suboc_param
  TConfigAeat = record
    Entorno:            string;  // PRE / PRO
    UrlEnvio:           string;
    UrlQR:              string;
    NifEmisor:          string;
    NombreEmisor:       string;
    SifNombreRazon:     string;
    SifNif:             string;
    SifNombre:          string;
    SifId:              string;
    SifVersion:         string;
    SifInstalacion:     string;
    CertSerie:          string;
    CertTitular:        string;
    OperacionExenta:    string;
    DescripcionOpe:     string;
  end;

  // Datos de la factura necesarios para el registro
  TDatosFacturaAeat = record
    Serie:              string;
    Numero:             Integer;
    NumSerieFactura:    string;
    FechaFac:           TDateTime;
    FechaExpedicion:    string;  // dd-mm-yyyy
    TipoFactura:        string;  // F1 / F2 / F3 / R1..R5
    NifCliente:         string;
    NombreCliente:      string;
    PaisClienteISO2:    string;
    EsClienteUE:        Boolean;
    EsClienteExtr:      Boolean;
    TipoIdCliente:      string;
    Descripcion:        string;
    ImporteTotal:       Currency;
    // Factura rectificada (abonos)
    RectSerie:          string;
    RectNumero:         Integer;
    RectFecha:          string;  // dd-mm-yyyy
  end;

  // Eslabón anterior de la cadena de huellas del emisor
  TCadenaAnterior = record
    Contador:    Int64;
    NumSerie:    string;
    Fecha:       string;  // dd-mm-yyyy
    Huella:      string;
    // Envío incierto pendiente de reintento (misma huella)
    VueloClave:  string;
    VueloFhGen:  string;
  end;

  // Selección del certificado de cliente en la negociación TLS. Busca por
  // nº de serie (en su orden de bytes o el inverso) y si no, por titular.
  TSelectorCertificado = class
  private
    FSerial:  string;
    FTitular: string;
  public
    constructor Create(const ASerial, ATitular: string);
    procedure Seleccionar(const Sender: TObject;
                          const ARequest: TURLRequest;
                          const ACertificateList: TCertificateList;
                          var AnIndex: Integer);
  end;

// ===========================================================================
//   Helpers de formato
// ===========================================================================

function EscaparXml(const AValor: string): string;
begin
  Result := StringReplace(AValor,  '&', '&amp;',  [rfReplaceAll]);
  Result := StringReplace(Result,  '<', '&lt;',   [rfReplaceAll]);
  Result := StringReplace(Result,  '>', '&gt;',   [rfReplaceAll]);
  Result := StringReplace(Result,  '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&apos;', [rfReplaceAll]);
end;

function FormatearImporte(AImporte: Currency): string;
var
  oFmt: TFormatSettings;
begin
  oFmt := TFormatSettings.Create;
  oFmt.DecimalSeparator  := '.';
  oFmt.ThousandSeparator := #0;
  Result := FormatFloat('0.00', AImporte, oFmt);
end;

function NormalizarNif(const AValor: string): string;
var
  cActual: Char;
begin
  Result := '';
  for cActual in UpperCase(Trim(AValor)) do
    if CharInSet(cActual, ['A'..'Z', '0'..'9']) then
      Result := Result + cActual;
end;

// Instante de generación con huso horario (yyyy-mm-ddThh:nn:ss+hh:mm)
function FechaHoraHusoGen(ADt: TDateTime): string;
var
  oDesfase: TTimeSpan;
  sSigno:   string;
begin
  oDesfase := TTimeZone.Local.GetUtcOffset(ADt);
  if oDesfase.Ticks < 0 then
    sSigno := '-'
  else
    sSigno := '+';
  Result := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', ADt) + sSigno +
            Format('%.2d:%.2d', [Abs(oDesfase.Hours), Abs(oDesfase.Minutes)]);
end;

// Percent-encode de un valor de parámetro de URL (RFC 3986)
function CodificarParametroURL(const AValor: string): string;
var
  aBytes:  TBytes;
  iOcteto: Byte;
  oSalida: TStringBuilder;
begin
  oSalida := TStringBuilder.Create;
  try
    aBytes := TEncoding.UTF8.GetBytes(AValor);
    for iOcteto in aBytes do
    begin
      if ((iOcteto >= Ord('A')) and (iOcteto <= Ord('Z'))) or
         ((iOcteto >= Ord('a')) and (iOcteto <= Ord('z'))) or
         ((iOcteto >= Ord('0')) and (iOcteto <= Ord('9'))) or
         (iOcteto = Ord('-')) or (iOcteto = Ord('.')) or
         (iOcteto = Ord('_')) or (iOcteto = Ord('~')) then
        oSalida.Append(Char(iOcteto))
      else
        oSalida.Append('%' + IntToHex(iOcteto, 2));
    end;
    Result := oSalida.ToString;
  finally
    FreeAndNil(oSalida);
  end;
end;

function ExtraerEtiqueta(const AXml, AEtiqueta: string): string;
var
  iIni:      Integer;
  iFin:      Integer;
  sApertura: string;
begin
  Result := '';
  sApertura := AEtiqueta + '>';
  iIni := Pos('<' + sApertura, AXml);
  if iIni > 0 then
    iIni := iIni + Length(sApertura) + 1
  else
  begin
    iIni := Pos(':' + sApertura, AXml);
    if iIni > 0 then
      iIni := iIni + Length(sApertura) + 1;
  end;
  if iIni > 0 then
  begin
    iFin := PosEx('<', AXml, iIni);
    if iFin > iIni then
      Result := Trim(Copy(AXml, iIni, iFin - iIni));
  end;
end;

function ComponerNumSerieFacturaAeat(const ASerie: string;
                                     ANumero: Integer): string;
begin
  // Mismo valor que figura en la factura impresa y en el QR
  Result := Trim(ASerie) + '/' + IntToStr(ANumero);
end;

function ClaveOperacion(const ASerie: string; ANumero: Integer;
                        AOperacion: TOperacionAeat): string;
begin
  Result := ComponerNumSerieFacturaAeat(ASerie, ANumero) + '#' +
            IntToStr(Ord(AOperacion));
end;

// ===========================================================================
//   Selección de certificado
// ===========================================================================

function NormalizarSerieCert(const AValor: string): string;
begin
  Result := UpperCase(Trim(AValor));
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
  Result := StringReplace(Result, ':', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
end;

// El nº de serie se guardó byte a byte desde el blob de crypt32
// (inLibCertificates); según la capa que lo lea puede venir con los bytes
// en orden inverso, así que se compara en ambos sentidos
function InvertirBytesHex(const AHex: string): string;
var
  iPos: Integer;
begin
  Result := '';
  iPos := Length(AHex) - 1;
  while iPos >= 1 do
  begin
    Result := Result + Copy(AHex, iPos, 2);
    Dec(iPos, 2);
  end;
end;

constructor TSelectorCertificado.Create(const ASerial, ATitular: string);
begin
  inherited Create;
  FSerial  := ASerial;
  FTitular := ATitular;
end;

procedure TSelectorCertificado.Seleccionar(const Sender: TObject;
                                           const ARequest: TURLRequest;
                                           const ACertificateList:
                                                 TCertificateList;
                                           var AnIndex: Integer);
var
  i:        Integer;
  sBuscada: string;
  sSerie:   string;
begin
  AnIndex := -1;
  sBuscada := NormalizarSerieCert(FSerial);
  if sBuscada <> '' then
  begin
    for i := 0 to ACertificateList.Count - 1 do
    begin
      sSerie := NormalizarSerieCert(ACertificateList[i].SerialNum);
      if (sSerie = sBuscada) or (sSerie = InvertirBytesHex(sBuscada)) then
      begin
        AnIndex := i;
        Break;
      end;
    end;
  end;
  if (AnIndex < 0) and (Trim(FTitular) <> '') then
  begin
    for i := 0 to ACertificateList.Count - 1 do
    begin
      if ContainsText(ACertificateList[i].Subject, Trim(FTitular)) then
      begin
        AnIndex := i;
        Break;
      end;
    end;
  end;
  // Último recurso: si solo se ofrece un certificado se usa ese
  if (AnIndex < 0) and (ACertificateList.Count = 1) then
    AnIndex := 0;
end;

// ===========================================================================
//   Configuración (suboc_param)
// ===========================================================================

function LeerParametros(AConn: TUniConnection): TStringList;
var
  Qry: TUniQuery;
begin
  Result := TStringList.Create;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text := 'SELECT NOMBRE_PARAM, VALUE_PARAM FROM suboc_param';
    Qry.Open;
    while not Qry.Eof do
    begin
      Result.Values[UpperCase(Trim(
        Qry.FieldByName('NOMBRE_PARAM').AsString))] :=
        Trim(Qry.FieldByName('VALUE_PARAM').AsString);
      Qry.Next;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function Param(AParams: TStringList; const ANombre,
               ADefecto: string): string;
begin
  Result := AParams.Values[ANombre];
  if Result = '' then
    Result := ADefecto;
end;

function CargarConfigAeat(AConn: TUniConnection): TConfigAeat;
var
  oParams: TStringList;
begin
  oParams := LeerParametros(AConn);
  try
    Result.Entorno := UpperCase(Param(oParams, 'VERIFACTU_ENTORNO', 'PRE'));
    if Result.Entorno = 'PRO' then
    begin
      Result.UrlEnvio := Param(oParams, 'VERIFACTU_URL_ENVIO_PRO',
                               cUrlEnvioPro);
      Result.UrlQR := Param(oParams, 'VERIFACTU_URL_QR_PRO', cUrlQRPro);
    end
    else
    begin
      Result.Entorno := 'PRE';
      Result.UrlEnvio := Param(oParams, 'VERIFACTU_URL_ENVIO_PRE',
                               cUrlEnvioPre);
      Result.UrlQR := Param(oParams, 'VERIFACTU_URL_QR_PRE', cUrlQRPre);
    end;
    Result.NifEmisor := NormalizarNif(Param(oParams,
      'VERIFACTU_NIF_EMISOR', Param(oParams, 'OFFLINE_NIF', '')));
    Result.NombreEmisor := Param(oParams, 'VERIFACTU_NOMBRE_EMISOR', '');
    Result.SifNombreRazon := Param(oParams, 'VERIFACTU_SIF_NOMBRE_RAZON', '');
    Result.SifNif := NormalizarNif(Param(oParams, 'VERIFACTU_SIF_NIF', ''));
    Result.SifNombre := Param(oParams, 'VERIFACTU_SIF_NOMBRE', 'Subocasana');
    Result.SifId := Param(oParams, 'VERIFACTU_SIF_ID', 'SB');
    Result.SifVersion := Param(oParams, 'VERIFACTU_SIF_VERSION', '1.0');
    Result.SifInstalacion := Param(oParams,
      'VERIFACTU_SIF_NUMERO_INSTALACION', '1');
    Result.CertSerie := Param(oParams, 'CERTIFICADO_SERIE_VERIFACTU', '');
    Result.CertTitular := Param(oParams, 'CERTIFICADO_TITULAR_VERIFACTU', '');
    // Los servicios odontológicos están exentos (art. 20.Uno.3 LIVA)
    Result.OperacionExenta := UpperCase(Param(oParams,
      'VERIFACTU_OPERACION_EXENTA', 'E1'));
    Result.DescripcionOpe := Param(oParams,
      'VERIFACTU_DESCRIPCION_OPERACION', '');
  finally
    FreeAndNil(oParams);
  end;
end;

procedure ValidarConfigAeat(const AConfig: TConfigAeat);
begin
  // La AEAT responde un 1100 genérico si un NIF va vacío o mal formado:
  // se valida aquí con un mensaje claro
  if Length(AConfig.NifEmisor) <> 9 then
    raise Exception.CreateFmt('El NIF del emisor (parámetro ' +
      'VERIFACTU_NIF_EMISOR) no es válido: "%s".', [AConfig.NifEmisor]);
  if AConfig.NombreEmisor = '' then
    raise Exception.Create('Falta el nombre o razón social del emisor ' +
      '(parámetro VERIFACTU_NOMBRE_EMISOR).');
  if AConfig.SifNombreRazon = '' then
    raise Exception.Create('Falta el nombre del productor del software ' +
      '(parámetro VERIFACTU_SIF_NOMBRE_RAZON).');
  if Length(AConfig.SifNif) <> 9 then
    raise Exception.CreateFmt('El NIF del productor del software ' +
      '(parámetro VERIFACTU_SIF_NIF) no es válido: "%s".', [AConfig.SifNif]);
  if (AConfig.CertSerie = '') and (AConfig.CertTitular = '') then
    raise Exception.Create('No hay certificado digital seleccionado. ' +
      'Selecciónelo en Parámetros > Seleccionar certificado.');
end;

// ===========================================================================
//   Cadena de huellas (suboc_verifactu_cadena)
// ===========================================================================

procedure AsegurarTablaCadena(AConn: TUniConnection);
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    // Un DDL confirma implícitamente la transacción en curso: solo se lanza
    // si la tabla no existe (script_verifactu_aeat.sql ya la crea)
    Qry.SQL.Text :=
      ' SELECT COUNT(*) FROM information_schema.TABLES ' +
      ' WHERE TABLE_SCHEMA = DATABASE() ' +
      '   AND TABLE_NAME = ''suboc_verifactu_cadena''';
    Qry.Open;
    if Qry.Fields[0].AsInteger > 0 then
      Exit;
    Qry.Close;
    Qry.SQL.Text :=
      'CREATE TABLE IF NOT EXISTS suboc_verifactu_cadena ( ' +
      '  NIF_VFCAD varchar(20) NOT NULL, ' +
      '  CONTADOR_VFCAD bigint(20) NOT NULL DEFAULT 0, ' +
      '  NUMSERIE_FAC_VFCAD varchar(60) DEFAULT NULL, ' +
      '  FECHA_FAC_VFCAD date DEFAULT NULL, ' +
      '  HUELLA_VFCAD char(64) DEFAULT NULL, ' +
      '  PROXIMO_ENVIO_VFCAD datetime DEFAULT NULL, ' +
      '  VUELO_CLAVE_VFCAD varchar(80) DEFAULT NULL, ' +
      '  VUELO_FHGEN_VFCAD varchar(30) DEFAULT NULL, ' +
      '  VUELO_HUELLA_VFCAD char(64) DEFAULT NULL, ' +
      '  INSTANTE_MODIF_VFCAD datetime DEFAULT NULL, ' +
      '  PRIMARY KEY (NIF_VFCAD) ' +
      ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ' +
      '  COLLATE=utf8mb4_spanish_ci ' +
      '  COMMENT=''Cadena de huellas VERI*FACTU por emisor''';
    Qry.Execute;
  finally
    FreeAndNil(Qry);
  end;
end;

// Bloquea (FOR UPDATE) la fila de la cadena del emisor hasta el
// commit/rollback: serializa el encadenamiento entre puestos
procedure ObtenerCadena(AConn: TUniConnection; const ANif: string;
                        out ACadena: TCadenaAnterior);
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' INSERT IGNORE INTO suboc_verifactu_cadena ' +
      ' (NIF_VFCAD, CONTADOR_VFCAD, INSTANTE_MODIF_VFCAD) ' +
      ' VALUES (:NIF, 0, NOW())';
    Qry.ParamByName('NIF').AsString := ANif;
    Qry.Execute;
    Qry.SQL.Text :=
      ' SELECT CONTADOR_VFCAD, NUMSERIE_FAC_VFCAD, ' +
      '        DATE_FORMAT(FECHA_FAC_VFCAD, ''%d-%m-%Y'') AS FECHA_TXT, ' +
      '        HUELLA_VFCAD, VUELO_CLAVE_VFCAD, VUELO_FHGEN_VFCAD, ' +
      '        VUELO_HUELLA_VFCAD ' +
      ' FROM suboc_verifactu_cadena ' +
      ' WHERE NIF_VFCAD = :NIF ' +
      ' FOR UPDATE';
    Qry.ParamByName('NIF').AsString := ANif;
    Qry.Open;
    ACadena.Contador := Qry.FieldByName('CONTADOR_VFCAD').AsLargeInt;
    ACadena.NumSerie := Qry.FieldByName('NUMSERIE_FAC_VFCAD').AsString;
    ACadena.Fecha    := Qry.FieldByName('FECHA_TXT').AsString;
    ACadena.Huella   := Trim(Qry.FieldByName('HUELLA_VFCAD').AsString);
    // El intento en vuelo solo vale si la cadena no ha avanzado desde él
    if SameText(Trim(Qry.FieldByName('VUELO_HUELLA_VFCAD').AsString),
                ACadena.Huella) then
    begin
      ACadena.VueloClave := Qry.FieldByName('VUELO_CLAVE_VFCAD').AsString;
      ACadena.VueloFhGen := Qry.FieldByName('VUELO_FHGEN_VFCAD').AsString;
    end
    else
    begin
      ACadena.VueloClave := '';
      ACadena.VueloFhGen := '';
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure AvanzarCadena(AConn: TUniConnection; const ANif: string;
                        const ADatos: TDatosFacturaAeat;
                        const AHuella: string; AEsperaSegundos: Integer);
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' UPDATE suboc_verifactu_cadena ' +
      ' SET CONTADOR_VFCAD = CONTADOR_VFCAD + 1, ' +
      '     NUMSERIE_FAC_VFCAD = :NUMSERIE, ' +
      '     FECHA_FAC_VFCAD = :FECHA, ' +
      '     HUELLA_VFCAD = :HUELLA, ' +
      '     PROXIMO_ENVIO_VFCAD = DATE_ADD(NOW(), INTERVAL :ESPERA SECOND), ' +
      '     VUELO_CLAVE_VFCAD = NULL, ' +
      '     VUELO_FHGEN_VFCAD = NULL, ' +
      '     VUELO_HUELLA_VFCAD = NULL, ' +
      '     INSTANTE_MODIF_VFCAD = NOW() ' +
      ' WHERE NIF_VFCAD = :NIF';
    Qry.ParamByName('NUMSERIE').AsString := ADatos.NumSerieFactura;
    Qry.ParamByName('FECHA').AsDate := ADatos.FechaFac;
    Qry.ParamByName('HUELLA').AsString := AHuella;
    Qry.ParamByName('ESPERA').AsInteger := AEsperaSegundos;
    Qry.ParamByName('NIF').AsString := ANif;
    Qry.Execute;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure ActualizarProximoEnvio(AConn: TUniConnection; const ANif: string;
                                 AEsperaSegundos: Integer);
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' UPDATE suboc_verifactu_cadena ' +
      ' SET PROXIMO_ENVIO_VFCAD = DATE_ADD(NOW(), INTERVAL :ESPERA SECOND) ' +
      ' WHERE NIF_VFCAD = :NIF';
    Qry.ParamByName('ESPERA').AsInteger := AEsperaSegundos;
    Qry.ParamByName('NIF').AsString := ANif;
    Qry.Execute;
  finally
    FreeAndNil(Qry);
  end;
end;

// Se ejecuta tras el rollback de un envío incierto: guarda el instante de
// generación para que el reintento reproduzca exactamente la misma huella
procedure GuardarEnvioEnVuelo(AConn: TUniConnection; const ANif, AClave,
                              AFhGen, AHuellaAnterior: string);
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' UPDATE suboc_verifactu_cadena ' +
      ' SET VUELO_CLAVE_VFCAD = :CLAVE, ' +
      '     VUELO_FHGEN_VFCAD = :FHGEN, ' +
      '     VUELO_HUELLA_VFCAD = :HUELLA ' +
      ' WHERE NIF_VFCAD = :NIF';
    Qry.ParamByName('CLAVE').AsString := AClave;
    Qry.ParamByName('FHGEN').AsString := AFhGen;
    Qry.ParamByName('HUELLA').AsString := AHuellaAnterior;
    Qry.ParamByName('NIF').AsString := ANif;
    Qry.Execute;
  finally
    FreeAndNil(Qry);
  end;
end;

function SegundosEsperaEnvioAeat(AConn: TUniConnection): Integer;
var
  oConfig: TConfigAeat;
  Qry:     TUniQuery;
begin
  Result := 0;
  oConfig := CargarConfigAeat(AConn);
  AsegurarTablaCadena(AConn);
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' SELECT TIMESTAMPDIFF(SECOND, NOW(), PROXIMO_ENVIO_VFCAD) AS ESPERA ' +
      ' FROM suboc_verifactu_cadena ' +
      ' WHERE NIF_VFCAD = :NIF';
    Qry.ParamByName('NIF').AsString := oConfig.NifEmisor;
    Qry.Open;
    if (not Qry.IsEmpty) and (not Qry.FieldByName('ESPERA').IsNull) and
       (Qry.FieldByName('ESPERA').AsInteger > 0) then
      Result := Qry.FieldByName('ESPERA').AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure EsperarTurnoEnvioAeat(AConn: TUniConnection;
                                const AProgreso: TProc<Integer> = nil);
var
  iEspera: Integer;
  iFin:    UInt64;
begin
  iEspera := SegundosEsperaEnvioAeat(AConn);
  if iEspera > 0 then
  begin
    iFin := GetTickCount64 + UInt64(iEspera) * 1000;
    while GetTickCount64 < iFin do
    begin
      if Assigned(AProgreso) then
        AProgreso(Integer((iFin - GetTickCount64) div 1000) + 1);
      Sleep(200);
    end;
  end;
end;

// ===========================================================================
//   Carga de la factura
// ===========================================================================

function TipoIdDestinatario(const ATipoId: string; AEsUE: Boolean): string;
var
  sTipo: string;
begin
  sTipo := UpperCase(Trim(ATipoId));
  if MatchText(sTipo, ['02', '03', '04', '05', '06', '07']) then
    Result := sTipo
  else if sTipo = 'ID' then
    Result := '04'
  else if Pos('PASAPORTE', sTipo) > 0 then
    Result := '03'
  else if AEsUE then
    Result := '02'
  else
    Result := '06';
end;

function CargarDatosFactura(AConn: TUniConnection;
                            const ASerie: string;
                            ANumero: Integer;
                            const AConfig: TConfigAeat;
                            const ATipoFactura: string;
                            out ADatos: TDatosFacturaAeat): Boolean;
var
  Qry:         TUniQuery;
  oCampo:      TField;
  bEsSimpl:    Boolean;
begin
  ADatos := Default(TDatosFacturaAeat);
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' SELECT f.*, p.ESMIEMBRO_UE_PAIS, ' +
      '        (SELECT l.DESCRIPCION_ARTICULO_LINEA ' +
      '           FROM suboc_facturas_lineas l ' +
      '          WHERE l.SERIE_FACTURA_LINEA = f.SERIE_FACTURA ' +
      '            AND l.NRO_FACTURA_LINEA = f.NRO_FACTURA ' +
      '          ORDER BY CAST(l.LINEA_LINEA AS UNSIGNED) LIMIT 1) ' +
      '          AS DESCRIPCION_PRIMERA_LINEA ' +
      ' FROM suboc_facturas f ' +
      ' LEFT JOIN suboc_paises p ' +
      '        ON p.COD_PAIS_ALPHA2 = f.PAIS_CLIENTE_FACTURA ' +
      ' WHERE f.SERIE_FACTURA = :SERIE AND f.NRO_FACTURA = :NUMERO';
    Qry.ParamByName('SERIE').AsString := ASerie;
    Qry.ParamByName('NUMERO').AsInteger := ANumero;
    Qry.Open;
    Result := not Qry.IsEmpty;
    if Result then
    begin
      ADatos.Serie := ASerie;
      ADatos.Numero := ANumero;
      ADatos.NumSerieFactura := ComponerNumSerieFacturaAeat(ASerie, ANumero);
      ADatos.FechaFac := Qry.FieldByName('FECHA_FACTURA').AsDateTime;
      ADatos.FechaExpedicion := FormatDateTime('dd-mm-yyyy', ADatos.FechaFac);
      ADatos.ImporteTotal := Qry.FieldByName(
        'TOTAL_LIQUIDO_FACTURA').AsCurrency;
      ADatos.NifCliente := NormalizarNif(
        Qry.FieldByName('NIF_CLIENTE_FACTURA').AsString);
      ADatos.NombreCliente := Trim(
        Qry.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString);
      if ADatos.NombreCliente = '' then
        ADatos.NombreCliente := Trim(Qry.FieldByName('NOMBRE').AsString +
          ' ' + Qry.FieldByName('APELLIDOS').AsString);
      ADatos.PaisClienteISO2 := UpperCase(Trim(
        Qry.FieldByName('PAIS_CLIENTE_FACTURA').AsString));
      if ADatos.PaisClienteISO2 = '' then
        ADatos.PaisClienteISO2 := 'ES';
      ADatos.EsClienteExtr := ADatos.PaisClienteISO2 <> 'ES';
      ADatos.EsClienteUE := ADatos.EsClienteExtr and
        (Qry.FieldByName('ESMIEMBRO_UE_PAIS').AsString = 'S');
      ADatos.TipoIdCliente := TipoIdDestinatario(
        Qry.FieldByName('TIPOID_INT_CLIENTE_FACTURA').AsString,
        ADatos.EsClienteUE);
      ADatos.Descripcion := AConfig.DescripcionOpe;
      if ADatos.Descripcion = '' then
        ADatos.Descripcion := Trim(
          Qry.FieldByName('DESCRIPCION_PRIMERA_LINEA').AsString);
      if ADatos.Descripcion = '' then
        ADatos.Descripcion := 'Servicios odontológicos';
      ADatos.Descripcion := Copy(ADatos.Descripcion, 1, 500);
      // Factura rectificada: columnas añadidas por el script de migración
      oCampo := Qry.FindField('SERIE_RECTIFICADA_FACTURA');
      if oCampo <> nil then
      begin
        ADatos.RectSerie := Trim(oCampo.AsString);
        ADatos.RectNumero := Qry.FieldByName(
          'NRO_RECTIFICADA_FACTURA').AsInteger;
        if not Qry.FieldByName('FECHA_RECTIFICADA_FACTURA').IsNull then
          ADatos.RectFecha := FormatDateTime('dd-mm-yyyy',
            Qry.FieldByName('FECHA_RECTIFICADA_FACTURA').AsDateTime);
      end;
      bEsSimpl := Qry.FieldByName('ESSIMPL_FACTURA').AsString = 'S';
      if ATipoFactura <> '' then
        ADatos.TipoFactura := UpperCase(ATipoFactura)
      else if (ADatos.RectSerie <> '') and (ADatos.RectNumero > 0) then
      begin
        if bEsSimpl then
          ADatos.TipoFactura := 'R5'
        else
          ADatos.TipoFactura := 'R1';
      end
      else if bEsSimpl then
        ADatos.TipoFactura := 'F2'
      else
        ADatos.TipoFactura := 'F1';
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

// ===========================================================================
//   Composición del XML del registro
// ===========================================================================

function EsRectificativa(const ADatos: TDatosFacturaAeat): Boolean;
begin
  Result := Copy(ADatos.TipoFactura, 1, 1) = 'R';
end;

function ConstruirEncadenamiento(const ANif: string;
                                 const ACadena: TCadenaAnterior): string;
begin
  if ACadena.Huella = '' then
    Result := '<sum1:Encadenamiento>' +
              '<sum1:PrimerRegistro>S</sum1:PrimerRegistro>' +
              '</sum1:Encadenamiento>'
  else
    Result := '<sum1:Encadenamiento><sum1:RegistroAnterior>' +
      '<sum1:IDEmisorFactura>' + EscaparXml(ANif) +
      '</sum1:IDEmisorFactura>' +
      '<sum1:NumSerieFactura>' + EscaparXml(ACadena.NumSerie) +
      '</sum1:NumSerieFactura>' +
      '<sum1:FechaExpedicionFactura>' + ACadena.Fecha +
      '</sum1:FechaExpedicionFactura>' +
      '<sum1:Huella>' + ACadena.Huella + '</sum1:Huella>' +
      '</sum1:RegistroAnterior></sum1:Encadenamiento>';
end;

function ConstruirSistemaInformatico(const AConfig: TConfigAeat): string;
begin
  Result :=
    '<sum1:SistemaInformatico>' +
    '<sum1:NombreRazon>' + EscaparXml(AConfig.SifNombreRazon) +
    '</sum1:NombreRazon>' +
    '<sum1:NIF>' + EscaparXml(AConfig.SifNif) + '</sum1:NIF>' +
    '<sum1:NombreSistemaInformatico>' + EscaparXml(AConfig.SifNombre) +
    '</sum1:NombreSistemaInformatico>' +
    '<sum1:IdSistemaInformatico>' + EscaparXml(AConfig.SifId) +
    '</sum1:IdSistemaInformatico>' +
    '<sum1:Version>' + EscaparXml(AConfig.SifVersion) + '</sum1:Version>' +
    '<sum1:NumeroInstalacion>' + EscaparXml(AConfig.SifInstalacion) +
    '</sum1:NumeroInstalacion>' +
    '<sum1:TipoUsoPosibleSoloVerifactu>S' +
    '</sum1:TipoUsoPosibleSoloVerifactu>' +
    '<sum1:TipoUsoPosibleMultiOT>N</sum1:TipoUsoPosibleMultiOT>' +
    '<sum1:IndicadorMultiplesOT>N</sum1:IndicadorMultiplesOT>' +
    '</sum1:SistemaInformatico>';
end;

function ConstruirDestinatarios(const ADatos: TDatosFacturaAeat): string;
begin
  Result := '';
  // Destinatarios es obligatorio en F1, F3 y en las rectificativas de
  // factura completa (R1..R4); F2 y R5 (simplificadas) no lo llevan
  if MatchText(ADatos.TipoFactura, ['F1', 'F3', 'R1', 'R2', 'R3', 'R4']) then
  begin
    if ADatos.EsClienteExtr then
    begin
      if ADatos.NifCliente = '' then
        raise Exception.CreateFmt('La factura %s %s es de un cliente ' +
          'extranjero sin documento de identificación.',
          [ADatos.TipoFactura, ADatos.NumSerieFactura]);
      Result := '<sum1:Destinatarios><sum1:IDDestinatario>' +
        '<sum1:NombreRazon>' + EscaparXml(ADatos.NombreCliente) +
        '</sum1:NombreRazon><sum1:IDOtro>' +
        '<sum1:CodigoPais>' + EscaparXml(ADatos.PaisClienteISO2) +
        '</sum1:CodigoPais><sum1:IDType>' + ADatos.TipoIdCliente +
        '</sum1:IDType>' +
        '<sum1:ID>' + EscaparXml(ADatos.NifCliente) + '</sum1:ID>' +
        '</sum1:IDOtro></sum1:IDDestinatario></sum1:Destinatarios>';
    end
    else
    begin
      if Length(ADatos.NifCliente) <> 9 then
        raise Exception.CreateFmt('La factura %s %s no tiene un NIF de ' +
          'cliente válido ("%s"). Si el paciente no tiene NIF, márquela ' +
          'como simplificada.',
          [ADatos.TipoFactura, ADatos.NumSerieFactura, ADatos.NifCliente]);
      Result := '<sum1:Destinatarios><sum1:IDDestinatario>' +
        '<sum1:NombreRazon>' + EscaparXml(ADatos.NombreCliente) +
        '</sum1:NombreRazon><sum1:NIF>' + EscaparXml(ADatos.NifCliente) +
        '</sum1:NIF></sum1:IDDestinatario></sum1:Destinatarios>';
    end;
  end;
end;

function ConstruirRectificacion(const ANif: string;
                                const ADatos: TDatosFacturaAeat): string;
begin
  Result := '';
  if EsRectificativa(ADatos) then
  begin
    if (ADatos.RectSerie = '') or (ADatos.RectNumero <= 0) then
      raise Exception.CreateFmt('La rectificativa %s no indica la factura ' +
        'que rectifica.', [ADatos.NumSerieFactura]);
    // Los abonos copian la factura en negativo: rectificación por
    // diferencias (I), sin ImporteRectificacion
    Result := '<sum1:TipoRectificativa>I</sum1:TipoRectificativa>' +
      '<sum1:FacturasRectificadas><sum1:IDFacturaRectificada>' +
      '<sum1:IDEmisorFactura>' + EscaparXml(ANif) +
      '</sum1:IDEmisorFactura>' +
      '<sum1:NumSerieFactura>' + EscaparXml(ComponerNumSerieFacturaAeat(
        ADatos.RectSerie, ADatos.RectNumero)) + '</sum1:NumSerieFactura>' +
      '<sum1:FechaExpedicionFactura>' + ADatos.RectFecha +
      '</sum1:FechaExpedicionFactura>' +
      '</sum1:IDFacturaRectificada></sum1:FacturasRectificadas>';
  end;
end;

function ConstruirDesglose(const AConfig: TConfigAeat;
                           const ADatos: TDatosFacturaAeat): string;
var
  sCalificacion: string;
begin
  // Sin IVA repercutido: operación exenta (E1..E6) o no sujeta (N1/N2)
  if Copy(AConfig.OperacionExenta, 1, 1) = 'N' then
    sCalificacion := '<sum1:CalificacionOperacion>' +
      AConfig.OperacionExenta + '</sum1:CalificacionOperacion>'
  else
    sCalificacion := '<sum1:OperacionExenta>' + AConfig.OperacionExenta +
      '</sum1:OperacionExenta>';
  Result := '<sum1:DetalleDesglose>' +
    '<sum1:Impuesto>01</sum1:Impuesto>' +
    '<sum1:ClaveRegimen>01</sum1:ClaveRegimen>' +
    sCalificacion +
    '<sum1:BaseImponibleOimporteNoSujeto>' +
    FormatearImporte(ADatos.ImporteTotal) +
    '</sum1:BaseImponibleOimporteNoSujeto>' +
    '</sum1:DetalleDesglose>';
end;

function ConstruirRegistroAlta(const AConfig: TConfigAeat;
                               const ADatos: TDatosFacturaAeat;
                               const ACadena: TCadenaAnterior;
                               const AFhGen: string;
                               ASubsanacion: Boolean;
                               out AHuella: string): string;
var
  sCuota:   string;
  sImporte: string;
  sFechaOp: string;
begin
  sCuota := FormatearImporte(0);
  sImporte := FormatearImporte(ADatos.ImporteTotal);
  AHuella := UpperCase(THashSHA2.GetHashString(
    'IDEmisorFactura=' + AConfig.NifEmisor +
    '&NumSerieFactura=' + ADatos.NumSerieFactura +
    '&FechaExpedicionFactura=' + ADatos.FechaExpedicion +
    '&TipoFactura=' + ADatos.TipoFactura +
    '&CuotaTotal=' + sCuota +
    '&ImporteTotal=' + sImporte +
    '&Huella=' + ACadena.Huella +
    '&FechaHoraHusoGenRegistro=' + AFhGen));
  sFechaOp := '';
  if EsRectificativa(ADatos) and (ADatos.RectFecha <> '') then
    sFechaOp := '<sum1:FechaOperacion>' + ADatos.RectFecha +
      '</sum1:FechaOperacion>';
  Result := '<sum1:RegistroAlta><sum1:IDVersion>1.0</sum1:IDVersion>' +
    '<sum1:IDFactura><sum1:IDEmisorFactura>' +
    EscaparXml(AConfig.NifEmisor) + '</sum1:IDEmisorFactura>' +
    '<sum1:NumSerieFactura>' + EscaparXml(ADatos.NumSerieFactura) +
    '</sum1:NumSerieFactura><sum1:FechaExpedicionFactura>' +
    ADatos.FechaExpedicion + '</sum1:FechaExpedicionFactura>' +
    '</sum1:IDFactura><sum1:NombreRazonEmisor>' +
    EscaparXml(AConfig.NombreEmisor) + '</sum1:NombreRazonEmisor>' +
    IfThen(ASubsanacion, '<sum1:Subsanacion>S</sum1:Subsanacion>', '') +
    '<sum1:TipoFactura>' + ADatos.TipoFactura + '</sum1:TipoFactura>' +
    ConstruirRectificacion(AConfig.NifEmisor, ADatos) +
    sFechaOp +
    '<sum1:DescripcionOperacion>' + EscaparXml(ADatos.Descripcion) +
    '</sum1:DescripcionOperacion>' +
    ConstruirDestinatarios(ADatos) +
    '<sum1:Desglose>' + ConstruirDesglose(AConfig, ADatos) +
    '</sum1:Desglose>' +
    '<sum1:CuotaTotal>' + sCuota + '</sum1:CuotaTotal>' +
    '<sum1:ImporteTotal>' + sImporte + '</sum1:ImporteTotal>' +
    ConstruirEncadenamiento(AConfig.NifEmisor, ACadena) +
    ConstruirSistemaInformatico(AConfig) +
    '<sum1:FechaHoraHusoGenRegistro>' + AFhGen +
    '</sum1:FechaHoraHusoGenRegistro>' +
    '<sum1:TipoHuella>01</sum1:TipoHuella><sum1:Huella>' + AHuella +
    '</sum1:Huella></sum1:RegistroAlta>';
end;

function ConstruirRegistroAnulacion(const AConfig: TConfigAeat;
                                    const ADatos: TDatosFacturaAeat;
                                    const ACadena: TCadenaAnterior;
                                    const AFhGen: string;
                                    out AHuella: string): string;
begin
  // Huella del registro de anulación según especificación AEAT
  AHuella := UpperCase(THashSHA2.GetHashString(
    'IDEmisorFacturaAnulada=' + AConfig.NifEmisor +
    '&NumSerieFacturaAnulada=' + ADatos.NumSerieFactura +
    '&FechaExpedicionFacturaAnulada=' + ADatos.FechaExpedicion +
    '&Huella=' + ACadena.Huella +
    '&FechaHoraHusoGenRegistro=' + AFhGen));
  Result :=
    '<sum1:RegistroAnulacion>' +
    '<sum1:IDVersion>1.0</sum1:IDVersion>' +
    '<sum1:IDFactura>' +
    '<sum1:IDEmisorFacturaAnulada>' + EscaparXml(AConfig.NifEmisor) +
    '</sum1:IDEmisorFacturaAnulada>' +
    '<sum1:NumSerieFacturaAnulada>' + EscaparXml(ADatos.NumSerieFactura) +
    '</sum1:NumSerieFacturaAnulada>' +
    '<sum1:FechaExpedicionFacturaAnulada>' + ADatos.FechaExpedicion +
    '</sum1:FechaExpedicionFacturaAnulada>' +
    '</sum1:IDFactura>' +
    ConstruirEncadenamiento(AConfig.NifEmisor, ACadena) +
    ConstruirSistemaInformatico(AConfig) +
    '<sum1:FechaHoraHusoGenRegistro>' + AFhGen +
    '</sum1:FechaHoraHusoGenRegistro>' +
    '<sum1:TipoHuella>01</sum1:TipoHuella>' +
    '<sum1:Huella>' + AHuella + '</sum1:Huella>' +
    '</sum1:RegistroAnulacion>';
end;

function EnvolverSoap(const AConfig: TConfigAeat;
                      const ARegistro: string): string;
begin
  Result :=
    '<?xml version="1.0" encoding="UTF-8"?>' +
    '<soapenv:Envelope xmlns:soapenv="' + cNsSoap + '" ' +
    'xmlns:sum="' + cNsLR + '" xmlns:sum1="' + cNsInf + '">' +
    '<soapenv:Header/><soapenv:Body>' +
    '<sum:RegFactuSistemaFacturacion>' +
    '<sum:Cabecera><sum1:ObligadoEmision>' +
    '<sum1:NombreRazon>' + EscaparXml(AConfig.NombreEmisor) +
    '</sum1:NombreRazon>' +
    '<sum1:NIF>' + EscaparXml(AConfig.NifEmisor) + '</sum1:NIF>' +
    '</sum1:ObligadoEmision></sum:Cabecera>' +
    '<sum:RegistroFactura>' + ARegistro + '</sum:RegistroFactura>' +
    '</sum:RegFactuSistemaFacturacion>' +
    '</soapenv:Body></soapenv:Envelope>';
end;

// ===========================================================================
//   Transporte HTTP con certificado de cliente
// ===========================================================================

procedure EnviarHttp(const AUrl, APeticion, ASerialCert,
                     ATitularCert: string;
                     out AStatus: Integer; out ARespuesta: string);
var
  oHttp:     THTTPClient;
  oSelector: TSelectorCertificado;
  oCuerpo:   TStringStream;
  oResp:     IHTTPResponse;
  aCabeceras: TNetHeaders;
begin
  aCabeceras := [
    TNetHeader.Create('Content-Type', 'text/xml; charset=utf-8'),
    TNetHeader.Create('SOAPAction', '""')];
  oHttp     := THTTPClient.Create;
  oSelector := TSelectorCertificado.Create(ASerialCert, ATitularCert);
  oCuerpo   := TStringStream.Create(APeticion, TEncoding.UTF8);
  try
    oHttp.ConnectionTimeout := 30000;
    oHttp.ResponseTimeout   := 90000;
    // Un proxy o portal que redirige no es la AEAT
    oHttp.HandleRedirects   := False;
    oHttp.OnNeedClientCertificate := oSelector.Seleccionar;
    oResp := oHttp.Post(AUrl, oCuerpo, nil, aCabeceras);
    AStatus    := oResp.StatusCode;
    ARespuesta := oResp.ContentAsString(TEncoding.UTF8);
  finally
    FreeAndNil(oCuerpo);
    FreeAndNil(oSelector);
    FreeAndNil(oHttp);
  end;
end;

// True si la respuesta procede del servicio SOAP de la AEAT y resuelve el
// envío: HTTP 200 con EstadoEnvio o HTTP 500 con SOAP Fault
function EsRespuestaAeatDefinitiva(AEstadoHttp: Integer;
                                   const AXml: string): Boolean;
begin
  if AEstadoHttp = 200 then
    Result := ExtraerEtiqueta(AXml, 'EstadoEnvio') <> ''
  else
    Result := (AEstadoHttp = 500) and
              (ExtraerEtiqueta(AXml, 'faultstring') <> '');
end;

procedure InterpretarRespuesta(var AResultado: TResultadoEnvioAeat);
var
  sXml: string;
begin
  sXml := AResultado.Respuesta;
  if AResultado.EstadoHttp <> 200 then
  begin
    AResultado.DescripcionError := ExtraerEtiqueta(sXml, 'faultstring');
    AResultado.MensajeError := Format('La AEAT rechazó la petición ' +
      '(HTTP %d): %s', [AResultado.EstadoHttp, AResultado.DescripcionError]);
    Exit;
  end;
  AResultado.EstadoEnvio := ExtraerEtiqueta(sXml, 'EstadoEnvio');
  AResultado.EstadoRegistro := ExtraerEtiqueta(sXml, 'EstadoRegistro');
  AResultado.CodigoError := ExtraerEtiqueta(sXml, 'CodigoErrorRegistro');
  AResultado.DescripcionError := ExtraerEtiqueta(sXml,
    'DescripcionErrorRegistro');
  AResultado.EsperaSegundos := StrToIntDef(
    ExtraerEtiqueta(sXml, 'TiempoEsperaEnvio'), cEsperaEnvioDefecto);
  AResultado.Csv := ExtraerEtiqueta(sXml, 'CSV');
  if AResultado.EstadoRegistro = '' then
    AResultado.EstadoRegistro := AResultado.EstadoEnvio;
  // Duplicado: un intento anterior ya quedó registrado en la AEAT
  AResultado.Duplicado := (AResultado.CodigoError = '3000') or
    ContainsText(AResultado.DescripcionError, 'duplicado');
  AResultado.Ok :=
    SameText(AResultado.EstadoRegistro, 'Correcto') or
    SameText(AResultado.EstadoRegistro, 'AceptadoConErrores') or
    AResultado.Duplicado;
  if AResultado.Duplicado then
    AResultado.EstadoRegistro := 'Duplicado';
  if (not AResultado.Ok) or
     SameText(AResultado.EstadoRegistro, 'AceptadoConErrores') or
     AResultado.Duplicado then
  begin
    if (AResultado.CodigoError = '') and
       (AResultado.DescripcionError = '') then
      AResultado.MensajeError := 'Estado del envío AEAT: ' +
        AResultado.EstadoEnvio
    else
      AResultado.MensajeError := Trim(Format('AEAT [%s] %s',
        [AResultado.CodigoError, AResultado.DescripcionError]));
  end;
end;

// ===========================================================================
//   QR tributario
// ===========================================================================

function ConstruirUrlQR(const ABase, ANif: string;
                        const ADatos: TDatosFacturaAeat): string;
begin
  // Formato fijado por la AEAT (documento técnico del QR tributario):
  // nif, numserie, fecha dd-mm-aaaa e importe total con punto decimal
  Result := ABase +
    '?nif='      + CodificarParametroURL(ANif) +
    '&numserie=' + CodificarParametroURL(ADatos.NumSerieFactura) +
    '&fecha='    + CodificarParametroURL(ADatos.FechaExpedicion) +
    '&importe='  + CodificarParametroURL(
                     FormatearImporte(ADatos.ImporteTotal));
end;

function ConstruirUrlQRFacturaAeat(AConn: TUniConnection;
                                   const ASerie: string;
                                   ANumero: Integer): string;
var
  oConfig: TConfigAeat;
  oDatos:  TDatosFacturaAeat;
begin
  Result := '';
  oConfig := CargarConfigAeat(AConn);
  if CargarDatosFactura(AConn, ASerie, ANumero, oConfig, '', oDatos) then
    Result := ConstruirUrlQR(oConfig.UrlQR, oConfig.NifEmisor, oDatos);
end;

function GenerarQRPngVerifactu(const AUrl: string;
                               AEscala: Integer = 4): TBytes;
var
  oQR:     TDelphiZXIngQRCode;
  oPng:    TPngImage;
  oStream: TMemoryStream;
  iX:      Integer;
  iY:      Integer;
  pLinea:  PByteArray;
begin
  SetLength(Result, 0);
  if (Trim(AUrl) <> '') and (AEscala >= 1) then
  begin
    oQR     := TDelphiZXIngQRCode.Create;
    oPng    := nil;
    oStream := nil;
    try
      oQR.ErrorCorrectionLevel := qreM;
      oQR.Encoding             := qrUTF8NoBOM;
      oQR.QuietZone            := 4;
      oQR.Data                 := AUrl;
      // PNG RGB de 24 bits: el informe lo pinta con fiabilidad
      oPng := TPngImage.CreateBlank(COLOR_RGB, 8,
                                    oQR.Columns * AEscala,
                                    oQR.Rows * AEscala);
      for iY := 0 to oPng.Height - 1 do
      begin
        pLinea := oPng.Scanline[iY];
        for iX := 0 to oPng.Width - 1 do
        begin
          if oQR.IsBlack[iY div AEscala, iX div AEscala] then
          begin
            pLinea[iX * 3]     := 0;
            pLinea[iX * 3 + 1] := 0;
            pLinea[iX * 3 + 2] := 0;
          end
          else
          begin
            pLinea[iX * 3]     := 255;
            pLinea[iX * 3 + 1] := 255;
            pLinea[iX * 3 + 2] := 255;
          end;
        end;
      end;
      oStream := TMemoryStream.Create;
      oPng.SaveToStream(oStream);
      SetLength(Result, oStream.Size);
      if oStream.Size > 0 then
        Move(oStream.Memory^, Result[0], oStream.Size);
    finally
      FreeAndNil(oStream);
      FreeAndNil(oPng);
      FreeAndNil(oQR);
    end;
  end;
end;

procedure GenerarQrResultado(const AConfig: TConfigAeat;
                             const ADatos: TDatosFacturaAeat;
                             var AResultado: TResultadoEnvioAeat);
var
  oB64: TBase64Encoding;
begin
  AResultado.VerifactuUrl := ConstruirUrlQR(AConfig.UrlQR,
    AConfig.NifEmisor, ADatos);
  try
    AResultado.QRCodePng := GenerarQRPngVerifactu(AResultado.VerifactuUrl);
    if Length(AResultado.QRCodePng) > 0 then
    begin
      // Sin saltos de línea (TNetEncoding.Base64 corta cada 76 caracteres)
      oB64 := TBase64Encoding.Create(0);
      try
        AResultado.QRCodeBase64 := oB64.EncodeBytesToString(
          AResultado.QRCodePng);
      finally
        FreeAndNil(oB64);
      end;
    end;
  except
    on E: Exception do
      AResultado.MensajeError := Trim(AResultado.MensajeError +
        ' No se pudo generar el QR: ' + E.Message);
  end;
end;

// ===========================================================================
//   Persistencia del resultado
// ===========================================================================

// RESPUESTA_COMPLETA exige JSON válido: se guarda un resumen con el XML
function RespuestaJson(const AResultado: TResultadoEnvioAeat): string;
var
  oJson: TJSONObject;
begin
  oJson := TJSONObject.Create;
  try
    oJson.AddPair('sistema', 'AEAT');
    oJson.AddPair('estadoHttp', TJSONNumber.Create(AResultado.EstadoHttp));
    oJson.AddPair('estadoEnvio', AResultado.EstadoEnvio);
    oJson.AddPair('estadoRegistro', AResultado.EstadoRegistro);
    oJson.AddPair('csv', AResultado.Csv);
    oJson.AddPair('codigoError', AResultado.CodigoError);
    oJson.AddPair('descripcionError', AResultado.DescripcionError);
    oJson.AddPair('huella', AResultado.Huella);
    oJson.AddPair('fechaHoraGen', AResultado.FechaHoraGen);
    oJson.AddPair('respuestaXml', AResultado.Respuesta);
    Result := oJson.ToJSON;
  finally
    FreeAndNil(oJson);
  end;
end;

// ID de la consolidación (contador 'CS'). Hace lo mismo que GET_NEXT_CONT
// pero sin START TRANSACTION/COMMIT, que confirmarían la transacción del
// envío antes de tiempo.
function ReservarIdConsolidacion(AConn: TUniConnection; const ASerie: string;
                                 ANumero: Integer): Integer;
var
  Qry: TUniQuery;
begin
  Result := 0;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text := ' SELECT ID_CONSOLIDACION FROM suboc_consolidacion ' +
                    ' WHERE SERIE_FACTURA = :SERIE AND NRO_FACTURA = :NUMERO';
    Qry.ParamByName('SERIE').AsString := ASerie;
    Qry.ParamByName('NUMERO').AsInteger := ANumero;
    Qry.Open;
    if not Qry.IsEmpty then
      Exit;
    Qry.Close;
    Qry.SQL.Text :=
      ' SELECT CONTADOR_CONTADOR FROM suboc_contadores ' +
      ' WHERE SERIE_CONTADOR = ''-'' AND TIPODOC_CONTADOR = ''CS'' ' +
      ' FOR UPDATE';
    Qry.Open;
    if Qry.IsEmpty then
    begin
      Result := 1;
      Qry.Close;
      Qry.SQL.Text :=
        ' INSERT INTO suboc_contadores ' +
        ' (TIPODOC_CONTADOR, CONTADOR_CONTADOR, SERIE_CONTADOR, ' +
        '  EJERCICIO_CONTADOR) VALUES (''CS'', 2, ''-'', ''-'')';
      Qry.Execute;
    end
    else
    begin
      // CONTADOR_CONTADOR guarda el siguiente valor libre
      Result := Qry.Fields[0].AsInteger;
      Qry.Close;
      Qry.SQL.Text :=
        ' UPDATE suboc_contadores ' +
        ' SET CONTADOR_CONTADOR = CONTADOR_CONTADOR + 1 ' +
        ' WHERE SERIE_CONTADOR = ''-'' AND TIPODOC_CONTADOR = ''CS''';
      Qry.Execute;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure ActualizarFaseFactura(AConn: TUniConnection; const ASerie: string;
                                ANumero: Integer;
                                const AConsolidada, AFase: string);
var
  Qry: TUniQuery;
begin
  // UPDATE directo: SET_CONSOLIDACION_FASE abre su propia transacción y
  // confirmaría la del envío antes de tiempo
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      ' UPDATE suboc_facturas ' +
      ' SET CONSOLIDACION_FACTURA = :CONSO, ' +
      '     FASE_CONSOLIDACION_FACTURA = :FASE, ' +
      '     FECHA_ULT_CONSO_FACTURA = NOW() ' +
      ' WHERE SERIE_FACTURA = :SERIE AND NRO_FACTURA = :NUMERO';
    Qry.ParamByName('CONSO').AsString := AConsolidada;
    Qry.ParamByName('FASE').AsString := AFase;
    Qry.ParamByName('SERIE').AsString := ASerie;
    Qry.ParamByName('NUMERO').AsInteger := ANumero;
    Qry.Execute;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure GuardarConsolidacion(AConn: TUniConnection; const ASerie: string;
                               ANumero, AIdNuevo: Integer;
                               AOperacion: TOperacionAeat;
                               const AResultado: TResultadoEnvioAeat);
var
  Qry:     TUniQuery;
  oStream: TBytesStream;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text := ' SELECT * FROM suboc_consolidacion ' +
                    ' WHERE SERIE_FACTURA = :SERIE AND NRO_FACTURA = :NUMERO';
    Qry.ParamByName('SERIE').AsString := ASerie;
    Qry.ParamByName('NUMERO').AsInteger := ANumero;
    Qry.ReadOnly := False;
    Qry.Open;
    if Qry.IsEmpty then
    begin
      if AIdNuevo <= 0 then
        raise Exception.Create('No se pudo reservar el ID de consolidación.');
      Qry.Insert;
      Qry.FieldByName('ID_CONSOLIDACION').AsInteger := AIdNuevo;
      Qry.FieldByName('SERIE_FACTURA').AsString := ASerie;
      Qry.FieldByName('NRO_FACTURA').AsInteger := ANumero;
    end
    else
      Qry.Edit;
    if AOperacion = opAeatAnulacion then
      Qry.FieldByName('ESTADO').AsString := 'ANULADA'
    else
      Qry.FieldByName('ESTADO').AsString := 'PROCESADO';
    Qry.FieldByName('REQUEST_ID').AsString := AResultado.Csv;
    // QUEUE_ID: eslabón de la cadena (lo usan las comprobaciones de la ficha)
    Qry.FieldByName('QUEUE_ID').AsInteger := Integer(AResultado.Contador);
    Qry.FieldByName('ISSUER_IRS_ID').AsString := AResultado.NifEmisor;
    Qry.FieldByName('ISSUED_TIME').AsDateTime := Now;
    Qry.FieldByName('CHAIN_NUMBER').AsString := IntToStr(AResultado.Contador);
    Qry.FieldByName('CHAIN_HASH').AsString := AResultado.Huella;
    Qry.FieldByName('FECHA_PROCESAMIENTO').AsDateTime := Now;
    Qry.FieldByName('RESPUESTA_COMPLETA').AsString := RespuestaJson(AResultado);
    Qry.FieldByName('PETICION_COMPLETA').AsString := AResultado.Peticion;
    if AOperacion <> opAeatAnulacion then
    begin
      Qry.FieldByName('VERIFACTU_URL').AsString := AResultado.VerifactuUrl;
      Qry.FieldByName('QRCODE_BASE64').AsString := AResultado.QRCodeBase64;
      if Length(AResultado.QRCodePng) > 0 then
      begin
        oStream := TBytesStream.Create(AResultado.QRCodePng);
        try
          (Qry.FieldByName('QRCODE_PNG') as TBlobField).LoadFromStream(
            oStream);
        finally
          FreeAndNil(oStream);
        end;
      end;
    end;
    Qry.Post;
  finally
    FreeAndNil(Qry);
  end;
end;

function ExisteConsolidacionProcesada(AConn: TUniConnection;
                                      const ASerie: string;
                                      ANumero: Integer): Boolean;
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text := ' SELECT ESTADO FROM suboc_consolidacion ' +
                    ' WHERE SERIE_FACTURA = :SERIE AND NRO_FACTURA = :NUMERO';
    Qry.ParamByName('SERIE').AsString := ASerie;
    Qry.ParamByName('NUMERO').AsInteger := ANumero;
    Qry.Open;
    Result := (not Qry.IsEmpty) and
              (Qry.FieldByName('ESTADO').AsString <> 'PENDIENTE');
  finally
    FreeAndNil(Qry);
  end;
end;

procedure PersistirResultado(AConn: TUniConnection;
                             const AConfig: TConfigAeat;
                             const ADatos: TDatosFacturaAeat;
                             AIdNuevo: Integer;
                             AOperacion: TOperacionAeat;
                             const AResultado: TResultadoEnvioAeat);
begin
  if AResultado.Ok then
  begin
    AvanzarCadena(AConn, AConfig.NifEmisor, ADatos, AResultado.Huella,
                  AResultado.EsperaSegundos);
    GuardarConsolidacion(AConn, ADatos.Serie, ADatos.Numero, AIdNuevo,
                         AOperacion, AResultado);
    if AOperacion = opAeatAnulacion then
      ActualizarFaseFactura(AConn, ADatos.Serie, ADatos.Numero, 'S',
                            'CANCELADA')
    else
      ActualizarFaseFactura(AConn, ADatos.Serie, ADatos.Numero, 'S',
                            'ONLINE');
  end
  else
  begin
    // El rechazo no avanza la cadena, pero el control de flujo sí cuenta
    ActualizarProximoEnvio(AConn, AConfig.NifEmisor,
                           AResultado.EsperaSegundos);
    if AOperacion = opAeatAlta then
    begin
      if ExisteConsolidacionProcesada(AConn, ADatos.Serie, ADatos.Numero) then
        ActualizarFaseFactura(AConn, ADatos.Serie, ADatos.Numero, 'S',
                              'ERROR')
      else
        ActualizarFaseFactura(AConn, ADatos.Serie, ADatos.Numero, 'N',
                              'ERROR_BORRADOR');
    end;
  end;
end;

// ===========================================================================
//   API pública
// ===========================================================================

function EnviarFacturaAeat(AConn: TUniConnection;
                           const ASerie: string;
                           ANumero: Integer;
                           AOperacion: TOperacionAeat;
                           const ATipoFactura: string = ''):
                           TResultadoEnvioAeat;
var
  oConfig:      TConfigAeat;
  oDatos:       TDatosFacturaAeat;
  oCadena:      TCadenaAnterior;
  sRegistro:    string;
  sClave:       string;
  iIdNuevo:     Integer;
  bTransaccion: Boolean;
begin
  Result := Default(TResultadoEnvioAeat);
  oConfig := CargarConfigAeat(AConn);
  ValidarConfigAeat(oConfig);
  if not CargarDatosFactura(AConn, ASerie, ANumero, oConfig, ATipoFactura,
                            oDatos) then
    raise Exception.CreateFmt('No se encontró la factura %s.',
      [ComponerNumSerieFacturaAeat(ASerie, ANumero)]);
  Result.NifEmisor := oConfig.NifEmisor;
  Result.NumSerieFactura := oDatos.NumSerieFactura;
  AsegurarTablaCadena(AConn);
  iIdNuevo := 0;
  sClave := ClaveOperacion(ASerie, ANumero, AOperacion);
  bTransaccion := not AConn.InTransaction;
  if bTransaccion then
    AConn.StartTransaction;
  try
    if AOperacion <> opAeatAnulacion then
      iIdNuevo := ReservarIdConsolidacion(AConn, ASerie, ANumero);
    ObtenerCadena(AConn, oConfig.NifEmisor, oCadena);
    Result.Contador := oCadena.Contador + 1;
    // Un intento incierto de este mismo registro se repite idéntico: misma
    // huella si la AEAT llegó a registrarlo sin que recibiéramos respuesta
    if (oCadena.VueloClave = sClave) and (oCadena.VueloFhGen <> '') then
      Result.FechaHoraGen := oCadena.VueloFhGen
    else
      Result.FechaHoraGen := FechaHoraHusoGen(Now);
    if AOperacion = opAeatAnulacion then
      sRegistro := ConstruirRegistroAnulacion(oConfig, oDatos, oCadena,
                     Result.FechaHoraGen, Result.Huella)
    else
      sRegistro := ConstruirRegistroAlta(oConfig, oDatos, oCadena,
                     Result.FechaHoraGen, AOperacion = opAeatSubsanacion,
                     Result.Huella);
    Result.Peticion := EnvolverSoap(oConfig, sRegistro);
    try
      EnviarHttp(oConfig.UrlEnvio, Result.Peticion, oConfig.CertSerie,
                 oConfig.CertTitular, Result.EstadoHttp, Result.Respuesta);
    except
      on E: Exception do
        raise EVerifactuAeatIncierto.Create('No se pudo completar el envío ' +
          'a la AEAT: ' + E.Message);
    end;
    // Solo el servicio SOAP de la AEAT resuelve un envío. Cualquier otra
    // respuesta (proxy, portal cautivo, cuerpo truncado) deja el registro
    // incierto y se reenvía idéntico
    if not EsRespuestaAeatDefinitiva(Result.EstadoHttp, Result.Respuesta) then
      raise EVerifactuAeatIncierto.CreateFmt('La AEAT no ha dado una ' +
        'respuesta válida (HTTP %d). Vuelva a intentarlo.',
        [Result.EstadoHttp]);
    InterpretarRespuesta(Result);
    if Result.Ok and (AOperacion <> opAeatAnulacion) then
      GenerarQrResultado(oConfig, oDatos, Result);
    PersistirResultado(AConn, oConfig, oDatos, iIdNuevo, AOperacion, Result);
    if bTransaccion then
      AConn.Commit;
  except
    on E: EVerifactuAeatIncierto do
    begin
      if bTransaccion then
      begin
        AConn.Rollback;
        GuardarEnvioEnVuelo(AConn, oConfig.NifEmisor, sClave,
                            Result.FechaHoraGen, oCadena.Huella);
      end;
      raise;
    end;
    on E: Exception do
    begin
      if bTransaccion and AConn.InTransaction then
        AConn.Rollback;
      raise;
    end;
  end;
end;

end.
