inherited frmMtoParametros: TfrmMtoParametros
  Top = 274
  Caption = 'Contadores'
  ClientHeight = 372
  ClientWidth = 842
  Font.Height = -17
  ExplicitWidth = 858
  ExplicitHeight = 411
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 684
    Height = 372
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 688
    ExplicitHeight = 373
  end
  inherited pButtonRightBar: TPanel
    Left = 684
    Width = 158
    Height = 372
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 688
    ExplicitWidth = 158
    ExplicitHeight = 373
    inherited pButtonGen: TPanel
      Top = 245
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
    Width = 684
    Height = 372
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
      ExplicitWidth = 680
      ExplicitHeight = 336
      inherited cxGrdPrincipal: TcxGrid
        Top = 34
        Width = 680
        Height = 302
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
        Width = 680
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
      ExplicitWidth = 680
      ExplicitHeight = 336
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
