inherited frmMtoParametros: TfrmMtoParametros
  Top = 274
  Caption = 'Contadores'
  ClientHeight = 374
  ClientWidth = 850
  Font.Height = -17
  ExplicitWidth = 866
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 692
    Height = 374
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 692
    ExplicitHeight = 374
  end
  inherited pButtonRightBar: TPanel
    Left = 692
    Width = 158
    Height = 374
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 692
    ExplicitWidth = 158
    ExplicitHeight = 374
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
      ExplicitTop = 246
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
    Width = 692
    Height = 374
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Height = -17
    ExplicitWidth = 692
    ExplicitHeight = 374
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
        ExplicitWidth = 684
        ExplicitHeight = 303
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          FilterRow.SeparatorWidth = 5
          FixedDataRows.SeparatorWidth = 5
          NewItemRow.SeparatorWidth = 5
          OptionsData.Editing = True
          OptionsView.NavigatorOffset = 40
          Preview.LeftIndent = 16
          Preview.RightIndent = 4
          object dbcGrdDBTabPrinNOMBRE_PARAM: TcxGridDBColumn
            Caption = 'Par'#225'metro'
            DataBinding.FieldName = 'NOMBRE_PARAM'
            Width = 285
          end
          object dbcGrdDBTabPrinVALUE_PARAM: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VALUE_PARAM'
            Width = 888
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
        ExplicitWidth = 684
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
    DataSet = unqryParametros
  end
  object unqryParametros: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_param'
      '  (NOMBRE_PARAM, VALUE_PARAM)'
      'VALUES'
      '  (:NOMBRE_PARAM, :VALUE_PARAM)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_param'
      'WHERE'
      '  NOMBRE_PARAM = :Old_NOMBRE_PARAM')
    SQLUpdate.Strings = (
      'UPDATE suboc_param'
      'SET'
      '  NOMBRE_PARAM = :NOMBRE_PARAM, VALUE_PARAM = :VALUE_PARAM'
      'WHERE'
      '  NOMBRE_PARAM = :Old_NOMBRE_PARAM')
    SQLLock.Strings = (
      'SELECT NOMBRE_PARAM, VALUE_PARAM FROM suboc_param'
      'WHERE'
      '  NOMBRE_PARAM = :Old_NOMBRE_PARAM'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT NOMBRE_PARAM, VALUE_PARAM FROM suboc_param'
      'WHERE'
      '  NOMBRE_PARAM = :NOMBRE_PARAM')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_param')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * FROM suboc_param')
    BeforePost = unqryParametrosBeforePost
    Left = 520
    Top = 240
  end
end
