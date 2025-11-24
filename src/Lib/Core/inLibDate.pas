unit inLibDate;

interface

uses Sysutils;

const
  eDays   = 1;
  eWeeks  = 2;
  eMonths = 4;
  eYears  = 8;

Type
    EInvalidPeriod = Class(Exception);

    TFechaDiff = class(TObject)
    private
      dFechaIni: TDateTime;
      dFechaFin: TDateTime;

      iDifDays          : Integer;
      iDifMonths        : Integer;
      iDifYears         : Integer;
      iDifWeeks         : Integer;

      iDaysLastMonth    : Integer;
      iDifTotalDays     : Integer;

      bUp               : Boolean;
    public
      constructor Create; overload;
      constructor Create(const dFechaIn:TDateTime;
                         const dFechaFi:TDateTime;
                         _bUp:boolean;
                         bIncDay: boolean);  overload;
      procedure   SetFechas(const dFechaIn:TDateTime; const dFechaFi:TDateTime; __bUp:boolean);
      procedure   SetDiffUp(eTipo:Integer);
      function    GetDiffDays:Integer;
      function    GetDiffDaysLastMonth:Integer;
      function    GetLetras: String;

    private
         procedure CalcularDiff(const dFechaIn:TDateTime;
                                const dFechaFi:TDateTime;
                                var   iDifDay,
                                      iDifMonth,
                                      iDifWeek,
                                      iDifYear,
                                      iDaysLastMont,
                                      iDifTotalDay     : Integer);
      //function DateDiffLetras(const Date1:TDateTime;const Date2:TDateTime): String;
      function DiffYears(const D1:TDateTime; const D2: TDateTime) : Integer;
      function DiffMonths(const D1:TDateTime; const D2: TDateTime) : Integer;
      function DiffDays(const D1:TDatetime; const D2: TDateTime) : Integer;
      function AddMonths(const D: TDateTime; const N: Integer) : TDateTime;
      function AddYears(const D: TDateTime; const N: Integer) : TDateTime;
      function MinI(const A:Integer;const B: Integer) : Integer;

      function GetDiffMonthsUp: Integer;
      function GetDiffWeeksUp: Integer;
      function GetDiffYearsUp: Integer;

      function GetNumYearsLet(const iAnn:Integer): String;
      function GetNumDaysLet(const iDay:Integer): String;
      function GetNumMonthsLet(const iMonth:Integer): String;
      function GetNumWeeksLet(const iWeek:Integer): String;

      function SepLet(bIsFinal: boolean):String;
      function GetNumVblesPos: Integer;

      procedure SetDiffDays;
      procedure SetDiffWeeks;
      procedure SetDiffWeekDays;
      procedure SetDiffMonths;
      procedure SetDiffMonthsDays;
      procedure SetDiffMonthsWeeks;
      procedure SetDiffMonthsWeeksDays;
      procedure SetDiffYears;
      procedure SetDiffYearsDays;
      procedure SetDiffYearsWeeks;
      procedure SetDiffYearsWeeksDays;
      procedure SetDiffYearsMonths;
      procedure SetDiffYearsMonthsDays;
      procedure SetDiffYearsMonthsWeeks;
      procedure RestaureDiff;
    end;

implementation

uses CNumLtr, DateUtils;

constructor TFechaDiff.Create;
begin
  dFechaIni := Date;
  dFechaFin := Date;

  iDifDays       := 0;
  iDifWeeks      := 0;
  iDifMonths     := 0;
  iDifYears      := 0;
  iDaysLastMonth := 0;
  iDifTotalDays  := 0;
end;


constructor TFechaDiff.Create(const dFechaIn:TDateTime;
                             const dFechaFi:TDateTime;
                             _bUp:boolean;
                             bIncDay: boolean);
var
  dFechaAux:TDateTime;
begin

  dFechaIni := dFechaIn;
  dFechaFin := dFechaFi;

  if ( dFechaIni > dFechaFin ) then
  begin
    dFechaAux := dFechaIni;
    dFechaIni := dFechaFin;
    dFechaFin := dFechaAux;
  end;

  if bIncDay then dFechaFin := dFechaFin + 1;

  SetFechas(dFechaIni, dFechaFin, _bUp);

end;

