
unit UniDataArticulos;

interface

uses
  SysUtils, Classes, DB, inMtoPrincipal, MemDS, DBAccess, Uni;

type
  TDMArticulos = class(TDataModule)
    unqryArticulos: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    //dmConn:TdmConn;
  public
    constructor Create(AOwner: TComponent);

  end;

var
  dmArticulos: TDMArticulos;

implementation

uses
  inMtoArticulos;

{$R *.dfm}

constructor TDMArticulos.Create(AOwner: TComponent);
begin
  //dmConn := TdmConn.Create(dmConn);
  //dmConn.ZconnGlent.Connect;

  inherited;
end;

procedure TDMArticulos.DataModuleCreate(Sender: TObject);
begin
  inherited;
  with frmopenapp do
  begin
    unqryArticulos.Connection := FdmConn.conUni;

  end;
  unqryArticulos.Open;

end;

procedure TDMArticulos.DataModuleDestroy(Sender: TObject);
begin
  unqryArticulos.Close;
  //dmConn.ZconnGlent.Disconnect;
  //dmConn.Free;
end;

end.
