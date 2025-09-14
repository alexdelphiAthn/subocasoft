inherited frmMtoSearDocHis: TfrmMtoSearDocHis
  Left = 516
  Caption = 'B'#250'squeda de Odont'#243'logos en Facturas'
  ClientWidth = 744
  ExplicitWidth = 760
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
      ExplicitWidth = 736
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
              Top = 8
              ExplicitTop = 8
            end
            inherited btnCancelar: TcxButton
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
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
              object cxgrdbclmnGrdDBTabPrinODONTOLOGO: TcxGridDBColumn
                DataBinding.FieldName = 'ODONTOLOGO'
                Width = 106
              end
              object cxgrdbclmnGrdDBTabPrinNOMBRE_ODONTOLOGO: TcxGridDBColumn
                DataBinding.FieldName = 'NOMBRE_ODONTOLOGO'
                Width = 194
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
