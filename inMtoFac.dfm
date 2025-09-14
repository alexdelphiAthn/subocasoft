inherited frmMtoFac: TfrmMtoFac
  Top = 0
  Caption = 'Borrador de Venta'
  ClientHeight = 604
  ClientWidth = 1234
  Font.Height = -15
  ExplicitWidth = 1250
  ExplicitHeight = 643
  PixelsPerInch = 96
  TextHeight = 17
  inherited pButtonPage: TPanel
    Width = 1044
    Height = 604
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 1044
    ExplicitHeight = 604
  end
  inherited pButtonRightBar: TPanel
    Left = 1044
    Width = 190
    Height = 604
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Height = -15
    ParentFont = False
    ExplicitLeft = 1044
    ExplicitWidth = 190
    ExplicitHeight = 604
    object btnRectificar: TSpeedButton [0]
      Left = 3
      Top = 250
      Width = 183
      Height = 27
      Cursor = crHandPoint
      Caption = '&Dupl. '#243' Abonar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      OnClick = btnRectificarClick
    end
    object btnImprimir: TSpeedButton [1]
      Left = 3
      Top = 350
      Width = 183
      Height = 27
      Cursor = crHandPoint
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      OnClick = btnImprimirClick
    end
    object btnNuevaFactura: TSpeedButton [2]
      Left = 3
      Top = 200
      Width = 183
      Height = 27
      Cursor = crHandPoint
      Caption = '&Nueva'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      OnClick = btnNuevaFacturaClick
    end
    object btnConsolidar: TSpeedButton [3]
      Left = 7
      Top = 406
      Width = 183
      Height = 27
      Cursor = crHandPoint
      Caption = '&Consolidar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      OnClick = btnConsolidarClick
    end
    inherited pButtonGen: TPanel
      Top = 477
      Width = 188
      Height = 126
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Constraints.MinHeight = 80
      Constraints.MinWidth = 79
      ExplicitTop = 477
      ExplicitWidth = 188
      ExplicitHeight = 126
      inherited sbGrabar: TSpeedButton
        Left = 2
        Top = 16
        Width = 183
        Height = 35
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 2
        ExplicitTop = 16
        ExplicitWidth = 183
        ExplicitHeight = 35
      end
      inherited sbCancelar: TSpeedButton
        Left = 2
        Top = 56
        Width = 183
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 2
        ExplicitTop = 56
        ExplicitWidth = 183
        ExplicitHeight = 29
      end
      inherited sbSalir: TSpeedButton
        Left = 2
        Top = 91
        Width = 183
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 2
        ExplicitTop = 91
        ExplicitWidth = 183
        ExplicitHeight = 29
      end
    end
    inherited pButtonBDStat: TPanel
      Width = 188
      Height = 70
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Constraints.MinHeight = 37
      Constraints.MinWidth = 79
      ExplicitWidth = 188
      ExplicitHeight = 70
      inherited pnTableName: TPanel
        Top = 14
        Width = 188
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 14
        ExplicitWidth = 188
        ExplicitHeight = 16
        inherited lblEditMode: TLabel
          Width = 188
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitTop = 0
          ExplicitWidth = 79
          ExplicitHeight = 14
        end
      end
      inherited Panel4: TPanel
        Width = 188
        Height = 14
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 188
        ExplicitHeight = 14
        inherited lblTablaOrigen: TLabel
          Width = 188
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitWidth = 79
          ExplicitHeight = 14
        end
      end
    end
    inherited cxdbnvgtr2: TcxDBNavigator
      Left = 7
      Top = 30
      Height = 27
      ExplicitLeft = 7
      ExplicitTop = 30
      ExplicitHeight = 27
    end
    object lblNroFacturaCab: TcxLabel
      Left = 29
      Top = 146
    end
    object lblNroFacturaLin: TcxLabel
      Left = 29
      Top = 173
    end
  end
  inherited pcPantalla: TPageControl
    Width = 1044
    Height = 604
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 1044
    ExplicitHeight = 604
    inherited tsLista: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 1036
      ExplicitHeight = 564
      inherited cxGrdPrincipal: TcxGrid
        Top = 38
        Width = 1036
        Height = 526
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 38
        ExplicitWidth = 1036
        ExplicitHeight = 526
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          FilterRow.SeparatorWidth = 5
          FixedDataRows.SeparatorWidth = 5
          NewItemRow.SeparatorWidth = 5
          OptionsView.NavigatorOffset = 40
          OptionsView.IndicatorWidth = 10
          Preview.LeftIndent = 16
          Preview.RightIndent = 4
          object dbcGrdDBTabPrinCONSOLIDACION_FACTURA: TcxGridDBColumn
            Caption = 'Consolidada'
            DataBinding.FieldName = 'CONSOLIDACION_FACTURA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ReadOnly = True
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Width = 128
          end
          object dbcGrdDBTabPrinFASE_CONSOLIDACION_FACTURA: TcxGridDBColumn
            Caption = 'Fase Consolidacion'
            DataBinding.FieldName = 'FASE_CONSOLIDACION_FACTURA'
            OnCustomDrawCell = dbcGrdDBTabPrinFASE_CONSOLIDACION_FACTURACustomDrawCell
            Width = 198
          end
          object cxgrdbclmnGrdDBTabPrinSERIE_FACTURA: TcxGridDBColumn
            Caption = 'Serie'
            DataBinding.FieldName = 'SERIE_FACTURA'
            MinWidth = 16
            Width = 77
          end
          object cxgrdbclmnGrdDBTabPrinNRO_FACTURA: TcxGridDBColumn
            Caption = 'Nro Doc'
            DataBinding.FieldName = 'NRO_FACTURA'
            MinWidth = 16
            Width = 115
          end
          object dbcGrdDBTabPrinESSIMPL_FACTURA: TcxGridDBColumn
            Caption = 'Simplificada'
            DataBinding.FieldName = 'ESSIMPL_FACTURA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Width = 132
          end
          object cxgrdbclmnGrdDBTabPrinFECHA_FACTURA: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'FECHA_FACTURA'
            PropertiesClassName = 'TcxDateEditProperties'
            MinWidth = 16
            Width = 126
          end
          object cxgrdbclmnGrdDBTabPrinTOTAL_LIQUIDO_FACTURA: TcxGridDBColumn
            Caption = 'Total Liquido'
            DataBinding.FieldName = 'TOTAL_LIQUIDO_FACTURA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            MinWidth = 16
            Width = 156
          end
          object cxgrdbclmnGrdDBTabPrinAPELLIDOS: TcxGridDBColumn
            Caption = 'Apellidos'
            DataBinding.FieldName = 'APELLIDOS'
            MinWidth = 16
            Width = 204
          end
          object cxgrdbclmnGrdDBTabPrinNOMBRE: TcxGridDBColumn
            Caption = 'Nombre'
            DataBinding.FieldName = 'NOMBRE'
            MinWidth = 16
            Width = 131
          end
          object cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'C'#243'digo Cliente'
            DataBinding.FieldName = 'CODIGO_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 157
          end
          object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Raz'#243'n Social'
            DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 319
          end
          object cxgrdbclmnGrdDBTabPrinNIF_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Nif'
            DataBinding.FieldName = 'NIF_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 107
          end
          object cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'M'#243'vil'
            DataBinding.FieldName = 'MOVIL_CLIENTE_FACTURA'
            PropertiesClassName = 'TcxTextEditProperties'
            MinWidth = 16
            Width = 120
          end
          object cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Email'
            DataBinding.FieldName = 'EMAIL_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 117
          end
          object cxgrdbclmnGrdDBTabPrinDIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Direcci'#243'n 1'
            DataBinding.FieldName = 'DIRECCION1_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 145
          end
          object cxgrdbclmnGrdDBTabPrinDIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Direcci'#243'n 2'
            DataBinding.FieldName = 'DIRECCION2_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 145
          end
          object cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Poblaci'#243'n'
            DataBinding.FieldName = 'POBLACION_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 142
          end
          object cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Provincia'
            DataBinding.FieldName = 'PROVINCIA_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 138
          end
          object cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'C'#243'digo Postal'
            DataBinding.FieldName = 'CPOSTAL_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 147
          end
          object cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE_FACTURA: TcxGridDBColumn
            Caption = 'Pais'
            DataBinding.FieldName = 'PAIS_CLIENTE_FACTURA'
            MinWidth = 16
            Width = 110
          end
          object cxgrdbclmnGrdDBTabPrinFORMA_PAGO_FACTURA: TcxGridDBColumn
            Caption = 'Forma Pago'
            DataBinding.FieldName = 'FORMA_PAGO_FACTURA'
            MinWidth = 16
          end
        end
      end
      inherited pnTopGrid: TPanel
        Width = 1036
        Height = 38
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 1036
        ExplicitHeight = 38
        inherited dxbvl1: TdxBevel
          Left = 4
          Width = 514
          Height = 19
          ExplicitLeft = 4
          ExplicitWidth = 514
          ExplicitHeight = 19
        end
        inherited btnRestoreWindow: TSpeedButton
          Left = 494
          Top = 3
          Width = 16
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 494
          ExplicitTop = 3
          ExplicitWidth = 16
          ExplicitHeight = 14
        end
        inherited edtBusqGlobal: TcxTextEdit
          Left = 154
          ExplicitLeft = 154
          ExplicitWidth = 167
          ExplicitHeight = 30
          Width = 167
        end
        inherited cxlblBusq: TcxLabel
          Left = 8
          Top = 4
          ExplicitLeft = 8
          ExplicitTop = 4
        end
        inherited cxdbnvgtr1: TcxDBNavigator
          Left = 333
          Top = 2
          Width = 406
          Height = 30
          ExplicitLeft = 333
          ExplicitTop = 2
          ExplicitWidth = 406
          ExplicitHeight = 30
        end
      end
    end
    inherited tsFicha: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Height = -8
      ExplicitLeft = 4
      ExplicitTop = 36
      ExplicitWidth = 1036
      ExplicitHeight = 564
      object pnl1: TPanel
        Left = 0
        Top = 280
        Width = 1036
        Height = 284
        Align = alClient
        TabOrder = 0
        object cxspl1: TcxSplitter
          Left = 1
          Top = 1
          Width = 1034
          Height = 8
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          DragThreshold = 2
          PositionAfterOpen = 24
          MinSize = 24
        end
        object cxpgcntrlFacturacx: TcxPageControl
          Left = 1
          Top = 9
          Width = 1034
          Height = 274
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Lucida Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Properties.ActivePage = tsLineasFactura
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 270
          ClientRectLeft = 4
          ClientRectRight = 1030
          ClientRectTop = 30
          object tsLineasFactura: TcxTabSheet
            Caption = 'Lineas'
            ImageIndex = 1
            object cxgrd5: TcxGrid
              Left = 0
              Top = 0
              Width = 1026
              Height = 240
              Align = alClient
              TabOrder = 0
              object tvLineasFactura: TcxGridDBTableView
                OnKeyDown = tvLineasFacturaKeyDown
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                OnCellClick = tvLineasFacturaCellClick
                OnEditing = tvLineasFacturaEditing
                DataController.DataModeController.SmartRefresh = True
                DataController.DataSource = dmFac.dsLinFac
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoInsertOnNewItemRowFocusing]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                FixedDataRows.SeparatorColor = clBlack
                NewItemRow.Visible = True
                OptionsBehavior.FocusFirstCellOnNewRecord = True
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsBehavior.FocusCellOnCycle = True
                OptionsCustomize.ColumnGrouping = False
                OptionsData.Appending = True
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsSelection.InvertSelect = False
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object cxgrdbclmntv1CODIGO_ARTICULO_LINEA: TcxGridDBColumn
                  Caption = 'C'#243'digo Tratamiento'
                  DataBinding.FieldName = 'CODIGO_ARTICULO_LINEA'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Glyph.SourceDPI = 96
                      Glyph.Data = {
                        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
                        662D38223F3E0D0A3C212D2D2047656E657261746F723A2041646F626520496C
                        6C7573747261746F722032312E302E322C20535647204578706F727420506C75
                        672D496E202E205356472056657273696F6E3A20362E3030204275696C642030
                        2920202D2D3E0D0A3C7376672076657273696F6E3D22312E31222069643D2246
                        696E642220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F3230
                        30302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E
                        77332E6F72672F313939392F786C696E6B2220783D223070782220793D223070
                        78220D0A092076696577426F783D2230203020333220333222207374796C653D
                        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
                        3B2220786D6C3A73706163653D227072657365727665223E0D0A3C7374796C65
                        20747970653D22746578742F637373223E0D0A092E426C61636B7B66696C6C3A
                        233732373237323B7D0D0A3C2F7374796C653E0D0A3C7061746820636C617373
                        3D22426C61636B2220643D224D32392E352C31392E374C32392E352C31392E37
                        4C32392E352C31392E374332392E352C31392E372C32392E352C31392E372C32
                        392E352C31392E374C32332E382C366C302C30632D302E342D312E322D312E35
                        2D322D322E382D320D0A09632D312E372C302D332C312E332D332C337633682D
                        34563763302D312E372D312E332D332D332D3343392E372C342C382E362C342E
                        392C382E322C366C302C304C322E352C31392E3763302C302C302C302C302C30
                        6C302C30683043322E322C32302E342C322C32312E322C322C32320D0A096330
                        2C332E332C322E372C362C362C3673362D322E372C362D36762D346834763463
                        302C332E332C322E372C362C362C3673362D322E372C362D364333302C32312E
                        322C32392E382C32302E342C32392E352C31392E377A204D382C3236632D322E
                        322C302D342D312E382D342D3473312E382D342C342D340D0A0973342C312E38
                        2C342C345331302E322C32362C382C32367A204D32342C3236632D322E322C30
                        2D342D312E382D342D3473312E382D342C342D3473342C312E382C342C345332
                        362E322C32362C32342C32367A222F3E0D0A3C2F7376673E0D0A}
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesButtonClick
                  Properties.OnEditValueChanged = cxgrdbclmntv1CODIGO_ARTICULO_LINEAPropertiesEditValueChanged
                  MinWidth = 16
                  Width = 180
                end
                object cxgrdbclmntv1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn
                  Caption = 'Descripci'#243'n'
                  DataBinding.FieldName = 'DESCRIPCION_ARTICULO_LINEA'
                  MinWidth = 16
                  Width = 262
                end
                object cxgrdbclmntv1ZONA: TcxGridDBColumn
                  Caption = 'Nro Pieza'
                  DataBinding.FieldName = 'ZONA'
                  MinWidth = 16
                  Width = 98
                end
                object cxgrdbclmntv1ODONTOLOGO: TcxGridDBColumn
                  Caption = 'Odont'#243'logo'
                  DataBinding.FieldName = 'ODONTOLOGO'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = cxgrdbclmntv1ODONTOLOGOPropertiesButtonClick
                  MinWidth = 16
                  Width = 123
                end
                object cxgrdbclmntv1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn
                  Caption = 'Precio'
                  DataBinding.FieldName = 'PRECIOVENTA_ARTICULO_LINEA'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  MinWidth = 16
                  Width = 83
                end
                object cxgrdbclmntv1CANTIDAD_LINEA: TcxGridDBColumn
                  Caption = 'Cantidad'
                  DataBinding.FieldName = 'CANTIDAD_LINEA'
                  PropertiesClassName = 'TcxSpinEditProperties'
                  MinWidth = 16
                  Width = 102
                end
                object cxgrdbclmntv1SUM_TOTAL_LINEA: TcxGridDBColumn
                  Caption = 'Total'
                  DataBinding.FieldName = 'SUM_TOTAL_LINEA'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  MinWidth = 16
                  Width = 120
                end
                object cxgrdbclmntv1LINEA_LINEA: TcxGridDBColumn
                  Caption = 'NroLinea'
                  DataBinding.FieldName = 'LINEA_LINEA'
                  MinWidth = 16
                  Width = 132
                end
                object tvLineasFacturaSERIE_FACTURA_LINEA: TcxGridDBColumn
                  DataBinding.FieldName = 'SERIE_FACTURA_LINEA'
                  Visible = False
                end
                object tvLineasFacturaNRO_FACTURA_LINEA: TcxGridDBColumn
                  DataBinding.FieldName = 'NRO_FACTURA_LINEA'
                  Visible = False
                end
              end
              object lv1: TcxGridLevel
                GridView = tvLineasFactura
              end
            end
          end
          object ts5: TcxTabSheet
            Caption = 'Totales'
            ImageIndex = 2
            object cxlbl17: TcxLabel
              Left = 70
              Top = 50
              Caption = 'Total a pagar'
            end
            object cxlbl18: TcxLabel
              Left = 55
              Top = 94
              Caption = 'Forma de Pago'
            end
            object cxDBCurrencyEdit3: TcxDBCurrencyEdit
              Left = 188
              Top = 47
              DataBinding.DataField = 'TOTAL_LIQUIDO_FACTURA'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = True
              TabOrder = 0
              Width = 80
            end
            object cbbFORMAPAGO: TcxDBLookupComboBox
              Left = 188
              Top = 91
              DataBinding.DataField = 'FORMA_PAGO_FACTURA'
              DataBinding.DataSource = dsTablaG
              Properties.KeyFieldNames = 'DESCRIPCION_FORMAPAGO'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION_FORMAPAGO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmFac.dsFormasPago
              TabOrder = 3
              OnKeyUp = cbbSerieFacturaKeyUp
              Width = 211
            end
            object btnGenerarRecibos: TcxButton
              Left = 117
              Top = 138
              Width = 184
              Height = 39
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Generar Recibo/s'
              OptionsImage.Spacing = 3
              TabOrder = 2
              OnClick = btnGenerarRecibosClick
            end
          end
          object ts8: TcxTabSheet
            Caption = 'Otros'
            ImageIndex = 4
            object cxlbl12: TcxLabel
              Left = 13
              Top = 16
              Caption = 'Comentarios'
            end
            object cxdbm1: TcxDBMemo
              Left = 44
              Top = 56
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataBinding.DataField = 'COMENTARIOS_FACTURA'
              DataBinding.DataSource = dsTablaG
              TabOrder = 1
              Height = 119
              Width = 529
            end
          end
          object cxtbsht1: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Historia Dental'
            ImageIndex = 3
            object cxgrd1: TcxGrid
              Left = 0
              Top = 0
              Width = 1026
              Height = 240
              Align = alClient
              TabOrder = 0
              object tvHistoriaDental: TcxGridDBTableView
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataModeController.SmartRefresh = True
                DataController.DataSource = dmFac.dsHistoria
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                FixedDataRows.SeparatorColor = clBlack
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsCustomize.ColumnGrouping = False
                OptionsSelection.InvertSelect = False
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object cxgrdbclmncxgrdbtblvw1FECHA: TcxGridDBColumn
                  Caption = 'Fecha'
                  DataBinding.FieldName = 'FECHA'
                  MinWidth = 16
                end
                object cxgrdbclmncxgrdbtblvw1CODIGO_ARTICULO: TcxGridDBColumn
                  Caption = 'C'#243'digo Tratamiento'
                  DataBinding.FieldName = 'CODIGO_ARTICULO'
                  MinWidth = 16
                  Width = 183
                end
                object cxgrdbclmncxgrdbtblvw1DESCRIPCION_ARTICULO: TcxGridDBColumn
                  Caption = 'Descripci'#243'n Tratamiento'
                  DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
                  MinWidth = 16
                  Width = 235
                end
                object cxgrdbclmncxgrdbtblvw1ZONA: TcxGridDBColumn
                  Caption = 'Nro Pieza'
                  DataBinding.FieldName = 'ZONA'
                  MinWidth = 16
                  Width = 178
                end
                object cxgrdbclmncxgrdbtblvw1PRECIOVENTA_ARTICULO: TcxGridDBColumn
                  Caption = 'Precio'
                  DataBinding.FieldName = 'PRECIOVENTA_ARTICULO'
                  MinWidth = 16
                end
                object cxgrdbclmncxgrdbtblvw1ODONTOLOGO: TcxGridDBColumn
                  Caption = 'Nro Odont'#243'logo'
                  DataBinding.FieldName = 'ODONTOLOGO'
                  MinWidth = 16
                  Width = 153
                end
                object cxgrdbclmncxgrdbtblvw1NOMBRE_ODONTOLOGO: TcxGridDBColumn
                  Caption = 'Nombre odont'#243'logo'
                  DataBinding.FieldName = 'NOMBRE_ODONTOLOGO'
                  MinWidth = 16
                  Width = 187
                end
                object cxgrdbclmncxgrdbtblvw1DESHISVARCHAR: TcxGridDBColumn
                  Caption = 'Historia Dental'
                  DataBinding.FieldName = 'DESHISVARCHAR'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = cxgrdbclmncxgrdbtblvw1DESCRIPCION_HISTORIAPropertiesButtonClick
                  MinWidth = 16
                  Width = 360
                end
              end
              object cxgrdbndtblvw1: TcxGridDBBandedTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DetailKeyFieldNames = 'AppointmentId'
                DataController.KeyFieldNames = 'PerId'
                DataController.MasterKeyFieldNames = 'AppointmentId'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                Bands = <
                  item
                    Width = 766
                  end>
                object cxgrdbndclmn1: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'PerId'
                  MinWidth = 16
                  Width = 30
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn2: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'AppointmentId'
                  MinWidth = 16
                  Width = 65
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn3: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'Linea'
                  MinWidth = 16
                  Width = 35
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn4: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'clave'
                  MinWidth = 16
                  Width = 101
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn5: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'valor'
                  MinWidth = 16
                  Width = 117
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn6: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'instantemodif'
                  MinWidth = 16
                  Width = 110
                  Position.BandIndex = 0
                  Position.ColIndex = 7
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn7: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'descripcion'
                  MinWidth = 16
                  Width = 142
                  Position.BandIndex = 0
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn8: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'parte'
                  MinWidth = 16
                  Width = 167
                  Position.BandIndex = 0
                  Position.ColIndex = 6
                  Position.RowIndex = 0
                end
              end
              object cxgrdlvl1: TcxGridLevel
                GridView = tvHistoriaDental
              end
            end
          end
          object cxtbsht2: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Recibos'
            ImageIndex = 4
            object pnl4: TPanel
              Left = 0
              Top = 0
              Width = 1026
              Height = 240
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              Caption = #180
              TabOrder = 0
              object cxgrd2: TcxGrid
                Left = 1
                Top = 1
                Width = 936
                Height = 238
                Align = alClient
                TabOrder = 0
                object tvLineasRecibos: TcxGridDBTableView
                  Navigator.Buttons.ConfirmDelete = True
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataModeController.SmartRefresh = True
                  DataController.DataSource = dmFac.dsRecibos
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FixedDataRows.SeparatorColor = clBlack
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsCustomize.ColumnGrouping = False
                  OptionsSelection.InvertSelect = False
                  OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                  OptionsView.GroupByBox = False
                  object cxgrdbclmncxgrdbtblvw2NRO_PLAZO_RECIBO: TcxGridDBColumn
                    Caption = 'Nro Plazo'
                    DataBinding.FieldName = 'NRO_PLAZO_RECIBO'
                    MinWidth = 16
                    Width = 117
                  end
                  object cxgrdbclmncxgrdbtblvw2FECHA_EXPEDICION: TcxGridDBColumn
                    Caption = 'Fecha Expedici'#243'n'
                    DataBinding.FieldName = 'FECHA_EXPEDICION'
                    MinWidth = 16
                    Width = 167
                  end
                  object cxgrdbclmncxgrdbtblvw2ESTADO_RECIBO: TcxGridDBColumn
                    Caption = 'Estado del recibo'
                    DataBinding.FieldName = 'ESTADO_RECIBO'
                    MinWidth = 16
                    Width = 188
                  end
                  object cxgrdbclmncxgrdbtblvw2FECHA_PAGO: TcxGridDBColumn
                    Caption = 'Fecha de Pago'
                    DataBinding.FieldName = 'FECHA_PAGO'
                    MinWidth = 16
                    Width = 162
                  end
                  object cxgrdbclmncxgrdbtblvw2FECHA_VENCIMIENTO: TcxGridDBColumn
                    Caption = 'Fecha Vencimiento'
                    DataBinding.FieldName = 'FECHA_VENCIMIENTO'
                    MinWidth = 16
                    Width = 190
                  end
                  object cxgrdbclmncxgrdbtblvw2FORMA_PAGO_DESCRIPCION_ORIGEN: TcxGridDBColumn
                    Caption = 'Descripcion Forma Pago Factura'
                    DataBinding.FieldName = 'FORMA_PAGO_DESCRIPCION_ORIGEN'
                    MinWidth = 16
                    Width = 319
                  end
                  object cxgrdbclmncxgrdbtblvw2EUROS_RECIBO: TcxGridDBColumn
                    Caption = 'Euros Recibo'
                    DataBinding.FieldName = 'EUROS_RECIBO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    MinWidth = 16
                    Width = 160
                  end
                  object cxgrdbclmncxgrdbtblvw2IBAN: TcxGridDBColumn
                    DataBinding.FieldName = 'IBAN'
                    MinWidth = 16
                    Width = 215
                  end
                  object cxgrdbclmncxgrdbtblvw2LOCALIDAD_EXPEDICION: TcxGridDBColumn
                    Caption = 'Localidad Expedici'#243'n'
                    DataBinding.FieldName = 'LOCALIDAD_EXPEDICION'
                    MinWidth = 16
                    Width = 217
                  end
                  object cxgrdbclmncxgrdbtblvw2CODIGO_CLIENTE: TcxGridDBColumn
                    Caption = 'C'#243'digo de Cliente'
                    DataBinding.FieldName = 'CODIGO_CLIENTE'
                    MinWidth = 16
                    Width = 202
                  end
                  object cxgrdbclmncxgrdbtblvw2RAZONSOCIAL_CLIENTE: TcxGridDBColumn
                    Caption = 'Raz'#243'n Social'
                    DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE'
                    MinWidth = 16
                    Width = 206
                  end
                  object cxgrdbclmncxgrdbtblvw2DIRECCION1_CLIENTE: TcxGridDBColumn
                    Caption = 'Direcci'#243'n'
                    DataBinding.FieldName = 'DIRECCION1_CLIENTE'
                    MinWidth = 16
                    Width = 222
                  end
                  object cxgrdbclmncxgrdbtblvw2CPOSTAL_CLIENTE: TcxGridDBColumn
                    Caption = 'C'#243'digo Postal'
                    DataBinding.FieldName = 'CPOSTAL_CLIENTE'
                    MinWidth = 16
                    Width = 141
                  end
                  object cxgrdbclmncxgrdbtblvw2POBLACION_CLIENTE: TcxGridDBColumn
                    Caption = 'Poblaci'#243'n'
                    DataBinding.FieldName = 'POBLACION_CLIENTE'
                    MinWidth = 16
                    Width = 133
                  end
                  object cxgrdbclmncxgrdbtblvw2PROVINCIA_CLIENTE: TcxGridDBColumn
                    Caption = 'Provincia'
                    DataBinding.FieldName = 'PROVINCIA_CLIENTE'
                    MinWidth = 16
                    Width = 161
                  end
                  object cxgrdbclmncxgrdbtblvw2IMPORTE_LETRA: TcxGridDBColumn
                    Caption = 'Debe en letra'
                    DataBinding.FieldName = 'IMPORTE_LETRA'
                    MinWidth = 16
                    Width = 322
                  end
                end
                object cxgrdbndtblvw2: TcxGridDBBandedTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DetailKeyFieldNames = 'AppointmentId'
                  DataController.KeyFieldNames = 'PerId'
                  DataController.MasterKeyFieldNames = 'AppointmentId'
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsView.GroupByBox = False
                  Bands = <
                    item
                      Width = 766
                    end>
                  object cxgrdbndclmn9: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'PerId'
                    MinWidth = 16
                    Width = 30
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn10: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'AppointmentId'
                    MinWidth = 16
                    Width = 65
                    Position.BandIndex = 0
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn11: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'Linea'
                    MinWidth = 16
                    Width = 35
                    Position.BandIndex = 0
                    Position.ColIndex = 2
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn12: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'clave'
                    MinWidth = 16
                    Width = 101
                    Position.BandIndex = 0
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn13: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'valor'
                    MinWidth = 16
                    Width = 117
                    Position.BandIndex = 0
                    Position.ColIndex = 4
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn14: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'instantemodif'
                    MinWidth = 16
                    Width = 110
                    Position.BandIndex = 0
                    Position.ColIndex = 7
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn15: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'descripcion'
                    MinWidth = 16
                    Width = 142
                    Position.BandIndex = 0
                    Position.ColIndex = 5
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmn16: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'parte'
                    MinWidth = 16
                    Width = 167
                    Position.BandIndex = 0
                    Position.ColIndex = 6
                    Position.RowIndex = 0
                  end
                end
                object cxgrdlvl2: TcxGridLevel
                  GridView = tvLineasRecibos
                end
              end
              object pnl5: TPanel
                Left = 937
                Top = 1
                Width = 88
                Height = 238
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Align = alRight
                TabOrder = 1
                object btnReciboPagado: TcxButton
                  Left = 6
                  Top = 14
                  Width = 78
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = '&Pagado'
                  OptionsImage.Spacing = 3
                  TabOrder = 0
                  OnClick = btnReciboPagadoClick
                end
                object btn5: TcxButton
                  Left = 6
                  Top = 141
                  Width = 78
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Imprimir'
                  OptionsImage.Spacing = 3
                  TabOrder = 3
                  OnClick = btn5Click
                end
                object btnReciboDevuelto: TcxButton
                  Left = 6
                  Top = 62
                  Width = 78
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = '&Devuelto'
                  OptionsImage.Spacing = 3
                  TabOrder = 2
                  OnClick = btnReciboDevueltoClick
                end
                object btnReciboEmitido: TcxButton
                  Left = 6
                  Top = 38
                  Width = 78
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = '&Emitido'
                  OptionsImage.Spacing = 3
                  TabOrder = 1
                  OnClick = btnReciboEmitidoClick
                end
              end
            end
          end
          object tsVeriFactu: TcxTabSheet
            Caption = 'VeriFactu'
            ImageIndex = 5
            object scrlbx1: TScrollBox
              Left = 0
              Top = 0
              Width = 1026
              Height = 240
              HorzScrollBar.Position = 42
              VertScrollBar.ButtonSize = 20
              VertScrollBar.Position = 412
              Align = alClient
              TabOrder = 0
              object lbl18: TLabel
                Left = 2
                Top = 200
                Width = 176
                Height = 19
                Caption = 'PETICION_COMPLETA'
              end
              object lbl17: TLabel
                Left = 1
                Top = -352
                Width = 188
                Height = 19
                Caption = 'RESPUESTA_COMPLETA'
                FocusControl = cxdbmRESPUESTA_COMPLETA
              end
              object lbl13: TLabel
                Left = 32
                Top = 131
                Width = 140
                Height = 19
                Caption = 'QRCODE_BASE64'
                FocusControl = cxdbmQRCODE_BASE64
              end
              object lbl12: TLabel
                Left = 38
                Top = 64
                Width = 134
                Height = 19
                Caption = 'VERIFACTU_URL'
                FocusControl = cxdbmVERIFACTU_URL
              end
              object lbl11: TLabel
                Left = 59
                Top = -2
                Width = 109
                Height = 19
                Caption = 'CHAIN_HASH'
                FocusControl = txtCHAIN_HASH
              end
              object lbl10: TLabel
                Left = 50
                Top = -51
                Width = 136
                Height = 19
                Caption = 'CHAIN_NUMBER'
                FocusControl = txtCHAIN_NUMBER
              end
              object lbl9: TLabel
                Left = 79
                Top = -99
                Width = 109
                Height = 19
                Caption = 'ISSUED_TIME'
                FocusControl = dteISSUED_TIME
              end
              object lbl8: TLabel
                Left = 66
                Top = -148
                Width = 118
                Height = 19
                Caption = 'ISSUER_IRS_ID'
                FocusControl = txtISSUER_IRS_ID
              end
              object lbl7: TLabel
                Left = 100
                Top = -196
                Width = 84
                Height = 19
                Caption = 'QUEUE_ID'
                FocusControl = spQUEUE_ID
              end
              object lbl6: TLabel
                Left = 83
                Top = -245
                Width = 101
                Height = 19
                Caption = 'REQUEST_ID'
                FocusControl = txtREQUEST_ID
              end
              object lbl: TLabel
                Left = 19
                Top = -390
                Width = 170
                Height = 19
                Caption = 'ID_CONSOLIDACION'
                FocusControl = spID_CONSOLIDACION
              end
              object lbl15: TLabel
                Left = 404
                Top = -188
                Width = 205
                Height = 19
                Caption = 'FECHA_PROCESAMIENTO'
                FocusControl = dteFECHA_PROCESAMIENTO
              end
              object lbl16: TLabel
                Left = 344
                Top = -392
                Width = 65
                Height = 19
                Caption = 'ESTADO'
                FocusControl = txtESTADO
              end
              object btnReconsolidar: TSpeedButton
                Left = 810
                Top = -293
                Width = 217
                Height = 52
                Cursor = crHandPoint
                Caption = '&Reconsolidar OFFLINE'
                OnClick = btnReconsolidarClick
              end
              object btnConsultarEstado: TSpeedButton
                Left = 810
                Top = -386
                Width = 217
                Height = 39
                Cursor = crHandPoint
                Caption = 'Cons&ultar Estado'
                OnClick = btnConsultarEstadoClick
              end
              object btnCancelarFactura: TSpeedButton
                Left = 810
                Top = -340
                Width = 217
                Height = 39
                Cursor = crHandPoint
                Caption = 'Cancelar &Factura'
                OnClick = btnCancelarFacturaClick
              end
              object btnSubsanacion: TSpeedButton
                Left = 810
                Top = -234
                Width = 217
                Height = 52
                Cursor = crHandPoint
                Caption = 'Su&bsanacion Manual'
                OnClick = btnSubsanacionClick
              end
              object spQUEUE_ID: TcxDBSpinEdit
                Left = 198
                Top = -204
                DataBinding.DataField = 'QUEUE_ID'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 0
                Width = 121
              end
              object cxdbmRESPUESTA_COMPLETA: TcxDBMemo
                Left = 198
                Top = -356
                DataBinding.DataField = 'RESPUESTA_COMPLETA'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 1
                Height = 89
                Width = 402
              end
              object cxdbmQRCODE_BASE64: TcxDBMemo
                Left = 185
                Top = 105
                DataBinding.DataField = 'QRCODE_BASE64'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 2
                Height = 44
                Width = 665
              end
              object cxdbmVERIFACTU_URL: TcxDBMemo
                Left = 185
                Top = 38
                DataBinding.DataField = 'VERIFACTU_URL'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 3
                Height = 44
                Width = 665
              end
              object txtCHAIN_HASH: TcxDBTextEdit
                Left = 185
                Top = -10
                DataBinding.DataField = 'CHAIN_HASH'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 4
                Width = 665
              end
              object txtCHAIN_NUMBER: TcxDBTextEdit
                Left = 198
                Top = -59
                DataBinding.DataField = 'CHAIN_NUMBER'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 5
                Width = 121
              end
              object dteISSUED_TIME: TcxDBDateEdit
                Left = 198
                Top = -107
                DataBinding.DataField = 'ISSUED_TIME'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 6
                Width = 121
              end
              object txtISSUER_IRS_ID: TcxDBTextEdit
                Left = 198
                Top = -156
                DataBinding.DataField = 'ISSUER_IRS_ID'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 7
                Width = 153
              end
              object imgQRCODE_PNG: TcxDBImage
                Left = 606
                Top = -395
                DataBinding.DataField = 'QRCODE_PNG'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.FitMode = ifmProportionalStretch
                Properties.GraphicClassName = 'TdxPNGImage'
                Properties.ReadOnly = True
                TabOrder = 8
                Height = 176
                Width = 196
              end
              object txtREQUEST_ID: TcxDBTextEdit
                Left = 198
                Top = -253
                DataBinding.DataField = 'REQUEST_ID'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 9
                Width = 402
              end
              object spID_CONSOLIDACION: TcxDBSpinEdit
                Left = 198
                Top = -398
                DataBinding.DataField = 'ID_CONSOLIDACION'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 10
                Width = 121
              end
              object cxdbmPETICION_COMPLETA1: TcxDBMemo
                Left = 185
                Top = 175
                DataBinding.DataField = 'PETICION_COMPLETA'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 11
                Height = 44
                Width = 654
              end
              object dteFECHA_PROCESAMIENTO: TcxDBDateEdit
                Left = 617
                Top = -196
                DataBinding.DataField = 'FECHA_PROCESAMIENTO'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
                Properties.Kind = ckDateTime
                Properties.ReadOnly = True
                TabOrder = 12
                Width = 185
              end
              object txtESTADO: TcxDBTextEdit
                Left = 425
                Top = -400
                DataBinding.DataField = 'ESTADO'
                DataBinding.DataSource = dmFac.dsConsolidacion
                Properties.ReadOnly = True
                TabOrder = 13
                Width = 126
              end
            end
          end
          object tsError: TcxTabSheet
            Caption = 'Eventos VeriFactu'
            ImageIndex = 6
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 1026
              Height = 240
              Align = alClient
              TabOrder = 0
              object tvEventosVeriFactu: TcxGridDBTableView
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataModeController.SmartRefresh = True
                DataController.DataSource = dmFac.dsErrores
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                FixedDataRows.SeparatorColor = clBlack
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsCustomize.ColumnGrouping = False
                OptionsSelection.InvertSelect = False
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object dbctv3CREATED_AT_LOG: TcxGridDBColumn
                  Caption = 'Fecha Evento'
                  DataBinding.FieldName = 'CREATED_AT_LOG'
                  Width = 206
                end
                object dbctv3TIPO_EVENTO_LOG: TcxGridDBColumn
                  Caption = 'Tipo Evento'
                  DataBinding.FieldName = 'TIPO_EVENTO_LOG'
                end
                object dbctv3DESCRIPCION_LOG: TcxGridDBColumn
                  Caption = 'Descripci'#243'n Evento'
                  DataBinding.FieldName = 'DESCRIPCION_LOG'
                  Width = 534
                end
                object dbctv3DATOS_ADICIONALES_LOG: TcxGridDBColumn
                  Caption = 'Datos adicionales'
                  DataBinding.FieldName = 'DATOS_ADICIONALES_LOG'
                  Width = 460
                end
              end
              object cxgrdbndtblvw11: TcxGridDBBandedTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DetailKeyFieldNames = 'AppointmentId'
                DataController.KeyFieldNames = 'PerId'
                DataController.MasterKeyFieldNames = 'AppointmentId'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                Bands = <
                  item
                    Width = 766
                  end>
                object cxgrdbndclmn: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'PerId'
                  MinWidth = 16
                  Width = 30
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn17: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'AppointmentId'
                  MinWidth = 16
                  Width = 65
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn18: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'Linea'
                  MinWidth = 16
                  Width = 35
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn19: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'clave'
                  MinWidth = 16
                  Width = 101
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn20: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'valor'
                  MinWidth = 16
                  Width = 117
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn21: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'instantemodif'
                  MinWidth = 16
                  Width = 110
                  Position.BandIndex = 0
                  Position.ColIndex = 7
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn22: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'descripcion'
                  MinWidth = 16
                  Width = 142
                  Position.BandIndex = 0
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
                object cxgrdbndclmn23: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'parte'
                  MinWidth = 16
                  Width = 167
                  Position.BandIndex = 0
                  Position.ColIndex = 6
                  Position.RowIndex = 0
                end
              end
              object lv2: TcxGridLevel
                GridView = tvEventosVeriFactu
              end
            end
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 1036
        Height = 280
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object pnl3: TPanel
          Left = 1
          Top = 1
          Width = 816
          Height = 278
          Align = alLeft
          TabOrder = 0
          object cxtbshtCabecera: TcxPageControl
            Left = 1
            Top = 1
            Width = 814
            Height = 276
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsCabecera
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 272
            ClientRectLeft = 4
            ClientRectRight = 810
            ClientRectTop = 30
            object tsCabecera: TcxTabSheet
              Caption = 'Cabecera'
              ImageIndex = 0
              object lblcxlbl1: TcxLabel
                Left = 8
                Top = 14
                Caption = 'Nro Documento'
              end
              object lblcxlbl3: TcxLabel
                Left = 8
                Top = 106
                Caption = 'Fecha'
              end
              object dteFECHA_FACTURA: TcxDBDateEdit
                Left = 71
                Top = 106
                DataBinding.DataField = 'FECHA_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.DateButtons = [btnClear, btnToday]
                TabOrder = 8
                OnKeyUp = dteFECHA_FACTURAKeyUp
                Width = 171
              end
              object lblcxlbl8: TcxLabel
                Left = 8
                Top = 62
                Caption = 'Serie Documento'
              end
              object cbbSerieFactura: TcxDBLookupComboBox
                Left = 160
                Top = 62
                DataBinding.DataField = 'SERIE_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.KeyFieldNames = 'SERIE_CONTADOR'
                Properties.ListColumns = <
                  item
                    FieldName = 'SERIE_CONTADOR'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = dmFac.dsSeries
                Properties.ReadOnly = True
                Properties.OnChange = cbbSerieFacturaPropertiesChange
                TabOrder = 4
                OnKeyUp = cbbSerieFacturaKeyUp
                Width = 77
              end
              object btnNroFactura: TcxDBButtonEdit
                Left = 160
                Top = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataBinding.DataField = 'NRO_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = btnNroFacturaPropertiesButtonClick
                TabOrder = 0
                Width = 77
              end
              object btnCODIGO_CLIENTE: TcxDBButtonEdit
                Left = 413
                Top = 13
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataBinding.DataField = 'CODIGO_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = btnCODIGO_CLIENTEPropertiesButtonClick
                Properties.OnEditValueChanged = btnCODIGO_CLIENTEPropertiesEditValueChanged
                TabOrder = 1
                OnKeyUp = btnCODIGO_CLIENTEKeyUp
                Width = 84
              end
              object lblCodigoPaciente: TcxLabel
                Left = 269
                Top = 14
                Caption = 'C'#243'digo Paciente'
              end
              object lblRazonSocial: TcxLabel
                Left = 269
                Top = 51
                Caption = 'Raz'#243'n Social'
              end
              object lblDBRAZONSOCIAL_CLIENTE_FACTURA: TcxDBLabel
                Left = 269
                Top = 77
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataBinding.DataField = 'RAZONSOCIAL_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                Height = 32
                Width = 320
              end
              object lblDBMOVIL_CLIENTE_FACTURA: TcxDBLabel
                Left = 269
                Top = 142
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataBinding.DataField = 'MOVIL_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                Height = 35
                Width = 204
              end
              object lblTelefonoMovil: TcxLabel
                Left = 269
                Top = 114
                Caption = 'Tel'#233'fono M'#243'vil'
              end
              object chkEsSimpl: TcxDBCheckBox
                Left = 279
                Top = 195
                Caption = 'Modelo simplificado'
                DataBinding.DataField = 'ESSIMPL_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ReadOnly = True
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Properties.OnChange = chkEsSimplPropertiesChange
                Style.TransparentBorder = False
                TabOrder = 12
              end
              object chkConsolidada: TcxDBCheckBox
                Left = 8
                Top = 195
                Caption = 'Consolidada'
                DataBinding.DataField = 'CONSOLIDACION_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ReadOnly = True
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Properties.OnChange = chkConsolidadaPropertiesChange
                Style.TransparentBorder = False
                TabOrder = 13
              end
              object lblDB2: TcxDBLabel
                Left = 34
                Top = 168
                DataBinding.DataField = 'FASE_CONSOLIDACION_FACTURA'
                DataBinding.DataSource = dsTablaG
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clGreen
                Style.Font.Height = -17
                Style.Font.Name = 'Lucida Sans'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Height = 31
                Width = 203
              end
              object lblDBFECHA_ULT_CONSO_FACTURA: TcxDBLabel
                Left = 34
                Top = 216
                DataBinding.DataField = 'FECHA_ULT_CONSO_FACTURA'
                DataBinding.DataSource = dsTablaG
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clGreen
                Style.Font.Height = -17
                Style.Font.Name = 'Lucida Sans'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Height = 26
                Width = 203
              end
            end
            object tsDatosCliente: TcxTabSheet
              Caption = 'Datos Paciente - Cabecera'
              ImageIndex = 1
              object cxgrpbx1: TcxGroupBox
                Left = 3
                Top = 19
                Caption = 'Direcci'#243'n'
                TabOrder = 0
                Height = 211
                Width = 451
                object txtDIRECCION1_CLIENTE_FACTURA: TcxDBTextEdit
                  Left = 18
                  Top = 56
                  DataBinding.DataField = 'DIRECCION1_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 1
                  Width = 423
                end
                object txtCPOSTAL_CLIENTE_FACTURA: TcxDBTextEdit
                  Left = 18
                  Top = 109
                  DataBinding.DataField = 'CPOSTAL_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 3
                  Width = 60
                end
                object txtPOBLACION_CLIENTE_FACTURA: TcxDBTextEdit
                  Left = 84
                  Top = 109
                  DataBinding.DataField = 'POBLACION_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 4
                  Width = 357
                end
                object txtPROVINCIA_CLIENTE_FACTURA: TcxDBTextEdit
                  Left = 98
                  Top = 142
                  DataBinding.DataField = 'PROVINCIA_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 9
                  Width = 343
                end
                object txtDIRECCION2_CLIENTE_FACTURA: TcxDBTextEdit
                  Left = 18
                  Top = 82
                  DataBinding.DataField = 'DIRECCION2_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 2
                  Width = 423
                end
                object lblcxlbl6: TcxLabel
                  Left = 7
                  Top = 142
                  Caption = 'Provincia'
                end
                object lblcxlbl13: TcxLabel
                  Left = 51
                  Top = 171
                  Caption = 'Pa'#237's'
                end
                object txtRAZONSOCIAL_CLIENTE_FACTURA: TcxDBTextEdit
                  Left = 120
                  Top = 23
                  DataBinding.DataField = 'RAZONSOCIAL_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 0
                  Width = 321
                end
                object lblcxlbl14: TcxLabel
                  Left = 3
                  Top = 27
                  Caption = 'Raz'#243'n Social'
                end
                object lblDB1: TcxDBLabel
                  Left = 172
                  Top = 173
                  DataBinding.DataField = 'NOMBRE_SPA_PAIS'
                  DataBinding.DataSource = dmFac.dsPaises
                  Height = 28
                  Width = 269
                end
                object btnPAIS_CLIENTE: TcxDBButtonEdit
                  Left = 93
                  Top = 173
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataBinding.DataField = 'PAIS_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = btnPAIS_CLIENTEPropertiesButtonClick
                  Properties.OnChange = btnPAIS_CLIENTEPropertiesChange
                  TabOrder = 10
                  Width = 72
                end
              end
              object txtNIF_CLIENTE_FACTURA: TcxDBTextEdit
                Left = 460
                Top = 128
                DataBinding.DataField = 'NIF_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 4
                Width = 205
              end
              object lblcxlbl9: TcxLabel
                Left = 457
                Top = 106
                Caption = 'NIF'
              end
              object lblcxlbl104: TcxLabel
                Left = 458
                Top = 165
                Caption = 'M'#243'vil'
              end
              object txtMOVIL_CLIENTE_FACTURA: TcxDBTextEdit
                Left = 517
                Top = 161
                DataBinding.DataField = 'MOVIL_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 5
                Width = 160
              end
              object lblcxlbl11: TcxLabel
                Left = 460
                Top = 198
                Caption = 'Email'
              end
              object txtEMAIL_CLIENTE_FACTURA: TcxDBTextEdit
                Left = 516
                Top = 197
                DataBinding.DataField = 'EMAIL_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 6
                Width = 335
              end
              object txtAPELLIDOS: TcxDBTextEdit
                Left = 460
                Top = 75
                DataBinding.DataField = 'APELLIDOS'
                DataBinding.DataSource = dsTablaG
                TabOrder = 2
                OnExit = txtAPELLIDOSExit
                Width = 279
              end
              object txtNOMBRE: TcxDBTextEdit
                Left = 457
                Top = 27
                DataBinding.DataField = 'NOMBRE'
                DataBinding.DataSource = dsTablaG
                TabOrder = 1
                OnExit = txtNOMBREExit
                Width = 282
              end
              object lblcxlbl15: TcxLabel
                Left = 457
                Top = 5
                Caption = 'Nombre'
              end
              object lblcxlbl16: TcxLabel
                Left = 457
                Top = 56
                Caption = 'Apellidos'
              end
              object lblDBCODIGO_CLIENTE_FACTURA: TcxDBLabel
                Left = 243
                Top = 0
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataBinding.DataField = 'CODIGO_CLIENTE_FACTURA'
                DataBinding.DataSource = dsTablaG
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -13
                Style.Font.Name = 'Lucida Sans'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Height = 21
                Width = 38
              end
              object btnCrearActualizarCli: TcxButton
                Left = 682
                Top = 107
                Width = 122
                Height = 92
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Crear o &Actualizar Paciente'
                OptionsImage.Spacing = 3
                TabOrder = 13
                WordWrap = True
                OnClick = btnCrearActualizarCliClick
              end
              object cxchkNoNIFControl: TcxCheckBox
                Left = 499
                Top = 107
                Caption = 'desactivar control nif'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -12
                Style.Font.Name = 'Lucida Sans'
                Style.Font.Style = []
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                TabOrder = 3
              end
            end
          end
        end
        object img1: TcxImage
          Left = 828
          Top = 32
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000064
            00000064080600000070E2955400000006624B474400FF00FF00FFA0BDA79300
            00071349444154789CED9C7B8815551CC73FBA0FD38D406D174B8544A125CAB4
            D04DFF312310A9E861DA4328CAA4822028D3A428218A240AA28749104425A9BD
            3503238B50E9653E90DC762B72350DB5C8C4C766B6FDF19B5B737F3373EF99B9
            73F7FE56CF070EEEDC99DFEF9C39DF7B5EBF73AEE0F1783C1E4F36FA65B0E9C9
            BD142737A9EAB87FB54AE1C98617C4185E1063D4E7E023CB38743253D118EB5B
            8831BC20C6F08218C30B620C2F8831BC20C6F08218C30B620C2F8831BC20C6F0
            8218C30B620C2F8831BC20C6F08218238FFD1057FAFA5E7CAFECFBF816620C2F
            8831BC20C6E8CD31C4EFBD3BE05B8831BC20C6F08218C30B620C2F8831BC20C6
            F08218A33705B902D88DC4B4FA52DA054CAF427DE4862EB02BBB626CFB4AEA4A
            F19E59EB07C8E71754AE3E4E95686FD6FA01FC18628EDE8C6569F437A7A26F56
            0A5CF3A9498BF62DC4185E106378418CE105318617C4185E106378418C51CB75
            48B9797E6FAD034C45107C0B318617C4185E10639C8AB12CD3F816620C2F8831
            BC20C6A8E518524BEA8036E052E022A015381B381D19CB0E03BF00DF039B80CF
            80AF8013BD5FD4F264DD332E6757D15EB4232381C54865A7DD57DF0D3C098C28
            93476FBC472E19D65290666029D01D934FDAD40D2C018626E4F57A15DF2396BE
            26C86CE0B718FF95A603C08D31F9D501AF55E13D12C94B903CD35AA2E36103F0
            72099B83C01BC01DC004A415350676CDC044602EB02C7836C9CF4B814D987A60
            4DCAFAC98C35413A81C12AAF41FC5F213AB503B7030353947D103007E848F0F9
            61F04C98C1C04F29F2C88C25414E0093553E0DC48B7118B88FCA66960DC03CE0
            488CFFD5445BCAC40AF272C692204FC7E413D74D7500E7A7286B39C6222D53E7
            B324C73C9CC94B90BCFC86B939C6CFB7C89890372DC0E698FC6EA8425E25B12A
            4833D1D95407D511A3400BF083CA733FC953E2AA605590A5CAFE30F97653498C
            058EAABC5FC8EAAC9687ADF30CBF8F44BEA98DA1CFEE079E71B0BD92F233AE8D
            C8EA3E89F94804A0403730BA8C4D6E586C218B956D3B6EB3A901C0F198BC75BA
            B68C9F06A283FC1329DF2133D604A9231A9BBACDD1767C4CBE5904015960866D
            BAC8104DEF8BBF0F790B9819BA9E84742905FE04CE42D60AE5B8057835F8FB3D
            E0A384E7D6023F97F1D504FC8A448C0BB421516267FA62F8FD4B753D555DAFC6
            4D0C9001B9C0326065D64221938835C0ACD067534929486F6E50EDCEC9CF77EA
            FA6275FD690A5F1784FEDE1EFC3B806818C4954FD4F543C03A6011D23D5685AC
            7DFD74F2F99DE179CAEF76753F4DB8624F607314B80ED812F2B307780C11C895
            B632656F076690F3018E4AD70B797380E2F29CE968D71CB2390EFC437C25AEC3
            BD6B6F49F0A1D3466094A3CFB25813446F3A35967EFC3F2E5376DB8047906E66
            9BBA77AFA3CF01B809D283ACE8A738FA2DC9C922C855C0C7417A05382D742FBC
            9FD183ECADBBA005E9066E0296C794B370BF6251AC09A2E35779C5AE2ECFE057
            7759FB43F746036F13ADBFFD54D87D5913A49241BD14E72ABF634B3F0EC025CA
            666BCC330F20FB38E1E736100CF427C3B9AC76757DA1A3DD46E09B20C5ED8D87
            67733DC05E079F3AEFB8AEEE2960A1FA6C3232CBCB84B516B290E2F22C73B40B
            EF656CA138C0580FAC0FDDFFDAD1E70A559605259E7D473DBBC3318F08D60499
            4471790EE2B6B0BB5BD96D0A3EBB13693DE17BD738F86B020E29BB09259E1F05
            1C53CF675A3C5A13A48EE8FF3234C7C1AE3FF001D1F7D1E959C772CC55763B29
            3F24E816B5C831AF22AC090272A2305CA60EA2070EE268001E067E27FA5E7B91
            D6E2B2AA6E047E54F68F3BD8CD5636EB1C6C2258146404D179FEBC14F6F5C80C
            6906B227DE86B43C571E54791F03863BD8E9999C9EA0386151108017292ED711
            8A8387D5623CD12DDCE71C6D0B87BB0BE950960258156428D1B85627B258AB16
            C3887655FB80218EF66728DB83590A61551090F5842EDF66AA23CA308AA3C385
            34B39491A255D9669AFA5A1604E4ACAD2E63276E2B6D57C6116D193DC0F329FD
            E8415DEFA738615D9006E4ACAD2EE711E47488CBEC2B89466400D763460FB08A
            F43BB07ADAFB6896425917046461B89AF87545277220A12985BF26649DB133C1
            E72AD2EF328E213A331C97D207C414C62AF544675E7A46B31C596BB421E34C63
            905A82CFEE0A9ED12B70DD4D65399BF0AEF2935BE8C44A7A93F88A998584B8F3
            CEEF10707D86FA03E93AB5BFDC828B96D272E24519821CEFD4B1A34AD209E09E
            0CF5379F68F87D3D15ECB3D7BAD2CBA535241F761E8E9C28ECCAE0770FF1BB7E
            2B91A3ACE51843B49BEA415AEF390EF689D4BAC25D521712054EA23FB291B500
            99E96C451695DD413A107CB62278664260338DF856D68DFC3C6E2652B9039155
            782B32B55D01FC956037A544393D0E4C03FEA0F22FCD3EBC18B9D10A7C417631
            36506137E5895207DC8A6CD3BA0AB103994D250EE0A7E47F819433FD90F1EA6A
            645C3A17F905EEDFC8C6D95EE073E07D24AE56927F0133AA12BCA2E2AF7C0000
            000049454E44AE426082}
          Properties.FitMode = ifmProportionalStretch
          Properties.ReadOnly = True
          Style.BorderStyle = ebsNone
          Style.Edges = []
          TabOrder = 1
          Transparent = True
          OnDblClick = img1DblClick
          Height = 126
          Width = 181
        end
        object rgTIPOID_INT_CLIENTE: TcxDBRadioGroup
          Left = 823
          Top = 192
          Caption = 'Tipo de Id Internacional'
          DataBinding.DataField = 'TIPOID_INT_CLIENTE_FACTURA'
          DataBinding.DataSource = dsTablaG
          Properties.Items = <
            item
              Caption = 'Id Fiscal'
              Value = 'ID'
            end
            item
              Caption = 'Pasaporte'
              Value = 'PASAPORTE'
            end>
          TabOrder = 2
          Visible = False
          Height = 76
          Width = 218
        end
      end
    end
  end
  inherited cxlclzr1: TcxLocalizer [3]
    FileName = 
      'C:\DISCO DURO\proyectos\subocasoft\facturacion\CXLOCALIZATION.in' +
      'i'
    Left = 944
    Top = 424
  end
  inherited dsTablaG: TDataSource [4]
    DataSet = dmFac.unqryFac
    OnDataChange = dsTablaGDataChange
    Left = 996
    Top = 431
  end
end
