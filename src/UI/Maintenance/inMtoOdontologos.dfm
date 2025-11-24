inherited frmMtoOdontologos: TfrmMtoOdontologos
  Left = 5
  Top = 4
  Caption = 'Odont'#243'logos'
  ClientHeight = 530
  ClientWidth = 857
  ExplicitWidth = 869
  ExplicitHeight = 568
  TextHeight = 22
  inherited pButtonPage: TPanel
    Width = 659
    Height = 530
    ExplicitWidth = 379
    ExplicitHeight = 529
  end
  inherited pButtonRightBar: TPanel
    Left = 659
    Height = 530
    ExplicitLeft = 379
    ExplicitHeight = 529
    inherited pButtonGen: TPanel
      Top = 371
      ExplicitTop = 370
      ExplicitWidth = 196
    end
    inherited pButtonBDStat: TPanel
      ExplicitWidth = 196
      inherited pnTableName: TPanel
        ExplicitWidth = 196
      end
      inherited Panel4: TPanel
        ExplicitWidth = 196
      end
    end
  end
  inherited pcPantalla: TPageControl
    Width = 659
    Height = 530
    ActivePage = tsLista
    ExplicitWidth = 379
    ExplicitHeight = 529
    inherited tsLista: TTabSheet
      ExplicitWidth = 651
      ExplicitHeight = 490
      inherited cxGrdPrincipal: TcxGrid
        Width = 651
        Height = 447
        ExplicitWidth = 651
        ExplicitHeight = 447
        inherited cxGrdDBTabPrin: TcxGridDBTableView
          object cxgrdbclmnGrdDBTabPrinODONTOLOGO: TcxGridDBColumn
            Caption = 'C'#243'digo Odont'#243'logo'
            DataBinding.FieldName = 'ODONTOLOGO'
            Width = 217
          end
          object cxgrdbclmnGrdDBTabPrinNOMBRE_ODONTOLOGO: TcxGridDBColumn
            Caption = 'Nombre Odont'#243'logo'
            DataBinding.FieldName = 'NOMBRE_ODONTOLOGO'
            Width = 292
          end
        end
      end
      inherited pnTopGrid: TPanel
        Width = 651
        ExplicitWidth = 651
        inherited edtBusqGlobal: TcxTextEdit
          ExplicitHeight = 30
        end
      end
    end
    inherited tsFicha: TTabSheet
      ExplicitWidth = 651
      ExplicitHeight = 490
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 651
        Height = 145
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 371
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
        end
        object cxlbl1: TcxLabel
          Left = 46
          Top = 65
          Caption = 'Nombre'
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
          Width = 649
          Height = 145
          Align = alTop
          TabOrder = 0
          ExplicitLeft = 25
          ExplicitTop = -28
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 128
            Top = 31
            DataBinding.DataField = 'ODONTOLOGO'
            DataBinding.DataSource = dsTablaG
            ParentFont = False
            Properties.ReadOnly = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -17
            Style.Font.Name = 'Lucida Sans'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 121
          end
          object cxLabel1: TcxLabel
            Left = 49
            Top = 35
            Caption = 'C'#243'digo'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -17
            Style.Font.Name = 'Lucida Sans'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel2: TcxLabel
            Left = 46
            Top = 65
            Caption = 'Nombre'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -17
            Style.Font.Name = 'Lucida Sans'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 128
            Top = 61
            DataBinding.DataField = 'NOMBRE_ODONTOLOGO'
            DataBinding.DataSource = dsTablaG
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -17
            Style.Font.Name = 'Lucida Sans'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Width = 226
          end
          object img1: TcxImage
            Left = 360
            Top = 10
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Picture.Data = {
              0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000064
              000000640804000000DAEB5DDF00000002624B474400FF878FCCBF000009C449
              44415478DAED9C7B7054F515C73F9B20092A24010179B44A02627807060B5441
              A8545468C71148C2401901291A1050A820D5D23AA3508501DAA9ED94024AA980
              F22893625B9191C4CA748A513194E722F2284D90F07E19C2F68F9C7BF6DEBB77
              37BB7793BDEB4CCFEF8FBDF93DCE9EEFDEDF3DBFF3BA8178C9472E637991156C
              670F7E2AA8A2861AAAA8C0CF1EB6B38217194B2E494B69E4B3915304A26C956C
              603469C906620E5F450DC1DCBEE227344E161839EC7505C2687BC84E06184DF9
              D222D6198A59C0141E24976C6E230B1F3EB2684936B90C630A0B28E68C65CD17
              34F51EC84BA66DF21A79A444B52A853C169BB6E34BDE03D92AA2FC918C98D766
              B246566FF51EC81E11A57798F1C9D29CA98FAC2EF71EC83911E5B630E3C6E671
              A696327ADE6B185922C8657CAE80F8B82CE399DE02E92162EC0B3B233210D82F
              E3DDBD05325CC478CF35906D32FE88B7409E1231FEE01AC80A197FD25B20AF88
              18F32DBD53A9D2660009F64CB5CC9D2FE32F7B0BC4380726587A674534496659
              E64ED473C8532A11311E700D64A8F4EEF016C81111A3B36B2077ABBDE521A5F2
              B58871B3A53F9D2C6D86F8C19E74CBDC9B65FC6B52BD03D25E843815614E5D5A
              0B351DDB7907648088F0715C40CA64467FEF80E48B089BE202B259668CF60EC8
              6C1161695C4096392A81845234222C9016DFCFD1C0646C8A7CB1645BD1957EF4
              269B9634725CD1889664D39B7E74A59558CC05516CD006A6E0639AC9424EDACE
              8B731CC14F19BBD845197E8EA8EF62B4FFF00A1951A98C06A653EA1DEE8D2386
              92A7912E8F2878946D8D2B1C541CE6584D1875D60D62887496DDECE413FC9CE6
              86A3D037388D9F3276B29BB3A62D56FB799737400C73EFA87CBE6F8B1966924D
              3679F4A10F7964D3C1E6CEA6F1818DC303DE00310CF09316DD150B15DA384CF0
              06C8620DCCD57E7689994337B5D56A3F177B03E48086726A3FDBC4CCA19D2AEA
              DACF03DE0031EEC455F9BC25660EB7CACA2B7A6F3DA066A2976AB82E62C4EE4F
              A4CACAEBD4082F0F82D9C34488CFB9E0FA8E34D5CD69045E87261EC82FE5AB7F
              C371B9BA33661E1D64E5315E97AB0589077248BE7A241FC9D5E098790C9195FF
              60945CED4F348CFE1AF36DCA6AB99E1133976764E59B34D307BEAF37F1AC7780
              E972BD2E662EEFC8CA69C026B97E23913072A996AFFD3ED057936E37C5C4E526
              B5B6FA000FC975355D1307E46F6A82FB801497464A819A8C3EC0C7BF139DBD7A
              44ADD611D2B354FEFE28263E3B6D2EEE0F95EFB044C0C8D42CEEFBDAD7510EB4
              00FD620E25D5D051FBFEAEEAB879C30359ABA7B13935F367E9FD24CAE7A411BB
              1C3CF59E6A256C6868188FEBEDB7A6010669FF4FA3E2F382CEBFCF167331FA1F
              6F5820C7F57E3C66CBA8AF92916B0CAC93CB20AEC9EC9596FE1446E93D399E18
              20B579C359E4E8481627540D7F27228F7E5AF770822CEDCD61B6E613130064B8
              ADF822C021D63097420652A47EFA85088AB8808BEABF17319042E6B206BF8DEB
              19D5880D46AD58AE3A2A522B752895C9A1348A95352CA755624E92EEACD45D1E
              BE5D670B13E9456B5AD38B4914EBFE0FDFAEB2826E89B5B66EA7886D1A918ABF
              5DE33D9EA2B55741BA740650C46236524A397E4E51C5A53A85BE441595F829A7
              948D2CA688FEB63C5692500A851A17B6B632C64459089544D49D796C661F1554
              B08FCDCCF3BA4CE3FFF4CDA526F46414F3F8156F53CA3E8E5125CED359AA38CA
              3E4A58CF32E632921EC9562A0B4DB8976758C7E1A80E4AF3C1E7672D3319E0B5
              C6F2D193D96CD348A3FB76C9B136A8094359480987A8264035E728673EB32866
              2F15547386FD7CC8221E76115153EAC5422DDFA88F76952616FE2D986FAA2CAA
              AB5D64296D638590C174F5AE9DDB76A653C82072694F96D49E6690C5B7E8C2FD
              8C6106DB43D65CB0E4562668F432FA769969D183E8C4EFD476B55AC0AB99CA72
              2D8F695447C4D708EE2DE769D67080C38CD4D1C6FCD6F57D5D6DBBAF8ED49155
              1A040AEEEDCD3CA9566E2B2DB42C88C8A95063F0B73B8CFEDEC4FF24BFE6513A
              D3824C1E620995A6B13768CE5D8C6089E6BB0204581BB648549CA6653610D7D8
              C2186EB5CD3322B89F4664F7B1468D43E969FD86F34C0BD1663E269B328F23F4
              1E3EC169ED9D1B5E374DB0FC12018E322F8C959AAD86FA90B030BEA7CAB753C8
              587B0D9C1EE4EE30EB73348AF3234B38FC73CD31E7382D6B4DB1054439F911F3
              201B64DEBB6167FCD5146C25CC1DAD720019A43BD84D80129BD26DABAEF6CAD0
              2543A930813848419D966B5F9DDD2B8C2179236C51537375D6C6D7798239D57D
              8FD4A0ABEDD99B64729B2E313FCAF3B74423EC4EB43A4205E3684D2DA4BA3CA0
              3F130EE3CCDD2F9BEEC50EEE889ADD08DDABDF7678068CDF7CB8C3CA1571BF82
              F142E88FF83393E7FD7C4CBF908F7259B92864CC4868EF75DCA2FF92D141AE81
              0CD078A7D01493128CBDD47B82AECDB4F43753D5E91C4534CE83F6AE81B4D3D8
              3100BDD50C3C4D9E0B7669AA3FE658FAE74AEF7FC33C6D86EA756F0BA7EB510B
              34361502DCE392E11C0791D3B474E6B930AB8CB28166AE816468780F98A1DBEA
              31D70C839B28585D3231CC860BD24199D1230E9B5C53AAE97A8ABF1E97AFB248
              E3C329A2028C4CFA6B61D7188585335D7FEBB3C1A4C4A35A79D5222E2041455B
              6B11FD20825236689ACCD9EDFA5B0D7D59143CB016C5ED3FBE299C4A0034E61B
              2967DB460FE0875D7D63F0C76A0BBBE58F01F510D50A1A23F7D461B818F4B686
              F1620FE2A5F0A9AC7E0BD0A441663DF8F4EFEA8EDD1865BEB687862FC6E16CC2
              8E223F8C533B5EADEA6E104DDD74F4344459D7D469DC1B6414227CE9709A8C17
              07F812931C021547AD2FD4D42710F8A7C505D815C58A0E7A183F6B1BE96972ED
              AE87BCBE395B8FC23B1B02488105487E4C8AFB982D3FBCC4C26B8965ACB1DA12
              AF1A5DF50B2418660870B88E9044301074C1F1ED85525B3ECC290A703E989FAF
              5F20C1B3211043B0C6A8A3D868E9ADB4FD7F02336D0A2DEEAC6F20B788009531
              4403F33452956EBA4F469F11A969613215AF842AF7FA0602C339C10947472A3C
              7D2152DC1BE2697CA6A745F0A4BBCFE975B3FA07128F55F05C888FB39675213E
              CDF3D2B32AF980FC58A4D8A23D0BA5E717FC5CAE16EAD85FA46772F201E9A675
              C046A06FBDF48C65ACAD5E2F45AD912EC907244523F146D6F143F9FB7E06DB14
              705E08680B90C4B7C3963AA12D36A56DA4303AE9CB1E876464A6736154C0C356
              6692C32E9E714866A83B7BD6E68E4D4B4E20C10D9302F8D4EC4C3595A15B3761
              B7640162DD5A29FA0AC1BD4013737444CDCA3493855D19399DE025FDC9E4535A
              E355C7E4AFB6C05B4E674872D183BA85BEAB4ED30E8BF9388E41BAE506272F90
              5475BB83ED558BA16F7EBA7C24310DB6897B455E146F13527F349024A729A652
              B52B263F7EBCDABB01AA79826F000DA3848BF859678BBFE4B19EC35CE003E757
              67FE07DCCC7421F6A8B0F30000000049454E44AE426082}
            Properties.FitMode = ifmProportionalStretch
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Edges = []
            TabOrder = 0
            Transparent = True
            Height = 101
            Width = 64
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 145
        Width = 651
        Height = 345
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 371
        ExplicitHeight = 344
        object cxpgcntrl2: TcxPageControl
          Left = 1
          Top = 1
          Width = 649
          Height = 343
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxtbsht3
          Properties.CustomButtons.Buttons = <>
          ExplicitWidth = 369
          ExplicitHeight = 342
          ClientRectBottom = 339
          ClientRectLeft = 4
          ClientRectRight = 645
          ClientRectTop = 28
          object cxtbsht3: TcxTabSheet
            Caption = 'M'#225's Datos'
            ImageIndex = 0
            ExplicitWidth = 361
            ExplicitHeight = 310
          end
        end
      end
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = unqryOdontologos
    Left = 236
    Top = 311
  end
  inherited cxlclzr1: TcxLocalizer
    Left = 160
    Top = 288
  end
  object unqryOdontologos: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_odontologos'
      '  (ODONTOLOGO, NOMBRE_ODONTOLOGO)'
      'VALUES'
      '  (:ODONTOLOGO, :NOMBRE_ODONTOLOGO)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_odontologos'
      'WHERE'
      '  ODONTOLOGO = :Old_ODONTOLOGO')
    SQLUpdate.Strings = (
      'UPDATE suboc_odontologos'
      'SET'
      
        '  ODONTOLOGO = :ODONTOLOGO, NOMBRE_ODONTOLOGO = :NOMBRE_ODONTOLO' +
        'GO'
      'WHERE'
      '  ODONTOLOGO = :Old_ODONTOLOGO')
    SQLLock.Strings = (
      'SELECT * FROM suboc_odontologos'
      'WHERE'
      '  ODONTOLOGO = :Old_ODONTOLOGO'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT ODONTOLOGO, NOMBRE_ODONTOLOGO FROM suboc_odontologos'
      'WHERE'
      '  ODONTOLOGO = :ODONTOLOGO')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_odontologos')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_odontologos')
    Active = True
    Left = 288
    Top = 272
  end
end
