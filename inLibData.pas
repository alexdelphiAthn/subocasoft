unit inLibData;

interface

uses  SysUtils, Classes, DB, Uni, inMtoPrincipal, System.JSON;

function GetNextCont(sTipoDoc:STring):Integer;
procedure SetConsolidationFase(NumeroFactura: Integer; SerieFactura:string;
                                FaseConsolidation:string; Consolidation:string);
function GetConsolidationFase(NumeroFactura: Integer;
                               SerieFactura:string):string;
function fncObtenerQueueIdFactura(const sSerie: string;
                                  const iNumero: Integer): Integer;
procedure CargarConfiguracionOffline(out sPrefix, sNif:String);

implementation

function fncObtenerQueueIdFactura(const sSerie: string;
                                  const iNumero: Integer): Integer;
var
  qryConsolidacion: TUniQuery;
  iQueueId: Integer;
begin
  iQueueId := 0;
  qryConsolidacion := TUniQuery.Create(nil);
  try
    qryConsolidacion.Connection := frmOpenApp.FDmConn.conUni;
    qryConsolidacion.SQL.Text :=
      'SELECT QUEUE_ID ' +
      'FROM suboc_consolidacion ' +
      'WHERE SERIE_FACTURA = :SERIE ' +
      '  AND NRO_FACTURA = :NUMERO ' +
      '  AND QUEUE_ID IS NOT NULL';
    qryConsolidacion.ParamByName('SERIE').AsString := sSerie;
    qryConsolidacion.ParamByName('NUMERO').AsInteger := iNumero;
    qryConsolidacion.Open;
    if not qryConsolidacion.IsEmpty then
      Result := qryConsolidacion.FieldByName('QUEUE_ID').AsInteger
    else
      Result := -1;
  finally
    qryConsolidacion.Close;
    FreeAndNil(qryConsolidacion);
  end;
end;

function GetNextCont(sTipoDoc:STring):Integer;
var
  unstdprocNextCont:TUniStoredProc;
begin
   unstdprocNextCont := TUniStoredProc.Create(nil);
   unstdprocNextCont.Connection := frmOpenApp.FDmConn.conUni;
   unstdprocNextCont.StoredProcName := 'GET_NEXT_CONT';
   unstdprocNextCont.Prepare;
   unstdprocNextCont.ParamByName('pTipoDoc').AsString := sTipoDoc;
   unstdprocNextCont.ExecProc;
   Result := unstdprocNextCont.ParamByName('pcont').AsInteger;
   unstdprocNextCont.Free;
end;

procedure SetConsolidationFase(NumeroFactura: Integer; SerieFactura:string;
                              FaseConsolidation:string; Consolidation:string);
var
  unstdprocNextCont:TUniStoredProc;
begin
   unstdprocNextCont := TUniStoredProc.Create(nil);
   unstdprocNextCont.Connection := frmOpenApp.FDmConn.conUni;
   unstdprocNextCont.StoredProcName := 'SET_CONSOLIDACION_FASE';
   unstdprocNextCont.Prepare;
   unstdprocNextCont.ParamByName('pNumFactura').AsInteger := NumeroFactura;
   unstdprocNextCont.ParamByName('pSerieFactura').AsString := SerieFactura;
   unstdprocNextCont.ParamByName('pFaseConso').AsString := FaseConsolidation;
   unstdprocNextCont.ParamByName('pConso').AsString := Consolidation;
   unstdprocNextCont.ExecProc;
   unstdprocNextCont.Free;
end;

function GetConsolidationFase(NumeroFactura: Integer;
                               SerieFactura:string):string;
var
  unqrySol: TUniQuery;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := frmOpenApp.FDmConn.conUni;
  unqrySol.sql.Text := 'SELECT FASE_CONSOLIDACION_FACTURA ' +
                       '  FROM suboc_facturas ' +
                       '  WHERE NRO_FACTURA = ' +
                                            QuotedStr(IntToStr(NumeroFactura)) +
                       ' AND SERIE_FACTURA = ' + QuotedStr(SerieFactura);
  unqrySol.Open;
  if (unqrySol.RecordCount >= 1) then
    Result := unqrySol.FieldByName('FASE_CONSOLIDACION_FACTURA').AsString;
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

procedure CargarConfiguracionOffline(out sPrefix, sNif:String);
var
  qryParams: TUniQuery;
begin
  qryParams := TUniQuery.Create(nil);
  try
    qryParams.Connection := frmOpenApp.FDmConn.conUni;
    qryParams.SQL.Text :=
      'SELECT NOMBRE_PARAM, VALUE_PARAM ' +
      'FROM suboc_param ' +
      'WHERE NOMBRE_PARAM IN (' +
      QuotedStr('OFFLINE_PREFIX') + ', ' +
      QuotedStr('OFFLINE_NIF') + ')';
    qryParams.Open;

    // Leer parámetros
    while not qryParams.Eof do
    begin
      if qryParams.FieldByName('NOMBRE_PARAM').AsString = 'OFFLINE_PREFIX' then
        sPrefix := qryParams.FieldByName('VALUE_PARAM').AsString
      else
      if qryParams.FieldByName('NOMBRE_PARAM').AsString = 'OFFLINE_NIF' then
        sNif := qryParams.FieldByName('VALUE_PARAM').AsString;
      qryParams.Next;
    end;
  finally
    qryParams.Close;
    FreeAndNil(qryParams);
  end;
end;


end.
