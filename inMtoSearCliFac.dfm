inherited frmMtoSearchCliFac: TfrmMtoSearchCliFac
  Caption = 'B'#250'squeda de Clientes en Facturas'
  PixelsPerInch = 120
  TextHeight = 13
  inherited cxpgcntrl1: TcxPageControl
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    inherited ts1: TcxTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      inherited pnlCliTopPrin: TPanel
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
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
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        inherited pnl3: TPanel
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          inherited btn3: TcxButton
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
          end
          inherited pnl5: TPanel
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
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
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          inherited cxgrdGrdPrincipal: TcxGrid
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            inherited tvGrdDBTabPrin: TcxGridDBTableView
              object cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn
                Caption = 'Filiaci'#243'n'
                DataBinding.FieldName = 'CODIGO_CLIENTE'
                Width = 67
              end
              object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn
                Caption = 'Nombre'
                DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE'
                Width = 182
              end
              object cxgrdbclmnGrdDBTabPrinNIF_CLIENTE: TcxGridDBColumn
                Caption = 'Nif'
                DataBinding.FieldName = 'NIF_CLIENTE'
                Width = 97
              end
              object cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn
                Caption = 'Tel'#233'fono'
                DataBinding.FieldName = 'MOVIL_CLIENTE'
                Width = 90
              end
              object cxgrdbclmnGrdDBTabPrinTELEFONO_CLIENTE: TcxGridDBColumn
                Caption = 'Tel'#233'fono2'
                DataBinding.FieldName = 'TELEFONO_CLIENTE'
                Width = 74
              end
              object cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE: TcxGridDBColumn
                Caption = 'Email'
                DataBinding.FieldName = 'EMAIL_CLIENTE'
                Width = 87
              end
              object cxgrdbclmnGrdDBTabPrinDIRECCION1_CLIENTE: TcxGridDBColumn
                Caption = 'Direcci'#243'n1'
                DataBinding.FieldName = 'DIRECCION1_CLIENTE'
                Width = 326
              end
              object cxgrdbclmnGrdDBTabPrinDIRECCION2_CLIENTE: TcxGridDBColumn
                Caption = 'Direcci'#243'n2'
                DataBinding.FieldName = 'DIRECCION2_CLIENTE'
                Width = 78
              end
              object cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE: TcxGridDBColumn
                Caption = 'Poblaci'#243'n'
                DataBinding.FieldName = 'POBLACION_CLIENTE'
                Width = 183
              end
              object cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE: TcxGridDBColumn
                Caption = 'Provincia'
                DataBinding.FieldName = 'PROVINCIA_CLIENTE'
                Width = 116
              end
              object cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE: TcxGridDBColumn
                Caption = 'C'#243'digo Postal'
                DataBinding.FieldName = 'CPOSTAL_CLIENTE'
              end
              object cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE: TcxGridDBColumn
                Caption = 'Pa'#237's'
                DataBinding.FieldName = 'PAIS_CLIENTE'
                Width = 27
              end
              object cxgrdbclmnGrdDBTabPrinOBSERVACIONES_CLIENTE: TcxGridDBColumn
                Caption = 'Observaciones'
                DataBinding.FieldName = 'OBSERVACIONES_CLIENTE'
              end
              object cxgrdbclmnGrdDBTabPrinREFERENCIA_CLIENTE: TcxGridDBColumn
                Caption = 'Referencia'
                DataBinding.FieldName = 'REFERENCIA_CLIENTE'
                Width = 150
              end
              object cxgrdbclmnGrdDBTabPrinPROFESION_CLIENTE: TcxGridDBColumn
                Caption = 'Profesi'#243'n'
                DataBinding.FieldName = 'PROFESION_CLIENTE'
                Width = 183
              end
              object cxgrdbclmnGrdDBTabPrinFECHA_NACIMIENTO: TcxGridDBColumn
                Caption = 'Fecha de Nacimiento'
                DataBinding.FieldName = 'FECHA_NACIMIENTO'
                Width = 131
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
      inherited pnl1: TPanel
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
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
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        inherited cxRichEdit1: TcxRichEdit
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
      end
    end
  end
end
