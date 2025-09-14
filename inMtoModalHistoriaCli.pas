unit inMtoModalHistoriaCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlue,
  cxTextEdit, cxMemo, cxDBEdit, UniDataClientes, DB;

type
  TfrmModalHistoriaCli = class(TForm)
    cxdbmHistoria: TcxDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModalHistoriaCli: TfrmModalHistoriaCli;

implementation

{$R *.dfm}

procedure TfrmModalHistoriaCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ((cxdbmHistoria.DataBinding.DataSource.DataSet.state = dsInsert) or
      (cxdbmHistoria.DataBinding.DataSource.DataSet.state = dsEdit)      ) then
       cxdbmHistoria.DataBinding.DataSource.DataSet.Post;
end;

end.
