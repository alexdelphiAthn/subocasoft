unit CNumLtr;

interface

uses SysUtils;

  function numeral(numero : longint) : string;
  function DineroEnLetra(curCantidad: Currency): String;

implementation

var
  SonMiles : boolean;
  {Variable que permite saber si se habla de miles en una cantidad}

function ESPACIO(numero : longint) : char;
{Delvuelve un espacio si es mayor a cero}
begin
  ESPACIO := #0;
  if numero > 0 then ESPACIO := ' ';
end;

function Y(numero : longint) : string;
begin
  Y := '';
  if numero > 0 then Y := ' Y ';
end;


function numeral(numero : longint) : string;
begin
  {inicicializa variables}
  numeral := '';
  case numero of
    0 : exit;
    1..15 :
    case numero of
      1 : numeral := 'UN'; //alex  if SonMiles then numeral := 'UN' else numeral := 'UNO';
      2 : numeral := 'DOS';
      3 : numeral := 'TRES';
      4 : numeral := 'CUATRO';
      5 : numeral := 'CINCO';
      6 : numeral := 'SEIS';
      7 : numeral := 'SIETE';
      8 : numeral := 'OCHO';
      9 : numeral := 'NUEVE';
     10 : numeral := 'DIEZ';
     11 : numeral := 'ONCE';
     12 : numeral := 'DOCE';
     13 : numeral := 'TRECE';
     14 : numeral := 'CATORCE';
     15 : numeral := 'QUINCE';
    end;
    16..19 : numeral := 'DIECI' + numeral(numero mod 10);
    20 : numeral := 'VEINT' + 'E';
    21..29 : numeral := 'VEINT' + 'I' + numeral(numero mod 10);
    30..39 : numeral := 'TREINTA' + Y(numero mod 10) + numeral(numero mod 10);
    40..49 : numeral := 'CUARENTA' + Y(numero mod 10) + numeral(numero mod 10);
    50..59 : numeral := 'CINCUENTA' + Y(numero mod 10) + numeral(numero mod 10);
    60..69 : numeral := 'SESENTA' + Y(numero mod 10) + numeral(numero mod 10);
    70..79 : numeral := 'SETENTA' + Y(numero mod 10) + numeral(numero mod 10);
    80..89 : numeral := 'OCHENTA' + Y(numero mod 10) + numeral(numero mod 10);
    90..99 : numeral := 'NOVENTA' + Y(numero mod 10) + numeral(numero mod 10);
    100 : numeral := 'CIEN';
    101..199 : numeral := 'CIEN' + 'TO ' + numeral(numero mod 100);
    1000..1999 : numeral := 'MIL' + ESPACIO(numero mod 1000) + numeral(numero mod 1000);

  else
    if (numero >= 200) and (numero <= 999) then
      case numero div 100 of
        2 : numeral := 'DOS'    + 'CIENTOS'    + ESPACIO(numero mod 100) + numeral(numero mod 100);
        3 : numeral := 'TRES'   + 'CIENTOS'   + ESPACIO(numero mod 100) + numeral(numero mod 100);
        4 : numeral := 'CUATRO' + 'CIENTOS' + ESPACIO(numero mod 100) + numeral(numero mod 100);
        5 : numeral := 'QUINIENTOS'         + ESPACIO(numero mod 100) + numeral(numero mod 100);
        6 : numeral := 'SEIS'   + 'CIENTOS'   + ESPACIO(numero mod 100) + numeral(numero mod 100);
        7 : numeral := 'SETE'   + 'CIENTOS'   + ESPACIO(numero mod 100) + numeral(numero mod 100);
        8 : numeral := 'OCHO'   + 'CIENTOS'   + ESPACIO(numero mod 100) + numeral(numero mod 100);
        9 : numeral := 'NOVE'   + 'CIENTOS'   + ESPACIO(numero mod 100) + numeral(numero mod 100);
      end;
    if (numero > 999) and (numero < 1000000) then begin
      SonMiles := true;
      numeral := numeral(numero div 1000) + ESPACIO(numero mod 1000) + 'MIL' +
                 ESPACIO(numero mod 1000) + numeral(numero mod 1000);
    end;
    if (numero >= 1000000) and (numero < 2000000) then
      numeral := 'UN' + ' ' + 'MILLÓN' + ESPACIO(numero mod 1000) + numeral(numero mod 1000);
    if (numero >= 2000000) then
      numeral := numeral(numero div 1000000) + ESPACIO(numero mod 1000) + 'MILLONES' +
                 ESPACIO(numero mod 1000000)+ numeral(numero mod 1000000);
  end;
  SonMiles := false;
end;

