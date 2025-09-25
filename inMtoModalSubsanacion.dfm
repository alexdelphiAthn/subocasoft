object frmModalSubsanacion: TfrmModalSubsanacion
  Left = 0
  Top = 0
  Caption = 'Subsanaci'#243'n Manual de Factura'
  ClientHeight = 619
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Lucida Sans'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 19
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 560
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object gbDatosBasicos: TcxGroupBox
      Left = 15
      Top = 15
      Caption = ' Datos B'#225'sicos de la Factura '
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      TabOrder = 0
      Height = 140
      Width = 870
      object lblNumeroFacturaOriginal: TcxLabel
        Left = 20
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblNumeroFactura: TcxLabel
        Left = 20
        Top = 58
        Caption = 'N'#250'mero Factura:'
      end
      object txtNumeroFactura: TcxTextEdit
        Left = 169
        Top = 55
        Enabled = False
        TabOrder = 2
        Width = 161
      end
      object lblFechaFacturaOriginal: TcxLabel
        Left = 350
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblFechaFactura: TcxLabel
        Left = 350
        Top = 58
        Caption = 'Fecha Factura:'
      end
      object dteFechaFactura: TcxDateEdit
        Left = 480
        Top = 55
        Enabled = False
        TabOrder = 5
        Width = 130
      end
      object lblTipoFacturaOriginal: TcxLabel
        Left = 630
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblTipoFactura: TcxLabel
        Left = 630
        Top = 58
        Caption = 'Tipo Factura:'
      end
      object cbbTipoFactura: TcxComboBox
        Left = 750
        Top = 55
        Enabled = False
        TabOrder = 8
        Width = 110
      end
      object chkEsSubsanacion: TcxCheckBox
        Left = 20
        Top = 95
        Caption = 'Marcar como subsanaci'#243'n (isFix: true)'
        Enabled = False
        Style.TextColor = clMaroon
        TabOrder = 9
      end
    end
    object gbDatosCliente: TcxGroupBox
      Left = 15
      Top = 170
      Caption = ' Datos del Cliente '
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      TabOrder = 1
      Height = 140
      Width = 870
      object lblNIFClienteOriginal: TcxLabel
        Left = 20
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblNIFCliente: TcxLabel
        Left = 20
        Top = 58
        Caption = 'NIF/ID Cliente:'
      end
      object txtNIFCliente: TcxTextEdit
        Left = 150
        Top = 55
        TabOrder = 2
        Width = 180
      end
      object lblNombreClienteOriginal: TcxLabel
        Left = 350
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblNombreCliente: TcxLabel
        Left = 350
        Top = 58
        Caption = 'Raz'#243'n Social:'
      end
      object txtNombreCliente: TcxTextEdit
        Left = 473
        Top = 55
        TabOrder = 5
        Width = 377
      end
      object lblPaisClienteOriginal: TcxLabel
        Left = 20
        Top = 88
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblPaisCliente: TcxLabel
        Left = 20
        Top = 108
        Caption = 'Pa'#237's:'
      end
      object txtPaisCliente: TcxTextEdit
        Left = 150
        Top = 105
        Properties.OnChange = txtPaisClientePropertiesChange
        TabOrder = 8
        Text = 'ES'
        Width = 100
      end
      object lblTipoIdInternacionalOriginal: TcxLabel
        Left = 276
        Top = 88
        Caption = 'Original: '
        Style.TextColor = clGray
        Visible = False
      end
      object lblTipoIdInternacional: TcxLabel
        Left = 276
        Top = 108
        Caption = 'Tipo Id Internacional:'
        Visible = False
      end
      object txtTipoIdInternacional: TcxTextEdit
        Left = 468
        Top = 105
        TabOrder = 11
        Visible = False
        Width = 100
      end
      object cbbTipoIdInternacional: TcxComboBox
        Left = 468
        Top = 103
        TabOrder = 12
        Visible = False
        Width = 219
      end
    end
    object gbDescripcion: TcxGroupBox
      Left = 5
      Top = 316
      Caption = ' Descripci'#243'n de la Operaci'#243'n '
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      TabOrder = 2
      Height = 140
      Width = 870
      object lblDescripcionOriginal: TcxLabel
        Left = 20
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblDescripcion: TcxLabel
        Left = 20
        Top = 58
        Caption = 'Descripci'#243'n:'
      end
      object memoDescripcion: TcxMemo
        Left = 150
        Top = 55
        Enabled = False
        TabOrder = 2
        Height = 50
        Width = 403
      end
      object lblFechaOperacionOriginal: TcxLabel
        Left = 590
        Top = 30
        Caption = 'Original: '
        Style.TextColor = clGray
      end
      object lblFechaOperacion: TcxLabel
        Left = 576
        Top = 59
        Caption = 'Fecha Operaci'#243'n:'
      end
      object dteFechaOperacion: TcxDateEdit
        Left = 720
        Top = 55
        TabOrder = 5
        Width = 140
      end
    end
    object cxgrpbxTotales: TcxGroupBox
      Left = 0
      Top = 462
      Caption = ' Totales '
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      TabOrder = 3
      Height = 94
      Width = 875
      object lblTotalFacturaOriginal: TcxLabel
        Left = 613
        Top = 24
        Caption = 'Original Total: '
        Style.TextColor = clGray
      end
      object lblTotalFactura: TcxLabel
        Left = 677
        Top = 57
        Caption = 'Total:'
      end
      object currTotalFactura: TcxCurrencyEdit
        Left = 750
        Top = 53
        Properties.DisplayFormat = '#,##0.00'
        Properties.ReadOnly = False
        Style.Color = clInfoBk
        TabOrder = 2
        Width = 100
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 560
    Width = 892
    Height = 59
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      892
      59)
    object btnAceptar: TcxButton
      Left = 650
      Top = 10
      Width = 95
      Height = 32
      Anchors = [akTop, akRight]
      Caption = '&Subsanar'
      Default = True
      LookAndFeel.SkinName = 'Blue'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TcxButton
      Left = 751
      Top = 10
      Width = 95
      Height = 32
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancelar'
      LookAndFeel.SkinName = 'Blue'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
