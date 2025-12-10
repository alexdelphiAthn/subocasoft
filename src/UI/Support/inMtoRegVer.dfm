inherited frmMtoRegVer: TfrmMtoRegVer
  Top = 274
  Caption = 'Registro Verifactu'
  ClientHeight = 373
  ClientWidth = 846
  Font.Height = -17
  ExplicitWidth = 862
  ExplicitHeight = 412
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 688
    Height = 373
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 688
    ExplicitHeight = 373
  end
  inherited pButtonRightBar: TPanel
    Left = 688
    Width = 158
    Height = 373
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 688
    ExplicitWidth = 158
    ExplicitHeight = 373
    inherited pButtonGen: TPanel
      Top = 246
      Width = 156
      Height = 127
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Constraints.MinHeight = 80
      Constraints.MinWidth = 99
      ExplicitTop = 245
      ExplicitWidth = 156
      ExplicitHeight = 127
      inherited sbGrabar: TSpeedButton
        Top = 20
        Width = 153
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 20
        ExplicitWidth = 153
        ExplicitHeight = 32
      end
      inherited sbCancelar: TSpeedButton
        Top = 55
        Width = 153
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 55
        ExplicitWidth = 153
        ExplicitHeight = 32
      end
      inherited sbSalir: TSpeedButton
        Top = 90
        Width = 153
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 90
        ExplicitWidth = 153
        ExplicitHeight = 32
      end
    end
    inherited pButtonBDStat: TPanel
      Width = 156
      Height = 70
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Constraints.MinHeight = 37
      Constraints.MinWidth = 99
      ExplicitWidth = 156
      ExplicitHeight = 70
      inherited pnTableName: TPanel
        Top = 14
        Width = 156
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 14
        ExplicitWidth = 156
        ExplicitHeight = 16
        inherited lblEditMode: TLabel
          Width = 156
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -14
          ExplicitTop = 0
          ExplicitWidth = 157
          ExplicitHeight = 14
        end
      end
      inherited Panel4: TPanel
        Width = 156
        Height = 14
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 156
        ExplicitHeight = 14
        inherited lblTablaOrigen: TLabel
          Width = 156
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -14
          ExplicitWidth = 157
          ExplicitHeight = 14
        end
      end
    end
    inherited cxdbnvgtr2: TcxDBNavigator
      Left = 7
      Top = 30
      Width = 144
      Height = 41
      ExplicitLeft = 7
      ExplicitTop = 30
      ExplicitWidth = 144
      ExplicitHeight = 41
    end
  end
  inherited pcPantalla: TPageControl
    Width = 688
    Height = 373
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Height = -17
    ExplicitWidth = 688
    ExplicitHeight = 373
    inherited tsLista: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitTop = 33
      ExplicitWidth = 684
      ExplicitHeight = 337
      inherited cxGrdPrincipal: TcxGrid
        Top = 34
        Width = 684
        Height = 303
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Height = -17
        ExplicitTop = 34
        ExplicitWidth = 680
        ExplicitHeight = 302
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          FilterRow.SeparatorWidth = 5
          FixedDataRows.SeparatorWidth = 5
          NewItemRow.SeparatorWidth = 5
          OptionsData.Editing = True
          OptionsView.NavigatorOffset = 40
          Preview.LeftIndent = 16
          Preview.RightIndent = 4
          object dbcGrdDBTabPrinID_LOG: TcxGridDBColumn
            Caption = 'Identificador'
            DataBinding.FieldName = 'ID_LOG'
            Width = 114
          end
          object dbcGrdDBTabPrinCREATED_AT_LOG: TcxGridDBColumn
            Caption = 'Fecha y hora ES'
            DataBinding.FieldName = 'CREATED_AT_LOG'
          end
          object dbcGrdDBTabPrinTIPO_EVENTO_LOG: TcxGridDBColumn
            Caption = 'Tipo Evento'
            DataBinding.FieldName = 'TIPO_EVENTO_LOG'
          end
          object dbcGrdDBTabPrinUSUARIO_LOG: TcxGridDBColumn
            Caption = 'Ordenador\Usuario'
            DataBinding.FieldName = 'USUARIO_LOG'
            Width = 169
          end
          object dbcGrdDBTabPrinVERSION_LOG: TcxGridDBColumn
            DataBinding.FieldName = 'VERSION_LOG'
            Width = 120
          end
          object dbcGrdDBTabPrinDESCRIPCION_LOG: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'DESCRIPCION_LOG'
            Width = 412
          end
          object dbcGrdDBTabPrinDATOS_ADICIONALES_LOG: TcxGridDBColumn
            Caption = 'Datos Adicionales'
            DataBinding.FieldName = 'DATOS_ADICIONALES_LOG'
            Width = 219
          end
          object dbcGrdDBTabPrinHASH_ANTERIOR_LOG: TcxGridDBColumn
            Caption = 'Hash Anterior'
            DataBinding.FieldName = 'HASH_ANTERIOR_LOG'
            Width = 710
          end
          object dbcGrdDBTabPrinHASH_PROPIO_LOG: TcxGridDBColumn
            Caption = 'Hash Propio'
            DataBinding.FieldName = 'HASH_PROPIO_LOG'
          end
          object dbcGrdDBTabPrinFIRMA_DIGITAL_LOG: TcxGridDBColumn
            Caption = 'Firma digital'
            DataBinding.FieldName = 'FIRMA_DIGITAL_LOG'
          end
          object dbcGrdDBTabPrinTIMESTAMP_LOG: TcxGridDBColumn
            Caption = 'Fecha y Hora UTC'
            DataBinding.FieldName = 'TIMESTAMP_LOG'
          end
          object dbcGrdDBTabPrinNRO_FACTURA_LOG: TcxGridDBColumn
            DataBinding.FieldName = 'NRO_FACTURA_LOG'
          end
          object dbcGrdDBTabPrinSERIE_FACTURA_LOG: TcxGridDBColumn
            DataBinding.FieldName = 'SERIE_FACTURA_LOG'
          end
        end
      end
      inherited pnTopGrid: TPanel
        Width = 684
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 680
        ExplicitHeight = 34
        inherited dxbvl1: TdxBevel
          Left = 4
          Width = 554
          Height = 28
          ExplicitLeft = 4
          ExplicitWidth = 554
          ExplicitHeight = 28
        end
        inherited btnRestoreWindow: TSpeedButton
          Left = 501
          Top = 4
          Width = 15
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -12
          ExplicitLeft = 501
          ExplicitTop = 4
          ExplicitWidth = 15
          ExplicitHeight = 14
        end
        inherited edtBusqGlobal: TcxTextEdit
          Left = 125
          Top = 3
          ExplicitLeft = 125
          ExplicitTop = 3
          ExplicitWidth = 125
          ExplicitHeight = 27
          Width = 125
        end
        inherited cxlblBusq: TcxLabel
          Left = 8
          Top = 4
          ExplicitLeft = 8
          ExplicitTop = 4
          ExplicitWidth = 125
          ExplicitHeight = 23
        end
        inherited cxdbnvgtr1: TcxDBNavigator
          Left = 254
          Width = 252
          Height = 26
          ExplicitLeft = 254
          ExplicitWidth = 252
          ExplicitHeight = 26
        end
      end
    end
    inherited tsFicha: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Height = -12
      ExplicitTop = 33
      ExplicitWidth = 684
      ExplicitHeight = 337
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = unqryRegVer
  end
  object unqryRegVer: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_verifactu_log_eventos'
      
        '  (ID_LOG, TIMESTAMP_LOG, TIPO_EVENTO_LOG, USUARIO_LOG, VERSION_' +
        'LOG, DESCRIPCION_LOG, DATOS_ADICIONALES_LOG, HASH_ANTERIOR_LOG, ' +
        'HASH_PROPIO_LOG, FIRMA_DIGITAL_LOG, CREATED_AT_LOG, NRO_FACTURA_' +
        'LOG, SERIE_FACTURA_LOG)'
      'VALUES'
      
        '  (:ID_LOG, :TIMESTAMP_LOG, :TIPO_EVENTO_LOG, :USUARIO_LOG, :VER' +
        'SION_LOG, :DESCRIPCION_LOG, :DATOS_ADICIONALES_LOG, :HASH_ANTERI' +
        'OR_LOG, :HASH_PROPIO_LOG, :FIRMA_DIGITAL_LOG, :CREATED_AT_LOG, :' +
        'NRO_FACTURA_LOG, :SERIE_FACTURA_LOG)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_verifactu_log_eventos'
      'WHERE'
      '  ID_LOG = :Old_ID_LOG')
    SQLUpdate.Strings = (
      'UPDATE suboc_verifactu_log_eventos'
      'SET'
      
        '  ID_LOG = :ID_LOG, TIMESTAMP_LOG = :TIMESTAMP_LOG, TIPO_EVENTO_' +
        'LOG = :TIPO_EVENTO_LOG, USUARIO_LOG = :USUARIO_LOG, VERSION_LOG ' +
        '= :VERSION_LOG, DESCRIPCION_LOG = :DESCRIPCION_LOG, DATOS_ADICIO' +
        'NALES_LOG = :DATOS_ADICIONALES_LOG, HASH_ANTERIOR_LOG = :HASH_AN' +
        'TERIOR_LOG, HASH_PROPIO_LOG = :HASH_PROPIO_LOG, FIRMA_DIGITAL_LO' +
        'G = :FIRMA_DIGITAL_LOG, CREATED_AT_LOG = :CREATED_AT_LOG, NRO_FA' +
        'CTURA_LOG = :NRO_FACTURA_LOG, SERIE_FACTURA_LOG = :SERIE_FACTURA' +
        '_LOG'
      'WHERE'
      '  ID_LOG = :Old_ID_LOG')
    SQLLock.Strings = (
      
        'SELECT ID_LOG, TIMESTAMP_LOG, TIPO_EVENTO_LOG, USUARIO_LOG, VERS' +
        'ION_LOG, DESCRIPCION_LOG, DATOS_ADICIONALES_LOG, HASH_ANTERIOR_L' +
        'OG, HASH_PROPIO_LOG, FIRMA_DIGITAL_LOG, CREATED_AT_LOG, NRO_FACT' +
        'URA_LOG, SERIE_FACTURA_LOG FROM suboc_verifactu_log_eventos'
      'WHERE'
      '  ID_LOG = :Old_ID_LOG'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID_LOG, TIMESTAMP_LOG, TIPO_EVENTO_LOG, USUARIO_LOG, VERS' +
        'ION_LOG, DESCRIPCION_LOG, DATOS_ADICIONALES_LOG, HASH_ANTERIOR_L' +
        'OG, HASH_PROPIO_LOG, FIRMA_DIGITAL_LOG, CREATED_AT_LOG, NRO_FACT' +
        'URA_LOG, SERIE_FACTURA_LOG FROM suboc_verifactu_log_eventos'
      'WHERE'
      '  ID_LOG = :ID_LOG')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_verifactu_log_eventos')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * FROM suboc_verifactu_log_eventos ORDER BY ID_LOG DESC')
    ReadOnly = True
    Active = True
    Left = 520
    Top = 240
  end
end
