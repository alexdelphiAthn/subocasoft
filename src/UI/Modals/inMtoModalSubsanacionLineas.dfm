object frmModalSubsanacionLineas: TfrmModalSubsanacionLineas
  Left = 0
  Top = 0
  Caption = 'Detalle de L'#237'neas - Subsanaci'#243'n'
  ClientHeight = 390
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Lucida Sans'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1068
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Lucida Sans'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      1068
      342)
    object gbLineasDetalle: TcxGroupBox
      Left = 8
      Top = 8
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'L'#237'neas de Detalle'
      Style.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      TabOrder = 0
      Height = 230
      Width = 1036
      object grdLineas: TcxGrid
        Left = 2
        Top = 24
        Width = 1032
        Height = 204
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object tvLineas: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnEditValueChanged = tvLineasEditValueChanged
          DataController.DataSource = dsLineas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object colDescripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'DESCRIPCION_LINEA'
            Options.Editing = False
            Width = 297
          end
          object colCantidad: TcxGridDBColumn
            Caption = 'Cantidad'
            DataBinding.FieldName = 'CANTIDAD_LINEA'
            Options.Editing = False
            Width = 142
          end
          object colImporteUnitarioOriginal: TcxGridDBColumn
            Caption = 'Imp. Unit. Original'
            DataBinding.FieldName = 'IMPORTE_UNITARIO_ORIGINAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            OnGetDisplayText = colImporteUnitarioActualGetDisplayText
            Options.Editing = False
            Width = 211
          end
          object colImporteUnitarioActual: TcxGridDBColumn
            Caption = 'Imp. Unit. Actual'
            DataBinding.FieldName = 'IMPORTE_UNITARIO_ACTUAL'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  EFBBBF3C3F786D6C2076657273696F6E3D27312E302720656E636F64696E673D
                  275554462D38273F3E0D0A3C7376672076657273696F6E3D22312E3122206964
                  3D224C61796572312220786D6C6E733D22687474703A2F2F7777772E77332E6F
                  72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F
                  2F7777772E77332E6F72672F313939392F786C696E6B2220783D223070782220
                  793D22307078222076696577426F783D2230203020333220333222207374796C
                  653D22656E61626C652D6261636B67726F756E643A6E65772030203020333220
                  33323B2220786D6C3A73706163653D227072657365727665223E0D0A20203C73
                  74796C6520747970653D22746578742F637373223E0D0A202020202E426C7565
                  0D0A202020207B0D0A20202020202066696C6C3A233131373744373B0D0A2020
                  20202020666F6E742D66616D696C793A2764782D666F6E742D69636F6E73273B
                  0D0A202020202020666F6E742D73697A653A333270783B0D0A202020207D0D0A
                  20203C2F7374796C653E0D0A20203C7465787420783D22302220793D22333222
                  20636C6173733D22426C7565223EEF9E8C3C2F746578743E0D0A3C2F7376673E
                  223B}
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = colImporteUnitarioActualPropertiesButtonClick
            OnGetDisplayText = colImporteUnitarioActualGetDisplayText
            Width = 185
          end
          object colImporteTotalLinea: TcxGridDBColumn
            Caption = 'Total L'#237'nea'
            DataBinding.FieldName = 'IMPORTE_TOTAL_LINEA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = '#,##0.00'
            Options.Editing = False
            Width = 153
          end
        end
        object lvLineas: TcxGridLevel
          GridView = tvLineas
        end
      end
    end
    object pnlTotales: TPanel
      Left = 8
      Top = 246
      Width = 1036
      Height = 88
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblTotalOriginal: TcxLabel
        Left = 16
        Top = 8
        Caption = 'Total Objetivo: 0,00 '#8364
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lblTotalActual: TcxLabel
        Left = 16
        Top = 32
        Caption = 'Total Actual: 0,00 '#8364
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lblDiferencia: TcxLabel
        Left = 16
        Top = 56
        Caption = 'Diferencia: 0,00 '#8364
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lblStateDataset: TcxLabel
        Left = 911
        Top = 11
        Caption = 'State'
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 342
    Width = 1068
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Lucida Sans'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      1068
      48)
    object btnAceptar: TcxButton
      Left = 907
      Top = 3
      Width = 132
      Height = 40
      Anchors = [akTop, akRight]
      Caption = '&Aceptar'
      Default = True
      LookAndFeel.Kind = lfOffice11
      ModalResult = 1
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        61796572312220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F
        323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777
        772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D22
        307078222076696577426F783D2230203020333220333222207374796C653D22
        656E61626C652D6261636B67726F756E643A6E6577203020302033322033323B
        2220786D6C3A73706163653D227072657365727665223E262331333B26233130
        3B20203C7374796C6520747970653D22746578742F6373732220786D6C3A7370
        6163653D227072657365727665223E2E59656C6C6F77262331333B262331303B
        202020207B262331333B262331303B20202020202066696C6C3A234646423131
        353B262331333B262331303B202020202020666F6E742D66616D696C793A2661
        706F733B64782D666F6E742D69636F6E732661706F733B3B262331333B262331
        303B202020202020666F6E742D73697A653A333270783B262331333B26233130
        3B202020207D262331333B262331303B20203C2F7374796C653E0D0A3C746578
        7420783D22302220793D2233322220636C6173733D2259656C6C6F77223EEF9E
        8C3C2F746578743E0D0A3C2F7376673E0D0A}
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      OnClick = btnAceptarClick
    end
  end
  object dsLineas: TDataSource
    DataSet = qryLineas
    OnStateChange = dsLineasStateChange
    Left = 200
    Top = 200
  end
  object qryLineas: TUniQuery
    Left = 136
    Top = 200
  end
end
