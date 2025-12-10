inherited frmMtoFormasdePago: TfrmMtoFormasdePago
  Left = 5
  Top = 4
  Caption = 'Formas de Pago'
  ClientHeight = 388
  ClientWidth = 720
  ExplicitWidth = 736
  ExplicitHeight = 427
  TextHeight = 22
  inherited pButtonPage: TPanel
    Width = 522
    Height = 388
    ExplicitWidth = 526
    ExplicitHeight = 389
  end
  inherited pButtonRightBar: TPanel
    Left = 522
    Height = 388
    ExplicitLeft = 526
    ExplicitHeight = 389
    inherited pButtonGen: TPanel
      Top = 231
      ExplicitTop = 230
    end
    inherited pButtonBDStat: TPanel
      inherited pnTableName: TPanel
        inherited lblEditMode: TLabel
          Margins.Bottom = 0
        end
      end
      inherited Panel4: TPanel
        inherited lblTablaOrigen: TLabel
          Margins.Bottom = 0
        end
      end
    end
  end
  inherited pcPantalla: TPageControl
    Width = 522
    Height = 388
    ExplicitWidth = 526
    ExplicitHeight = 389
    inherited tsLista: TTabSheet
      ExplicitWidth = 518
      ExplicitHeight = 349
      inherited cxGrdPrincipal: TcxGrid
        Width = 518
        Height = 306
        ExplicitWidth = 518
        ExplicitHeight = 306
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          OptionsData.Editing = True
          object cxgrdbclmnGrdDBTabPrinCODIGO_FORMAPAGO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_FORMAPAGO'
            Width = 111
          end
          object cxgrdbclmnGrdDBTabPrinDESCRIPCION_FORMAPAGO: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'DESCRIPCION_FORMAPAGO'
            Width = 302
          end
          object cxgrdbclmnGrdDBTabPrinN_PLAZOS: TcxGridDBColumn
            Caption = 'N'#250'mero de plazos'
            DataBinding.FieldName = 'N_PLAZOS'
            Width = 210
          end
          object cxgrdbclmnGrdDBTabPrinDIAS_ENTRE_PLAZOS: TcxGridDBColumn
            Caption = 'D'#237'as entre plazos'
            DataBinding.FieldName = 'DIAS_ENTRE_PLAZOS'
            Width = 193
          end
          object cxgrdbclmnGrdDBTabPrinPORCEN_ANTICIPO: TcxGridDBColumn
            Caption = '% Anticipo'
            DataBinding.FieldName = 'PORCEN_ANTICIPO'
            Width = 172
          end
          object cxgrdbclmnGrdDBTabPrinDEFAULT_FACTURA: TcxGridDBColumn
            Caption = 'Forma de pago por defecto'
            DataBinding.FieldName = 'DEFAULT_FACTURA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Width = 428
          end
        end
      end
      inherited pnTopGrid: TPanel
        Width = 518
        ExplicitWidth = 522
        inherited edtBusqGlobal: TcxTextEdit
          ExplicitHeight = 30
        end
      end
    end
    inherited tsFicha: TTabSheet
      ExplicitWidth = 518
      ExplicitHeight = 349
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 518
        Height = 145
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 522
        object cxdbtxtdt1: TcxDBTextEdit
          Left = 104
          Top = 33
          DataBinding.DataField = 'CODIGO'
          DataBinding.DataSource = dsTablaG
          Enabled = False
          TabOrder = 1
          Width = 121
        end
        object cxlbl2: TcxLabel
          Left = 49
          Top = 37
          Caption = 'C'#243'digo'
          TabOrder = 2
        end
        object cxlbl1: TcxLabel
          Left = 46
          Top = 65
          Caption = 'Nombre'
          TabOrder = 4
        end
        object cxdbtxtdt2: TcxDBTextEdit
          Left = 104
          Top = 61
          DataBinding.DataField = 'DESCRIPCION'
          DataBinding.DataSource = dsTablaG
          TabOrder = 3
          Width = 241
        end
        object cxlbl18: TcxLabel
          Left = 791
          Top = 93
          Caption = 'Modificado'
          TabOrder = 6
        end
        object cxdbtxtdt15: TcxDBTextEdit
          Left = 856
          Top = 89
          DataBinding.DataField = 'modificado'
          DataBinding.DataSource = dsTablaG
          TabOrder = 5
          Width = 57
        end
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 516
          Height = 145
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Lucida Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 520
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 123
            Top = 32
            DataBinding.DataField = 'CODIGO_FORMAPAGO'
            DataBinding.DataSource = dsTablaG
            Properties.ReadOnly = False
            TabOrder = 0
            Width = 121
          end
          object cxLabel1: TcxLabel
            Left = 49
            Top = 37
            Caption = 'C'#243'digo'
            TabOrder = 1
          end
          object cxLabel2: TcxLabel
            Left = 46
            Top = 88
            Caption = 'Nombre'
            TabOrder = 3
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 119
            Top = 87
            DataBinding.DataField = 'DESCRIPCION_FORMAPAGO'
            DataBinding.DataSource = dsTablaG
            TabOrder = 2
            Width = 322
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 145
        Width = 518
        Height = 204
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 371
        object cxpgcntrl2: TcxPageControl
          Left = 1
          Top = 1
          Width = 516
          Height = 202
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxtbsht3
          Properties.CustomButtons.Buttons = <>
          ExplicitWidth = 369
          ClientRectBottom = 198
          ClientRectLeft = 4
          ClientRectRight = 512
          ClientRectTop = 28
          object cxtbsht3: TcxTabSheet
            Caption = 'M'#225's Datos'
            ImageIndex = 0
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 361
          end
        end
      end
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = unqryFormasdePago
    Left = 236
    Top = 311
  end
  inherited cxlclzr1: TcxLocalizer
    Left = 160
    Top = 288
  end
  object unqryFormasdePago: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_formapago'
      
        '  (CODIGO_FORMAPAGO, DESCRIPCION_FORMAPAGO, N_PLAZOS, DIAS_ENTRE' +
        '_PLAZOS, PORCEN_ANTICIPO, DEFAULT_FACTURA)'
      'VALUES'
      
        '  (:CODIGO_FORMAPAGO, :DESCRIPCION_FORMAPAGO, :N_PLAZOS, :DIAS_E' +
        'NTRE_PLAZOS, :PORCEN_ANTICIPO, :DEFAULT_FACTURA)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_formapago'
      'WHERE'
      '  CODIGO_FORMAPAGO = :Old_CODIGO_FORMAPAGO')
    SQLUpdate.Strings = (
      'UPDATE suboc_formapago'
      'SET'
      
        '  CODIGO_FORMAPAGO = :CODIGO_FORMAPAGO, DESCRIPCION_FORMAPAGO = ' +
        ':DESCRIPCION_FORMAPAGO, N_PLAZOS = :N_PLAZOS, DIAS_ENTRE_PLAZOS ' +
        '= :DIAS_ENTRE_PLAZOS, PORCEN_ANTICIPO = :PORCEN_ANTICIPO, DEFAUL' +
        'T_FACTURA = :DEFAULT_FACTURA'
      'WHERE'
      '  CODIGO_FORMAPAGO = :Old_CODIGO_FORMAPAGO')
    SQLLock.Strings = (
      'SELECT * FROM suboc_formapago'
      'WHERE'
      '  CODIGO_FORMAPAGO = :Old_CODIGO_FORMAPAGO'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_FORMAPAGO, DESCRIPCION_FORMAPAGO, N_PLAZOS, DIAS_E' +
        'NTRE_PLAZOS, PORCEN_ANTICIPO, DEFAULT_FACTURA FROM suboc_formapa' +
        'go'
      'WHERE'
      '  CODIGO_FORMAPAGO = :CODIGO_FORMAPAGO')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_formapago')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_formapago')
    Left = 288
    Top = 272
  end
end
