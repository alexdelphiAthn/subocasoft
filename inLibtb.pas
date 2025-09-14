unit inLibtb;

interface

uses  SysUtils, Variants, DB, ADODB, ExtCtrls, DBCtrls, Controls, Grids,
      Classes, COMObj, ComCtrls, ExtActns, OleCtrls, Forms, inifiles;

  type
    TStringArray = array of string;

     //function GetBBDDFolder:String;
     function GetAppFolder:String;
//     function ADOGetStringConnection(sDataBase:STring; sDataSource  : string): string;
//     procedure CrearFichBBDD(sDataSourc:String);
//     procedure Crear_Estructura(sFuenteDatos:String; sCrearSQL:String);
     function SoloNumeros(S:String):String;
     function LetraNIF(DNI: String): Char;
     function CalculaDC(Banco, Cuenta: string):integer;
     function DevDC(sNcuenta:String):String;
     function TomarLetra(S: String):String;
     function SonNumeros(S:String):boolean;
     function NomEjecutable:String;
     function AnsiOccurs(const str: string; const substr: string): integer;
     function AnsiSplit(const str: string; const separator: string): TStringArray;
     function SoloLetraNIF(S:String):Char;
     procedure ComprobarNIF(sNIF:String);
     function EsBBDDPerfil(sTableName:String):boolean;
     function leCadINI (clave, cadena : string; defecto : string) : string;
     function FileSinExtension(sFile: string):string;
     procedure esCadINI (clave, cadena, valor : string);
     //procedure CrearMiniMensaje(sTipoVen:String;sMensaje:String; mrMessage:TModalResult = mrOk); overload;
     //procedure CrearMiniMensaje(sTipoVen:String;sMensaje:String); overload;


implementation

uses UniData;

procedure esCadINI (clave, cadena, valor : string);
var
   sIniFile:string;
begin
  if ParamStr(2) = '' then
    sIniFile := ExtractFilePath(ParamStr(0)) + FileSinExtension(ExtractFileName(ParamStr(0))) + '.ini'
  else
    sIniFile := ExtractFilePath(ParamStr(0)) + ParamStr(2);

  with tinifile.create (sIniFile) do
  try
    writeString (clave, cadena, valor);
  finally
    free;
  end;
end;

function FileSinExtension(sFile: string):string;
begin
 Result := ExtractFilePath(sFile) + copy(ExtractFileName(sFile), 1, pos(ExtractFileExt(sFile), ExtractFileName(sFile)) - 1);
end;

function leCadINI (clave, cadena : string; defecto : string) : string;
var
  sIniFile:string;
begin
  if ParamStr(2) = '' then
    sIniFile := ExtractFilePath(ParamStr(0)) + FileSinExtension(ExtractFileName(ParamStr(0))) + '.ini'
  else
    sIniFile := ExtractFilePath(ParamStr(0)) + ParamStr(2);
  with tinifile.create (sIniFile) do
  try
    result := readString (clave, cadena, defecto);
    if result = defecto then
      esCadINI(clave, cadena, defecto);
  finally
    free;
  end;
end;


function GetAppFolder:String;
begin
 result:= ExtractFilePath(Application.EXEName);
end;

procedure CrearFichBBDD(sDataSourc:String);
var
    ctCatalog :  Variant;
begin
  //if not(DirectoryExists(GetBBDDFolder) ) then
    //CrearBBDD
  ctCatalog := CreateOleObject('ADOX.Catalog');

  try
    ctCatalog.Create(sDataSourc);
  finally
  end;
end;

//procedure Crear_Estructura(sFuenteDatos:String;sCrearSQL:String);
//var
//  adocoCreacion:TADOCommand;
//begin
//  with UniData.dmTablas do
//  begin
//    adocoCreacion:= TADOCommand.Create(nil);
//
//    adocoCreacion.ConnectionString := sFuenteDatos;
//
//    adocoCreacion.CommandText := sCrearSQL;
//
//    try
//      adocoCreacion.Execute;
//    finally
//      adocoCreacion.Free;
//    end;
//  end;
//end;
//
//function ADOGetStringConnection(sDataBase:STring; sDataSource  : string): string;
//var
//  sResult:String;
//begin
//
//   sResult := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog='+ sDataBase+ ';Data Source='+sDataSource;
//   Result := sResult;
//   (*
//         Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=InquiPro;Data Source=BULY
//   *)      
//end;

function LetraNIF(DNI: String): Char;
begin
  Result := Copy('TRWAGMYFPDXBNJZSQVHLCKET', StrToInt(DNI) mod 23 + 1, 1)[1];
end;

