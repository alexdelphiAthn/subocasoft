unit inLibDocumentoValidator;

interface
uses
  System.SysUtils, System.RegularExpressions;
type
  TTipoDocumento = (tdNIF, tdNIE, tdCIF, tdPasaporte, tdTarjetaResidencia, tdDesconocido);
  TDocumentoValidator = class
  private
    // Letras para cálculo del NIF
    const LETRAS_NIF: string = 'TRWAGMYFPDXBNJZSQVHLCKE';
    // Letras válidas para NIE
    const LETRAS_NIE_INICIO: string = 'XYZ';
    // Letras válidas para CIF según tipo de organización
    const LETRAS_CIF_ORGANIZACION: string = 'ABCDEFGHJNPQRSUVW';
    function LimpiarDocumento(const documento: string): string;
    function EsNumero(const valor: string): Boolean;
    function ValidarNIF(const nif: string): Boolean;
    function ValidarNIE(const nie: string): Boolean;
    function ValidarCIF(const cif: string): Boolean;
    function ValidarPasaporte(const pasaporte: string): Boolean;
    function ValidarTarjetaResidencia(const tarjeta: string): Boolean;
    function CalcularLetraNIF(numero: Integer): Char;
    function CalcularDigitoControlCIF(const cif: string): Char;
  public
    function DetectarTipoDocumento(const documento: string): TTipoDocumento;
    function ValidarDocumento(const documento: string): Boolean; overload;
    function ValidarDocumentoConTipo(const documento: string; out tipoDetectado: TTipoDocumento): Boolean;
    function ValidarDocumento(const documento: string; tipoEsperado: TTipoDocumento): Boolean; overload;
    function ObtenerMensajeError(const documento: string; tipo: TTipoDocumento): string;
  end;
implementation
{ TDocumentoValidator }
function TDocumentoValidator.LimpiarDocumento(const documento: string): string;
begin
  // Eliminar espacios, guiones y convertir a mayúsculas
  Result := UpperCase(StringReplace(StringReplace(Trim(documento), ' ', '', [rfReplaceAll]), '-', '', [rfReplaceAll]));
end;
function TDocumentoValidator.EsNumero(const valor: string): Boolean;
var
  i: Integer;
