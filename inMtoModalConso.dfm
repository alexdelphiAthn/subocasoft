object frmMtoModalConso: TfrmMtoModalConso
  Left = 0
  Top = 0
  Caption = 'Enviar Factura a VeriFactu'
  ClientHeight = 848
  ClientWidth = 1111
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Lucida Sans'
  Font.Style = []
  TextHeight = 18
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 1111
    Height = 848
    ActivePage = tsDefData
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1107
    ExplicitHeight = 847
    object ts1: TTabSheet
      Caption = 'Datos de Conexi'#243'n'
      object lbl1: TLabel
        Left = 24
        Top = 9
        Width = 73
        Height = 18
        Caption = 'URL base'
      end
      object lbl2: TLabel
        Left = 24
        Top = 61
        Width = 91
        Height = 18
        Caption = 'Key de auth'
      end
      object lbl3: TLabel
        Left = 24
        Top = 117
        Width = 107
        Height = 18
        Caption = 'Value de Auth'
      end
      object edtBaseURL: TEdit
        Left = 24
        Top = 27
        Width = 433
        Height = 26
        TabOrder = 0
        Text = 'https://wortice.es/api-demo/invoice'
      end
      object edtValue: TEdit
        Left = 24
        Top = 136
        Width = 881
        Height = 26
        TabOrder = 1
        Text = 
          '2wj3W4pKXfxh80V7P7b1lPPeEvrTbqZ6H1Yvnl2jFJ8xlB6yEGhKCAB3dHAFytHK' +
          '2K6d8jc7D62yA6oFSX9zU3'
      end
      object edtKey: TEdit
        Left = 24
        Top = 82
        Width = 473
        Height = 26
        TabOrder = 2
        Text = 'API-KEY'
      end
    end
    object tsDefData: TTabSheet
      Caption = 'Valores por defecto'
      ImageIndex = 5
      object lbl14: TLabel
        Left = 32
        Top = 17
        Width = 88
        Height = 18
        Caption = 'Nro Factura'
      end
      object lbl141: TLabel
        Left = 32
        Top = 73
        Width = 97
        Height = 18
        Caption = 'Serie Factura'
      end
      object lbl1411: TLabel
        Left = 32
        Top = 129
        Width = 117
        Height = 18
        Caption = 'Importe Factura'
      end
      object edtNroFactura: TEdit
        Left = 32
        Top = 38
        Width = 433
        Height = 26
        TabOrder = 0
      end
      object edtSerieFactura: TEdit
        Left = 32
        Top = 94
        Width = 433
        Height = 26
        TabOrder = 1
      end
      object edtImporteFactura: TEdit
        Left = 32
        Top = 150
        Width = 433
        Height = 26
        TabOrder = 2
      end
    end
    object ts2: TTabSheet
      Caption = 'Facturas'
      ImageIndex = 1
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 1107
        Height = 775
        Align = alClient
        TabOrder = 0
      end
      object pnl2: TPanel
        Left = 0
        Top = 775
        Width = 1107
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btnBuildJSON: TButton
          Left = 40
          Top = 6
          Width = 305
          Height = 25
          Caption = 'Elaborar factura para enviar a WS'
          TabOrder = 0
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'Body raw de WS'
      ImageIndex = 2
      object mseBody: TSynEdit
        Left = 0
        Top = 0
        Width = 1107
        Height = 816
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        TabOrder = 0
        UseCodeFolding = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Consolas'
        Gutter.Font.Style = []
        Gutter.Bands = <
          item
            Kind = gbkMarks
            Width = 13
          end
          item
            Kind = gbkLineNumbers
          end
          item
            Kind = gbkFold
          end
          item
            Kind = gbkTrackChanges
          end
          item
            Kind = gbkMargin
            Width = 3
          end>
        Highlighter = synjsnsyn1
        SelectedColor.Alpha = 0.400000005960464500
      end
    end
    object ts4: TTabSheet
      Caption = 'Di'#225'logo con el WS'
      ImageIndex = 3
      object pnl1: TPanel
        Left = 0
        Top = 753
        Width = 1107
        Height = 63
        Align = alBottom
        TabOrder = 0
        object btnCallWS: TButton
          Left = 8
          Top = 8
          Width = 305
          Height = 40
          Caption = 'Llamada al WS'
          TabOrder = 0
        end
      end
      object mseDialog: TSynEdit
        Left = 0
        Top = 0
        Width = 1107
        Height = 753
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        TabOrder = 1
        UseCodeFolding = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Consolas'
        Gutter.Font.Style = []
        Gutter.Bands = <
          item
            Kind = gbkMarks
            Width = 13
          end
          item
            Kind = gbkLineNumbers
          end
          item
            Kind = gbkFold
          end
          item
            Kind = gbkTrackChanges
          end
          item
            Kind = gbkMargin
            Width = 3
          end>
        Highlighter = synjsnsyn1
        SelectedColor.Alpha = 0.400000005960464500
      end
    end
    object tsRespuestaWS: TTabSheet
      Caption = 'Respuesta WS OK'
      ImageIndex = 6
      object pnl4: TPanel
        Left = 0
        Top = 0
        Width = 1103
        Height = 815
        Align = alClient
        TabOrder = 0
        object lbl: TLabel
          Left = 61
          Top = 22
          Width = 160
          Height = 18
          Caption = 'ID_CONSOLIDACION'
          FocusControl = spID_CONSOLIDACION
        end
        object lbl4: TLabel
          Left = 96
          Top = 70
          Width = 125
          Height = 18
          Caption = 'SERIE_FACTURA'
          FocusControl = txtSERIE_FACTURA
        end
        object lbl5: TLabel
          Left = 103
          Top = 119
          Width = 118
          Height = 18
          Caption = 'NRO_FACTURA'
          FocusControl = spNRO_FACTURA
        end
        object lbl6: TLabel
          Left = 125
          Top = 167
          Width = 96
          Height = 18
          Caption = 'REQUEST_ID'
          FocusControl = txtREQUEST_ID
        end
        object lbl7: TLabel
          Left = 142
          Top = 216
          Width = 79
          Height = 18
          Caption = 'QUEUE_ID'
          FocusControl = spQUEUE_ID
        end
        object lbl8: TLabel
          Left = 108
          Top = 264
          Width = 113
          Height = 18
          Caption = 'ISSUER_IRS_ID'
          FocusControl = txtISSUER_IRS_ID
        end
        object lbl9: TLabel
          Left = 121
          Top = 313
          Width = 100
          Height = 18
          Caption = 'ISSUED_TIME'
          FocusControl = dteISSUED_TIME
        end
        object lbl10: TLabel
          Left = 92
          Top = 361
          Width = 129
          Height = 18
          Caption = 'CHAIN_NUMBER'
          FocusControl = txtCHAIN_NUMBER
        end
        object lbl11: TLabel
          Left = 114
          Top = 410
          Width = 107
          Height = 18
          Caption = 'CHAIN_HASH'
          FocusControl = txtCHAIN_HASH
        end
        object lbl12: TLabel
          Left = 93
          Top = 476
          Width = 128
          Height = 18
          Caption = 'VERIFACTU_URL'
          FocusControl = cxdbmVERIFACTU_URL
        end
        object lbl13: TLabel
          Left = 87
          Top = 543
          Width = 134
          Height = 18
          Caption = 'QRCODE_BASE64'
          FocusControl = cxdbmQRCODE_BASE64
        end
        object lbl15: TLabel
          Left = 27
          Top = 591
          Width = 194
          Height = 18
          Caption = 'FECHA_PROCESAMIENTO'
          FocusControl = dteFECHA_PROCESAMIENTO
        end
        object lbl16: TLabel
          Left = 159
          Top = 640
          Width = 62
          Height = 18
          Caption = 'ESTADO'
          FocusControl = txtESTADO
        end
        object lbl17: TLabel
          Left = 42
          Top = 703
          Width = 179
          Height = 18
          Caption = 'RESPUESTA_COMPLETA'
          FocusControl = cxdbmRESPUESTA_COMPLETA
        end
        object lbl18: TLabel
          Left = 57
          Top = 752
          Width = 164
          Height = 18
          Caption = 'PETICION_COMPLETA'
          FocusControl = cxdbmPETICION_COMPLETA
        end
        object img1: TcxDBImage
          Left = 648
          Top = 17
          DataBinding.DataField = 'QRCODE_PNG'
          Properties.FitMode = ifmProportionalStretch
          Properties.GraphicClassName = 'TdxPNGImage'
          Properties.ReadOnly = True
          TabOrder = 0
          Height = 176
          Width = 196
        end
        object spID_CONSOLIDACION: TcxDBSpinEdit
          Left = 240
          Top = 14
          DataBinding.DataField = 'ID_CONSOLIDACION'
          TabOrder = 1
          Width = 121
        end
        object txtSERIE_FACTURA: TcxDBTextEdit
          Left = 240
          Top = 62
          DataBinding.DataField = 'SERIE_FACTURA'
          TabOrder = 2
          Width = 121
        end
        object spNRO_FACTURA: TcxDBSpinEdit
          Left = 240
          Top = 111
          DataBinding.DataField = 'NRO_FACTURA'
          TabOrder = 3
          Width = 121
        end
        object txtREQUEST_ID: TcxDBTextEdit
          Left = 240
          Top = 159
          DataBinding.DataField = 'REQUEST_ID'
          TabOrder = 4
          Width = 353
        end
        object spQUEUE_ID: TcxDBSpinEdit
          Left = 240
          Top = 208
          DataBinding.DataField = 'QUEUE_ID'
          TabOrder = 5
          Width = 121
        end
        object txtISSUER_IRS_ID: TcxDBTextEdit
          Left = 240
          Top = 256
          DataBinding.DataField = 'ISSUER_IRS_ID'
          TabOrder = 6
          Width = 153
        end
        object dteISSUED_TIME: TcxDBDateEdit
          Left = 240
          Top = 305
          DataBinding.DataField = 'ISSUED_TIME'
          TabOrder = 7
          Width = 121
        end
        object txtCHAIN_NUMBER: TcxDBTextEdit
          Left = 240
          Top = 353
          DataBinding.DataField = 'CHAIN_NUMBER'
          TabOrder = 8
          Width = 121
        end
        object txtCHAIN_HASH: TcxDBTextEdit
          Left = 240
          Top = 402
          DataBinding.DataField = 'CHAIN_HASH'
          TabOrder = 9
          Width = 665
        end
        object cxdbmVERIFACTU_URL: TcxDBMemo
          Left = 240
          Top = 450
          DataBinding.DataField = 'VERIFACTU_URL'
          TabOrder = 10
          Height = 44
          Width = 665
        end
        object cxdbmQRCODE_BASE64: TcxDBMemo
          Left = 240
          Top = 517
          DataBinding.DataField = 'QRCODE_BASE64'
          TabOrder = 11
          Height = 44
          Width = 665
        end
        object dteFECHA_PROCESAMIENTO: TcxDBDateEdit
          Left = 240
          Top = 583
          DataBinding.DataField = 'FECHA_PROCESAMIENTO'
          TabOrder = 12
          Width = 121
        end
        object txtESTADO: TcxDBTextEdit
          Left = 240
          Top = 632
          DataBinding.DataField = 'ESTADO'
          TabOrder = 13
          Width = 121
        end
        object cxdbmRESPUESTA_COMPLETA: TcxDBMemo
          Left = 240
          Top = 680
          DataBinding.DataField = 'RESPUESTA_COMPLETA'
          TabOrder = 14
          Height = 41
          Width = 617
        end
        object cxdbmPETICION_COMPLETA: TcxDBMemo
          Left = 240
          Top = 749
          DataBinding.DataField = 'PETICION_COMPLETA'
          TabOrder = 15
          Height = 44
          Width = 617
        end
      end
    end
  end
  object rstCliClient: TRESTClient
    Authenticator = htBasAuthAutenticator
    Accept = 'application/json, text/plain, text/xml; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'ISO-8859-1, *;q=0.8'
    ContentType = 'text/xml'
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Output-Format'
        Value = 'text/xml'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Io-Format'
        Value = 'text/xml'
      end>
    SecureProtocols = [SSL2, SSL3, TLS1, TLS11, TLS12]
    SynchronizedEvents = False
    Left = 648
    Top = 144
  end
  object rstReqRequest: TRESTRequest
    AssignedValues = [rvAccept]
    Accept = 'application/json'
    Client = rstCliClient
    Method = rmPOST
    Params = <>
    Response = rstResResponse
    SynchronizedEvents = False
    Left = 744
    Top = 128
  end
  object rstResResponse: TRESTResponse
    Left = 648
    Top = 216
  end
  object synjsnsyn1: TSynJSONSyn
    Left = 488
    Top = 40
  end
  object htBasAuthAutenticator: THTTPBasicAuthenticator
    Left = 728
    Top = 320
  end
  object unqryConsolidacion: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_consolidacion'
      
        '  (ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID, QUE' +
        'UE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH, VER' +
        'IFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ESTA' +
        'DO, RESPUESTA_COMPLETA, PETICION_COMPLETA)'
      'VALUES'
      
        '  (:ID_CONSOLIDACION, :SERIE_FACTURA, :NRO_FACTURA, :REQUEST_ID,' +
        ' :QUEUE_ID, :ISSUER_IRS_ID, :ISSUED_TIME, :CHAIN_NUMBER, :CHAIN_' +
        'HASH, :VERIFACTU_URL, :QRCODE_BASE64, :QRCODE_PNG, :FECHA_PROCES' +
        'AMIENTO, :ESTADO, :RESPUESTA_COMPLETA, :PETICION_COMPLETA)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_consolidacion'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION')
    SQLUpdate.Strings = (
      'UPDATE suboc_consolidacion'
      'SET'
      
        '  ID_CONSOLIDACION = :ID_CONSOLIDACION, SERIE_FACTURA = :SERIE_F' +
        'ACTURA, NRO_FACTURA = :NRO_FACTURA, REQUEST_ID = :REQUEST_ID, QU' +
        'EUE_ID = :QUEUE_ID, ISSUER_IRS_ID = :ISSUER_IRS_ID, ISSUED_TIME ' +
        '= :ISSUED_TIME, CHAIN_NUMBER = :CHAIN_NUMBER, CHAIN_HASH = :CHAI' +
        'N_HASH, VERIFACTU_URL = :VERIFACTU_URL, QRCODE_BASE64 = :QRCODE_' +
        'BASE64, QRCODE_PNG = :QRCODE_PNG, FECHA_PROCESAMIENTO = :FECHA_P' +
        'ROCESAMIENTO, ESTADO = :ESTADO, RESPUESTA_COMPLETA = :RESPUESTA_' +
        'COMPLETA, PETICION_COMPLETA = :PETICION_COMPLETA'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION')
    SQLLock.Strings = (
      
        'SELECT ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID,' +
        ' QUEUE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH,' +
        ' VERIFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ' +
        'ESTADO, RESPUESTA_COMPLETA, PETICION_COMPLETA FROM suboc_consoli' +
        'dacion'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID,' +
        ' QUEUE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH,' +
        ' VERIFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ' +
        'ESTADO, RESPUESTA_COMPLETA, PETICION_COMPLETA FROM suboc_consoli' +
        'dacion'
      'WHERE'
      '  ID_CONSOLIDACION = :ID_CONSOLIDACION')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_consolidacion')
    SQL.Strings = (
      'SELECT * FROM suboc_consolidacion'
      'WHERE ID_CONSOLIDACION = 0;'
      'ORDER BY ID_CONSOLIDACION DESC')
    Left = 200
    Top = 136
  end
  object unqryFacturas: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_consolidacion'
      
        '  (ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID, QUE' +
        'UE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH, VER' +
        'IFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ESTA' +
        'DO, RESPUESTA_COMPLETA, PETICION_COMPLETA)'
      'VALUES'
      
        '  (:ID_CONSOLIDACION, :SERIE_FACTURA, :NRO_FACTURA, :REQUEST_ID,' +
        ' :QUEUE_ID, :ISSUER_IRS_ID, :ISSUED_TIME, :CHAIN_NUMBER, :CHAIN_' +
        'HASH, :VERIFACTU_URL, :QRCODE_BASE64, :QRCODE_PNG, :FECHA_PROCES' +
        'AMIENTO, :ESTADO, :RESPUESTA_COMPLETA, :PETICION_COMPLETA)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_consolidacion'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION')
    SQLUpdate.Strings = (
      'UPDATE suboc_consolidacion'
      'SET'
      
        '  ID_CONSOLIDACION = :ID_CONSOLIDACION, SERIE_FACTURA = :SERIE_F' +
        'ACTURA, NRO_FACTURA = :NRO_FACTURA, REQUEST_ID = :REQUEST_ID, QU' +
        'EUE_ID = :QUEUE_ID, ISSUER_IRS_ID = :ISSUER_IRS_ID, ISSUED_TIME ' +
        '= :ISSUED_TIME, CHAIN_NUMBER = :CHAIN_NUMBER, CHAIN_HASH = :CHAI' +
        'N_HASH, VERIFACTU_URL = :VERIFACTU_URL, QRCODE_BASE64 = :QRCODE_' +
        'BASE64, QRCODE_PNG = :QRCODE_PNG, FECHA_PROCESAMIENTO = :FECHA_P' +
        'ROCESAMIENTO, ESTADO = :ESTADO, RESPUESTA_COMPLETA = :RESPUESTA_' +
        'COMPLETA, PETICION_COMPLETA = :PETICION_COMPLETA'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION')
    SQLLock.Strings = (
      
        'SELECT ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID,' +
        ' QUEUE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH,' +
        ' VERIFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ' +
        'ESTADO, RESPUESTA_COMPLETA, PETICION_COMPLETA FROM suboc_consoli' +
        'dacion'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID,' +
        ' QUEUE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH,' +
        ' VERIFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ' +
        'ESTADO, RESPUESTA_COMPLETA, PETICION_COMPLETA FROM suboc_consoli' +
        'dacion'
      'WHERE'
      '  ID_CONSOLIDACION = :ID_CONSOLIDACION')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_consolidacion')
    SQL.Strings = (
      'SELECT * FROM suboc_consolidacion'
      'ORDER BY ID_CONSOLIDACION DESC')
    ReadOnly = True
    Left = 200
    Top = 216
  end
  object unqryFacturasLineas: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_consolidacion'
      
        '  (ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID, QUE' +
        'UE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH, VER' +
        'IFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ESTA' +
        'DO, RESPUESTA_COMPLETA, PETICION_COMPLETA)'
      'VALUES'
      
        '  (:ID_CONSOLIDACION, :SERIE_FACTURA, :NRO_FACTURA, :REQUEST_ID,' +
        ' :QUEUE_ID, :ISSUER_IRS_ID, :ISSUED_TIME, :CHAIN_NUMBER, :CHAIN_' +
        'HASH, :VERIFACTU_URL, :QRCODE_BASE64, :QRCODE_PNG, :FECHA_PROCES' +
        'AMIENTO, :ESTADO, :RESPUESTA_COMPLETA, :PETICION_COMPLETA)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_consolidacion'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION')
    SQLUpdate.Strings = (
      'UPDATE suboc_consolidacion'
      'SET'
      
        '  ID_CONSOLIDACION = :ID_CONSOLIDACION, SERIE_FACTURA = :SERIE_F' +
        'ACTURA, NRO_FACTURA = :NRO_FACTURA, REQUEST_ID = :REQUEST_ID, QU' +
        'EUE_ID = :QUEUE_ID, ISSUER_IRS_ID = :ISSUER_IRS_ID, ISSUED_TIME ' +
        '= :ISSUED_TIME, CHAIN_NUMBER = :CHAIN_NUMBER, CHAIN_HASH = :CHAI' +
        'N_HASH, VERIFACTU_URL = :VERIFACTU_URL, QRCODE_BASE64 = :QRCODE_' +
        'BASE64, QRCODE_PNG = :QRCODE_PNG, FECHA_PROCESAMIENTO = :FECHA_P' +
        'ROCESAMIENTO, ESTADO = :ESTADO, RESPUESTA_COMPLETA = :RESPUESTA_' +
        'COMPLETA, PETICION_COMPLETA = :PETICION_COMPLETA'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION')
    SQLLock.Strings = (
      
        'SELECT ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID,' +
        ' QUEUE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH,' +
        ' VERIFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ' +
        'ESTADO, RESPUESTA_COMPLETA, PETICION_COMPLETA FROM suboc_consoli' +
        'dacion'
      'WHERE'
      '  ID_CONSOLIDACION = :Old_ID_CONSOLIDACION'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID_CONSOLIDACION, SERIE_FACTURA, NRO_FACTURA, REQUEST_ID,' +
        ' QUEUE_ID, ISSUER_IRS_ID, ISSUED_TIME, CHAIN_NUMBER, CHAIN_HASH,' +
        ' VERIFACTU_URL, QRCODE_BASE64, QRCODE_PNG, FECHA_PROCESAMIENTO, ' +
        'ESTADO, RESPUESTA_COMPLETA, PETICION_COMPLETA FROM suboc_consoli' +
        'dacion'
      'WHERE'
      '  ID_CONSOLIDACION = :ID_CONSOLIDACION')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_consolidacion')
    SQL.Strings = (
      'SELECT DESCRIPCION_ARTICULO_LINEA'
      'FROM suboc_facturas_lineas'
      'WHERE NRO_FACTURA_LINEA = :NRO_FACTURA_LINEA'
      'AND SERIE_FACTURA_LINEA = :SERIE_FACTURA_LINEA'
      'LIMIT 1')
    ReadOnly = True
    Left = 368
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NRO_FACTURA_LINEA'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'SERIE_FACTURA_LINEA'
        Value = nil
      end>
  end
end
