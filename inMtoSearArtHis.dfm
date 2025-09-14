inherited frmMtoSearArtHis: TfrmMtoSearArtHis
  Left = 516
  Caption = 'B'#250'squeda de Art'#237'culos en Lineas de Factura'
  ClientWidth = 744
  ExplicitWidth = 760
  ExplicitHeight = 481
  PixelsPerInch = 120
  TextHeight = 13
  inherited cxpgcntrl1: TcxPageControl
    Width = 744
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 744
    ClientRectRight = 740
    inherited ts1: TcxTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 736
      ExplicitHeight = 413
      inherited pnlCliTopPrin: TPanel
        Width = 736
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = ''
        ExplicitWidth = 736
        inherited lbl1: TLabel
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
        inherited edtBusqGlobal: TcxTextEdit
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitHeight = 22
        end
      end
      inherited pnlCliPrin: TPanel
        Width = 736
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 736
        inherited pnl3: TPanel
          Width = 734
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitWidth = 734
          inherited btn3: TcxButton
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
          end
          inherited pnl5: TPanel
            Width = 732
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 732
            inherited btnAceptar: TcxButton
              Top = 10
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              TabOrder = 1
              ExplicitTop = 10
            end
            inherited btnCancelar: TcxButton
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              TabOrder = 0
            end
          end
        end
        inherited pnl4: TPanel
          Width = 734
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitWidth = 734
          inherited cxgrdGrdPrincipal: TcxGrid
            Width = 732
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 732
            inherited tvGrdDBTabPrin: TcxGridDBTableView
              object cxgrdbclmnGrdDBTabPrinCODIGO_ARTICULO: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'CODIGO_ARTICULO'
                Width = 146
              end
              object cxgrdbclmnGrdDBTabPrinFAMILIA_ARTICULO: TcxGridDBColumn
                Caption = 'Familia'
                DataBinding.FieldName = 'FAMILIA_ARTICULO'
                Width = 174
              end
              object cxgrdbclmnGrdDBTabPrinDESCRIPCION_ARTICULO: TcxGridDBColumn
                Caption = 'Descripci'#243'n'
                DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
              end
              object cxgrdbclmnGrdDBTabPrinPRECIOVENTA_ARTICULO: TcxGridDBColumn
                Caption = 'Precio'
                DataBinding.FieldName = 'PRECIOVENTA_ARTICULO'
              end
            end
          end
        end
      end
    end
    inherited ts2: TcxTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 736
      ExplicitHeight = 413
      inherited pnl1: TPanel
        Width = 736
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 736
        inherited btn1: TcxButton
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
        inherited btn2: TcxButton
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
      end
      inherited pnl2: TPanel
        Width = 736
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 736
        inherited cxRichEdit1: TcxRichEdit
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitWidth = 734
          Width = 734
        end
      end
    end
  end
end