procedure TFechaDiff.CalcularDiff(const dFechaIn:TDateTime;
                                  const dFechaFi:TDateTime;
                                  var iDifDay,
                                      iDifMonth,
                                      iDifWeek,
                                      iDifYear,
                                      iDaysLastMont,
                                      iDifTotalDay     : Integer);
var
  dAuxDate  : TDateTime;
begin
  iDifYears     := DiffYears(dFechaIni, dFechaFin);
  dAuxDate      := AddYears(dFechaIni, iDifYears);
  iDifMonths    := DiffMonths(dAuxDate, dFechaFin);
  dAuxDate      := AddMonths(dAuxdate, iDifMonths);

  iDifDays   := DiffDays(dAuxDate, dFechaFin) mod 7;
  iDifWeeks  := DiffDays(dAuxDate, dFechaFin) div 7;

  iDifTotalDay  := Trunc(dFechaFi - dFechaIn);
  iDaysLastMonth:= DaysInAMonth(StrToInt(FormatDateTime('yyyy', dFechaFi)),
                               StrToInt(FormatDateTime('mm', dFechaFi)) );

end;



function TFechaDiff.GetDiffDays: Integer;
begin
  Result :=  iDifTotalDays;
end;

function TFechaDiff.GetDiffMonthsUp: Integer;
begin
  SetDiffMonthsWeeksDays;
  if ( ( iDifDays > 0 ) or ( iDifWeeks > 0 ) ) and bUp then
    Result := DiffMonths(dFechaIni, dFechaFin) + 1
  else
    Result := DiffMonths(dFechaIni, dFechaFin);

  iDifDays  := 0;
  iDifWeeks := 0;
end;

function TFechaDiff.GetDiffWeeksUp: Integer;
begin
  SetDiffWeekDays;
  if ( iDifDays > 0 ) and bUp then
    Result := (DiffDays(dFechaIni, dFechaFin) div 7) + 1
  else
    Result := (DiffDays(dFechaIni, dFechaFin) div 7);

  iDifDays := 0;
end;

function TFechaDiff.GetDiffYearsUp: Integer;
begin
  RestaureDiff;

  if ( ( iDifDays > 0 ) or (iDifWeeks > 0 ) or (iDifMonths > 0 ) ) and bUp then
    Result := DiffYears(dFechaIni, dFechaFin) + 1
  else
    Result := DiffYears(dFechaIni, dFechaFin);

  iDifDays   := 0;
  iDifWeeks  := 0;
  iDifMonths := 0;
end;

function TFechaDiff.GetNumYearsLet(const iAnn:Integer): String;
var
  sFecha: String;
begin
  sFecha  := '';
  if (iAnn > 0) then
    begin
      sFecha := numeral(iAnn);
      if ( iAnn = 1 ) then
        sFecha := sFecha + ' AÑO'
      else
        sFecha := sFecha + ' AÑOS';
    end;

  Result := sFecha;
end;

function TFechaDiff.GetNumDaysLet(const iDay:Integer): String;
var 
  sFecha : STring;
begin
  sFecha := '';

  if iDay > 0 then
  begin
    sFecha := numeral (iDay);
    if iDay = 1 then
      sFecha := sFecha + ' DÍA'
    else
      sFecha := sFecha + ' DÍAS';
  end;

  Result := sFecha;
end;

function TFechaDiff.GetNumMonthsLet(const iMonth:Integer): String;
var 
  sFecha : STring;
begin
  sFecha := '';

  if iMonth > 0 then
  begin
    sFecha := numeral(iMonth);
    if ( iMonth = 1 ) then
      sFecha := sFecha + ' MES'
    else
      sFecha := sFecha + ' MESES';
  end;
  
  Result := sFecha;
end;

function TFechaDiff.GetNumWeeksLet(const iWeek:Integer): String;
var
  sFecha: String;
begin
  sFecha := '';

  if iWeek > 0 then
  begin
    sFecha := numeral(iWeek);
    if iWeek = 1 then
      sFecha := sFecha + 'A SEMANA'
    else
      sFecha := sFecha + ' SEMANAS';
  end;
  Result := sFecha;
end;

function TFechaDiff.DiffDays(const D1: TDateTime; const D2: TDateTime) : Integer;
begin
  Result := Integer(Trunc(D2 - D1));
end;

