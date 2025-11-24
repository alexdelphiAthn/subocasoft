unit UniDataDocRecibos;

interface

uses
  SysUtils, Classes, DB, UniDataDocBase, Uni, Dialogs;

type
  TdmDocConRecibos = class(TdmDocBase)
  protected
    // Métodos abstractos adicionales para recibos
    function GetDatasetRecibos: TUniQuery; virtual; abstract;
    function GetStoredProcGetRecibos: TUniStoredProc; virtual; abstract;

  public
    // Métodos de gestión de recibos
    procedure GenerarRecibos;
    procedure CambiarEstadoRecibo(const sEstado: string);
  end;

implementation

{ TdmDocConRecibos }

procedure TdmDocConRecibos.GenerarRecibos;
var
  dsDoc: TDataSet;
  stpRecibos: TUniStoredProc;
  qryRecibos: TUniQuery;
begin
  dsDoc := GetDatasetDocumento;

  // Grabar documento si está en edición
  if ((dsDoc.State = dsEdit) or (dsDoc.State = dsInsert)) then
    dsDoc.Post;

  stpRecibos := GetStoredProcGetRecibos;
  qryRecibos := GetDatasetRecibos;

  // Llamar al stored procedure para generar recibos
  stpRecibos.ParamByName('pNRO_FACTURA').AsInteger :=
    dsDoc.FieldByName(GetNombreCampoNroDoc).AsInteger;
  stpRecibos.ParamByName('pSERIE_FACTURA').AsString :=
    dsDoc.FieldByName(GetNombreCampoSerieDoc).AsString;
  stpRecibos.ExecProc;

  // Refrescar el dataset de recibos
  qryRecibos.Refresh;
end;

procedure TdmDocConRecibos.CambiarEstadoRecibo(const sEstado: string);
var
  qryRecibos: TUniQuery;
begin
  qryRecibos := GetDatasetRecibos;

  with qryRecibos do
  begin
    if not ((State = dsEdit) or (State = dsInsert)) then
      Edit;

    FieldByName('ESTADO_RECIBO').AsString := sEstado;

    if sEstado = 'Pagado' then
      FieldByName('FECHA_PAGO').AsDateTime := Trunc(Now)
    else if (sEstado = 'Emitido') or (sEstado = 'Devuelto') then
      FieldByName('FECHA_PAGO').AsVariant := null;

    Post;
  end;
end;

end.
