object frmFacturasHistoria: TfrmFacturasHistoria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Historia'
  ClientHeight = 454
  ClientWidth = 474
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 17
  object cxdbmHistoria: TcxDBMemo
    Left = 0
    Top = 0
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    DataBinding.DataField = 'DESCRIPCION_HISTORIA'
    Properties.ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 470
    ExplicitHeight = 453
    Height = 454
    Width = 474
  end
end