function TFechaDiff.DiffMonths(const D1:TDateTime; const D2: TDateTime) : Integer;
var Ye1, Mo1, Da1 : Word;
    Ye2, Mo2, Da2 : Word;
    ModMonth1,
    ModMonth2     : TDateTime;
begin
  DecodeDate(D1, Ye1, Mo1, Da1);
  DecodeDate(D2, Ye2, Mo2, Da2);
  Result := (Ye2 - Ye1) * 12 + (Mo2 - Mo1);
  ModMonth1 := Da1 + Frac(D1);
  ModMonth2 := Da2 + Frac(D2);
  if (D2 > D1) and (ModMonth2 < ModMonth1) then
    Dec(Result);
  if (D2 < D1) and (ModMonth2 > ModMonth1) then
    Inc(Result);
end;

function TFechaDiff.DiffYears(const D1:TDateTime; const D2: TDateTime) : Integer;
var Ye1, Mo1, Da1 : Word;
    Ye2, Mo2, Da2 : Word;
    ModYear1,
    ModYear2      : TDateTime;
begin
  DecodeDate(D1, Ye1, Mo1, Da1);
  DecodeDate(D2, Ye2, Mo2, Da2);
  Result := Ye2 - Ye1;
  ModYear1 := Mo1 * 31 + Da1 + Frac(Da1);
  ModYear2 := Mo2 * 31 + Da2 + Frac(Da2);
  if (D2 > D1) and (ModYear2 < ModYear1) then
    Dec(Result);
  if (D2 < D1) and (ModYear2 > ModYear1) then
    Inc(Result);
end;

function TFechaDiff.AddMonths(const D: TDateTime; const N: Integer) : TDateTime;
var Ye, Mo, Da : Word;
    IMo : Integer;
begin
  DecodeDate(D, Ye, Mo, Da);
  Inc(Ye, N div 12);
  IMo := Mo;
  Inc(IMo, N mod 12);
  if IMo > 12 then
    begin
      Dec(IMo, 12);
      Inc(Ye);
    end else
    if IMo < 1 then
      begin
        Inc(IMo, 12);
        Dec(Ye);
      end;
  Mo := Word(IMo);
  Da := Word(MinI(Da, DaysInAMonth(Ye, Mo)));
  Result := EncodeDate(Ye, Mo, Da) + Frac(D);
end;

function TFechaDiff.AddYears(const D: TDateTime; const N: Integer): TDateTime;
var Ye, Mo, Da : Word;
begin
  DecodeDate(D, Ye, Mo, Da);
  Inc(Ye, N);
  Da := Word(MinI(Da, DaysInAMonth(Ye, Mo)));
  Result := EncodeDate(Ye, Mo, Da);
end;

function TFechaDiff.MinI(const A:Integer;const B: Integer): Integer;
begin
  if ( A < B ) then
    Result := A
  else
    Result := B;
end;

function TFechaDiff.SepLet(bIsFinal: boolean):String;
begin
  if ( bIsFinal = true ) then
    Result := ' Y '
  else
    Result := ', ';
end;

function TFechaDiff.GetNumVblesPos: Integer;
var
  iCount : Integer;
begin
  iCount := 0;

  if iDifDays > 0 then
    iCount := iCount + 1;
  if iDifWeeks > 0 then
    iCount := iCount + 2;
  if iDifMonths > 0 then
    iCount := iCount + 4;
  if iDifYears > 0 then
    iCount := iCount + 8;

  Result := iCount;
end;


function TFechaDiff.GetDiffDaysLastMonth: Integer;
begin
  Result := iDaysLastMonth;
end;

procedure TFechaDiff.SetDiffUp(eTipo: Integer);

begin
  case eTipo of
      1:  SetDiffDays;
      2:  SetDiffWeeks;
      3:  SetDiffWeekDays;
      4:  SetDiffMonths;
      5:  SetDiffMonthsDays;
      6:  SetDiffMonthsWeeks;
      7:  SetDiffMonthsWeeksDays;
      8:  SetDiffYears;
      9:  SetDiffYearsDays;
      10: SetDiffYearsWeeks;
      11: SetDiffYearsWeeksDays;
      12: SetDiffYearsMonths;
      13: SetDiffYearsMonthsDays;
      14: SetDiffYearsMonthsWeeks;
      15: RestaureDiff;
      else Raise EInvalidPeriod.Create('Parámetro incorrecto');

  end;

