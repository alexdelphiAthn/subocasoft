object frmGenPreFac: TfrmGenPreFac
  Left = 516
  Top = 286
  HorzScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Generar Factura'
  ClientHeight = 331
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  FormStyle = fsStayOnTop
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 23
  object cxlbl1: TcxLabel
    Left = 8
    Top = 4
    Caption = 'Documento Origen N'#250'mero'
  end
  object edtNumFacOrigen: TcxTextEdit
    Left = 80
    Top = 34
    Enabled = False
    TabOrder = 3
    Width = 129
  end
  object pnl1: TPanel
    Left = 277
    Top = 0
    Width = 147
    Height = 331
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 273
    ExplicitHeight = 330
    object btn3: TcxButton
      Left = 0
      Top = 282
      Width = 145
      Height = 49
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btn3Click
    end
    object btnGenerar: TcxButton
      Left = 0
      Top = 240
      Width = 145
      Height = 49
      Caption = 'Generar'
      TabOrder = 0
      OnClick = btnGenerarClick
    end
  end
  object cxgrpFactura: TcxGroupBox
    Left = 8
    Top = 251
    Caption = 'Factura Generada'
    TabOrder = 8
    Height = 67
    Width = 209
    object edtNumFacAbono: TcxTextEdit
      Left = 72
      Top = 24
      Enabled = False
      TabOrder = 1
      Width = 129
    end
    object edtSerieFacAbono: TcxTextEdit
      Left = 24
      Top = 24
      Enabled = False
      TabOrder = 0
      Width = 41
    end
  end
  object edtSerieOrigen: TcxTextEdit
    Left = 32
    Top = 34
    Enabled = False
    TabOrder = 2
    Width = 41
  end
  object cxlbl8: TcxLabel
    Left = 16
    Top = 130
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Serie Factura'
  end
  object cmbSerieFactura: TcxLookupComboBox
    Left = 16
    Top = 154
    Properties.KeyFieldNames = 'SERIE_CONTADOR'
    Properties.ListColumns = <
      item
        FieldName = 'SERIE_CONTADOR'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmPre.dsSeriesFac
    Properties.ReadOnly = False
    TabOrder = 4
    Width = 145
  end
  object cxlbl2: TcxLabel
    Left = 16
    Top = 183
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Fecha Factura'
  end
  object dtFecha: TcxDateEdit
    Left = 16
    Top = 210
    TabOrder = 5
    Width = 145
  end
  object edtNroFactura: TcxTextEdit
    Left = 16
    Top = 99
    TabOrder = 9
    Text = '0'
    Width = 121
  end
  object cxlbl3: TcxLabel
    Left = 16
    Top = 72
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Nro Factura'
  end
end
