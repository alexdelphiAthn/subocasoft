object frmMtoGenerarQR: TfrmMtoGenerarQR
  Left = 0
  Top = 0
  Caption = 'GenerarQR'
  ClientHeight = 426
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pb1: TPaintBox
    Left = 144
    Top = 88
    Width = 300
    Height = 300
    OnPaint = pb1Paint
  end
  object edtText: TEdit
    Left = 144
    Top = 32
    Width = 329
    Height = 23
    TabOrder = 0
  end
  object btnGenerarQR: TButton
    Left = 504
    Top = 31
    Width = 75
    Height = 25
    Caption = 'QR'
    TabOrder = 1
    OnClick = btnGenerarQRClick
  end
end