end;

function TFechaDiff.GetLetras: String;
var
  sDays, sMonths, sWeeks, sYears, sText : String;
  iNumParams: Integer;
begin
    sYears  := GetNumYearsLet(iDifYears);
    sMonths := GetNumMonthsLet(iDifMonths);
    sWeeks  := GetNumWeeksLet(iDifWeeks);
    sDays   := GetNumDaysLet(iDifDays);

    iNumParams := GetNumVblesPos;

    case iNumParams of
      1: sText  := sDays;
      2: sText  := sWeeks;
      3: sText  := sWeeks + sepLet(true)   + sDays;
      4: sText  := sMonths;
      5: sText  := sMonths + sepLet(true)  + sDays;
      6: sText  := sMonths + sepLet(true)  + sWeeks;
      7: sText  := sMonths + sepLet(false) + sWeeks  + sepLet(true) + sDays;
      8: sText  := sYears;
      9: sText  := sYears + sepLet(true)   + sDays;
      10: sText := sYears + sepLet(true)   + sWeeks;
      11: sText := sYears + sepLet(false)  + sWeeks  + sepLet(true) + sDays;
      12: sText := sYears + sepLet(true)   + sMonths;
      13: sText := sYears + sepLet(false)  + sMonths + sepLet(true) + sDays;
      14: sText := sYears + sepLet(false)  + sMonths + sepLet(true) + sWeeks;
      15: sText := sYears + sepLet(false)  + sMonths + sepLet(false) + sWeeks
                          + sepLet(true) + sDays;
    end;


  Result := AnsiLowerCase(sText); //poner la primera letra en mayúscula

end;

procedure TFechaDiff.SetFechas(const dFechaIn, dFechaFi: TDateTime; __bUp:Boolean);
begin
  dFechaIni := dFechaIn;
  dFechaFin := dFechaFi;

  if dFechaIni > dFechaFin then
    Raise EInvalidPeriod.Create('Periodo incorrecto');

  CalcularDiff(dFechaIni,
               dFechaFi,
               iDifDays,
               iDifMonths,
               iDifWeeks,
               iDifYears,
               iDaysLastMonth,
               iDifTotalDays);
  bUp := __BUp;
end;

procedure TFechaDiff.SetDiffDays;
begin
 iDifDays   := iDifTotalDays;
 iDifWeeks  := 0;
 iDifMonths := 0;
 iDifYears  := 0;
end;


procedure TFechaDiff.SetDiffWeeks;
begin
  iDifDays   := 0;
  iDifWeeks  := GetDiffWeeksUp;
  iDifMonths := 0;
  iDifYears  := 0;
end;

procedure TFechaDiff.SetDiffWeekDays;
begin
  //iDifDays := iDifDays;
  iDifWeeks := iDifTotalDays div 7;
  iDifDays  := iDifTotalDays mod 7;
  iDifMonths := 0;
  iDifYears  := 0;
end;



procedure TFechaDiff.SetDiffMonths;
begin
  iDifDays   := 0;
  iDifWeeks  := 0;
  iDifMonths := GetDiffMonthsUp;
  iDifYears  := 0;
end;


procedure TFechaDiff.SetDiffMonthsDays;
var
  dAuxDate:TDateTime;
begin

  iDifMonths := DiffMonths(dFechaIni, dFechaFin);
  dAuxDate   := AddMonths(dFechaIni, iDifMonths);
  iDifDays   := DiffDays(dAuxDate, dFechaFin);
  iDifWeeks  := 0;
  iDifYears  := 0;
end;

procedure TFechaDiff.SetDiffMonthsWeeks;
var
  dAuxDate : TDateTime;
begin
  iDifMonths := DiffMonths(dFechaIni, dFechaFin);
  dAuxDate   := AddMonths(dFechaIni, iDifMonths);
  iDifDays   := 0;

  if ((( DiffDays(dAuxDate, dFechaFin ) mod 7) > 0) ) then
    iDifWeeks := (DiffDays(dAuxDate, dFechaFin ) div 7) + 1
  else
    iDifWeeks := (DiffDays(dAuxDate, dFechaFin ) div 7);

  iDifYears  := 0;
end;

