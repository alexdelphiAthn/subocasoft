object frmPrintCliEti: TfrmPrintCliEti
  Left = 506
  Top = 279
  HorzScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Imprimir Etiquetas Cliente'
  ClientHeight = 242
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  FormStyle = fsStayOnTop
  Scaled = False
  TextHeight = 23
  object pnl1: TPanel
    Left = 248
    Top = 0
    Width = 189
    Height = 242
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 244
    ExplicitHeight = 241
    object btn4: TcxButton
      Left = 0
      Top = 0
      Width = 185
      Height = 40
      Caption = 'PDF'
      TabOrder = 0
      OnClick = btn4Click
    end
    object btn2: TcxButton
      Left = 0
      Top = 42
      Width = 185
      Height = 43
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btn2Click
    end
    object btnVistaPreliminar: TcxButton
      Left = 0
      Top = 86
      Width = 185
      Height = 46
      Caption = 'Vista Preliminar'
      TabOrder = 2
      OnClick = btnVistaPreliminarClick
    end
    object btn3: TcxButton
      Left = 1
      Top = 192
      Width = 187
      Height = 49
      Align = alBottom
      Caption = 'Salir'
      TabOrder = 3
      OnClick = btn3Click
      ExplicitTop = 191
    end
  end
  object edtCodCli: TcxTextEdit
    Left = 11
    Top = 26
    Enabled = False
    TabOrder = 2
    Width = 182
  end
  object cxlbl1: TcxLabel
    Left = 8
    Top = -2
    Caption = 'C'#243'digo Cliente'
  end
  object cxRadioGroup1: TcxRadioGroup
    Left = 8
    Top = 61
    Caption = 'Opciones'
    Properties.Items = <>
    TabOrder = 3
    Height = 180
    Width = 185
    object cxlbl2: TcxLabel
      Left = 23
      Top = 37
      Caption = 'Dejar espacios en blanco antes de imprimir'
      Properties.WordWrap = True
      Width = 159
    end
    object speDejarBlancos: TcxSpinEdit
      Left = 24
      Top = 116
      TabOrder = 1
      Width = 121
    end
  end
  object frxrprt1: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42481.634675740700000000
    ReportOptions.LastChange = 43866.442975648100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.          ')
    Left = 376
    Top = 128
    Datasets = <
      item
        DataSet = DMClientes.fxdsPrintCli
        DataSetName = 'Clientes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      TopMargin = 3.400000000000000000
      BottomMargin = 3.400000000000000000
      Columns = 2
      ColumnWidth = 105.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '105')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 109.606299210000000000
        Top = 18.897650000000000000
        Width = 396.850650000000000000
        DataSet = DMClientes.fxdsPrintCli
        DataSetName = 'Clientes'
        RowCount = 0
        object FacturasRAZONSOCIAL_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 15.118120000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          DataField = 'RAZONSOCIAL_CLIENTE'
          DataSet = DMClientes.fxdsPrintCli
          DataSetName = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Clientes."RAZONSOCIAL_CLIENTE"]')
          ParentFont = False
        end
        object FacturasDIRECCION1_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 35.015770000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataField = 'DIRECCION1_CLIENTE'
          DataSet = DMClientes.fxdsPrintCli
          DataSetName = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Clientes."DIRECCION1_CLIENTE"]')
          ParentFont = False
        end
        object FacturasCPOSTAL_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 53.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CPOSTAL_CLIENTE'
          DataSet = DMClientes.fxdsPrintCli
          DataSetName = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Clientes."CPOSTAL_CLIENTE"]')
          ParentFont = False
        end
        object FacturasPOBLACION_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 79.149660000000000000
          Top = 53.913420000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataField = 'POBLACION_CLIENTE'
          DataSet = DMClientes.fxdsPrintCli
          DataSetName = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Clientes."POBLACION_CLIENTE"]')
          ParentFont = False
        end
        object FacturasPROVINCIA_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 76.590600000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataField = 'PROVINCIA_CLIENTE'
          DataSet = DMClientes.fxdsPrintCli
          DataSetName = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Clientes."PROVINCIA_CLIENTE"]')
          ParentFont = False
        end
      end
    end
  end
  object frxpdfPedWeb: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 296
    Top = 128
  end
end