Function DineroEnLetra(curCantidad: Currency): String;
 var i: integer;
     Cantidad, Centavos: Currency;
     BloqueCero, NumeroBloques, Digito: Byte;
     PrimerDigito, SegundoDigito, TercerDigito: Byte;
     Resultado, Temp, Bloque: String;
     Unidades: Array[0..28] of String;
     Decenas: Array[0..8] of String;
     Centenas: Array[0..8] of String;
begin

Unidades[0] := 'UN';
Unidades[1] := 'DOS';
Unidades[2] := 'TRES';
Unidades[3] := 'CUATRO';
Unidades[4] := 'CINCO';
Unidades[5] := 'SEIS';
Unidades[6] := 'SIETE';
Unidades[7] := 'OCHO';
Unidades[8] := 'NUEVE';
Unidades[9] := 'DIEZ';
Unidades[10] := 'ONCE';
Unidades[11] := 'DOCE';
Unidades[12] := 'TRECE';
Unidades[13] := 'CATORCE';
Unidades[14] := 'QUINCE';
Unidades[15] := 'DIESISEIS';
Unidades[16] := 'DIESISIETE';
Unidades[17] := 'DIESIOCHO';
Unidades[18] := 'DIESINUEVE';
Unidades[19] := 'VEINTE';
Unidades[20] := 'VEINTIUNO';
Unidades[21] := 'VEINTIDOS';
Unidades[22] := 'VEINTITRES';
Unidades[23] := 'VEINTICUATRO';
Unidades[24] := 'VEINTICINCO';
Unidades[25] := 'VEINTISEIS';
Unidades[26] := 'VEINTISIETE';
Unidades[27] := 'VEINTIOCHO';
Unidades[28] := 'VEINTINUEVE';

Decenas[0] := 'DIEZ';
Decenas[1] :='VEINTE';
Decenas[2] := 'TREINTA';
Decenas[3] := 'CUARENTA';
Decenas[4] := 'CINCUENTA';
Decenas[5] := 'SESENTA';
Decenas[6] := 'SETENTA';
Decenas[7] := 'OCHENTA';
Decenas[8] := 'NOVENTA';

Centenas[0] := 'CIENTO';
Centenas[1] := 'DOSCIENTOS';
Centenas[2] := 'TRESCIENTOS';
Centenas[3] := 'CUATROCIENTOS';
Centenas[4] := 'QUINIENTOS';
Centenas[5] := 'SEISCIENTOS';
Centenas[6] := 'SETECIENTOS';
Centenas[7] := 'OCHOCIENTOS';
Centenas[8] := 'NOVECIENTOS';

Cantidad := Trunc(curCantidad);
Centavos := (curCantidad - Cantidad) * 100;
NumeroBloques := 1;
Repeat
 PrimerDigito := 0;
 SegundoDigito := 0;
 TercerDigito := 0;
 Bloque := '';
 BloqueCero := 0;
 For i := 1 To 3 do begin
  Digito := Round(Cantidad) Mod 10;
  If Digito <> 0 Then begin
   Case i of
    1: begin
     Bloque := ' ' + Unidades[Digito - 1];
     PrimerDigito := Digito;
    end; //case 1
    2: begin
      If Digito <= 2 Then begin
       Bloque := ' ' + Unidades[(Digito * 10 + PrimerDigito - 1)];
      end Else begin
       If PrimerDigito <> 0 then
        Temp := ' Y' else Temp := '';
       Bloque := ' ' + Decenas[Digito - 1] + Temp + Bloque;
      End; //if
      SegundoDigito := Digito;
     end; //case 2
    3: begin
     If (Digito = 1) and (PrimerDigito = 0) and (SegundoDigito = 0) then
      Temp := 'CIEN' else Temp := Centenas[Digito-1];
     Bloque := ' ' + Temp + Bloque;
     TercerDigito := Digito;
     end; //case 3
    End; //case
  end Else begin
  BloqueCero := BloqueCero + 1;
  End; // If Digito <>0
  Cantidad := Int(Cantidad / 10);
  If Cantidad = 0 Then begin
   Break;
  End; // If Cantidad=0
 end; //for
 Case NumeroBloques of
  1:
   Resultado := Bloque;
  2: begin
   if BloqueCero = 3 then
    Temp := '' else Temp := ' MIL';
   Resultado := Bloque + Temp + Resultado;
   end; //case 2
  3: begin
   If (PrimerDigito = 1) and (SegundoDigito = 0) and (TercerDigito = 0) then
    Temp := ' MILLÓN' else Temp := ' MILLONES';
   Resultado := Bloque + Temp + Resultado;
   end; //case 3
 End; //case
 NumeroBloques := NumeroBloques + 1;
Until Cantidad = 0; //repeat

If curCantidad > 1 then
  Temp := ' CÉNTIMOS ***' else Temp := ' CÉNTIMO ***';
 DineroEnLetra := Resultado + Temp;

End;


end.