procedure TFechaDiff.RestaureDiff;
begin
  CalcularDiff(dFechaIni,
               dFechaFin,
               iDifDays,
               iDifMonths,
               iDifWeeks,
               iDifYears,
               iDaysLastMonth,
               iDifTotalDays);
end;

procedure TFechaDiff.SetDiffMonthsWeeksDays;
var
  dAuxDate:TDateTime;
begin

  iDifMonths := DiffMonths(dFechaIni, dFechaFin);
  dAuxDate   := AddMonths(dFechaIni, iDifMonths);
  iDifDays   := DiffDays(dAuxDate, dFechaFin) mod 7;
  iDifWeeks  := DiffDays(dAuxDate, dFechaFin) div 7;
  iDifYears  := 0;
end;

procedure TFechaDiff.SetDiffYears;
begin
  iDifDays   := 0;
  iDifWeeks  := 0;
  iDifMonths := 0;
  iDifYears  := GetDiffYearsUp;
end;

procedure TFechaDiff.SetDiffYearsDays;
var
  dAuxDate:TDateTime;
begin

  iDifYears  := DiffYears(dFechaIni, dFechaFin);
  dAuxDate   := AddYears(dFechaIni, iDifYears);
  iDifDays   := DiffDays(dAuxDate, dFechaFin);
  iDifWeeks  := 0;
  iDifMonths := 0;
end;

procedure TFechaDiff.SetDiffYearsMonths;
var
  dAuxDate:TDateTime;
begin

  iDifYears     := DiffYears(dFechaIni, dFechaFin);
  dAuxDate      := AddYears(dFechaIni, iDifYears);
  iDifMonths    := DiffMonths(dAuxDate, dFechaFin);
  dAuxDate      := AddMonths(dAuxdate, iDifMonths);
  if DiffDays(dAuxDate, dFechaFin) > 0  then
     iDifMonths := iDifMonths + 1;


  iDifWeeks  := 0;
  iDifDays   := 0;
end;

procedure TFechaDiff.SetDiffYearsMonthsDays;
var
  dAuxDate:TDateTime;
begin
  iDifYears     := DiffYears(dFechaIni, dFechaFin);
  dAuxDate      := AddYears(dFechaIni, iDifYears);
  iDifMonths    := DiffMonths(dAuxDate, dFechaFin);
  dAuxDate      := AddMonths(dAuxdate, iDifMonths);
  iDifDays      := DiffDays(dAuxDate, dFechaFin);
  iDifWeeks     := 0;

end;

procedure TFechaDiff.SetDiffYearsMonthsWeeks;
var
  dAuxDate:TDateTime;
  iDiffWeekD:Integer;
begin
  iDifYears     := DiffYears(dFechaIni, dFechaFin);
  dAuxDate      := AddYears(dFechaIni, iDifYears);
  iDifMonths    := DiffMonths(dAuxDate, dFechaFin);
  dAuxDate      := AddMonths(dAuxdate, iDifMonths);
  iDifWeeks     := DiffDays(dAuxDate, dFechaFin) div 7;
  iDiffWeekD    := DiffDays(dAuxDate, dFechaFin) mod 7;
  if iDiffWeekD > 0  then
     iDifWeeks := iDifWeeks + 1;
  iDifDays      := 0;

end;

procedure TFechaDiff.SetDiffYearsWeeks;
var
  dAuxDate:TDateTime;
begin
  iDifYears     := DiffYears(dFechaIni, dFechaFin);
  dAuxDate      := AddYears(dFechaIni, iDifMonths);
  if ((( DiffDays(dAuxDate, dFechaFin ) mod 7) > 0)) then
    iDifWeeks := (DiffDays(dAuxDate, dFechaFin ) div 7) + 1
  else
    iDifWeeks := (DiffDays(dAuxDate, dFechaFin ) div 7);
  iDifMonths := 0;
  iDifDays   := 0;
end;

procedure TFechaDiff.SetDiffYearsWeeksDays;
var
  dAuxDate:TDateTime;
begin
  iDifYears     := DiffYears(dFechaIni, dFechaFin);
  dAuxDate      := AddYears(dFechaIni, iDifYears);
  iDifWeeks := (DiffDays(dAuxDate, dFechaFin ) div 7);
  iDifMonths := 0;
  iDifDays   := (DiffDays(dAuxDate, dFechaFin ) mod 7);
end;

end.
