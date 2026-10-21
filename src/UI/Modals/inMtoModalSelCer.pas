unit inMtoModalSelCer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  StdCtrls, ExtCtrls, cxButtons, cxControls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid,
  inLibCertificates;

type
  // Datos del certificado elegido en el almacén de Windows
  TCertificadoSeleccionado = record
    Tipo: string;
    Titular: string;
    Nombre: string;
    Emisor: string;
    FechaHasta: string;
    NumeroSerie: string;
  end;

  TfrmModalSelCer = class(TForm)
    pnl1: TPanel;
    btnCancelar: TcxButton;
    btnAceptar: TcxButton;
    cxgrdCertificados: TcxGrid;
    tvCertificados: TcxGridTableView;
    colTipoCertificado: TcxGridColumn;
    colTitularCertificado: TcxGridColumn;
    colNombreCertificado: TcxGridColumn;
    colEmisorCertificado: TcxGridColumn;
    colFechaHastaCertificado: TcxGridColumn;
    colNumeroSerieCertificado: TcxGridColumn;
    lvCertificados: TcxGridLevel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvCertificadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// Muestra el almacén personal de Windows y devuelve el certificado elegido.
function SeleccionarCertificado(out ACertificado: TCertificadoSeleccionado):
                                                                        Boolean;

implementation

{$R *.dfm}

function SeleccionarCertificado(out ACertificado: TCertificadoSeleccionado):
                                                                        Boolean;
var
  frmSelCer: TfrmModalSelCer;
  oRegistro: TcxCustomGridRecord;
begin
  Result := False;
  ACertificado := Default(TCertificadoSeleccionado);
  frmSelCer := TfrmModalSelCer.Create(Application);
  try
    if frmSelCer.ShowModal = mrOk then
    begin
      oRegistro := frmSelCer.tvCertificados.Controller.FocusedRecord;
      if Assigned(oRegistro) then
      begin
        ACertificado.Tipo := VarToStr(oRegistro.Values[COLUMNA_CER_TIPO]);
        ACertificado.Titular :=
                             VarToStr(oRegistro.Values[COLUMNA_CER_TITULAR]);
        ACertificado.Nombre := VarToStr(oRegistro.Values[COLUMNA_CER_NOMBRE]);
        ACertificado.Emisor := VarToStr(oRegistro.Values[COLUMNA_CER_EMISOR]);
        ACertificado.FechaHasta :=
                          VarToStr(oRegistro.Values[COLUMNA_CER_FECHAHASTA]);
        ACertificado.NumeroSerie :=
                            VarToStr(oRegistro.Values[COLUMNA_CER_NROSERIE]);
        Result := True;
      end;
    end;
  finally
    FreeAndNil(frmSelCer);
  end;
end;

procedure TfrmModalSelCer.btnAceptarClick(Sender: TObject);
begin
  if tvCertificados.Controller.FocusedRecord = nil then
    ShowMessage('Debe seleccionar un certificado.')
  else
    ModalResult := mrOk;
end;

procedure TfrmModalSelCer.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmModalSelCer.FormCreate(Sender: TObject);
begin
  Position := poScreenCenter;
  CargarCertificados(tvCertificados);
  tvCertificados.ApplyBestFit;
  if tvCertificados.DataController.RecordCount = 0 then
    btnAceptar.Enabled := False;
end;

procedure TfrmModalSelCer.tvCertificadosDblClick(Sender: TObject);
begin
  btnAceptarClick(Sender);
end;

end.
