inherited frmMtoFacRec: TfrmMtoFacRec
  Left = 7
  Top = 0
  Caption = 'Facturas Rectificativas'
  ClientHeight = 661
  ClientWidth = 781
  ExplicitTop = -88
  ExplicitWidth = 797
  ExplicitHeight = 699
  PixelsPerInch = 96
  TextHeight = 13
  inherited pButtonPage: TPanel
    Width = 679
    Height = 634
    ExplicitWidth = 679
    ExplicitHeight = 634
  end
  inherited pButtonRightBar: TPanel
    Left = 679
    Height = 634
    ExplicitLeft = 679
    ExplicitHeight = 634
    object btnImprimir: TSpeedButton [0]
      Left = 4
      Top = 353
      Width = 96
      Height = 27
      Cursor = crHandPoint
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      OnClick = btnImprimirClick
    end
    inherited pButtonGen: TPanel
      Top = 472
      ExplicitTop = 472
    end
  end
  inherited pcPantalla: TPageControl
    Width = 679
    Height = 634
    ExplicitWidth = 679
    ExplicitHeight = 634
    inherited tsLista: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 29
      ExplicitWidth = 671
      ExplicitHeight = 601
      inherited cxGrdPrincipal: TcxGrid
        Width = 671
        Height = 572
        ExplicitWidth = 671
        ExplicitHeight = 572
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          object tvcGrdDBTabPrinSERIE: TcxGridDBColumn
            DataBinding.FieldName = 'SERIE'
          end
          object tvcGrdDBTabPrinNUMFAC: TcxGridDBColumn
            DataBinding.FieldName = 'NUMFAC'
          end
          object tvcGrdDBTabPrinTIPO_FRA_RECTIFICADA: TcxGridDBColumn
            DataBinding.FieldName = 'TIPO_FRA_RECTIFICADA'
          end
          object tvcGrdDBTabPrinFECHA: TcxGridDBColumn
            DataBinding.FieldName = 'FECHA'
            PropertiesClassName = 'TcxDateEditProperties'
          end
          object tvcGrdDBTabPrinCODCLI: TcxGridDBColumn
            DataBinding.FieldName = 'CODCLI'
          end
          object tvcGrdDBTabPrinNOMCLI: TcxGridDBColumn
            DataBinding.FieldName = 'NOMCLI'
          end
          object tvcGrdDBTabPrinBASE0: TcxGridDBColumn
            DataBinding.FieldName = 'BASE0'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinBASE1: TcxGridDBColumn
            DataBinding.FieldName = 'BASE1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinIVA0: TcxGridDBColumn
            DataBinding.FieldName = 'IVA0'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinIVA1: TcxGridDBColumn
            DataBinding.FieldName = 'IVA1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinRE1: TcxGridDBColumn
            DataBinding.FieldName = 'RE1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinSUM_IVA: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_IVA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinSUM_BASE: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_BASE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinSUM_RE: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_RE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinSUM_IRPF: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_IRPF'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinSUBTOTAL: TcxGridDBColumn
            DataBinding.FieldName = 'SUBTOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinTOTAL: TcxGridDBColumn
            DataBinding.FieldName = 'TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tvcGrdDBTabPrinPAGADO: TcxGridDBColumn
            DataBinding.FieldName = 'PAGADO'
          end
          object tvcGrdDBTabPrinCOMENTARIO: TcxGridDBColumn
            DataBinding.FieldName = 'COMENTARIO'
          end
          object tvcGrdDBTabPrinCOMENTARIO2: TcxGridDBColumn
            DataBinding.FieldName = 'COMENTARIO2'
          end
          object tvcGrdDBTabPrinCOMENTARIO3: TcxGridDBColumn
            DataBinding.FieldName = 'COMENTARIO3'
          end
          object tvcGrdDBTabPrinAGENTE: TcxGridDBColumn
            DataBinding.FieldName = 'AGENTE'
          end
          object tvcGrdDBTabPrinPEDIDO: TcxGridDBColumn
            DataBinding.FieldName = 'PEDIDO'
          end
          object tvcGrdDBTabPrinESTADO: TcxGridDBColumn
            DataBinding.FieldName = 'ESTADO'
          end
          object tvcGrdDBTabPrinPORCENTAJE_RETENCION: TcxGridDBColumn
            DataBinding.FieldName = 'PORCENTAJE_RETENCION'
          end
          object tvcGrdDBTabPrinIMPORTE_RETENCION: TcxGridDBColumn
            DataBinding.FieldName = 'IMPORTE_RETENCION'
          end
          object tvcGrdDBTabPrinAPLICADA_RETENCION: TcxGridDBColumn
            DataBinding.FieldName = 'APLICADA_RETENCION'
          end
          object tvcGrdDBTabPrinCONCEPTO_RETENCION: TcxGridDBColumn
            DataBinding.FieldName = 'CONCEPTO_RETENCION'
          end
          object tvcGrdDBTabPrinDESCONTAR_RETENCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCONTAR_RETENCION'
          end
          object tvcGrdDBTabPrinLIQUIDADA: TcxGridDBColumn
            DataBinding.FieldName = 'LIQUIDADA'
          end
          object tvcGrdDBTabPrinPENDIENTE: TcxGridDBColumn
            DataBinding.FieldName = 'PENDIENTE'
          end
          object tvcGrdDBTabPrinANTICIPO: TcxGridDBColumn
            DataBinding.FieldName = 'ANTICIPO'
          end
          object tvcGrdDBTabPrinREFERENCIA: TcxGridDBColumn
            DataBinding.FieldName = 'REFERENCIA'
          end
          object tvcGrdDBTabPrinFACTURA_ABONO: TcxGridDBColumn
            DataBinding.FieldName = 'FACTURA_ABONO'
          end
          object tvcGrdDBTabPrinDEVOLUCION_FACTURA: TcxGridDBColumn
            DataBinding.FieldName = 'DEVOLUCION_FACTURA'
          end
          object tvcGrdDBTabPrinIBAN: TcxGridDBColumn
            DataBinding.FieldName = 'IBAN'
          end
          object tvcGrdDBTabPrinBIC: TcxGridDBColumn
            DataBinding.FieldName = 'BIC'
          end
          object tvcGrdDBTabPrinIMPORTADO: TcxGridDBColumn
            DataBinding.FieldName = 'IMPORTADO'
          end
          object tvcGrdDBTabPrinHora: TcxGridDBColumn
            DataBinding.FieldName = 'Hora'
          end
          object tvcGrdDBTabPrinnombreCliente: TcxGridDBColumn
            DataBinding.FieldName = 'nombreCliente'
          end
          object tvcGrdDBTabPrinapellidosCliente: TcxGridDBColumn
            DataBinding.FieldName = 'apellidosCliente'
          end
          object tvcGrdDBTabPrinrazonsocialCliente: TcxGridDBColumn
            DataBinding.FieldName = 'razonsocialCliente'
          end
          object tvcGrdDBTabPrindniCliente: TcxGridDBColumn
            DataBinding.FieldName = 'dniCliente'
          end
          object tvcGrdDBTabPrinMovilCliente: TcxGridDBColumn
            DataBinding.FieldName = 'MovilCliente'
          end
          object tvcGrdDBTabPrinemailCliente: TcxGridDBColumn
            DataBinding.FieldName = 'emailCliente'
          end
          object tvcGrdDBTabPrindireccionCliente: TcxGridDBColumn
            DataBinding.FieldName = 'direccionCliente'
          end
          object tvcGrdDBTabPrinpoblacionCliente: TcxGridDBColumn
            DataBinding.FieldName = 'poblacionCliente'
          end
          object tvcGrdDBTabPrinprovinciaCliente: TcxGridDBColumn
            DataBinding.FieldName = 'provinciaCliente'
          end
          object tvcGrdDBTabPrinCPCliente: TcxGridDBColumn
            DataBinding.FieldName = 'CPCliente'
          end
          object tvcGrdDBTabPrinPaisCliente: TcxGridDBColumn
            DataBinding.FieldName = 'PaisCliente'
          end
          object tvcGrdDBTabPrinNombre_Envio_AuxCliente: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre_Envio_AuxCliente'
          end
          object tvcGrdDBTabPrinDireccion_Envio_AuxCliente: TcxGridDBColumn
            DataBinding.FieldName = 'Direccion_Envio_AuxCliente'
          end
          object tvcGrdDBTabPrinCP_Envio_AuxCliente: TcxGridDBColumn
            DataBinding.FieldName = 'CP_Envio_AuxCliente'
          end
          object tvcGrdDBTabPrinPoblacion_Envio_AuxCliente: TcxGridDBColumn
            DataBinding.FieldName = 'Poblacion_Envio_AuxCliente'
          end
          object tvcGrdDBTabPrinProvincia_Envio_AuxCliente: TcxGridDBColumn
            DataBinding.FieldName = 'Provincia_Envio_AuxCliente'
          end
          object tvcGrdDBTabPrinPais_Envio_auxCliente: TcxGridDBColumn
            DataBinding.FieldName = 'Pais_Envio_auxCliente'
          end
          object tvcGrdDBTabPrininstantemodif: TcxGridDBColumn
            DataBinding.FieldName = 'instantemodif'
          end
          object tvcGrdDBTabPrinusuariomodif: TcxGridDBColumn
            DataBinding.FieldName = 'usuariomodif'
          end
          object tvcGrdDBTabPrinNUM_FRA_RECTIFICADA: TcxGridDBColumn
            DataBinding.FieldName = 'NUM_FRA_RECTIFICADA'
          end
          object tvcGrdDBTabPrinSERIE_FRA_RECTIFICADA: TcxGridDBColumn
            DataBinding.FieldName = 'SERIE_FRA_RECTIFICADA'
          end
        end
      end
      inherited pnTopGrid: TPanel
        Width = 671
        ExplicitWidth = 671
        inherited RzPanel1: TRzPanel
          inherited edtBusqGlobal: TcxTextEdit
            ExplicitHeight = 23
          end
        end
        inherited RzPanel3: TRzPanel
          inherited chkCaseM: TcxCheckBox
            ExplicitHeight = 23
          end
        end
        inherited RzPanel2: TRzPanel
          inherited chkSoloActivos: TcxCheckBox
            ExplicitHeight = 23
          end
        end
        inherited RzPanel4: TRzPanel
          inherited chkEditInList: TcxCheckBox
            ExplicitHeight = 23
          end
        end
      end
    end
    inherited tsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 29
      ExplicitWidth = 671
      ExplicitHeight = 601
      object pnl1: TPanel
        Left = 0
        Top = 273
        Width = 671
        Height = 328
        Align = alClient
        TabOrder = 1
        object cxspl1: TcxSplitter
          Left = 1
          Top = 1
          Width = 669
          Height = 8
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnl2
          ExplicitTop = 273
        end
        object cxpgcntrl2: TcxPageControl
          Left = 1
          Top = 9
          Width = 669
          Height = 318
          Align = alClient
          TabOrder = 1
          Properties.ActivePage = ts6
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 314
          ClientRectLeft = 4
          ClientRectRight = 665
          ClientRectTop = 26
          object ts4: TcxTabSheet
            Caption = 'Lineas de Factura'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxgrd5: TcxGrid
              Left = 0
              Top = 0
              Width = 661
              Height = 288
              Align = alClient
              TabOrder = 0
              object tv1: TcxGridDBTableView
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                DataController.DataModeController.SmartRefresh = True
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NewItemRow.Visible = True
                OptionsCustomize.ColumnGrouping = False
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object tvctv1linea: TcxGridDBColumn
                  DataBinding.FieldName = 'linea'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Width = 48
                end
                object tvctv1codigo: TcxGridDBColumn
                  DataBinding.FieldName = 'codigo'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = tvctv1codigoPropertiesButtonClick
                  Width = 121
                end
                object tvctv1familia: TcxGridDBColumn
                  DataBinding.FieldName = 'familia'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Width = 116
                end
                object tvctv1nombre: TcxGridDBColumn
                  DataBinding.FieldName = 'nombre'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Width = 230
                end
                object tvctv1cantidad: TcxGridDBColumn
                  DataBinding.FieldName = 'CANTIDAD'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Width = 62
                end
                object tvctv1precio: TcxGridDBColumn
                  DataBinding.FieldName = 'precio'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.ReadOnly = True
                  Width = 58
                end
                object tvctv1iva: TcxGridDBColumn
                  DataBinding.FieldName = 'iva'
                  PropertiesClassName = 'TcxMaskEditProperties'
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '\d\d'
                  Properties.ReadOnly = True
                  Width = 33
                end
                object tvctv1imp_iva: TcxGridDBColumn
                  DataBinding.FieldName = 'imp_iva'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.ReadOnly = True
                end
                object tvctv1neto: TcxGridDBColumn
                  DataBinding.FieldName = 'neto'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.ReadOnly = False
                  Width = 59
                end
              end
              object tv2: TcxGridDBBandedTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                DataController.DetailKeyFieldNames = 'AppointmentId'
                DataController.KeyFieldNames = 'PerId'
                DataController.MasterKeyFieldNames = 'AppointmentId'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                Bands = <
                  item
                    Width = 958
                  end>
                object cxgrdbndclmntv2PerId: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'PerId'
                  Width = 37
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2AppointmentId: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'AppointmentId'
                  Width = 81
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2Linea: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'Linea'
                  Width = 44
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2clave: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'clave'
                  Width = 126
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2valor: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'valor'
                  Width = 146
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2instantemodif: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'instantemodif'
                  Width = 137
                  Position.BandIndex = 0
                  Position.ColIndex = 7
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2descripcion: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'descripcion'
                  Width = 178
                  Position.BandIndex = 0
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
                object cxgrdbndclmntv2parte: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'parte'
                  Width = 209
                  Position.BandIndex = 0
                  Position.ColIndex = 6
                  Position.RowIndex = 0
                end
              end
              object lv1: TcxGridLevel
                GridView = tv1
              end
            end
          end
          object ts5: TcxTabSheet
            Caption = 'Totales'
            ImageIndex = 2
            object cxlbl15: TcxLabel
              Left = 28
              Top = 16
              Caption = 'Base Imponible'
            end
            object cxlbl16: TcxLabel
              Left = 88
              Top = 45
              Caption = 'IVA '
            end
            object cxlbl17: TcxLabel
              Left = 82
              Top = 73
              Caption = 'Total'
            end
            object DBEF_PAGO: TcxDBTextEdit
              Left = 119
              Top = 97
              DataBinding.DataField = 'F_PAGO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 6
              Width = 50
            end
            object cxlbl18: TcxLabel
              Left = 29
              Top = 101
              Caption = 'Forma de Pago'
            end
            object cxlbl19: TcxLabel
              Left = 64
              Top = 130
              Caption = 'Anticipo'
            end
            object cxlbl7: TcxLabel
              Left = 70
              Top = 154
              Caption = 'Pagado'
            end
            object dbchkPAGADO: TDBCheckBox
              Left = 120
              Top = 152
              Width = 25
              Height = 17
              DataField = 'PAGADO'
              DataSource = dsTablaG
              TabOrder = 10
              ValueChecked = '1'
              ValueUnchecked = '0'
              WordWrap = True
            end
            object cxDBCurrencyEdit1: TcxDBCurrencyEdit
              Left = 120
              Top = 14
              DataBinding.DataField = 'SUM_BASE'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = True
              TabOrder = 0
              Width = 121
            end
            object cxDBCurrencyEdit2: TcxDBCurrencyEdit
              Left = 120
              Top = 41
              DataBinding.DataField = 'SUM_IVA'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = True
              TabOrder = 2
              Width = 121
            end
            object cxDBCurrencyEdit3: TcxDBCurrencyEdit
              Left = 120
              Top = 70
              DataBinding.DataField = 'TOTAL'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = True
              TabOrder = 4
              Width = 121
            end
            object cxDBCurrencyEdit4: TcxDBCurrencyEdit
              Left = 120
              Top = 126
              DataBinding.DataField = 'ANTICIPO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 8
              Width = 121
            end
          end
          object ts6: TcxTabSheet
            Caption = 'Factura Origen'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 661
              Height = 288
              Align = alClient
              TabOrder = 0
              object tvFacturas: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                DataController.DataModeController.SmartRefresh = True
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnGrouping = False
                OptionsView.GroupByBox = False
                object cxgrdbclmnGridDBTableView1NUMFAC: TcxGridDBColumn
                  DataBinding.FieldName = 'NUMFAC'
                end
                object cxgrdbclmnGridDBTableView1CODCLI: TcxGridDBColumn
                  DataBinding.FieldName = 'CODCLI'
                end
                object cxgrdbclmnGridDBTableView1NOMCLI: TcxGridDBColumn
                  DataBinding.FieldName = 'NOMCLI'
                  Width = 80
                end
                object cxgrdbclmnGridDBTableView1FECHA: TcxGridDBColumn
                  DataBinding.FieldName = 'FECHA'
                end
                object cxgrdbclmnGridDBTableView1SUM_BASE: TcxGridDBColumn
                  DataBinding.FieldName = 'SUM_BASE'
                end
                object cxgrdbclmnGridDBTableView1SUM_IVA: TcxGridDBColumn
                  DataBinding.FieldName = 'SUM_IVA'
                end
                object cxgrdbclmnGridDBTableView1SUBTOTAL: TcxGridDBColumn
                  DataBinding.FieldName = 'SUBTOTAL'
                end
                object cxgrdbclmnGridDBTableView1TOTAL: TcxGridDBColumn
                  DataBinding.FieldName = 'TOTAL'
                end
                object cxgrdbclmnGridDBTableView1F_PAGO: TcxGridDBColumn
                  DataBinding.FieldName = 'F_PAGO'
                  Width = 68
                end
                object cxgrdbclmnGridDBTableView1PAGADO: TcxGridDBColumn
                  DataBinding.FieldName = 'PAGADO'
                  Width = 80
                end
                object cxgrdbclmnGridDBTableView1VENC1: TcxGridDBColumn
                  DataBinding.FieldName = 'VENC1'
                end
                object cxgrdbclmnGridDBTableView1COMENTARIO: TcxGridDBColumn
                  DataBinding.FieldName = 'COMENTARIO'
                  Width = 105
                end
                object cxgrdbclmnGridDBTableView1AGENTE: TcxGridDBColumn
                  DataBinding.FieldName = 'AGENTE'
                  Width = 59
                end
                object cxgrdbclmnGridDBTableView1PEDIDO: TcxGridDBColumn
                  DataBinding.FieldName = 'PEDIDO'
                  Width = 81
                end
                object cxgrdbclmnGridDBTableView1ANTICIPO: TcxGridDBColumn
                  DataBinding.FieldName = 'ANTICIPO'
                end
                object cxgrdbclmnGridDBTableView1DEVOLUCION_FACTURA: TcxGridDBColumn
                  DataBinding.FieldName = 'DEVOLUCION_FACTURA'
                  Width = 144
                end
                object cxgrdbclmnFacturasSERIE: TcxGridDBColumn
                  DataBinding.FieldName = 'SERIE'
                end
              end
              object tvLinFac: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                DataController.DetailKeyFieldNames = 'NUMFAC'
                DataController.KeyFieldNames = 'NUMERO'
                DataController.MasterKeyFieldNames = 'NUMFAC'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                object cxgrdbclmnGrid1DBTableView2LINEA: TcxGridDBColumn
                  DataBinding.FieldName = 'LINEA'
                  Width = 49
                end
                object cxgrdbclmnGrid1DBTableView2CODIGO: TcxGridDBColumn
                  DataBinding.FieldName = 'CODIGO'
                  Width = 144
                end
                object cxgrdbclmnGrid1DBTableView2NOMBRE: TcxGridDBColumn
                  DataBinding.FieldName = 'NOMBRE'
                  Width = 264
                end
                object cxgrdbclmnGrid1DBTableView2CANTIDAD: TcxGridDBColumn
                  DataBinding.FieldName = 'CANTIDAD'
                  Width = 74
                end
                object cxgrdbclmnGrid1DBTableView2PRECIO: TcxGridDBColumn
                  DataBinding.FieldName = 'PRECIO'
                  Width = 88
                end
                object cxgrdbclmnGrid1DBTableView2IMP_IVA: TcxGridDBColumn
                  DataBinding.FieldName = 'IMP_IVA'
                  Width = 74
                end
                object cxgrdbclmnGrid1DBTableView2NETO: TcxGridDBColumn
                  DataBinding.FieldName = 'NETO'
                  Width = 74
                end
                object cxgrdbclmnGrid1DBTableView2P_UNI: TcxGridDBColumn
                  DataBinding.FieldName = 'P_UNI'
                  Visible = False
                  Width = 88
                end
                object cxgrdbclmnGrid1DBTableView2PCOSTE: TcxGridDBColumn
                  DataBinding.FieldName = 'PCOSTE'
                  Visible = False
                  Width = 88
                end
                object cxgrdbclmnGrid1DBTableView2NUMERO: TcxGridDBColumn
                  DataBinding.FieldName = 'NUMERO'
                  Visible = False
                  Width = 109
                end
                object cxgrdbclmnGrid1DBTableView2IVA: TcxGridDBColumn
                  DataBinding.FieldName = 'IVA'
                  Visible = False
                  Width = 25
                end
                object cxgrdbclmnGrid1DBTableView2DTO: TcxGridDBColumn
                  DataBinding.FieldName = 'DTO'
                  Visible = False
                  Width = 39
                end
                object cxgrdbclmnGrid1DBTableView2PROP1: TcxGridDBColumn
                  DataBinding.FieldName = 'PROP1'
                  Visible = False
                  Width = 109
                end
                object cxgrdbclmnGrid1DBTableView2PROP2: TcxGridDBColumn
                  DataBinding.FieldName = 'PROP2'
                  Visible = False
                  Width = 109
                end
                object cxgrdbclmnGrid1DBTableView2PROP3: TcxGridDBColumn
                  DataBinding.FieldName = 'PROP3'
                  Visible = False
                  Width = 109
                end
                object cxgrdbclmnGrid1DBTableView2PIEZAS: TcxGridDBColumn
                  DataBinding.FieldName = 'PIEZAS'
                  Visible = False
                  Width = 214
                end
                object cxgrdbclmnGrid1DBTableView2ALMACEN: TcxGridDBColumn
                  DataBinding.FieldName = 'ALMACEN'
                  Visible = False
                  Width = 46
                end
                object cxgrdbclmnGrid1DBTableView2DTO2: TcxGridDBColumn
                  DataBinding.FieldName = 'DTO2'
                  Visible = False
                  Width = 39
                end
                object cxgrdbclmnGrid1DBTableView2PRESENTACION: TcxGridDBColumn
                  DataBinding.FieldName = 'PRESENTACION'
                  Visible = False
                  Width = 354
                end
                object cxgrdbclmnGrid1DBTableView2UBICACION: TcxGridDBColumn
                  DataBinding.FieldName = 'UBICACION'
                  Visible = False
                  Width = 704
                end
                object cxgrdbclmnGrid1DBTableView2SERIE: TcxGridDBColumn
                  DataBinding.FieldName = 'SERIE'
                  Visible = False
                  Width = 20
                end
              end
              object lvFacturas: TcxGridLevel
                GridView = tvFacturas
                object lvLinFac: TcxGridLevel
                  GridView = tvLinFac
                end
              end
            end
          end
          object ts8: TcxTabSheet
            Caption = 'Otros'
            ImageIndex = 4
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxdbrdgrp2: TcxDBRadioGroup
              Left = 32
              Top = 16
              Caption = 'Tipo Factura Rectificada'
              DataBinding.DataField = 'TIPO_FRA_RECTIFICADA'
              DataBinding.DataSource = dsTablaG
              Properties.Items = <
                item
                  Caption = 'Normal'
                  Value = 'N'
                end
                item
                  Caption = 'DUA IVA Incl'
                  Value = 'D'
                end
                item
                  Caption = 'DUA Ingl'#233's'
                  Value = 'I'
                end
                item
                  Caption = 'Tax Free'
                  Value = 'T'
                end>
              TabOrder = 0
              Height = 137
              Width = 185
            end
            object DBE2: TcxDBTextEdit
              Left = 168
              Top = 195
              DataBinding.DataField = 'NUM_FRA_RECTIFICADA'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 81
            end
            object cxlbl10: TcxLabel
              Left = 29
              Top = 197
              Caption = 'Numero Factura Origen'
            end
            object DBENUM_FRA_RECTIFICADA: TcxDBTextEdit
              Left = 168
              Top = 163
              DataBinding.DataField = 'SERIE_FRA_RECTIFICADA'
              DataBinding.DataSource = dsTablaG
              TabOrder = 1
              Width = 33
            end
            object cxlbl11: TcxLabel
              Left = 45
              Top = 165
              Caption = 'Serie Factura Origen'
            end
            object cxlbl12: TcxLabel
              Left = 85
              Top = 229
              Caption = 'Comentarios'
            end
            object cxdbm1: TcxDBMemo
              Left = 168
              Top = 229
              DataBinding.DataField = 'COMENTARIO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 6
              Height = 89
              Width = 185
            end
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 671
        Height = 273
        Align = alTop
        TabOrder = 0
        object pnl3: TPanel
          Left = 1
          Top = 1
          Width = 624
          Height = 271
          Align = alLeft
          TabOrder = 0
          object cxpgcntrl1: TcxPageControl
            Left = 1
            Top = 1
            Width = 622
            Height = 269
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = ts1
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 265
            ClientRectLeft = 4
            ClientRectRight = 618
            ClientRectTop = 26
            object ts1: TcxTabSheet
              Caption = 'Cabecera Factura'
              ImageIndex = 0
              object cxlbl1: TcxLabel
                Left = 17
                Top = 16
                Caption = 'Nro Factura'
              end
              object DBE1: TcxDBTextEdit
                Left = 87
                Top = 12
                DataBinding.DataField = 'NUMFAC'
                DataBinding.DataSource = dsTablaG
                Properties.ReadOnly = True
                TabOrder = 1
                Width = 121
              end
              object cxlbl3: TcxLabel
                Left = 45
                Top = 82
                Caption = 'Fecha'
              end
              object cxdbdtdt1: TcxDBDateEdit
                Left = 88
                Top = 78
                DataBinding.DataField = 'FECHA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 10
                Width = 121
              end
              object DBE19: TcxDBTextEdit
                Left = 335
                Top = 12
                DataBinding.DataField = 'CODCLI'
                DataBinding.DataSource = dsTablaG
                Style.Shadow = False
                TabOrder = 2
                Width = 121
              end
              object cxlbl2: TcxLabel
                Left = 229
                Top = 16
                Caption = 'C'#243'digo de Cliente'
              end
              object DBENOMCLI: TcxDBTextEdit
                Left = 335
                Top = 44
                DataBinding.DataField = 'NOMCLI'
                DataBinding.DataSource = dsTablaG
                TabOrder = 6
                Width = 226
              end
              object cxlbl5: TcxLabel
                Left = 219
                Top = 48
                Caption = 'Nombre del Cliente'
              end
              object DBENUMFAC: TcxDBTextEdit
                Left = 88
                Top = 44
                DataBinding.DataField = 'SERIE'
                DataBinding.DataSource = dsTablaG
                TabOrder = 5
                Width = 104
              end
              object cxlbl8: TcxLabel
                Left = 9
                Top = 48
                Caption = 'Serie Factura'
              end
              object DBECODCLI2: TcxDBTextEdit
                Left = 335
                Top = 76
                DataBinding.DataField = 'AGENTE'
                DataBinding.DataSource = dsTablaG
                TabOrder = 7
                Width = 58
              end
              object cxlbl9: TcxLabel
                Left = 269
                Top = 80
                Caption = 'Vendedor'
              end
              object btn1: TcxButton
                Left = 451
                Top = 11
                Width = 22
                Height = 25
                Caption = '...'
                TabOrder = 0
                OnClick = btn1Click
              end
            end
            object ts2: TcxTabSheet
              Caption = 'Datos Cliente - Cabecera Factura'
              ImageIndex = 1
              object DBE3: TcxDBTextEdit
                Left = 103
                Top = 12
                DataBinding.DataField = 'CODCLI'
                DataBinding.DataSource = dsTablaG
                TabOrder = 1
                Width = 121
              end
              object cxlbl4: TcxLabel
                Left = 16
                Top = 16
                Caption = 'C'#243'digo Cliente'
              end
              object DBEdireccionCliente5: TcxDBTextEdit
                Left = 239
                Top = 12
                DataBinding.DataField = 'razonsocialCliente'
                DataBinding.DataSource = dsTablaG
                TabOrder = 2
                Width = 266
              end
              object cxgrpbx1: TcxGroupBox
                Left = 8
                Top = 48
                Caption = 'Facturaci'#243'n'
                TabOrder = 4
                Height = 161
                Width = 297
                object DBEdireccionCliente4: TcxDBTextEdit
                  Left = 14
                  Top = 22
                  DataBinding.DataField = 'razonsocialCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 0
                  Width = 266
                end
                object DBEpoblacionCliente: TcxDBTextEdit
                  Left = 14
                  Top = 79
                  DataBinding.DataField = 'CPCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 1
                  Width = 57
                end
                object DBEdireccionCliente: TcxDBTextEdit
                  Left = 78
                  Top = 79
                  DataBinding.DataField = 'poblacionCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 2
                  Width = 201
                end
                object DBEdireccionCliente1: TcxDBTextEdit
                  Left = 14
                  Top = 106
                  DataBinding.DataField = 'direccionCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 3
                  Width = 266
                end
                object DBEdireccionCliente6: TcxDBTextEdit
                  Left = 14
                  Top = 133
                  DataBinding.DataField = 'PaisCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 4
                  Width = 266
                end
              end
              object cxgrpbx2: TcxGroupBox
                Left = 312
                Top = 48
                Caption = 'Env'#237'o Cliente'
                TabOrder = 5
                Height = 161
                Width = 297
                object DBECODCLI: TcxDBTextEdit
                  Left = 7
                  Top = 20
                  DataBinding.DataField = 'Nombre_Envio_AuxCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 0
                  Width = 266
                end
                object DBEdireccionCliente2: TcxDBTextEdit
                  Left = 7
                  Top = 48
                  DataBinding.DataField = 'Direccion_Envio_AuxCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 1
                  Width = 266
                end
                object DBECPCliente: TcxDBTextEdit
                  Left = 8
                  Top = 76
                  DataBinding.DataField = 'CP_Envio_AuxCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 2
                  Width = 57
                end
                object DBEpoblacionCliente1: TcxDBTextEdit
                  Left = 72
                  Top = 76
                  DataBinding.DataField = 'Poblacion_Envio_AuxCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 3
                  Width = 201
                end
                object DBEdireccionCliente3: TcxDBTextEdit
                  Left = 7
                  Top = 103
                  DataBinding.DataField = 'Provincia_Envio_AuxCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 4
                  Width = 266
                end
                object DBEdireccionCliente7: TcxDBTextEdit
                  Left = 7
                  Top = 130
                  DataBinding.DataField = 'Pais_Envio_auxCliente'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 5
                  Width = 266
                end
              end
              object DBEemail1: TcxDBTextEdit
                Left = 22
                Top = 213
                DataBinding.DataField = 'emailCliente'
                DataBinding.DataSource = dsTablaG
                TabOrder = 6
                Width = 266
              end
              object DBEMovil: TcxDBTextEdit
                Left = 319
                Top = 213
                DataBinding.DataField = 'MovilCliente'
                DataBinding.DataSource = dsTablaG
                TabOrder = 7
                Width = 266
              end
              object btn3: TcxButton
                Left = 513
                Top = 3
                Width = 97
                Height = 45
                Caption = 'Copiar Datos Maestros'
                TabOrder = 0
                WordWrap = True
                OnClick = btn3Click
              end
            end
            object ts3: TcxTabSheet
              Caption = 'Datos Maestros Cliente'
              ImageIndex = 2
              object DBECODCLI1: TcxDBTextEdit
                Left = 103
                Top = 12
                DataBinding.DataField = 'CODCLI'
                DataBinding.DataSource = dsTablaG
                Properties.ReadOnly = True
                TabOrder = 0
                Width = 121
              end
              object cxlbl6: TcxLabel
                Left = 16
                Top = 16
                Caption = 'C'#243'digo Cliente'
              end
              object DBEnombreCliente1: TcxDBTextEdit
                Left = 239
                Top = 12
                DataBinding.DataField = 'nombre'
                Properties.ReadOnly = False
                TabOrder = 1
                Width = 122
              end
              object cxgrpbx3: TcxGroupBox
                Left = 8
                Top = 48
                Caption = 'Facturaci'#243'n'
                TabOrder = 4
                Height = 161
                Width = 297
                object DBErazonsocialCliente: TcxDBTextEdit
                  Left = 15
                  Top = 22
                  DataBinding.DataField = 'razonsocial'
                  TabOrder = 0
                  Width = 266
                end
                object DBEdireccionCliente8: TcxDBTextEdit
                  Left = 15
                  Top = 52
                  DataBinding.DataField = 'direccion'
                  TabOrder = 1
                  Width = 266
                end
                object DBECPCliente1: TcxDBTextEdit
                  Left = 16
                  Top = 79
                  DataBinding.DataField = 'CP'
                  TabOrder = 2
                  Width = 57
                end
                object DBEpoblacionCliente2: TcxDBTextEdit
                  Left = 80
                  Top = 79
                  DataBinding.DataField = 'poblacion'
                  TabOrder = 3
                  Width = 201
                end
                object DBEdireccionCliente9: TcxDBTextEdit
                  Left = 15
                  Top = 106
                  DataBinding.DataField = 'provincia'
                  TabOrder = 4
                  Width = 266
                end
                object DBEPaisCliente: TcxDBTextEdit
                  Left = 15
                  Top = 133
                  DataBinding.DataField = 'Pais'
                  TabOrder = 5
                  Width = 266
                end
              end
              object cxgrpbx4: TcxGroupBox
                Left = 312
                Top = 48
                Caption = 'Env'#237'o Cliente'
                TabOrder = 5
                Height = 161
                Width = 297
                object DBENombre_Envio_AuxCliente: TcxDBTextEdit
                  Left = 7
                  Top = 20
                  DataBinding.DataField = 'Nombre_Envio_Aux'
                  TabOrder = 0
                  Width = 266
                end
                object DBEdireccionCliente10: TcxDBTextEdit
                  Left = 7
                  Top = 48
                  DataBinding.DataField = 'Direccion_Envio_Aux'
                  TabOrder = 1
                  Width = 266
                end
                object DBECPCliente2: TcxDBTextEdit
                  Left = 8
                  Top = 76
                  DataBinding.DataField = 'CP_Envio_Aux'
                  TabOrder = 2
                  Width = 57
                end
                object DBEpoblacionCliente3: TcxDBTextEdit
                  Left = 72
                  Top = 76
                  DataBinding.DataField = 'Poblacion_Envio_Aux'
                  TabOrder = 3
                  Width = 201
                end
                object DBEdireccionCliente11: TcxDBTextEdit
                  Left = 7
                  Top = 103
                  DataBinding.DataField = 'Provincia_Envio_Aux'
                  TabOrder = 4
                  Width = 266
                end
                object DBEPais_Envio_auxCliente: TcxDBTextEdit
                  Left = 7
                  Top = 130
                  DataBinding.DataField = 'Pais_Envio_aux'
                  TabOrder = 5
                  Width = 266
                end
              end
              object DBEPaisCliente1: TcxDBTextEdit
                Left = 23
                Top = 213
                DataBinding.DataField = 'email'
                TabOrder = 6
                Width = 266
              end
              object DBEemail: TcxDBTextEdit
                Left = 319
                Top = 213
                DataBinding.DataField = 'Movil'
                TabOrder = 7
                Width = 266
              end
              object DBEnombre: TcxDBTextEdit
                Left = 367
                Top = 12
                DataBinding.DataField = 'apellidos'
                Properties.ReadOnly = False
                TabOrder = 2
                Width = 202
              end
            end
          end
        end
      end
    end
  end
  inherited sbStatus: TRzStatusBar
    Top = 634
    Width = 781
    ExplicitTop = 634
    ExplicitWidth = 781
    inherited spRecord: TRzStatusPane
      Left = 644
      ExplicitLeft = 652
    end
    inherited DBNControlDB1: TcxNavigator
      Width = 360
      ExplicitWidth = 360
    end
  end
end
