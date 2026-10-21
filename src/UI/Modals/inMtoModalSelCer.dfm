object frmModalSelCer: TfrmModalSelCer
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Seleccionar certificado del almac'#233'n de Windows'
  ClientHeight = 300
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 255
    Width = 1071
    Height = 45
    Align = alBottom
    TabOrder = 1
    object btnCancelar: TcxButton
      Left = 10
      Top = 8
      Width = 177
      Height = 29
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnAceptar: TcxButton
      Left = 248
      Top = 8
      Width = 177
      Height = 29
      Caption = '&Aceptar'
      Default = True
      TabOrder = 1
      OnClick = btnAceptarClick
    end
  end
  object cxgrdCertificados: TcxGrid
    Left = 0
    Top = 0
    Width = 1071
    Height = 255
    Align = alClient
    TabOrder = 0
    object tvCertificados: TcxGridTableView
      OnDblClick = tvCertificadosDblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object colTipoCertificado: TcxGridColumn
        Caption = 'Tipo'
        Width = 100
      end
      object colTitularCertificado: TcxGridColumn
        Caption = 'Titular/Empresa'
        Width = 250
      end
      object colNombreCertificado: TcxGridColumn
        Caption = 'Nombre'
        Width = 250
      end
      object colEmisorCertificado: TcxGridColumn
        Caption = 'Emisor'
        Width = 200
      end
      object colFechaHastaCertificado: TcxGridColumn
        Caption = 'V'#225'lido hasta'
        Width = 120
      end
      object colNumeroSerieCertificado: TcxGridColumn
        Caption = 'N'#250'mero de serie'
        Width = 150
      end
    end
    object lvCertificados: TcxGridLevel
      GridView = tvCertificados
    end
  end
end