//Banco es numero de banco + sucursal 8 digitos y cuenta son 10
function CalculaDC(Banco, Cuenta: string):integer;
const
  Pesos: array[0..9] of integer=(6,3,7,9,10,5,8,4,2,1);
var
  n      : byte;
  iTemp  : integer;
begin
  iTemp:=0;
  for n := 0 to 7 do
     iTemp := iTemp + StrToInt(Copy(Banco, 8 - n, 1)) * Pesos[n];
  Result:=11 - iTemp Mod 11;
  if (Result > 9) then Result:=1-Result mod 10;
  iTemp:=0;
  For n := 0 to 9 do
     iTemp := iTemp + StrToInt(Copy(Cuenta, 10 - n, 1)) * Pesos[n];
  iTemp:=11 - iTemp mod 11;
  if (iTemp > 9) then iTemp:=1-iTemp mod 10;
  Result:=Result*10+iTemp;
end;

function DevDC(sNcuenta:String):String;
var
  sBanco, sNumero:String;
begin
  if ((SonNumeros(sNcuenta)) and (Length(sNcuenta) = 20)) then
  begin
    sBanco:=Copy(sNcuenta, 1, 8);
    sNumero := Copy(sNcuenta, 11, 20);
    Result  := IntToStr(CalculaDC(sBanco, sNumero));
  end
  else
    Result := 'Número de Cuenta Inválido';
end;

function TomarLetra(S: String):String;
var
  SResul : String;
begin
  if ( (Length(S) = 8) and (SonNumeros(S)) ) then
    sResul := S
  else
  if (Length(S) >= 8) then
  begin
      sResul := SoloNumeros(S)
  end
  else
    sResul := '?';

  if (sResul <> '?') then
    Result := LetraNIF(sResul)
  else
    Result := ' NIF No Válido';
end;

function SoloLetraNIF(S:String):Char;
var
  L:String;
  i:Integer;
  bfound :boolean;
begin
  bfound := false;
  L := 'TRWAGMYFPDXBNJZSQVHLCKET';

  if Length(S) = 9 then
    for i := 1 to Length(L) do
    begin
      if (L[i] = S[9]) then
      begin
        bfound := true;
      end;
    end;

  if bfound then
    Result := S[9]
  else
    Result := #0;
end;

function SoloNumeros(S:String):String;
var
  i,j: Integer;
  N: String;
begin
  j := 1;
  N := StringOfChar('0', 8);
  for i := 1 to Length(S) do
    if ( (S[i] >= '0') and
     (S[i] <= '9') ) then
    begin
      N[j] := S[i];
      j := j + 1;
    end;
  Result := N;
end;

function SonNumeros(S:String):boolean;
var
  i : Integer;
  b : boolean;
begin
  b := True;
  for i := 1 to Length(S) do
    if ( (S[i]<'0') or (S[i]>'9') ) then
      b := False;
  Result := b;
end;

procedure ComprobarNIF(sNIF:String);
begin
  //si el primer digito no es un número, es un CIF
  if (sNIF <> '') then
    if ( (sNIF[1] >= '0') and (sNIF[1] <= '9') ) then
      if ( SoloLetraNIF( sNIF ) <> TomarLetra( sNIF ) ) then
        Raise Exception.Create('Letra DNI Incorrecta. Correcta ' + TomarLetra(sNIF) );
end;

function NomEjecutable:String;
begin
  //Result:= Copy( sName, 3, 255 );
end;

function AnsiSplit(const str: string;
                 const separator: string): TStringArray;
// Devuelve un arreglo con las partes de "str" separadas por
// "separator"
// Versión ANSI
var
 i, n: integer;
 p, q, s: PChar;
begin
 SetLength(Result, AnsiOccurs(str, separator)+1);
 p := PChar(str);
 s := PChar(separator);
 n := Length(separator);
 i := 0;
 repeat
   q := AnsiStrPos(p, s);
   if q = nil then q := AnsiStrScan(p, #0);
   SetString(Result[i], p, q - p);
   p := q + n;
   inc(i);
 until q^ = #0;
end;

function AnsiOccurs(const str: string; const substr: string): integer;
// Devuelve la cantidad de veces que una subcadena está en una cadena
// Versión ANSI
var
 p, q: PChar;
 n: integer;
begin
 Result := 0;
 n := Length(substr);
 if n = 0 then exit;
 q := PChar(Pointer(substr));
 p := PChar(Pointer(str));
 while p <> nil do begin
   p := AnsiStrPos(p, q);
   if p <> nil then begin
     inc(Result);
     inc(p, n);
   end;
 end;
end;


function EsBBDDPerfil(sTableName:String):boolean;
begin
 Result:= ( sTableName[1] = 'p' );
end;


end.