begin
  Result := True;
  if Length(valor) = 0 then
  begin
    Result := False;
    Exit;
  end;
  for i := 1 to Length(valor) do
  begin
    if not CharInSet(valor[i], ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;
function TDocumentoValidator.CalcularLetraNIF(numero: Integer): Char;
begin
  Result := LETRAS_NIF[(numero mod 23) + 1];
end;
function TDocumentoValidator.ValidarNIF(const nif: string): Boolean;
var
  nifLimpio: string;
  parteNumerica: string;
  letraDocumento, letraCalculada: Char;
  numero: Integer;
begin
  Result := False;
  nifLimpio := LimpiarDocumento(nif);
  // Debe tener exactamente 9 caracteres
  if Length(nifLimpio) <> 9 then
    Exit;
  // Los primeros 8 deben ser números
  parteNumerica := Copy(nifLimpio, 1, 8);
  if not EsNumero(parteNumerica) then
    Exit;
  // El último debe ser una letra válida del NIF
  letraDocumento := nifLimpio[9];
  if Pos(letraDocumento, LETRAS_NIF) = 0 then
    Exit;
  // Calcular la letra correcta
  try
    numero := StrToInt(parteNumerica);
    letraCalculada := CalcularLetraNIF(numero);
    Result := (letraDocumento = letraCalculada);
  except
    Result := False;
  end;
end;
function TDocumentoValidator.ValidarNIE(const nie: string): Boolean;
var
  nieLimpio: string;
  parteNumerica: string;
  letraInicial, letraFinal, letraCalculada: Char;
  numero: Integer;
  numeroParaCalculo: string;
begin
  Result := False;
  nieLimpio := LimpiarDocumento(nie);
  // Debe tener exactamente 9 caracteres
  if Length(nieLimpio) <> 9 then
    Exit;
  // Debe empezar con X, Y o Z
  letraInicial := nieLimpio[1];
  if not CharInSet(letraInicial, ['X', 'Y', 'Z']) then
    Exit;
  // Los caracteres 2-8 deben ser números
  parteNumerica := Copy(nieLimpio, 2, 7);
  if not EsNumero(parteNumerica) then
    Exit;
  // El último debe ser una letra válida del NIF
  letraFinal := nieLimpio[9];
  if Pos(letraFinal, LETRAS_NIF) = 0 then
    Exit;
  // Convertir la letra inicial a número: X=0, Y=1, Z=2
  case letraInicial of
    'X': numeroParaCalculo := '0' + parteNumerica;
    'Y': numeroParaCalculo := '1' + parteNumerica;
    'Z': numeroParaCalculo := '2' + parteNumerica;
  else
    Exit;
  end;
  try
    numero := StrToInt(numeroParaCalculo);
    letraCalculada := CalcularLetraNIF(numero);
    Result := (letraFinal = letraCalculada);
  except
    Result := False;
  end;
end;
function TDocumentoValidator.CalcularDigitoControlCIF(const cif: string): Char;
var
  suma, i, digito: Integer;
  parteNumerica: string;
  sumaPares, sumaImpares: Integer;
begin
  parteNumerica := Copy(cif, 2, 7);
  sumaPares := 0;
  sumaImpares := 0;
  // Sumar dígitos en posiciones pares (2º, 4º, 6º)
  for i := 2 to 6 do
  begin
    if (i mod 2) = 0 then
      sumaPares := sumaPares + StrToInt(parteNumerica[i]);
  end;
  // Para posiciones impares, multiplicar por 2 y sumar los dígitos del resultado
  for i := 1 to 7 do
  begin
    if (i mod 2) = 1 then
    begin
      digito := StrToInt(parteNumerica[i]) * 2;
      sumaImpares := sumaImpares + (digito div 10) + (digito mod 10);
    end;
  end;
  suma := sumaPares + sumaImpares;
  digito := 10 - (suma mod 10);
  if digito = 10 then
    digito := 0;
  // Según el tipo de organización, puede ser número o letra
  case cif[1] of
    'A', 'B', 'E', 'H': Result := Chr(Ord('0') + digito); // Número
    'K', 'P', 'Q', 'S': Result := 'JABCDEFGHI'[digito + 1]; // Letra
  else
    Result := Chr(Ord('0') + digito); // Por defecto número
  end;
end;
function TDocumentoValidator.ValidarCIF(const cif: string): Boolean;
var
  cifLimpio: string;
  letraOrganizacion, digitoControl, digitoCalculado: Char;
  parteNumerica: string;
begin
  Result := False;
  cifLimpio := LimpiarDocumento(cif);
  // Debe tener exactamente 9 caracteres
  if Length(cifLimpio) <> 9 then
    Exit;
  // Debe empezar con una letra válida de organización
  letraOrganizacion := cifLimpio[1];
  if Pos(letraOrganizacion, LETRAS_CIF_ORGANIZACION) = 0 then
    Exit;
  // Los caracteres 2-8 deben ser números
  parteNumerica := Copy(cifLimpio, 2, 7);
  if not EsNumero(parteNumerica) then
    Exit;
  // Validar el dígito de control
  digitoControl := cifLimpio[9];
  digitoCalculado := CalcularDigitoControlCIF(cifLimpio);
  Result := (digitoControl = digitoCalculado);
end;
function TDocumentoValidator.ValidarPasaporte(const pasaporte: string): Boolean;
var
  pasaporteLimpio: string;
begin
  // Validación básica para pasaporte español (formato AAA123456)
  pasaporteLimpio := LimpiarDocumento(pasaporte);
  // Debe tener 9 caracteres
  if Length(pasaporteLimpio) <> 9 then
  begin
    Result := False;
    Exit;
  end;
  // Primeros 3 caracteres deben ser letras
  Result := CharInSet(pasaporteLimpio[1], ['A'..'Z']) and
            CharInSet(pasaporteLimpio[2], ['A'..'Z']) and
            CharInSet(pasaporteLimpio[3], ['A'..'Z']) and
            EsNumero(Copy(pasaporteLimpio, 4, 6));
end;
function TDocumentoValidator.ValidarTarjetaResidencia(const tarjeta: string): Boolean;
var
  tarjetaLimpia: string;
  parteNumerica: string;
  letraFinal, letraCalculada: Char;
  numero: Integer;
begin
  // Las tarjetas de residencia siguen un formato similar al NIE
  tarjetaLimpia := LimpiarDocumento(tarjeta);
  // Formato básico: debe tener entre 8 y 12 caracteres
  if (Length(tarjetaLimpia) < 8) or (Length(tarjetaLimpia) > 12) then
  begin
    Result := False;
    Exit;
  end;
  // Si tiene 9 caracteres y empieza con X, Y, Z, validar como NIE
  if (Length(tarjetaLimpia) = 9) and CharInSet(tarjetaLimpia[1], ['X', 'Y', 'Z']) then
  begin
    Result := ValidarNIE(tarjetaLimpia);
    Exit;
  end;
  // Para otros formatos, validación básica
  Result := True; // Aceptar otros formatos válidos
end;
function TDocumentoValidator.DetectarTipoDocumento(const documento: string): TTipoDocumento;
var
  docLimpio: string;
begin
  docLimpio := LimpiarDocumento(documento);
  if Length(docLimpio) = 0 then
  begin
    Result := tdDesconocido;
    Exit;
  end;
  // NIE: Empieza con X, Y o Z y tiene 9 caracteres
  if (Length(docLimpio) = 9) and CharInSet(docLimpio[1], ['X', 'Y', 'Z']) then
  begin
    Result := tdNIE;
    Exit;
  end;
  // NIF: 9 caracteres, empieza con número
  if (Length(docLimpio) = 9) and CharInSet(docLimpio[1], ['0'..'9']) then
  begin
    Result := tdNIF;
    Exit;
  end;
  // CIF: 9 caracteres, empieza con letra de organización
  if (Length(docLimpio) = 9) and (Pos(docLimpio[1], LETRAS_CIF_ORGANIZACION) > 0) then
  begin
    Result := tdCIF;
    Exit;
  end;
  Result := tdDesconocido;
end;
function TDocumentoValidator.ValidarDocumento(const documento: string): Boolean;
var
  tipo: TTipoDocumento;
begin
  tipo := DetectarTipoDocumento(documento);
  Result := ValidarDocumento(documento, tipo);
end;
function TDocumentoValidator.ValidarDocumentoConTipo(const documento: string;
                                               out tipoDetectado: TTipoDocumento
                                                    ): Boolean;
begin
  tipoDetectado := DetectarTipoDocumento(documento);
  Result := ValidarDocumento(documento, tipoDetectado);
end;

function TDocumentoValidator.ValidarDocumento(const documento: string;
                                              tipoEsperado: TTipoDocumento
                                             ): Boolean;
begin
  case tipoEsperado of
    tdNIF: Result := ValidarNIF(documento);
    tdNIE: Result := ValidarNIE(documento);
    tdCIF: Result := ValidarCIF(documento);
    //tdPasaporte: Result := ValidarPasaporte(documento);
    //tdTarjetaResidencia: Result := ValidarTarjetaResidencia(documento);
  else
    Result := False;
  end;
end;

function TDocumentoValidator.ObtenerMensajeError(const documento: string; tipo: TTipoDocumento): string;
begin
  case tipo of
    tdNIF: Result := 'NIF inválido. Formato esperado: 12345678A';
    tdNIE: Result := 'NIE inválido. Formato esperado: X1234567A';
    tdCIF: Result := 'CIF inválido. Formato esperado: A12345674';
    //tdPasaporte: Result := 'Pasaporte inválido. Formato esperado: AAA123456';
    tdTarjetaResidencia: Result := 'Tarjeta de residencia inválida';
    tdDesconocido: Result := 'NIF vacío no permitido';
  else
    Result := 'Documento inválido';
  end;
end;
end.
