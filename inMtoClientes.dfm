inherited frmMtoClientes: TfrmMtoClientes
  Left = 5
  Top = 4
  Caption = 'Pacientes'
  ClientHeight = 601
  ClientWidth = 1219
  ExplicitWidth = 1235
  ExplicitHeight = 640
  PixelsPerInch = 96
  TextHeight = 22
  inherited pButtonPage: TPanel
    Width = 1021
    Height = 601
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 1021
    ExplicitHeight = 601
  end
  inherited pButtonRightBar: TPanel
    Left = 1021
    Height = 601
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ParentFont = False
    ExplicitLeft = 1021
    ExplicitHeight = 601
    object btn1: TSpeedButton [0]
      Left = 8
      Top = 165
      Width = 177
      Height = 45
      Cursor = crHandPoint
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Nuevo Paciente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      OnClick = btn1Click
    end
    inherited pButtonGen: TPanel
      Top = 473
      Height = 127
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Constraints.MinHeight = 80
      Constraints.MinWidth = 99
      ExplicitTop = 473
      ExplicitHeight = 127
      inherited sbGrabar: TSpeedButton
        Top = 0
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Height = -19
        ExplicitTop = 0
      end
      inherited sbCancelar: TSpeedButton
        Top = 44
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Height = -19
        ExplicitTop = 44
      end
      inherited sbSalir: TSpeedButton
        Top = 88
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Height = -19
        ExplicitTop = 88
      end
    end
    inherited pButtonBDStat: TPanel
      Height = 48
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Constraints.MinHeight = 37
      Constraints.MinWidth = 99
      ExplicitHeight = 48
      inherited pnTableName: TPanel
        Top = 14
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 14
        ExplicitHeight = 16
        inherited lblEditMode: TLabel
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitLeft = 2
          ExplicitTop = 8
          ExplicitWidth = 196
          ExplicitHeight = 14
        end
      end
      inherited Panel4: TPanel
        Height = 14
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitHeight = 14
        inherited lblTablaOrigen: TLabel
          Height = 14
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitWidth = 106
          ExplicitHeight = 14
        end
      end
    end
    inherited cxdbnvgtr2: TcxDBNavigator
      Left = 6
      Top = 55
      Width = 186
      Height = 34
      ExplicitLeft = 6
      ExplicitTop = 55
      ExplicitWidth = 186
      ExplicitHeight = 34
    end
    object btnImprimir: TcxButton
      Left = 6
      Top = 234
      Width = 187
      Height = 42
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Imprimir'
      DropDownMenu = dxbrpmn1
      Kind = cxbkOfficeDropDown
      OptionsImage.Spacing = 3
      TabOrder = 3
    end
  end
  inherited pcPantalla: TPageControl
    Width = 1021
    Height = 601
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 1021
    ExplicitHeight = 601
    inherited tsLista: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 1013
      ExplicitHeight = 561
      inherited cxGrdPrincipal: TcxGrid
        Top = 49
        Width = 1013
        Height = 512
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 49
        ExplicitWidth = 1013
        ExplicitHeight = 512
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          FilterRow.SeparatorWidth = 5
          FixedDataRows.SeparatorWidth = 5
          NewItemRow.SeparatorWidth = 5
          OptionsView.NavigatorOffset = 40
          Preview.LeftIndent = 16
          Preview.RightIndent = 4
          object cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn
            Caption = 'Filiaci'#243'n'
            DataBinding.FieldName = 'CODIGO_CLIENTE'
            MinWidth = 16
            Width = 85
          end
          object cxgrdbclmnGrdDBTabPrinAPELLIDOS: TcxGridDBColumn
            DataBinding.FieldName = 'APELLIDOS'
            MinWidth = 16
            Width = 236
          end
          object cxgrdbclmnGrdDBTabPrinNOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
            MinWidth = 16
            Width = 195
          end
          object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn
            Caption = 'Raz'#243'n Social'
            DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE'
            MinWidth = 16
            Width = 214
          end
          object cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn
            Caption = 'Tel'#233'fono1'
            DataBinding.FieldName = 'MOVIL_CLIENTE'
            MinWidth = 16
            Width = 195
          end
          object cxgrdbclmnGrdDBTabPrinTELEFONO_CLIENTE: TcxGridDBColumn
            Caption = 'Tel'#233'fono2'
            DataBinding.FieldName = 'TELEFONO_CLIENTE'
            MinWidth = 16
            Width = 201
          end
          object cxgrdbclmnGrdDBTabPrinNIF_CLIENTE: TcxGridDBColumn
            Caption = 'Nif'
            DataBinding.FieldName = 'NIF_CLIENTE'
            MinWidth = 16
            Width = 163
          end
          object cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE: TcxGridDBColumn
            Caption = 'Email'
            DataBinding.FieldName = 'EMAIL_CLIENTE'
            MinWidth = 16
            Width = 260
          end
          object cxgrdbclmnGrdDBTabPrinDIRECCION_CLIENTE1: TcxGridDBColumn
            Caption = 'DIRECCION1'
            DataBinding.FieldName = 'DIRECCION1_CLIENTE'
            MinWidth = 16
            Width = 211
          end
          object cxgrdbclmnGrdDBTabPrinDIRECCION_CLIENTE2: TcxGridDBColumn
            Caption = 'DIRECCION2'
            DataBinding.FieldName = 'DIRECCION2_CLIENTE'
            MinWidth = 16
            Width = 82
          end
          object cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE: TcxGridDBColumn
            Caption = 'Poblaci'#243'n'
            DataBinding.FieldName = 'POBLACION_CLIENTE'
            MinWidth = 16
            Width = 141
          end
          object cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE: TcxGridDBColumn
            Caption = 'C'#243'digo Postal'
            DataBinding.FieldName = 'CPOSTAL_CLIENTE'
            MinWidth = 16
            Width = 76
          end
          object cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE: TcxGridDBColumn
            Caption = 'Provincia'
            DataBinding.FieldName = 'PROVINCIA_CLIENTE'
            MinWidth = 16
            Width = 92
          end
          object cxgrdbclmnGrdDBTabPrinREFERENCIA_CLIENTE: TcxGridDBColumn
            Caption = 'Referencia'
            DataBinding.FieldName = 'REFERENCIA_CLIENTE'
            MinWidth = 16
            Width = 163
          end
          object cxgrdbclmnGrdDBTabPrinOBSERVACIONES_CLIENTE: TcxGridDBColumn
            Caption = 'Observaciones'
            DataBinding.FieldName = 'OBSERVACIONES_CLIENTE'
            MinWidth = 16
            Width = 115
          end
          object cxgrdbclmnGrdDBTabPrinPROFESION_CLIENTE: TcxGridDBColumn
            Caption = 'Profesi'#243'n'
            DataBinding.FieldName = 'PROFESION_CLIENTE'
            MinWidth = 16
            Width = 134
          end
          object cxgrdbclmnGrdDBTabPrinFECHA_NACIMIENTO: TcxGridDBColumn
            Caption = 'Fecha de Nacimiento'
            DataBinding.FieldName = 'FECHA_NACIMIENTO'
            MinWidth = 16
            Width = 133
          end
          object cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE: TcxGridDBColumn
            Caption = 'Pa'#237's'
            DataBinding.FieldName = 'PAIS_CLIENTE'
            MinWidth = 16
            Width = 109
          end
          object cxgrdbclmnGrdDBTabPrinIBAN: TcxGridDBColumn
            DataBinding.FieldName = 'IBAN'
            MinWidth = 16
          end
        end
      end
      inherited pnTopGrid: TPanel
        Width = 1013
        Height = 49
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 1013
        ExplicitHeight = 49
        inherited dxbvl1: TdxBevel
          Left = 4
          Width = 744
          Height = 46
          ExplicitLeft = 4
          ExplicitWidth = 744
          ExplicitHeight = 46
        end
        inherited btnRestoreWindow: TSpeedButton
          Left = 712
          Top = 2
          Width = 36
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 712
          ExplicitTop = 2
          ExplicitWidth = 36
          ExplicitHeight = 28
        end
        inherited edtBusqGlobal: TcxTextEdit
          Left = 162
          Top = 11
          ExplicitLeft = 162
          ExplicitTop = 11
          ExplicitWidth = 184
          ExplicitHeight = 30
          Width = 184
        end
        inherited cxlblBusq: TcxLabel
          Left = 8
          Top = 13
          ExplicitLeft = 8
          ExplicitTop = 13
        end
        inherited cxdbnvgtr1: TcxDBNavigator
          Left = 390
          Top = 11
          Width = 252
          Height = 26
          ExplicitLeft = 390
          ExplicitTop = 11
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
      Font.Height = -19
      ExplicitLeft = 4
      ExplicitTop = 36
      ExplicitWidth = 1013
      ExplicitHeight = 561
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 1013
        Height = 265
        Align = alTop
        TabOrder = 0
        object cxdbtxtdtCODIGO_CLIENTE: TcxDBTextEdit
          Left = 68
          Top = 50
          DataBinding.DataField = 'CODIGO_CLIENTE'
          DataBinding.DataSource = dsTablaG
          TabOrder = 1
          Width = 119
        end
        object cxdbtxtdtRAZON_SOCIAL: TcxDBTextEdit
          Left = 230
          Top = 199
          DataBinding.DataField = 'RAZONSOCIAL_CLIENTE'
          DataBinding.DataSource = dsTablaG
          TabOrder = 8
          OnEnter = cxdbtxtdtRAZON_SOCIALEnter
          Width = 444
        end
        object cxlbl3: TcxLabel
          Left = 30
          Top = 203
          Caption = 'Raz'#243'n Social Fiscal'
        end
        object cxdbtxtdtTELEFONO2: TcxDBTextEdit
          Left = 529
          Top = 149
          DataBinding.DataField = 'TELEFONO_CLIENTE'
          DataBinding.DataSource = dsTablaG
          TabOrder = 7
          Width = 145
        end
        object cxlbl5: TcxLabel
          Left = 258
          Top = 153
          Caption = 'Tel'#233'fonos'
        end
        object cxlbl6: TcxLabel
          Left = 258
          Top = 104
          Caption = 'Email'
        end
        object cxdbtxtdtEMAIL: TcxDBTextEdit
          Left = 319
          Top = 100
          DataBinding.DataField = 'EMAIL_CLIENTE'
          DataBinding.DataSource = dsTablaG
          TabOrder = 4
          Width = 355
        end
        object cxlbl4: TcxLabel
          Left = 65
          Top = 153
          Caption = 'Nif'
        end
        object cxdbtxtdtNIF: TcxDBTextEdit
          Left = 105
          Top = 149
          DataBinding.DataField = 'NIF_CLIENTE'
          DataBinding.DataSource = dsTablaG
          Properties.OnChange = cxdbtxtdtNIFPropertiesChange
          TabOrder = 5
          Width = 135
        end
        object cxdbtxtdtMOVIL_CLIENTE: TcxDBTextEdit
          Left = 364
          Top = 149
          DataBinding.DataField = 'MOVIL_CLIENTE'
          DataBinding.DataSource = dsTablaG
          TabOrder = 6
          Width = 148
        end
        object cxdbtxtdtNOMBRE: TcxDBTextEdit
          Left = 194
          Top = 50
          DataBinding.DataField = 'NOMBRE'
          DataBinding.DataSource = dsTablaG
          TabOrder = 2
          Width = 172
        end
        object cxdbtxtdtAPELLIDOS: TcxDBTextEdit
          Left = 372
          Top = 50
          DataBinding.DataField = 'APELLIDOS'
          DataBinding.DataSource = dsTablaG
          TabOrder = 3
          Width = 302
        end
        object img1: TcxImage
          Left = 682
          Top = 2
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D49484452000000AB
            0000009B08030000002A4C9B86000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC610500000300504C54450000000101010202020303030404
            040505050606060707070808080909090A0A0A0B0B0B0C0C0C0D0D0D0E0E0E0F
            0F0F101010111111121212131313141414151515161616171717181818191919
            1A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F2020202121212222222323232424
            242525252626262727272828282929292A2A2A2B2B2B2C2C2C2D2D2D2E2E2E2F
            2F2F303030313131323232333333343434353535363636373737383838393939
            3A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F4040404141414242424343434444
            444545454646464747474848484949494A4A4A00000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000982378610000010074524E53FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0053F7
            0725000000097048597300000EC300000EC301C76FA8640000063E4944415478
            5EED9C6977D43614401D02655FCAD2D2524A694B218510A01B297BA04D93FFFF
            7F5C4BBE9ED1D84FD2932C6786737C3F0449EF3DF99E2433B1640D55FDF930BB
            4EC3EC3A0DB3EB34CCAED330BB4E4359D79B558017246553D415291F6748CBA5
            A4EB159CBC90974B49578CFC90974B41D7334667674FE6EE66B91A9BE7B4876C
            94AB9109CCB649AEAF8DCC211D814D72352EA7684B6C82EBF1D3A7E69F473197
            B5BBDA97BEE1A2F9728E51119340339731F5A7CCF51D18968926C419556F0D17
            5C6754C664D0CC655CFD6D2B0937189431193473195DEFC0904C3421CED8FAFA
            BED5B45C6548C424D0CC65B4ABFB12634024165750C0B57E62451BE88BC4E20A
            4AB8D6F51756B5FA4857C2C469E652C6B5DEB7AE0FE9496C8E6B5D5F6A5CDED0
            96D824D7FAF033F97D6D09FE31D830D720B3EB34ACC5F585B96AB5FD81AE9635
            B87E634D2D763DA0C654D0CC25B1DE4A7624EDF998029AB924D5DFB18A0E2F09
            2830E9347349A93FB67E2B105190962D92526FED56D92614C764D3CC25A15EDC
            067C44308A49A6994B42BD751B40304A4AAE077DBD677755FBF232B93473D1D7
            5BB3215B8463985C9AB98C76D54E9090EA6376154848F531BB0A24A4FA08D5EF
            6E6FEFD06C386DCD06FC443886C96D5B8776F7FBF0C8699B2F47814DF116BFEB
            35AB525DA25B1FB4FD3E44A32C72FFAAAA7BB6DBB41F56D55ED78ECFE58D9BB9
            5B18186CB75AAE118C62926DA3BCEB65333730E4E82F2114C724DBBBF31B5575
            C1DEB23DB657B9567F6ADACFEBC7CDD7639BE9C5773133F502C69AEF421F220A
            285040C1104FE41E75C0E836DD05370928A0420105433C11CA16F0D3F9852EBC
            6D475550A28082214AD7EA1F025BF41BCE33A4832205140CF1446E51B7A45B63
            BFE1178107442FCF352F6A0D6D95060A86F822D439BC26E272AE0D3DA31BA2CD
            D440C1105F4478331DDE5513A8AAD30C042053010543BC110A5D7E27D4C1B021
            F424B6854405140CF1463E52E9B2FAB3FE91514B7479409E020A86F823FF51EA
            F2849885B10E467D90A5808221A14B50EBE22EB1195AC0B00793E13FB5A12278
            05ABB0CA03420D8C2C615C269A10277E811EF70949410222B1B88248BD5558E5
            7B42DD9BAB0B1189485843ACDE2AAC728790142322108EAA88D65B85556E13DA
            A1EF4268C8D59338A38784CB578458E6AC4068C8FE499C7D44C2A57B92D5DCE3
            0F2034019AA99170F992D0D7F45D0895473533122E57080DB6E51BBA7BDDD2E8
            BE0B48B8746BF11FE8BBBC235618E54F0C09970B841ED077D9275616ED6F1712
            2EDD1AE657FA2EFDDBC722A85F09CE42ABE32CA13DFA3A2E1E50968CDA555A29
            746FEE7FD0D77299BA44F4AEC3DD81E5DAE5157D3DA1E3263E125CA59DC2EEF9
            9667632E84FED158478AEBF258E6926EA175443F89846D1B43926B77B6C965B1
            D0A29FC86F546B487395EE5947CA864FCDAE90E85A9FE70A2E847265ABEA2E13
            444875ADED09E21E84F265ABADF74C1122D9756517B983D008D9E5DD909F7457
            73873F80D028D9AA729EA44864B8D6D799DA85D048D9B04D8EABF8312D42C26E
            6812C12389FC9B467039F044F863AC874924F25CDDA34F0B0845087E74AE21B0
            5B9EE95A7FC7D42E84A284BFEF2409E4BAF69FD45808C5E93D23598114816CD7
            D5ED5720A4C19CED15212E90EF2A7E7352165A6FA8E941546084ABB84714A6FF
            505C58B1076E6BC7B8D6BBCC9F82B3816BE9DF66322C31CAB57ECE05D2E8AD5F
            9E316CF996418971AEC9ABC28EDE5FFEC55FED9F191019E9CA070B7278CC0C2D
            C7E6A85AB759EA61ACABEFD5AC629739948C76AD3F70E13CF69845C378D7FA5F
            2E9B8BFA495201D76692B1E8B6BC8BB88E9755EDD695712D215B557F32998F42
            AE6564AB8BCC2653CA557CCC9141E84C7531D786BFF7F6EC47A58798FF9540D8
            B291089CD12AE96AE08A3D089EA51B845C8113756D1076EF7AF88F409EB46B5D
            1F093BA32EDD33932127EFDA70E8399FDA42D290B5B8367CF22E66FD4F98D7E5
            DA7020EB2E0F53F459A36BC37BE1E10E2181F5BA36BCEDE9063EC0BE76D78657
            CE733EFFBBC066B836ECA33BE97AAB4F7BC93E04C3ECC6D6081BE41A6576ED43
            7024B36B1F8223995DFB101C499969E277D00B6E51924119573C545092C1EC1A
            82920C66D710946430BB86A0248332AED2F1070FC1BBE930655C4F86D9751A66
            D769985DA761769D86D9751A66D769985DA7E1F371ADEBFF0136D8B4365210F8
            AB0000000049454E44AE426082}
          Properties.FitMode = ifmProportionalStretch
          Properties.ReadOnly = True
          ZoomingOptions.ZoomPercent = 140
          Style.BorderStyle = ebsNone
          Style.Edges = []
          TabOrder = 0
          Transparent = True
          Height = 263
          Width = 201
        end
        object cxlbl17: TcxLabel
          Left = 372
          Top = 10
          Caption = 'Apellidos'
        end
        object cxlbl15: TcxLabel
          Left = 194
          Top = 10
          Caption = 'Nombre'
        end
        object cxlbl2: TcxLabel
          Left = 68
          Top = 10
          Caption = 'C'#243'digo'
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 265
        Width = 1013
        Height = 296
        Align = alClient
        TabOrder = 1
        object cxpgcntrl2: TcxPageControl
          Left = 1
          Top = 1
          Width = 1011
          Height = 294
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxtbsht3
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 290
          ClientRectLeft = 4
          ClientRectRight = 1007
          ClientRectTop = 33
          object cxtbsht3: TcxTabSheet
            Caption = 'Domicilio fiscal'
            ImageIndex = 0
            object cxlbl7: TcxLabel
              Left = 38
              Top = 19
              Caption = 'Direcci'#243'n 1'
            end
            object cxlbl8: TcxLabel
              Left = 15
              Top = 99
              Caption = 'C'#243'digo Postal'
            end
            object cxdbtxtdt8: TcxDBTextEdit
              Left = 168
              Top = 95
              DataBinding.DataField = 'CPOSTAL_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 100
            end
            object cxlbl9: TcxLabel
              Left = 54
              Top = 139
              Caption = 'Poblaci'#243'n'
            end
            object cxdbtxtdt9: TcxDBTextEdit
              Left = 168
              Top = 135
              DataBinding.DataField = 'POBLACION_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 4
              Width = 501
            end
            object cxdbtxtdt10: TcxDBTextEdit
              Left = 168
              Top = 175
              DataBinding.DataField = 'PROVINCIA_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 5
              Width = 409
            end
            object cxlbl10: TcxLabel
              Left = 59
              Top = 179
              Caption = 'Provincia'
            end
            object cxlbl16: TcxLabel
              Left = 108
              Top = 219
              Caption = 'Pa'#237's'
            end
            object cxdbtxtdtDireccion: TcxDBTextEdit
              Left = 168
              Top = 55
              DataBinding.DataField = 'DIRECCION2_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 2
              Width = 501
            end
            object cxlbl1: TcxLabel
              Left = 38
              Top = 59
              Caption = 'Direcci'#243'n 2'
            end
            object cxlbl18: TcxLabel
              Left = 14
              Top = 250
              Caption = 'IBAN Bancario'
            end
            object cxdbtxtdtPAIS_CLIENTE: TcxDBTextEdit
              Left = 168
              Top = 246
              DataBinding.DataField = 'IBAN'
              DataBinding.DataSource = dsTablaG
              TabOrder = 13
              Width = 236
            end
            object txtDIRECCION1_CLIENTE: TcxDBTextEdit
              Left = 163
              Top = 15
              DataBinding.DataField = 'DIRECCION1_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 1
              Width = 506
            end
            object lblDB1: TcxDBLabel
              Left = 253
              Top = 213
              DataBinding.DataField = 'NOMBRE_SPA_PAIS'
              DataBinding.DataSource = DMClientes.dsPaises
              Height = 35
              Width = 324
            end
            object btnCODIGO_CLIENTE: TcxDBButtonEdit
              Left = 163
              Top = 213
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataBinding.DataField = 'PAIS_CLIENTE'
              DataBinding.DataSource = dsTablaG
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = btnCODIGO_CLIENTEPropertiesButtonClick
              Properties.OnChange = btnCODIGO_CLIENTEPropertiesChange
              TabOrder = 6
              Width = 72
            end
            object rgInternacional: TcxDBRadioGroup
              Left = 596
              Top = 184
              Caption = 'Tipo de Id Internacional'
              DataBinding.DataField = 'TIPOID_INT_CLIENTE'
              DataBinding.DataSource = dsTablaG
              Properties.Columns = 2
              Properties.Items = <
                item
                  Caption = 'Id Fiscal'
                  Value = 'ID'
                end
                item
                  Caption = 'Pasaporte'
                  Value = 'PASAPORTE'
                end>
              TabOrder = 7
              Visible = False
              Height = 61
              Width = 282
            end
          end
          object cxtbsht1: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'M'#225's datos personales'
            ImageIndex = 1
            object cxedtRAZONSOCIAL_CLIENTE: TcxDBTextEdit
              Left = 225
              Top = 23
              DataBinding.DataField = 'PROFESION_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 0
              Width = 455
            end
            object cxlbl11: TcxLabel
              Left = 107
              Top = 27
              Caption = 'Profesi'#243'n'
            end
            object cxedtPROFESION_CLIENTE: TcxDBTextEdit
              Left = 225
              Top = 112
              DataBinding.DataField = 'OBSERVACIONES_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 5
              Width = 455
            end
            object cxlbl12: TcxLabel
              Left = 58
              Top = 116
              Caption = 'Observaciones'
            end
            object cxlbl13: TcxLabel
              Left = 99
              Top = 71
              Caption = 'Referencia'
            end
            object cxedtPROFESION_CLIENTE1: TcxDBTextEdit
              Left = 225
              Top = 70
              DataBinding.DataField = 'REFERENCIA_CLIENTE'
              DataBinding.DataSource = dsTablaG
              TabOrder = 2
              Width = 455
            end
            object cxlbl14: TcxLabel
              Left = 3
              Top = 168
              Caption = 'Fecha de nacimiento'
            end
            object cxdbdtdt1: TcxDBDateEdit
              Left = 225
              Top = 163
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataBinding.DataField = 'FECHA_NACIMIENTO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 6
              Width = 142
            end
          end
          object cxtbsht2: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Historia dental'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object pnlHistoriaRight: TPanel
              Left = 853
              Top = 0
              Width = 150
              Height = 257
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alRight
              TabOrder = 0
              object btnFacturarSeleccionados: TcxButton
                Left = 5
                Top = 6
                Width = 141
                Height = 76
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Facturar Seleccionados'
                OptionsImage.Spacing = 3
                TabOrder = 0
                WordWrap = True
                OnClick = btnFacturarSeleccionadosClick
              end
            end
            object pnl3: TPanel
              Left = 0
              Top = 0
              Width = 853
              Height = 257
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              TabOrder = 1
              object cxgrd5: TcxGrid
                Left = 1
                Top = 1
                Width = 851
                Height = 255
                Align = alClient
                TabOrder = 0
                object cxgrdbtblvwHistoriasClientes: TcxGridDBTableView
                  Navigator.Buttons.ConfirmDelete = True
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataModeController.SmartRefresh = True
                  DataController.DataSource = DMClientes.dsHistoria
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsCustomize.ColumnGrouping = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                  OptionsView.GroupByBox = False
                  object cxgrdbclmncxgrdtvtv1FECHA: TcxGridDBColumn
                    Caption = 'Fecha'
                    DataBinding.FieldName = 'FECHA'
                    PropertiesClassName = 'TcxDateEditProperties'
                    MinWidth = 16
                    Width = 147
                  end
                  object cxgrdbclmncxgrdtvtv1CODIGO_ARTICULO: TcxGridDBColumn
                    Caption = 'C'#243'digo Tratamiento'
                    DataBinding.FieldName = 'CODIGO_ARTICULO'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Default = True
                        Kind = bkEllipsis
                      end>
                    Properties.OnButtonClick = cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesButtonClick
                    Properties.OnEditValueChanged = cxgrdbclmncxgrdtvtv1CODIGO_ARTICULOPropertiesEditValueChanged
                    MinWidth = 16
                    Width = 195
                  end
                  object cxgrdbclmncxgrdtvtv1DESCRIPCION_ARTICULO: TcxGridDBColumn
                    Caption = 'Descripci'#243'n Tratamiento'
                    DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    MinWidth = 16
                    Width = 383
                  end
                  object cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIA: TcxGridDBColumn
                    Caption = 'Historia detallada'
                    DataBinding.FieldName = 'DESHISVARCHAR'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Default = True
                        Kind = bkEllipsis
                      end>
                    Properties.ReadOnly = True
                    Properties.OnButtonClick = cxgrdbclmncxgrdtvtv1DESCRIPCION_HISTORIAPropertiesButtonClick
                    MinWidth = 16
                    Width = 183
                  end
                  object cxgrdbclmncxgrdtvtv1ZONA: TcxGridDBColumn
                    Caption = 'Nro Pieza dental'
                    DataBinding.FieldName = 'ZONA'
                    PropertiesClassName = 'TcxTextEditProperties'
                    MinWidth = 16
                    Width = 163
                  end
                  object cxgrdbclmnHistoriasClientesCANTIDAD: TcxGridDBColumn
                    Caption = 'Cantidad'
                    DataBinding.FieldName = 'CANTIDAD'
                    MinWidth = 16
                  end
                  object cxgrdbclmncxgrdtvtv1PRECIOVENTA_ARTICULO: TcxGridDBColumn
                    Caption = 'Precio'
                    DataBinding.FieldName = 'PRECIOVENTA_ARTICULO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    MinWidth = 16
                    Width = 151
                  end
                  object cxgrdbclmncxgrdtvtv1ODONTOLOGO: TcxGridDBColumn
                    Caption = 'C'#243'd Odont'#243'logo'
                    DataBinding.FieldName = 'ODONTOLOGO'
                    MinWidth = 16
                    Width = 181
                  end
                  object cxgrdbclmncxgrdtvtv1NOMBRE_ODONTOLOGO: TcxGridDBColumn
                    Caption = 'Nombre odont'#243'logo'
                    DataBinding.FieldName = 'NOMBRE_ODONTOLOGO'
                    MinWidth = 16
                    Width = 313
                  end
                  object cxgrdbclmncxgrdtvtv1NRO_FACTURA: TcxGridDBColumn
                    Caption = 'NroFacturaRef'
                    DataBinding.FieldName = 'NRO_FACTURA'
                    MinWidth = 16
                    Width = 184
                  end
                  object cxgrdbclmncxgrdtvtv1SERIE_FACTURA: TcxGridDBColumn
                    Caption = 'SerieFacturaRef'
                    DataBinding.FieldName = 'SERIE_FACTURA'
                    MinWidth = 16
                    Width = 187
                  end
                  object cxgrdbclmncxgrdtvtv1LINEA_LINEA: TcxGridDBColumn
                    Caption = 'LineaFraRef'
                    DataBinding.FieldName = 'LINEA_LINEA'
                    MinWidth = 16
                    Width = 140
                  end
                  object cxgrdbclmncxgrdtvtv1ID: TcxGridDBColumn
                    Caption = 'IdEntrada'
                    DataBinding.FieldName = 'ID'
                    MinWidth = 16
                  end
                end
                object cxgrdbndtblvwtv2: TcxGridDBBandedTableView
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
                  object cxgrdbndclmntv2PerId: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'PerId'
                    MinWidth = 16
                    Width = 30
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2AppointmentId: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'AppointmentId'
                    MinWidth = 16
                    Width = 65
                    Position.BandIndex = 0
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2Linea: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'Linea'
                    MinWidth = 16
                    Width = 35
                    Position.BandIndex = 0
                    Position.ColIndex = 2
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2clave: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'clave'
                    MinWidth = 16
                    Width = 101
                    Position.BandIndex = 0
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2valor: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'valor'
                    MinWidth = 16
                    Width = 117
                    Position.BandIndex = 0
                    Position.ColIndex = 4
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2instantemodif: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'instantemodif'
                    MinWidth = 16
                    Width = 110
                    Position.BandIndex = 0
                    Position.ColIndex = 7
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2descripcion: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'descripcion'
                    MinWidth = 16
                    Width = 142
                    Position.BandIndex = 0
                    Position.ColIndex = 5
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2parte: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'parte'
                    MinWidth = 16
                    Width = 167
                    Position.BandIndex = 0
                    Position.ColIndex = 6
                    Position.RowIndex = 0
                  end
                end
                object cxgrdlvllv1: TcxGridLevel
                  GridView = cxgrdbtblvwHistoriasClientes
                end
              end
            end
          end
          object cxtbsht4: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Historia Facturaci'#243'n'
            ImageIndex = 3
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxgrd1: TcxGrid
              Left = 0
              Top = 0
              Width = 1003
              Height = 257
              Align = alClient
              TabOrder = 0
              object tvFacturacion: TcxGridDBTableView
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataModeController.SmartRefresh = True
                DataController.DataSource = DMClientes.dsFacturas
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsCustomize.ColumnGrouping = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.InvertSelect = False
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object cxgrdbclmncxgrdbtblvw1FECHA_FACTURA: TcxGridDBColumn
                  Caption = 'Fecha'
                  DataBinding.FieldName = 'FECHA_FACTURA'
                  MinWidth = 16
                end
                object cxgrdbclmncxgrdbtblvw1NRO_FACTURA: TcxGridDBColumn
                  Caption = 'Nro Factura'
                  DataBinding.FieldName = 'NRO_FACTURA'
                  MinWidth = 16
                  Width = 151
                end
                object cxgrdbclmncxgrdbtblvw1SERIE_FACTURA: TcxGridDBColumn
                  Caption = 'Serie Factura'
                  DataBinding.FieldName = 'SERIE_FACTURA'
                  MinWidth = 16
                end
                object cxgrdbclmncxgrdbtblvw1TOTAL_LIQUIDO_FACTURA: TcxGridDBColumn
                  Caption = 'Total L'#237'quido'
                  DataBinding.FieldName = 'TOTAL_LIQUIDO_FACTURA'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  MinWidth = 16
                  Width = 130
                end
                object cxgrdbclmncxgrdbtblvw1FORMA_PAGO_FACTURA: TcxGridDBColumn
                  Caption = 'Forma de Pago'
                  DataBinding.FieldName = 'FORMA_PAGO_FACTURA'
                  MinWidth = 16
                  Width = 155
                end
                object cxgrdbclmncxgrdbtblvw1COMENTARIOS_FACTURA: TcxGridDBColumn
                  Caption = 'Comentarios'
                  DataBinding.FieldName = 'COMENTARIOS_FACTURA'
                  MinWidth = 16
                  Width = 125
                end
                object cxgrdbclmncxgrdbtblvw1RAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Raz'#243'n Social'
                  DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 339
                end
                object cxgrdbclmncxgrdbtblvw1NIF_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Nif'
                  DataBinding.FieldName = 'NIF_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 141
                end
                object cxgrdbclmncxgrdbtblvw1MOVIL_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Tel'#233'fono1'
                  DataBinding.FieldName = 'MOVIL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 142
                end
                object cxgrdbclmncxgrdbtblvw1EMAIL_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Email'
                  DataBinding.FieldName = 'EMAIL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 243
                end
                object cxgrdbclmncxgrdbtblvw1DIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Direcci'#243'n1'
                  DataBinding.FieldName = 'DIRECCION1_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 255
                end
                object cxgrdbclmncxgrdbtblvw1DIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Direcci'#243'n2'
                  DataBinding.FieldName = 'DIRECCION2_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 208
                end
                object cxgrdbclmncxgrdbtblvw1POBLACION_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Poblaci'#243'n'
                  DataBinding.FieldName = 'POBLACION_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 236
                end
                object cxgrdbclmncxgrdbtblvw1PROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Provincia'
                  DataBinding.FieldName = 'PROVINCIA_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 220
                end
                object cxgrdbclmncxgrdbtblvw1CPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'C'#243'digo Postal'
                  DataBinding.FieldName = 'CPOSTAL_CLIENTE_FACTURA'
                  MinWidth = 16
                end
                object cxgrdbclmncxgrdbtblvw1PAIS_CLIENTE_FACTURA: TcxGridDBColumn
                  Caption = 'Pa'#237's'
                  DataBinding.FieldName = 'PAIS_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 115
                end
              end
              object tvLineasFacturacion: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataSource = DMClientes.dsLinFac
                DataController.DetailKeyFieldNames = 'NRO_FACTURA_LINEA; SERIE_FACTURA_LINEA'
                DataController.KeyFieldNames = 'LINEA_LINEA'
                DataController.MasterKeyFieldNames = 'NRO_FACTURA; SERIE_FACTURA'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.ColumnHeaderHints = False
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnMoving = False
                OptionsCustomize.ColumnsQuickCustomizationShowCommands = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA: TcxGridDBColumn
                  DataBinding.FieldName = 'LINEA_LINEA'
                  MinWidth = 16
                  Width = 126
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA: TcxGridDBColumn
                  Caption = 'C'#243'digo Tratamiento'
                  DataBinding.FieldName = 'CODIGO_ARTICULO_LINEA'
                  MinWidth = 16
                  Width = 193
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn
                  Caption = 'Descripci'#243'n Tratamiento'
                  DataBinding.FieldName = 'DESCRIPCION_ARTICULO_LINEA'
                  MinWidth = 16
                  Width = 237
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1ZONA: TcxGridDBColumn
                  Caption = 'Nro Pieza'
                  DataBinding.FieldName = 'ZONA'
                  MinWidth = 16
                  Width = 94
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn
                  Caption = 'Precio'
                  DataBinding.FieldName = 'PRECIOVENTA_ARTICULO_LINEA'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  MinWidth = 16
                  Width = 104
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA: TcxGridDBColumn
                  Caption = 'Cantidad'
                  DataBinding.FieldName = 'CANTIDAD_LINEA'
                  MinWidth = 16
                  Width = 113
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA: TcxGridDBColumn
                  Caption = 'Total'
                  DataBinding.FieldName = 'SUM_TOTAL_LINEA'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  MinWidth = 16
                  Width = 110
                end
                object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1ODONTOLOGO: TcxGridDBColumn
                  Caption = 'Nro Odont'#243'logo'
                  DataBinding.FieldName = 'ODONTOLOGO'
                  MinWidth = 16
                  Width = 160
                end
              end
              object cxgrdlvlcxgrd1Level1: TcxGridLevel
                GridView = tvFacturacion
                object cxgrdlvlcxgrd1Level2: TcxGridLevel
                  GridView = tvLineasFacturacion
                end
              end
            end
          end
          object tsPresupuestos: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Presupuestos'
            ImageIndex = 4
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 1003
              Height = 257
              Align = alClient
              TabOrder = 0
              object cxGridDBTableView1: TcxGridDBTableView
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataModeController.SmartRefresh = True
                DataController.DataSource = DMClientes.dsPresupuestos
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsCustomize.ColumnGrouping = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.InvertSelect = False
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object cxGridDBColumn1: TcxGridDBColumn
                  AlternateCaption = 'Fecha Presupuesto'
                  Caption = 'Fecha Presupuesto'
                  DataBinding.FieldName = 'FECHA_FACTURA'
                  PropertiesClassName = 'TcxDateEditProperties'
                  MinWidth = 16
                  Width = 252
                end
                object cxGridDBColumn2: TcxGridDBColumn
                  AlternateCaption = 'Nro Presupuesto'
                  Caption = 'Nro Presupuesto'
                  DataBinding.FieldName = 'NRO_FACTURA'
                  MinWidth = 16
                  Width = 224
                end
                object cxGridDBColumn3: TcxGridDBColumn
                  Caption = 'Serie'
                  DataBinding.FieldName = 'SERIE_FACTURA'
                  MinWidth = 16
                  Width = 133
                end
                object cxGridDBColumn4: TcxGridDBColumn
                  Caption = 'C'#243'digo Paciente'
                  DataBinding.FieldName = 'CODIGO_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 167
                end
                object cxGridDBColumn5: TcxGridDBColumn
                  Caption = 'Raz'#243'n Social'
                  DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 270
                end
                object cxGridDBColumn6: TcxGridDBColumn
                  Caption = 'Nif'
                  DataBinding.FieldName = 'NIF_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 115
                end
                object cxGridDBColumn7: TcxGridDBColumn
                  Caption = 'Tel'#233'fono1'
                  DataBinding.FieldName = 'MOVIL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 131
                end
                object cxGridDBColumn8: TcxGridDBColumn
                  Caption = 'Email'
                  DataBinding.FieldName = 'EMAIL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 143
                end
                object cxGridDBColumn9: TcxGridDBColumn
                  Caption = 'Direcci'#243'n1'
                  DataBinding.FieldName = 'DIRECCION1_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 163
                end
                object cxGridDBColumn10: TcxGridDBColumn
                  Caption = 'Direcci'#243'n2'
                  DataBinding.FieldName = 'DIRECCION2_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 152
                end
                object cxGridDBColumn11: TcxGridDBColumn
                  Caption = 'Poblaci'#243'n'
                  DataBinding.FieldName = 'POBLACION_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 148
                end
                object cxGridDBColumn12: TcxGridDBColumn
                  Caption = 'Provincia'
                  DataBinding.FieldName = 'PROVINCIA_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 293
                end
                object cxGridDBColumn13: TcxGridDBColumn
                  Caption = 'C'#243'digo Postal'
                  DataBinding.FieldName = 'CPOSTAL_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 168
                end
                object cxGridDBColumn14: TcxGridDBColumn
                  Caption = 'Pa'#237's'
                  DataBinding.FieldName = 'PAIS_CLIENTE_FACTURA'
                  MinWidth = 16
                  Width = 115
                end
                object cxGridDBColumn15: TcxGridDBColumn
                  Caption = 'Total L'#237'quido'
                  DataBinding.FieldName = 'TOTAL_LIQUIDO_FACTURA'
                  MinWidth = 16
                  Width = 220
                end
                object cxGridDBColumn16: TcxGridDBColumn
                  Caption = 'Forma de Pago'
                  DataBinding.FieldName = 'FORMA_PAGO_FACTURA'
                  MinWidth = 16
                  Width = 180
                end
                object cxGridDBColumn17: TcxGridDBColumn
                  Caption = 'Comentarios'
                  DataBinding.FieldName = 'COMENTARIOS_FACTURA'
                  MinWidth = 16
                  Width = 389
                end
              end
              object cxGridDBTableView2: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataSource = DMClientes.dsLinPre
                DataController.DetailKeyFieldNames = 'NRO_FACTURA_LINEA; SERIE_FACTURA_LINEA'
                DataController.KeyFieldNames = 'LINEA_LINEA'
                DataController.MasterKeyFieldNames = 'NRO_FACTURA; SERIE_FACTURA'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.ColumnHeaderHints = False
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnMoving = False
                OptionsCustomize.ColumnsQuickCustomizationShowCommands = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
                object cxGridDBColumn18: TcxGridDBColumn
                  DataBinding.FieldName = 'LINEA_LINEA'
                  MinWidth = 16
                  Width = 22
                end
                object cxGridDBColumn19: TcxGridDBColumn
                  Caption = 'C'#243'digo Tratamiento'
                  DataBinding.FieldName = 'CODIGO_ARTICULO_LINEA'
                  MinWidth = 16
                  Width = 131
                end
                object cxGridDBColumn20: TcxGridDBColumn
                  Caption = 'Descripci'#243'n Tratamiento'
                  DataBinding.FieldName = 'DESCRIPCION_ARTICULO_LINEA'
                  MinWidth = 16
                  Width = 643
                end
                object cxGridDBColumn21: TcxGridDBColumn
                  Caption = 'Nro Pieza'
                  DataBinding.FieldName = 'ZONA'
                  MinWidth = 16
                  Width = 387
                end
                object cxGridDBColumn22: TcxGridDBColumn
                  Caption = 'Precio'
                  DataBinding.FieldName = 'PRECIOVENTA_ARTICULO_LINEA'
                  MinWidth = 16
                  Width = 67
                end
                object cxGridDBColumn23: TcxGridDBColumn
                  Caption = 'Cantidad'
                  DataBinding.FieldName = 'CANTIDAD_LINEA'
                  MinWidth = 16
                  Width = 67
                end
                object cxGridDBColumn24: TcxGridDBColumn
                  Caption = 'Total'
                  DataBinding.FieldName = 'SUM_TOTAL_LINEA'
                  MinWidth = 16
                  Width = 67
                end
                object cxGridDBColumn25: TcxGridDBColumn
                  Caption = 'Nro Odont'#243'logo'
                  DataBinding.FieldName = 'ODONTOLOGO'
                  MinWidth = 16
                  Width = 54
                end
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
                object cxGridLevel2: TcxGridLevel
                  GridView = cxGridDBTableView2
                end
              end
            end
          end
          object tsFichaDental: TcxTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'FichaDental'
            ImageIndex = 5
            object cxgrd2: TcxGrid
              Left = 0
              Top = 49
              Width = 1003
              Height = 208
              Align = alClient
              TabOrder = 0
              object tv1: TcxGridDBTableView
                Navigator.Buttons.ConfirmDelete = True
                Navigator.Buttons.CustomButtons = <>
                Navigator.Buttons.Insert.Visible = False
                Navigator.Buttons.Delete.Enabled = False
                Navigator.Buttons.Delete.Visible = False
                Navigator.Visible = True
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataModeController.SmartRefresh = True
                DataController.DataSource = DMClientes.dsCuestionarioPreguntas
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsCustomize.ColumnGrouping = False
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsSelection.MultiSelect = True
                OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                OptionsView.GroupByBox = False
                object cxgrdbclmntv1PREGUNTA: TcxGridDBColumn
                  DataBinding.FieldName = 'PREGUNTA'
                  MinWidth = 16
                  Width = 463
                end
                object cxgrdbclmntv1RESPUESTA: TcxGridDBColumn
                  DataBinding.FieldName = 'RESPUESTA'
                  MinWidth = 16
                  Width = 640
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
                GridView = tv1
              end
            end
            object pnl4: TPanel
              Left = 0
              Top = 0
              Width = 1003
              Height = 49
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alTop
              TabOrder = 1
              object lbl1: TLabel
                Left = 18
                Top = 15
                Width = 178
                Height = 22
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Fecha Cuestionario'
              end
              object cxdbdtdt2: TcxDBDateEdit
                Left = 211
                Top = 7
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                DataBinding.DataField = 'FECHA_CUESTIONARIO'
                DataBinding.DataSource = DMClientes.dsCuestionario
                TabOrder = 0
                Width = 174
              end
              object btnCrearCuestionario: TButton
                Left = 474
                Top = 8
                Width = 223
                Height = 33
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Crear Cuestionario'
                TabOrder = 1
                OnClick = btnCrearCuestionarioClick
              end
            end
          end
        end
      end
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = DMClientes.unqryClientes
    Left = 308
    Top = 199
  end
  object dxbrmngr1: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 1232
    Top = 320
    PixelsPerInch = 96
    object dxbrlrgbtn1: TdxBarLargeButton
      Caption = 'Etiquetas Sobre'
      Category = 0
      Hint = 'Etiquetas Sobre'
      Visible = ivAlways
      OnClick = dxbbEtiquetasClick
    end
    object dxbrlrgbtnCuestionario: TdxBarLargeButton
      Caption = 'Cuestionario'
      Category = 0
      Hint = 'Cuestionario'
      Visible = ivAlways
      OnClick = dxbrlrgbtnCuestionarioClick
    end
  end
  object dxbrpmn1: TdxBarPopupMenu
    BarManager = dxbrmngr1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxbrlrgbtn1'
      end
      item
        Visible = True
        ItemName = 'dxbrlrgbtnCuestionario'
      end>
    PopupAlignment = paRight
    UseOwnFont = False
    Left = 1160
    Top = 320
    PixelsPerInch = 96
  end
end
