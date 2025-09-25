object frmGenFacRec: TfrmGenFacRec
  Left = 516
  Top = 286
  HorzScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Duplicar/Abonar Borrador de Venta'
  ClientHeight = 339
  ClientWidth = 485
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
    Caption = 'Origen N'#250'mero'
  end
  object edtNumFacOrigen: TcxTextEdit
    Left = 80
    Top = 35
    Enabled = False
    TabOrder = 3
    Width = 129
  end
  object pnl1: TPanel
    Left = 328
    Top = 0
    Width = 157
    Height = 272
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 324
    ExplicitHeight = 313
    object btn3: TcxButton
      Left = 0
      Top = 274
      Width = 153
      Height = 40
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btn3Click
    end
    object btnGenerar: TcxButton
      Left = 0
      Top = 6
      Width = 153
      Height = 51
      Caption = 'Generar'
      TabOrder = 0
      OnClick = btnGenerarClick
    end
  end
  object chkAbonar: TcxCheckBox
    Left = 16
    Top = 65
    Caption = 'Generar Abono'
    TabOrder = 4
    OnClick = chkAbonarClick
  end
  object cxgrpbx1: TcxGroupBox
    Left = 0
    Top = 272
    Align = alBottom
    Caption = 'Borrador de Venta Generado'
    TabOrder = 10
    ExplicitLeft = 8
    ExplicitTop = 247
    ExplicitWidth = 297
    Height = 67
    Width = 485
    object edtNumFacAbono: TcxTextEdit
      Left = 72
      Top = 32
      Enabled = False
      TabOrder = 1
      Width = 129
    end
    object edtSerieFacAbono: TcxTextEdit
      Left = 24
      Top = 32
      Enabled = False
      TabOrder = 0
      Width = 41
    end
  end
  object edtSerieOrigen: TcxTextEdit
    Left = 32
    Top = 35
    Enabled = False
    TabOrder = 2
    Width = 41
  end
  object chkDuplicar: TcxCheckBox
    Left = 16
    Top = 89
    Caption = 'Duplicar'
    TabOrder = 5
    OnClick = chkDuplicarClick
  end
  object cxlbl8: TcxLabel
    Left = 9
    Top = 117
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Serie'
  end
  object cmbSerieFactura: TcxLookupComboBox
    Left = 35
    Top = 143
    Properties.KeyFieldNames = 'SERIE_CONTADOR'
    Properties.ListColumns = <
      item
        FieldName = 'SERIE_CONTADOR'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmFac.dsSeries
    Properties.ReadOnly = False
    TabOrder = 6
    Width = 190
  end
  object cxlbl2: TcxLabel
    Left = 9
    Top = 175
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Fecha'
  end
  object dtFecha: TcxDateEdit
    Left = 35
    Top = 201
    TabOrder = 7
    Width = 190
  end
end
