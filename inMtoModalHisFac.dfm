object frmModalHisFac: TfrmModalHisFac
  Left = 516
  Top = 286
  HorzScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Generar Factura'
  ClientHeight = 258
  ClientWidth = 410
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
  object pnl1: TPanel
    Left = 256
    Top = 0
    Width = 154
    Height = 258
    Align = alRight
    TabOrder = 0
    object btnSalir: TcxButton
      Left = 7
      Top = 143
      Width = 109
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
    end
    object btnGenerar: TcxButton
      Left = 7
      Top = 120
      Width = 109
      Height = 25
      Caption = 'Generar'
      TabOrder = 0
      OnClick = btnGenerarClick
    end
  end
  object cxlbl8: TcxLabel
    Left = 24
    Top = 78
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Serie Factura'
  end
  object cmbSerieFactura: TcxLookupComboBox
    Left = 24
    Top = 105
    Properties.KeyFieldNames = 'SERIE_CONTADOR'
    Properties.ListColumns = <
      item
        FieldName = 'SERIE_CONTADOR'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ReadOnly = False
    TabOrder = 1
    Width = 145
  end
  object cxlbl2: TcxLabel
    Left = 24
    Top = 143
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Fecha Factura'
  end
  object dtFecha: TcxDateEdit
    Left = 24
    Top = 177
    TabOrder = 2
    Width = 153
  end
  object edtNroFactura: TcxTextEdit
    Left = 24
    Top = 40
    TabOrder = 5
    Text = '0'
    Width = 121
  end
  object cxlbl3: TcxLabel
    Left = 24
    Top = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Nro Factura'
  end
end
