object dmFac: TdmFac
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 369
  Width = 1146
  object dsLinFac: TDataSource
    DataSet = unqryLinFac
    Left = 128
    Top = 88
  end
  object dsFacPrint: TDataSource
    DataSet = unqryFacPrint
    Left = 208
    Top = 88
  end
  object dsLinFacPrint: TDataSource
    DataSet = unqryLinFacPrint
    Left = 288
    Top = 88
  end
  object dsSeries: TDataSource
    DataSet = unqrySeries
    Left = 688
    Top = 88
  end
  object dsHistoria: TDataSource
    DataSet = unqryHistoria
    Left = 472
    Top = 88
  end
  object fxdsPrintFac: TfrxDBDataset
    Description = 'Facturas'
    UserName = 'Facturas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NRO_FACTURA=NRO_FACTURA'
      'SERIE_FACTURA=SERIE_FACTURA'
      'CODIGO_CLIENTE_FACTURA=CODIGO_CLIENTE_FACTURA'
      'RAZONSOCIAL_CLIENTE_FACTURA=RAZONSOCIAL_CLIENTE_FACTURA'
      'NIF_CLIENTE_FACTURA=NIF_CLIENTE_FACTURA'
      'MOVIL_CLIENTE_FACTURA=MOVIL_CLIENTE_FACTURA'
      'EMAIL_CLIENTE_FACTURA=EMAIL_CLIENTE_FACTURA'
      'DIRECCION1_CLIENTE_FACTURA=DIRECCION1_CLIENTE_FACTURA'
      'DIRECCION2_CLIENTE_FACTURA=DIRECCION2_CLIENTE_FACTURA'
      'POBLACION_CLIENTE_FACTURA=POBLACION_CLIENTE_FACTURA'
      'PROVINCIA_CLIENTE_FACTURA=PROVINCIA_CLIENTE_FACTURA'
      'CPOSTAL_CLIENTE_FACTURA=CPOSTAL_CLIENTE_FACTURA'
      'PAIS_CLIENTE_FACTURA=PAIS_CLIENTE_FACTURA'
      'TIPOID_INT_CLIENTE_FACTURA=TIPOID_INT_CLIENTE_FACTURA'
      'FECHA_FACTURA=FECHA_FACTURA'
      'TOTAL_LIQUIDO_FACTURA=TOTAL_LIQUIDO_FACTURA'
      'FORMA_PAGO_FACTURA=FORMA_PAGO_FACTURA'
      'COMENTARIOS_FACTURA=COMENTARIOS_FACTURA'
      'NOMBRE=NOMBRE'
      'APELLIDOS=APELLIDOS'
      'CONSOLIDACION_FACTURA=CONSOLIDACION_FACTURA'
      'REQUEST_ID=REQUEST_ID'
      'QUEUE_ID=QUEUE_ID'
      'ISSUER_IRS_ID=ISSUER_IRS_ID'
      'ISSUED_TIME=ISSUED_TIME'
      'CHAIN_NUMBER=CHAIN_NUMBER'
      'CHAIN_HASH=CHAIN_HASH'
      'VERIFACTU_URL=VERIFACTU_URL'
      'QRCODE_BASE64=QRCODE_BASE64'
      'QRCODE_PNG=QRCODE_PNG'
      'FECHA_PROCESAMIENTO=FECHA_PROCESAMIENTO'
      'ESTADO=ESTADO'
      'RESPUESTA_COMPLETA=RESPUESTA_COMPLETA'
      'PETICION_COMPLETA=PETICION_COMPLETA'
      'NOMBRE_SPA_PAIS=NOMBRE_SPA_PAIS')
    DataSource = dsFacPrint
    BCDToCurrency = False
    Left = 208
    Top = 24
  end
  object fxdstPrintLinFac: TfrxDBDataset
    Description = 'Lineas Facturas'
    UserName = 'Lineas Facturas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SERIE_FACTURA_LINEA=SERIE_FACTURA_LINEA'
      'NRO_FACTURA_LINEA=NRO_FACTURA_LINEA'
      'LINEA_LINEA=LINEA_LINEA'
      'CODIGO_ARTICULO_LINEA=CODIGO_ARTICULO_LINEA'
      'DESCRIPCION_ARTICULO_LINEA=DESCRIPCION_ARTICULO_LINEA'
      'ZONA=ZONA'
      'PRECIOVENTA_ARTICULO_LINEA=PRECIOVENTA_ARTICULO_LINEA'
      'CANTIDAD_LINEA=CANTIDAD_LINEA'
      'SUM_TOTAL_LINEA=SUM_TOTAL_LINEA'
      'ODONTOLOGO=ODONTOLOGO')
    DataSource = dsLinFacPrint
    BCDToCurrency = False
    Left = 288
    Top = 24
  end
  object unqryFac: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_facturas'
      
        '  (NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZONSOCI' +
        'AL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTURA, ' +
        'EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION2_CL' +
        'IENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_FACT' +
        'URA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, TIPOID_INT_C' +
        'LIENTE_FACTURA, FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA, FORMA_PAGO' +
        '_FACTURA, COMENTARIOS_FACTURA, NOMBRE, APELLIDOS, CONSOLIDACION_' +
        'FACTURA, FECHA_ULT_CONSO_FACTURA, FASE_CONSOLIDACION_FACTURA, ES' +
        'SIMPL_FACTURA)'
      'VALUES'
      
        '  (:NRO_FACTURA, :SERIE_FACTURA, :CODIGO_CLIENTE_FACTURA, :RAZON' +
        'SOCIAL_CLIENTE_FACTURA, :NIF_CLIENTE_FACTURA, :MOVIL_CLIENTE_FAC' +
        'TURA, :EMAIL_CLIENTE_FACTURA, :DIRECCION1_CLIENTE_FACTURA, :DIRE' +
        'CCION2_CLIENTE_FACTURA, :POBLACION_CLIENTE_FACTURA, :PROVINCIA_C' +
        'LIENTE_FACTURA, :CPOSTAL_CLIENTE_FACTURA, :PAIS_CLIENTE_FACTURA,' +
        ' :TIPOID_INT_CLIENTE_FACTURA, :FECHA_FACTURA, :TOTAL_LIQUIDO_FAC' +
        'TURA, :FORMA_PAGO_FACTURA, :COMENTARIOS_FACTURA, :NOMBRE, :APELL' +
        'IDOS, :CONSOLIDACION_FACTURA, :FECHA_ULT_CONSO_FACTURA, :FASE_CO' +
        'NSOLIDACION_FACTURA, :ESSIMPL_FACTURA)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_facturas'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA')
    SQLUpdate.Strings = (
      'UPDATE suboc_facturas'
      'SET'
      
        '  NRO_FACTURA = :NRO_FACTURA, SERIE_FACTURA = :SERIE_FACTURA, CO' +
        'DIGO_CLIENTE_FACTURA = :CODIGO_CLIENTE_FACTURA, RAZONSOCIAL_CLIE' +
        'NTE_FACTURA = :RAZONSOCIAL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA ' +
        '= :NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTURA = :MOVIL_CLIENTE_F' +
        'ACTURA, EMAIL_CLIENTE_FACTURA = :EMAIL_CLIENTE_FACTURA, DIRECCIO' +
        'N1_CLIENTE_FACTURA = :DIRECCION1_CLIENTE_FACTURA, DIRECCION2_CLI' +
        'ENTE_FACTURA = :DIRECCION2_CLIENTE_FACTURA, POBLACION_CLIENTE_FA' +
        'CTURA = :POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_FACTURA = ' +
        ':PROVINCIA_CLIENTE_FACTURA, CPOSTAL_CLIENTE_FACTURA = :CPOSTAL_C' +
        'LIENTE_FACTURA, PAIS_CLIENTE_FACTURA = :PAIS_CLIENTE_FACTURA, TI' +
        'POID_INT_CLIENTE_FACTURA = :TIPOID_INT_CLIENTE_FACTURA, FECHA_FA' +
        'CTURA = :FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA = :TOTAL_LIQUIDO_F' +
        'ACTURA, FORMA_PAGO_FACTURA = :FORMA_PAGO_FACTURA, COMENTARIOS_FA' +
        'CTURA = :COMENTARIOS_FACTURA, NOMBRE = :NOMBRE, APELLIDOS = :APE' +
        'LLIDOS, CONSOLIDACION_FACTURA = :CONSOLIDACION_FACTURA, FECHA_UL' +
        'T_CONSO_FACTURA = :FECHA_ULT_CONSO_FACTURA, FASE_CONSOLIDACION_F' +
        'ACTURA = :FASE_CONSOLIDACION_FACTURA, ESSIMPL_FACTURA = :ESSIMPL' +
        '_FACTURA'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA')
    SQLLock.Strings = (
      
        'SELECT NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZON' +
        'SOCIAL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTU' +
        'RA, EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION' +
        '2_CLIENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_' +
        'FACTURA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, TIPOID_I' +
        'NT_CLIENTE_FACTURA, FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA, FORMA_' +
        'PAGO_FACTURA, COMENTARIOS_FACTURA, NOMBRE, APELLIDOS, CONSOLIDAC' +
        'ION_FACTURA, FECHA_ULT_CONSO_FACTURA, FASE_CONSOLIDACION_FACTURA' +
        ', ESSIMPL_FACTURA FROM suboc_facturas'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZON' +
        'SOCIAL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTU' +
        'RA, EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION' +
        '2_CLIENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_' +
        'FACTURA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, TIPOID_I' +
        'NT_CLIENTE_FACTURA, FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA, FORMA_' +
        'PAGO_FACTURA, COMENTARIOS_FACTURA, NOMBRE, APELLIDOS, CONSOLIDAC' +
        'ION_FACTURA, FECHA_ULT_CONSO_FACTURA, FASE_CONSOLIDACION_FACTURA' +
        ', ESSIMPL_FACTURA FROM suboc_facturas'
      'WHERE'
      '  NRO_FACTURA = :NRO_FACTURA AND SERIE_FACTURA = :SERIE_FACTURA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_facturas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT F.*'
      'from suboc_facturas F'
      
        'order by fecha_factura desc, serie_factura desc, F.NRO_FACTURA d' +
        'esc')
    Active = True
    AutoCalcFields = False
    AfterInsert = zqryFacAfterInsert
    BeforePost = zqryFacBeforePost
    BeforeDelete = zqryFacBeforeDelete
    AfterDelete = zqryFacAfterDelete
    Left = 48
    Top = 146
  end
  object unqryFacPrint: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * '
      'from V_SUBOC_FACTURAS V'
      'WHERE V.NRO_FACTURA = 9'
      'AND V.SERIE_FACTURA = '#39'PRUE'#39
      'order by NRO_FACTURA Asc')
    Left = 208
    Top = 144
  end
  object unqryLinFacPrint: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO `SUBOC_FACTURAS_LINEAS`'
      
        '  (`SERIE_FACTURA_LINEA`, `NRO_FACTURA_LINEA`, `LINEA_LINEA`, `C' +
        'ODIGO_ARTICULO_LINEA`, `DESCRIPCION_ARTICULO_LINEA`, `ZONA`, `PR' +
        'ECIOVENTA_ARTICULO_LINEA`, `CANTIDAD_LINEA`, `SUM_TOTAL_LINEA`, ' +
        '`ODONTOLOGO`)'
      'VALUES'
      
        '  (:`SERIE_FACTURA_LINEA`, :`NRO_FACTURA_LINEA`, :`LINEA_LINEA`,' +
        ' :`CODIGO_ARTICULO_LINEA`, :`DESCRIPCION_ARTICULO_LINEA`, :`ZONA' +
        '`, :`PRECIOVENTA_ARTICULO_LINEA`, :`CANTIDAD_LINEA`, :`SUM_TOTAL' +
        '_LINEA`, :`ODONTOLOGO`)')
    SQLDelete.Strings = (
      'DELETE FROM `SUBOC_FACTURAS_LINEAS`'
      'WHERE'
      
        '  `SERIE_FACTURA_LINEA` = :`Old_SERIE_FACTURA_LINEA` AND `NRO_FA' +
        'CTURA_LINEA` = :`Old_NRO_FACTURA_LINEA` AND `LINEA_LINEA` = :`Ol' +
        'd_LINEA_LINEA`')
    SQLUpdate.Strings = (
      'UPDATE `SUBOC_FACTURAS_LINEAS`'
      'SET'
      
        '  `SERIE_FACTURA_LINEA` = :`SERIE_FACTURA_LINEA`, `NRO_FACTURA_L' +
        'INEA` = :`NRO_FACTURA_LINEA`, `LINEA_LINEA` = :`LINEA_LINEA`, `C' +
        'ODIGO_ARTICULO_LINEA` = :`CODIGO_ARTICULO_LINEA`, `DESCRIPCION_A' +
        'RTICULO_LINEA` = :`DESCRIPCION_ARTICULO_LINEA`, `ZONA` = :`ZONA`' +
        ', `PRECIOVENTA_ARTICULO_LINEA` = :`PRECIOVENTA_ARTICULO_LINEA`, ' +
        '`CANTIDAD_LINEA` = :`CANTIDAD_LINEA`, `SUM_TOTAL_LINEA` = :`SUM_' +
        'TOTAL_LINEA`, `ODONTOLOGO` = :`ODONTOLOGO`'
      'WHERE'
      
        '  `SERIE_FACTURA_LINEA` = :`Old_SERIE_FACTURA_LINEA` AND `NRO_FA' +
        'CTURA_LINEA` = :`Old_NRO_FACTURA_LINEA` AND `LINEA_LINEA` = :`Ol' +
        'd_LINEA_LINEA`')
    SQLLock.Strings = (
      'SELECT * FROM SUBOC_FACTURAS_LINEAS'
      'WHERE'
      
        '  `SERIE_FACTURA_LINEA` = :`Old_SERIE_FACTURA_LINEA` AND `NRO_FA' +
        'CTURA_LINEA` = :`Old_NRO_FACTURA_LINEA` AND `LINEA_LINEA` = :`Ol' +
        'd_LINEA_LINEA`'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT `SERIE_FACTURA_LINEA`, `NRO_FACTURA_LINEA`, `LINEA_LINEA`' +
        ', `CODIGO_ARTICULO_LINEA`, `DESCRIPCION_ARTICULO_LINEA`, `ZONA`,' +
        ' `PRECIOVENTA_ARTICULO_LINEA`, `CANTIDAD_LINEA`, `SUM_TOTAL_LINE' +
        'A`, `ODONTOLOGO` FROM `SUBOC_FACTURAS_LINEAS`'
      'WHERE'
      
        '  `SERIE_FACTURA_LINEA` = :`SERIE_FACTURA_LINEA` AND `NRO_FACTUR' +
        'A_LINEA` = :`NRO_FACTURA_LINEA` AND `LINEA_LINEA` = :`LINEA_LINE' +
        'A`')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM SUBOC_FACTURAS_LINEAS')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT *'
      ' FROM SUBOC_FACTURAS_LINEAS'
      'WHERE NRO_FACTURA_LINEA = :NRO_FACTURA'
      '  AND SERIE_FACTURA_LINEA = :SERIE_FACTURA'
      'ORDER BY LINEA_LINEA;')
    MasterSource = dsFacPrint
    MasterFields = 'SERIE_FACTURA;NRO_FACTURA'
    DetailFields = 'SERIE_FACTURA_LINEA;NRO_FACTURA_LINEA'
    Left = 288
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRO_FACTURA'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'SERIE_FACTURA'
        ParamType = ptInput
        Value = nil
      end>
  end
  object unqrySeries: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT DISTINCT SERIE_CONTADOR'
      'FROM SUBOC_CONTADORES'
      'WHERE TIPODOC_CONTADOR='#39'FC'#39
      'AND (DEFAULT_CONTADOR = '#39'S'#39' OR DEFSIMPL_CONTADOR = '#39'S'#39')'
      'ORDER BY DEFAULT_CONTADOR DESC')
    Left = 688
    Top = 144
  end
  object unqryHistoria: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_historia'
      
        '  (ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE, PR' +
        'ECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_FACTU' +
        'RA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA, CANTIDAD)'
      'VALUES'
      
        '  (:ID, :CODIGO_ARTICULO, :DESCRIPCION_ARTICULO, :CODIGO_CLIENTE' +
        ', :PRECIOVENTA_ARTICULO, :FECHA, :ZONA, :DESCRIPCION_HISTORIA, :' +
        'NRO_FACTURA, :LINEA_LINEA, :ODONTOLOGO, :SERIE_FACTURA, :CANTIDA' +
        'D)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_historia'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE suboc_historia'
      'SET'
      
        '  ID = :ID, CODIGO_ARTICULO = :CODIGO_ARTICULO, DESCRIPCION_ARTI' +
        'CULO = :DESCRIPCION_ARTICULO, CODIGO_CLIENTE = :CODIGO_CLIENTE, ' +
        'PRECIOVENTA_ARTICULO = :PRECIOVENTA_ARTICULO, FECHA = :FECHA, ZO' +
        'NA = :ZONA, DESCRIPCION_HISTORIA = :DESCRIPCION_HISTORIA, NRO_FA' +
        'CTURA = :NRO_FACTURA, LINEA_LINEA = :LINEA_LINEA, ODONTOLOGO = :' +
        'ODONTOLOGO, SERIE_FACTURA = :SERIE_FACTURA, CANTIDAD = :CANTIDAD'
      'WHERE'
      '  ID = :Old_ID')
    SQLLock.Strings = (
      'SELECT * FROM suboc_historia'
      'WHERE'
      '  ID = :Old_ID'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE' +
        ', PRECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_F' +
        'ACTURA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA, CANTIDAD FROM su' +
        'boc_historia'
      'WHERE'
      '  ID = :ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_historia')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from vu_suboc_historia'
      'where NRO_FACTURA = :NRO_FACTURA'
      'AND SERIE_FACTURA = :SERIE_FACTURA')
    MasterSource = frmMtoFac.dsTablaG
    MasterFields = 'NRO_FACTURA;SERIE_FACTURA'
    DetailFields = 'NRO_FACTURA;SERIE_FACTURA'
    Left = 472
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRO_FACTURA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftWideString
        Name = 'SERIE_FACTURA'
        ParamType = ptInput
        Value = 'Z25'
      end>
  end
  object unqryCliDataFac: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_clientes'
      'order by convert(CODIGO_CLIENTE, int) DESC')
    Left = 532
    Top = 8
  end
  object unqryArtDataLinFac: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_articulos')
    Left = 626
    Top = 8
  end
  object unqryDocDataFac: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_odontologos')
    Left = 724
    Top = 8
  end
  object unqryGetLinea: TUniQuery
    Connection = dmConn.conUni
    Left = 808
    Top = 8
  end
  object unqryLinFac: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_facturas_lineas'
      
        '  (SERIE_FACTURA_LINEA, NRO_FACTURA_LINEA, LINEA_LINEA, CODIGO_A' +
        'RTICULO_LINEA, DESCRIPCION_ARTICULO_LINEA, ZONA, PRECIOVENTA_ART' +
        'ICULO_LINEA, CANTIDAD_LINEA, SUM_TOTAL_LINEA, ODONTOLOGO)'
      'VALUES'
      
        '  (:SERIE_FACTURA_LINEA, :NRO_FACTURA_LINEA, :LINEA_LINEA, :CODI' +
        'GO_ARTICULO_LINEA, :DESCRIPCION_ARTICULO_LINEA, :ZONA, :PRECIOVE' +
        'NTA_ARTICULO_LINEA, :CANTIDAD_LINEA, :SUM_TOTAL_LINEA, :ODONTOLO' +
        'GO)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_facturas_lineas'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :Old_SERIE_FACTURA_LINEA AND NRO_FACTURA' +
        '_LINEA = :Old_NRO_FACTURA_LINEA AND LINEA_LINEA = :Old_LINEA_LIN' +
        'EA')
    SQLUpdate.Strings = (
      'UPDATE suboc_facturas_lineas'
      'SET'
      
        '  SERIE_FACTURA_LINEA = :SERIE_FACTURA_LINEA, NRO_FACTURA_LINEA ' +
        '= :NRO_FACTURA_LINEA, LINEA_LINEA = :LINEA_LINEA, CODIGO_ARTICUL' +
        'O_LINEA = :CODIGO_ARTICULO_LINEA, DESCRIPCION_ARTICULO_LINEA = :' +
        'DESCRIPCION_ARTICULO_LINEA, ZONA = :ZONA, PRECIOVENTA_ARTICULO_L' +
        'INEA = :PRECIOVENTA_ARTICULO_LINEA, CANTIDAD_LINEA = :CANTIDAD_L' +
        'INEA, SUM_TOTAL_LINEA = :SUM_TOTAL_LINEA, ODONTOLOGO = :ODONTOLO' +
        'GO'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :Old_SERIE_FACTURA_LINEA AND NRO_FACTURA' +
        '_LINEA = :Old_NRO_FACTURA_LINEA AND LINEA_LINEA = :Old_LINEA_LIN' +
        'EA')
    SQLLock.Strings = (
      'SELECT * FROM suboc_facturas_lineas'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :Old_SERIE_FACTURA_LINEA AND NRO_FACTURA' +
        '_LINEA = :Old_NRO_FACTURA_LINEA AND LINEA_LINEA = :Old_LINEA_LIN' +
        'EA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT SERIE_FACTURA_LINEA, NRO_FACTURA_LINEA, LINEA_LINEA, CODI' +
        'GO_ARTICULO_LINEA, DESCRIPCION_ARTICULO_LINEA, ZONA, PRECIOVENTA' +
        '_ARTICULO_LINEA, CANTIDAD_LINEA, SUM_TOTAL_LINEA, ODONTOLOGO FRO' +
        'M suboc_facturas_lineas'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :SERIE_FACTURA_LINEA AND NRO_FACTURA_LIN' +
        'EA = :NRO_FACTURA_LINEA AND LINEA_LINEA = :LINEA_LINEA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_facturas_lineas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT *'
      'FROM SUBOC_FACTURAS_LINEAS'
      'where NRO_FACTURA_LINEA = :NRO_FACTURA'
      'AND SERIE_FACTURA_LINEA = :SERIE_FACTURA'
      'order by NRO_FACTURA_LINEA, SERIE_FACTURA_LINEA, LINEA_LINEA ASC')
    MasterSource = frmMtoFac.dsTablaG
    MasterFields = 'SERIE_FACTURA;NRO_FACTURA'
    DetailFields = 'SERIE_FACTURA_LINEA;NRO_FACTURA_LINEA'
    Active = True
    BeforeInsert = zqryLinFacBeforeInsert
    AfterInsert = unqryLinFacAfterInsert
    BeforePost = zqryLinFacBeforePost
    AfterPost = zqryLinFacAfterPost
    AfterDelete = zqryLinFacAfterDelete
    Left = 128
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRO_FACTURA'
        ParamType = ptInput
        Value = 5
      end
      item
        DataType = ftWideString
        Name = 'SERIE_FACTURA'
        ParamType = ptInput
        Value = 'PRU'
      end>
  end
  object unstrdprcCrearFacturaAbono: TUniStoredProc
    StoredProcName = 'PRC_CREAR_FACTURA_ABONO'
    SQL.Strings = (
      
        'CALL PRC_CREAR_FACTURA_ABONO(:pidseriefactura, :pidnumfactura, :' +
        'pidseriefacturaabono, :pfechafacturaabono, @pidnumfacturaabono);' +
        ' SELECT @pidnumfacturaabono AS '#39'@pidnumfacturaabono'#39)
    Connection = dmConn.conUni
    Left = 64
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'pidseriefactura'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidnumfactura'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidseriefacturaabono'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'pfechafacturaabono'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidnumfacturaabono'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CREAR_FACTURA_ABONO'
  end
  object unstrdprcDuplicarFactura: TUniStoredProc
    StoredProcName = 'PRC_CREAR_FACTURA_DUPLICADA'
    SQL.Strings = (
      
        'CALL PRC_CREAR_FACTURA_DUPLICADA(:pidseriefactura, :pidnumfactur' +
        'a, :pidseriefacturaabono, :pfechafacturaabono, @pidnumfacturaabo' +
        'no); SELECT @pidnumfacturaabono AS '#39'@pidnumfacturaabono'#39)
    Connection = dmConn.conUni
    Left = 208
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'pidseriefactura'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidnumfactura'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidseriefacturaabono'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'pfechafacturaabono'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidnumfacturaabono'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CREAR_FACTURA_DUPLICADA'
  end
  object unstrdprcGetContadorFactura: TUniStoredProc
    StoredProcName = 'GET_NEXT_CONT_FACT_SERIE'
    SQL.Strings = (
      
        'CALL GET_NEXT_CONT_FACT_SERIE(:pserie, :pTipoDoc, @pcont); SELEC' +
        'T CAST(@pcont AS SIGNED) AS '#39'@pcont'#39)
    Connection = dmConn.conUni
    Left = 344
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'pserie'
        ParamType = ptInput
        Size = 10
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pTipoDoc'
        ParamType = ptInput
        Size = 2
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'pcont'
        ParamType = ptOutput
        Value = nil
      end>
    CommandStoredProcName = 'GET_NEXT_CONT_FACT_SERIE'
  end
  object unstrdprcGetContador: TUniStoredProc
    StoredProcName = 'GET_NEXT_CONT'
    SQL.Strings = (
      
        'CALL GET_NEXT_CONT(:pTipoDoc, @pcont); SELECT CAST(@pcont AS SIG' +
        'NED) AS '#39'@pcont'#39)
    Connection = dmConn.conUni
    Left = 488
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'pTipoDoc'
        ParamType = ptInput
        Size = 2
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'pcont'
        ParamType = ptOutput
        Value = Null
      end>
    CommandStoredProcName = 'GET_NEXT_CONT'
    StoredProcIsQuery = True
  end
  object unstrdprcCrearCliente: TUniStoredProc
    StoredProcName = 'PRC_CREAR_ACTUALIZAR_CLIENTE'
    SQL.Strings = (
      
        'CALL PRC_CREAR_ACTUALIZAR_CLIENTE(:pCODIGO_CLIENTE, :pRAZONSOCIA' +
        'L_CLIENTE, :pNOMBRE, :pAPELLIDOS, :pNIF_CLIENTE, :pMOVIL_CLIENTE' +
        ', :pEMAIL_CLIENTE, :pDIRECCION1_CLIENTE, :pDIRECCION2_CLIENTE, :' +
        'pPOBLACION_CLIENTE, :pPROVINCIA_CLIENTE, :pCPOSTAL_CLIENTE, :pPA' +
        'IS_CLIENTE, :pTIPOID_INT_CLIENTE)')
    Connection = dmConn.conUni
    Left = 600
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODIGO_CLIENTE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pRAZONSOCIAL_CLIENTE'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pNOMBRE'
        ParamType = ptInput
        Size = 100
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pAPELLIDOS'
        ParamType = ptInput
        Size = 100
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pNIF_CLIENTE'
        ParamType = ptInput
        Size = 50
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pMOVIL_CLIENTE'
        ParamType = ptInput
        Size = 40
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pEMAIL_CLIENTE'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pDIRECCION1_CLIENTE'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pDIRECCION2_CLIENTE'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pPOBLACION_CLIENTE'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pPROVINCIA_CLIENTE'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pCPOSTAL_CLIENTE'
        ParamType = ptInput
        Size = 15
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pPAIS_CLIENTE'
        ParamType = ptInput
        Size = 150
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pTIPOID_INT_CLIENTE'
        ParamType = ptInput
        Size = 150
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CREAR_ACTUALIZAR_CLIENTE'
  end
  object unstrdprcGetDataArticulo: TUniStoredProc
    StoredProcName = 'PRC_GET_DATA_ARTICULO'
    SQL.Strings = (
      
        'CALL PRC_GET_DATA_ARTICULO(:pidcodarticulo, @pidnomarticulo, @pi' +
        'dprecioventa); SELECT @pidnomarticulo AS '#39'@pidnomarticulo'#39', @pid' +
        'precioventa AS '#39'@pidprecioventa'#39)
    Connection = dmConn.conUni
    Left = 736
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'pidcodarticulo'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidnomarticulo'
        ParamType = ptOutput
        Size = 200
        Value = ''
      end
      item
        DataType = ftFloat
        Name = 'pidprecioventa'
        ParamType = ptOutput
        Value = 0.000000000000000000
      end>
    CommandStoredProcName = 'PRC_GET_DATA_ARTICULO'
  end
  object unstrdprcGetDataCliente: TUniStoredProc
    StoredProcName = 'PRC_GET_DATA_CLIENTE'
    SQL.Strings = (
      
        'CALL PRC_GET_DATA_CLIENTE(:pCODIGO_CLIENTE, @pRAZONSOCIAL_CLIENT' +
        'E, @pNOMBRE, @pAPELLIDOS, @pNIF_CLIENTE, @pMOVIL_CLIENTE, @pEMAI' +
        'L_CLIENTE, @pDIRECCION1_CLIENTE, @pDIRECCION2_CLIENTE, @pPOBLACI' +
        'ON_CLIENTE, @pPROVINCIA_CLIENTE, @pCPOSTAL_CLIENTE, @pPAIS_CLIEN' +
        'TE, @pTIPOID_INT_CLIENTE); SELECT @pRAZONSOCIAL_CLIENTE AS '#39'@pRA' +
        'ZONSOCIAL_CLIENTE'#39', @pNOMBRE AS '#39'@pNOMBRE'#39', @pAPELLIDOS AS '#39'@pAP' +
        'ELLIDOS'#39', @pNIF_CLIENTE AS '#39'@pNIF_CLIENTE'#39', @pMOVIL_CLIENTE AS '#39 +
        '@pMOVIL_CLIENTE'#39', @pEMAIL_CLIENTE AS '#39'@pEMAIL_CLIENTE'#39', @pDIRECC' +
        'ION1_CLIENTE AS '#39'@pDIRECCION1_CLIENTE'#39', @pDIRECCION2_CLIENTE AS ' +
        #39'@pDIRECCION2_CLIENTE'#39', @pPOBLACION_CLIENTE AS '#39'@pPOBLACION_CLIE' +
        'NTE'#39', @pPROVINCIA_CLIENTE AS '#39'@pPROVINCIA_CLIENTE'#39', @pCPOSTAL_CL' +
        'IENTE AS '#39'@pCPOSTAL_CLIENTE'#39', @pPAIS_CLIENTE AS '#39'@pPAIS_CLIENTE'#39 +
        ', @pTIPOID_INT_CLIENTE AS '#39'@pTIPOID_INT_CLIENTE'#39)
    Connection = dmConn.conUni
    Left = 872
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODIGO_CLIENTE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pRAZONSOCIAL_CLIENTE'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pNOMBRE'
        ParamType = ptOutput
        Size = 100
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pAPELLIDOS'
        ParamType = ptOutput
        Size = 100
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pNIF_CLIENTE'
        ParamType = ptOutput
        Size = 50
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pMOVIL_CLIENTE'
        ParamType = ptOutput
        Size = 40
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pEMAIL_CLIENTE'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pDIRECCION1_CLIENTE'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pDIRECCION2_CLIENTE'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pPOBLACION_CLIENTE'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pPROVINCIA_CLIENTE'
        ParamType = ptOutput
        Size = 200
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pCPOSTAL_CLIENTE'
        ParamType = ptOutput
        Size = 15
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pPAIS_CLIENTE'
        ParamType = ptOutput
        Size = 150
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pTIPOID_INT_CLIENTE'
        ParamType = ptOutput
        Size = 150
        Value = nil
      end>
    CommandStoredProcName = 'PRC_GET_DATA_CLIENTE'
  end
  object dsFormasPago: TDataSource
    DataSet = unqryFormaPago
    Left = 552
    Top = 88
  end
  object unqryFormaPago: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_historia'
      
        '  (ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE, PR' +
        'ECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_FACTU' +
        'RA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA)'
      'VALUES'
      
        '  (:ID, :CODIGO_ARTICULO, :DESCRIPCION_ARTICULO, :CODIGO_CLIENTE' +
        ', :PRECIOVENTA_ARTICULO, :FECHA, :ZONA, :DESCRIPCION_HISTORIA, :' +
        'NRO_FACTURA, :LINEA_LINEA, :ODONTOLOGO, :SERIE_FACTURA)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_historia'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE suboc_historia'
      'SET'
      
        '  ID = :ID, CODIGO_ARTICULO = :CODIGO_ARTICULO, DESCRIPCION_ARTI' +
        'CULO = :DESCRIPCION_ARTICULO, CODIGO_CLIENTE = :CODIGO_CLIENTE, ' +
        'PRECIOVENTA_ARTICULO = :PRECIOVENTA_ARTICULO, FECHA = :FECHA, ZO' +
        'NA = :ZONA, DESCRIPCION_HISTORIA = :DESCRIPCION_HISTORIA, NRO_FA' +
        'CTURA = :NRO_FACTURA, LINEA_LINEA = :LINEA_LINEA, ODONTOLOGO = :' +
        'ODONTOLOGO, SERIE_FACTURA = :SERIE_FACTURA'
      'WHERE'
      '  ID = :Old_ID')
    SQLLock.Strings = (
      'SELECT * FROM suboc_historia'
      'WHERE'
      '  ID = :Old_ID'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE' +
        ', PRECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_F' +
        'ACTURA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA FROM suboc_histor' +
        'ia'
      'WHERE'
      '  ID = :ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_historia')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_formapago'
      '')
    ReadOnly = True
    Left = 552
    Top = 144
  end
  object dsRecibos: TDataSource
    DataSet = unqryRecibos
    Left = 632
    Top = 88
  end
  object unqryRecibos: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO `suboc_recibos`'
      
        '  (`NRO_FACTURA`, `SERIE_FACTURA`, `NRO_PLAZO_RECIBO`, `FORMA_PA' +
        'GO_ORIGEN`, `FORMA_PAGO_DESCRIPCION_ORIGEN`, `EUROS_RECIBO`, `ES' +
        'TADO_RECIBO`, `FECHA_EXPEDICION`, `FECHA_VENCIMIENTO`, `IBAN`, `' +
        'FECHA_PAGO`, `LOCALIDAD_EXPEDICION`, `CODIGO_CLIENTE`, `RAZONSOC' +
        'IAL_CLIENTE`, `DIRECCION1_CLIENTE`, `POBLACION_CLIENTE`, `PROVIN' +
        'CIA_CLIENTE`, `CPOSTAL_CLIENTE`, `IMPORTE_LETRA`, `TRATAMIENTOS`' +
        ')'
      'VALUES'
      
        '  (:`NRO_FACTURA`, :`SERIE_FACTURA`, :`NRO_PLAZO_RECIBO`, :`FORM' +
        'A_PAGO_ORIGEN`, :`FORMA_PAGO_DESCRIPCION_ORIGEN`, :`EUROS_RECIBO' +
        '`, :`ESTADO_RECIBO`, :`FECHA_EXPEDICION`, :`FECHA_VENCIMIENTO`, ' +
        ':`IBAN`, :`FECHA_PAGO`, :`LOCALIDAD_EXPEDICION`, :`CODIGO_CLIENT' +
        'E`, :`RAZONSOCIAL_CLIENTE`, :`DIRECCION1_CLIENTE`, :`POBLACION_C' +
        'LIENTE`, :`PROVINCIA_CLIENTE`, :`CPOSTAL_CLIENTE`, :`IMPORTE_LET' +
        'RA`, :`TRATAMIENTOS`)')
    SQLDelete.Strings = (
      'DELETE FROM `suboc_recibos`'
      'WHERE'
      
        '  `NRO_FACTURA` = :`Old_NRO_FACTURA` AND `SERIE_FACTURA` = :`Old' +
        '_SERIE_FACTURA` AND `NRO_PLAZO_RECIBO` = :`Old_NRO_PLAZO_RECIBO`')
    SQLUpdate.Strings = (
      'UPDATE `suboc_recibos`'
      'SET'
      
        '  `NRO_FACTURA` = :`NRO_FACTURA`, `SERIE_FACTURA` = :`SERIE_FACT' +
        'URA`, `NRO_PLAZO_RECIBO` = :`NRO_PLAZO_RECIBO`, `FORMA_PAGO_ORIG' +
        'EN` = :`FORMA_PAGO_ORIGEN`, `FORMA_PAGO_DESCRIPCION_ORIGEN` = :`' +
        'FORMA_PAGO_DESCRIPCION_ORIGEN`, `EUROS_RECIBO` = :`EUROS_RECIBO`' +
        ', `ESTADO_RECIBO` = :`ESTADO_RECIBO`, `FECHA_EXPEDICION` = :`FEC' +
        'HA_EXPEDICION`, `FECHA_VENCIMIENTO` = :`FECHA_VENCIMIENTO`, `IBA' +
        'N` = :`IBAN`, `FECHA_PAGO` = :`FECHA_PAGO`, `LOCALIDAD_EXPEDICIO' +
        'N` = :`LOCALIDAD_EXPEDICION`, `CODIGO_CLIENTE` = :`CODIGO_CLIENT' +
        'E`, `RAZONSOCIAL_CLIENTE` = :`RAZONSOCIAL_CLIENTE`, `DIRECCION1_' +
        'CLIENTE` = :`DIRECCION1_CLIENTE`, `POBLACION_CLIENTE` = :`POBLAC' +
        'ION_CLIENTE`, `PROVINCIA_CLIENTE` = :`PROVINCIA_CLIENTE`, `CPOST' +
        'AL_CLIENTE` = :`CPOSTAL_CLIENTE`, `IMPORTE_LETRA` = :`IMPORTE_LE' +
        'TRA`, `TRATAMIENTOS` = :`TRATAMIENTOS`'
      'WHERE'
      
        '  `NRO_FACTURA` = :`Old_NRO_FACTURA` AND `SERIE_FACTURA` = :`Old' +
        '_SERIE_FACTURA` AND `NRO_PLAZO_RECIBO` = :`Old_NRO_PLAZO_RECIBO`')
    SQLLock.Strings = (
      'SELECT * FROM suboc_recibos'
      'WHERE'
      
        '  `NRO_FACTURA` = :`Old_NRO_FACTURA` AND `SERIE_FACTURA` = :`Old' +
        '_SERIE_FACTURA` AND `NRO_PLAZO_RECIBO` = :`Old_NRO_PLAZO_RECIBO`'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT `NRO_FACTURA`, `SERIE_FACTURA`, `NRO_PLAZO_RECIBO`, `FORM' +
        'A_PAGO_ORIGEN`, `FORMA_PAGO_DESCRIPCION_ORIGEN`, `EUROS_RECIBO`,' +
        ' `ESTADO_RECIBO`, `FECHA_EXPEDICION`, `FECHA_VENCIMIENTO`, `IBAN' +
        '`, `FECHA_PAGO`, `LOCALIDAD_EXPEDICION`, `CODIGO_CLIENTE`, `RAZO' +
        'NSOCIAL_CLIENTE`, `DIRECCION1_CLIENTE`, `POBLACION_CLIENTE`, `PR' +
        'OVINCIA_CLIENTE`, `CPOSTAL_CLIENTE`, `IMPORTE_LETRA`, `TRATAMIEN' +
        'TOS` FROM `suboc_recibos`'
      'WHERE'
      
        '  `NRO_FACTURA` = :`P_1_NRO_FACTURA` AND `SERIE_FACTURA` = :`P_1' +
        '_SERIE_FACTURA` AND `NRO_PLAZO_RECIBO` = :`NRO_PLAZO_RECIBO`')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_recibos')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_recibos'
      '')
    MasterSource = frmMtoFac.dsTablaG
    MasterFields = 'NRO_FACTURA;SERIE_FACTURA'
    DetailFields = 'NRO_FACTURA;SERIE_FACTURA'
    Left = 632
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRO_FACTURA'
        ParamType = ptInput
        Value = 5
      end
      item
        DataType = ftString
        Name = 'SERIE_FACTURA'
        ParamType = ptInput
        Value = 'Z19'
      end>
  end
  object dsRecibosPrint: TDataSource
    DataSet = unqryRecibosPrint
    Left = 368
    Top = 88
  end
  object fxdsRecibos: TfrxDBDataset
    Description = 'Recibos'
    UserName = 'Facturas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NRO_FACTURA=NRO_FACTURA'
      'SERIE_FACTURA=SERIE_FACTURA'
      'NRO_PLAZO_RECIBO=NRO_PLAZO_RECIBO'
      'FORMA_PAGO_ORIGEN=FORMA_PAGO_ORIGEN'
      'FORMA_PAGO_RECIBO=FORMA_PAGO_RECIBO'
      'FORMA_PAGO_DESCRIPCION_ORIGEN=FORMA_PAGO_DESCRIPCION_ORIGEN'
      'FORMA_PAGO_DESCRIPCION_RECIBO=FORMA_PAGO_DESCRIPCION_RECIBO'
      'EUROS_RECIBO=EUROS_RECIBO'
      'ESTADO_RECIBO=ESTADO_RECIBO'
      'FECHA_EXPEDICION=FECHA_EXPEDICION'
      'FECHA_VENCIMIENTO=FECHA_VENCIMIENTO'
      'IBAN=IBAN'
      'FECHA_PAGO=FECHA_PAGO'
      'LOCALIDAD_EXPEDICION=LOCALIDAD_EXPEDICION'
      'CODIGO_CLIENTE=CODIGO_CLIENTE'
      'RAZONSOCIAL_CLIENTE=RAZONSOCIAL_CLIENTE'
      'DIRECCION1_CLIENTE=DIRECCION1_CLIENTE'
      'POBLACION_CLIENTE=POBLACION_CLIENTE'
      'PROVINCIA_CLIENTE=PROVINCIA_CLIENTE'
      'CPOSTAL_CLIENTE=CPOSTAL_CLIENTE'
      'IMPORTE_LETRA=IMPORTE_LETRA'
      'TRATAMIENTOS=TRATAMIENTOS')
    DataSource = dsRecibosPrint
    BCDToCurrency = False
    Left = 368
    Top = 24
  end
  object unqryRecibosPrint: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * '
      'from SUBOC_recibos'
      '')
    DMLRefresh = True
    Left = 368
    Top = 144
  end
  object unstrdprcGetRecibos: TUniStoredProc
    StoredProcName = 'PRC_CREAR_RECIBOS_FACTURA'
    SQL.Strings = (
      'CALL PRC_CREAR_RECIBOS_FACTURA(:pSERIE_FACTURA, :pNRO_FACTURA)')
    Connection = dmConn.conUni
    Left = 1008
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'pSERIE_FACTURA'
        ParamType = ptInput
        Size = 8
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'pNRO_FACTURA'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CREAR_RECIBOS_FACTURA'
  end
  object unstrdprcCalcularFactura: TUniStoredProc
    StoredProcName = 'PRC_CALCULAR_FACTURA'
    SQL.Strings = (
      'CALL PRC_CALCULAR_FACTURA(:pidseriefactura, :pidnumfactura)')
    Connection = dmConn.conUni
    Left = 64
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'pidseriefactura'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pidnumfactura'
        ParamType = ptInput
        Size = 200
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CALCULAR_FACTURA'
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
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * FROM suboc_consolidacion'
      'WHERE NRO_FACTURA = :NRO_FACTURA'
      'AND SERIE_FACTURA = :SERIE_FACTURA'
      'ORDER BY ID_CONSOLIDACION DESC')
    MasterSource = frmMtoFac.dsTablaG
    MasterFields = 'SERIE_FACTURA;NRO_FACTURA'
    DetailFields = 'SERIE_FACTURA;NRO_FACTURA'
    ReadOnly = True
    Left = 824
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRO_FACTURA'
        ParamType = ptInput
        Value = 21
      end
      item
        DataType = ftWideString
        Name = 'SERIE_FACTURA'
        ParamType = ptInput
        Value = 'Z25'
      end>
  end
  object dsConsolidacion: TDataSource
    DataSet = unqryConsolidacion
    Left = 824
    Top = 96
  end
  object dsPaises: TDataSource
    DataSet = unqryPaisesCli
    Left = 936
    Top = 96
  end
  object unqryPaisesCli: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_paises'
      
        '  (COD_PAIS, COD_PAIS_ALPHA3, COD_PAIS_ALPHA2, NOMBRE_SPA_PAIS, ' +
        'NOMBRE_ENG_PAIS, ORDEN_PAIS)'
      'VALUES'
      
        '  (:COD_PAIS, :COD_PAIS_ALPHA3, :COD_PAIS_ALPHA2, :NOMBRE_SPA_PA' +
        'IS, :NOMBRE_ENG_PAIS, :ORDEN_PAIS)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_paises'
      'WHERE'
      '  COD_PAIS = :Old_COD_PAIS')
    SQLUpdate.Strings = (
      'UPDATE suboc_paises'
      'SET'
      
        '  COD_PAIS = :COD_PAIS, COD_PAIS_ALPHA3 = :COD_PAIS_ALPHA3, COD_' +
        'PAIS_ALPHA2 = :COD_PAIS_ALPHA2, NOMBRE_SPA_PAIS = :NOMBRE_SPA_PA' +
        'IS, NOMBRE_ENG_PAIS = :NOMBRE_ENG_PAIS, ORDEN_PAIS = :ORDEN_PAIS'
      'WHERE'
      '  COD_PAIS = :Old_COD_PAIS')
    SQLLock.Strings = (
      
        'SELECT COD_PAIS, COD_PAIS_ALPHA3, COD_PAIS_ALPHA2, NOMBRE_SPA_PA' +
        'IS, NOMBRE_ENG_PAIS, ORDEN_PAIS FROM suboc_paises'
      'WHERE'
      '  COD_PAIS = :Old_COD_PAIS'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT COD_PAIS, COD_PAIS_ALPHA3, COD_PAIS_ALPHA2, NOMBRE_SPA_PA' +
        'IS, NOMBRE_ENG_PAIS, ORDEN_PAIS FROM suboc_paises'
      'WHERE'
      '  COD_PAIS = :COD_PAIS')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_paises')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_paises'
      '')
    MasterSource = frmMtoFac.dsTablaG
    MasterFields = 'PAIS_CLIENTE_FACTURA'
    DetailFields = 'COD_PAIS_ALPHA2'
    ReadOnly = True
    Left = 936
    Top = 152
    ParamData = <
      item
        DataType = ftWideString
        Name = 'PAIS_CLIENTE_FACTURA'
        ParamType = ptInput
        Value = 'ES'
      end>
  end
  object unqryPaises: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_paises'
      
        '  (COD_PAIS, COD_PAIS_ALPHA3, COD_PAIS_ALPHA2, NOMBRE_SPA_PAIS, ' +
        'NOMBRE_ENG_PAIS, ESMIEMBRO_UE_PAIS, ORDEN_PAIS)'
      'VALUES'
      
        '  (:COD_PAIS, :COD_PAIS_ALPHA3, :COD_PAIS_ALPHA2, :NOMBRE_SPA_PA' +
        'IS, :NOMBRE_ENG_PAIS, :ESMIEMBRO_UE_PAIS, :ORDEN_PAIS)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_paises'
      'WHERE'
      '  COD_PAIS = :Old_COD_PAIS')
    SQLUpdate.Strings = (
      'UPDATE suboc_paises'
      'SET'
      
        '  COD_PAIS = :COD_PAIS, COD_PAIS_ALPHA3 = :COD_PAIS_ALPHA3, COD_' +
        'PAIS_ALPHA2 = :COD_PAIS_ALPHA2, NOMBRE_SPA_PAIS = :NOMBRE_SPA_PA' +
        'IS, NOMBRE_ENG_PAIS = :NOMBRE_ENG_PAIS, ESMIEMBRO_UE_PAIS = :ESM' +
        'IEMBRO_UE_PAIS, ORDEN_PAIS = :ORDEN_PAIS'
      'WHERE'
      '  COD_PAIS = :Old_COD_PAIS')
    SQLLock.Strings = (
      
        'SELECT COD_PAIS, COD_PAIS_ALPHA3, COD_PAIS_ALPHA2, NOMBRE_SPA_PA' +
        'IS, NOMBRE_ENG_PAIS, ESMIEMBRO_UE_PAIS, ORDEN_PAIS FROM suboc_pa' +
        'ises'
      'WHERE'
      '  COD_PAIS = :Old_COD_PAIS'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT COD_PAIS, COD_PAIS_ALPHA3, COD_PAIS_ALPHA2, NOMBRE_SPA_PA' +
        'IS, NOMBRE_ENG_PAIS, ESMIEMBRO_UE_PAIS, ORDEN_PAIS FROM suboc_pa' +
        'ises'
      'WHERE'
      '  COD_PAIS = :COD_PAIS')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_paises')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_paises'
      '')
    ReadOnly = True
    Left = 936
    Top = 8
  end
  object dsErrores: TDataSource
    DataSet = unqryErrores
    Left = 1040
    Top = 104
  end
  object unqryErrores: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select *'
      'FROM suboc_verifactu_log_eventos'
      'order by id_log desc')
    MasterSource = frmMtoFac.dsTablaG
    MasterFields = 'NRO_FACTURA;SERIE_FACTURA'
    DetailFields = 'NRO_FACTURA_LOG;SERIE_FACTURA_LOG'
    ReadOnly = True
    AutoCalcFields = False
    Left = 1040
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRO_FACTURA'
        ParamType = ptInput
        Value = 16
      end
      item
        DataType = ftWideString
        Name = 'SERIE_FACTURA'
        ParamType = ptInput
        Value = 'PRUE'
      end>
  end
end
