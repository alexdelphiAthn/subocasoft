object DMClientes: TDMClientes
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 322
  Width = 1088
  object dsFacturas: TDataSource
    DataSet = unqryFacturas
    Left = 120
    Top = 32
  end
  object dsLinFac: TDataSource
    DataSet = unqryLinFac
    Left = 192
    Top = 32
  end
  object dsHistoria: TDataSource
    DataSet = unqryHistoria
    Left = 264
    Top = 32
  end
  object unqryClientes: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_clientes'
      
        '  (CODIGO_CLIENTE, RAZONSOCIAL_CLIENTE, NIF_CLIENTE, MOVIL_CLIEN' +
        'TE, EMAIL_CLIENTE, DIRECCION1_CLIENTE, DIRECCION2_CLIENTE, POBLA' +
        'CION_CLIENTE, PROVINCIA_CLIENTE, CPOSTAL_CLIENTE, PAIS_CLIENTE, ' +
        'TIPOID_INT_CLIENTE, OBSERVACIONES_CLIENTE, REFERENCIA_CLIENTE, T' +
        'ELEFONO_CLIENTE, PROFESION_CLIENTE, FECHA_NACIMIENTO, NOMBRE, AP' +
        'ELLIDOS, IBAN)'
      'VALUES'
      
        '  (:CODIGO_CLIENTE, :RAZONSOCIAL_CLIENTE, :NIF_CLIENTE, :MOVIL_C' +
        'LIENTE, :EMAIL_CLIENTE, :DIRECCION1_CLIENTE, :DIRECCION2_CLIENTE' +
        ', :POBLACION_CLIENTE, :PROVINCIA_CLIENTE, :CPOSTAL_CLIENTE, :PAI' +
        'S_CLIENTE, :TIPOID_INT_CLIENTE, :OBSERVACIONES_CLIENTE, :REFEREN' +
        'CIA_CLIENTE, :TELEFONO_CLIENTE, :PROFESION_CLIENTE, :FECHA_NACIM' +
        'IENTO, :NOMBRE, :APELLIDOS, :IBAN)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_clientes'
      'WHERE'
      '  CODIGO_CLIENTE = :Old_CODIGO_CLIENTE')
    SQLUpdate.Strings = (
      'UPDATE suboc_clientes'
      'SET'
      
        '  CODIGO_CLIENTE = :CODIGO_CLIENTE, RAZONSOCIAL_CLIENTE = :RAZON' +
        'SOCIAL_CLIENTE, NIF_CLIENTE = :NIF_CLIENTE, MOVIL_CLIENTE = :MOV' +
        'IL_CLIENTE, EMAIL_CLIENTE = :EMAIL_CLIENTE, DIRECCION1_CLIENTE =' +
        ' :DIRECCION1_CLIENTE, DIRECCION2_CLIENTE = :DIRECCION2_CLIENTE, ' +
        'POBLACION_CLIENTE = :POBLACION_CLIENTE, PROVINCIA_CLIENTE = :PRO' +
        'VINCIA_CLIENTE, CPOSTAL_CLIENTE = :CPOSTAL_CLIENTE, PAIS_CLIENTE' +
        ' = :PAIS_CLIENTE, TIPOID_INT_CLIENTE = :TIPOID_INT_CLIENTE, OBSE' +
        'RVACIONES_CLIENTE = :OBSERVACIONES_CLIENTE, REFERENCIA_CLIENTE =' +
        ' :REFERENCIA_CLIENTE, TELEFONO_CLIENTE = :TELEFONO_CLIENTE, PROF' +
        'ESION_CLIENTE = :PROFESION_CLIENTE, FECHA_NACIMIENTO = :FECHA_NA' +
        'CIMIENTO, NOMBRE = :NOMBRE, APELLIDOS = :APELLIDOS, IBAN = :IBAN'
      'WHERE'
      '  CODIGO_CLIENTE = :Old_CODIGO_CLIENTE')
    SQLLock.Strings = (
      
        'SELECT CODIGO_CLIENTE, RAZONSOCIAL_CLIENTE, NIF_CLIENTE, MOVIL_C' +
        'LIENTE, EMAIL_CLIENTE, DIRECCION1_CLIENTE, DIRECCION2_CLIENTE, P' +
        'OBLACION_CLIENTE, PROVINCIA_CLIENTE, CPOSTAL_CLIENTE, PAIS_CLIEN' +
        'TE, TIPOID_INT_CLIENTE, OBSERVACIONES_CLIENTE, REFERENCIA_CLIENT' +
        'E, TELEFONO_CLIENTE, PROFESION_CLIENTE, FECHA_NACIMIENTO, NOMBRE' +
        ', APELLIDOS, IBAN FROM suboc_clientes'
      'WHERE'
      '  CODIGO_CLIENTE = :Old_CODIGO_CLIENTE'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_CLIENTE, RAZONSOCIAL_CLIENTE, NIF_CLIENTE, MOVIL_C' +
        'LIENTE, EMAIL_CLIENTE, DIRECCION1_CLIENTE, DIRECCION2_CLIENTE, P' +
        'OBLACION_CLIENTE, PROVINCIA_CLIENTE, CPOSTAL_CLIENTE, PAIS_CLIEN' +
        'TE, TIPOID_INT_CLIENTE, OBSERVACIONES_CLIENTE, REFERENCIA_CLIENT' +
        'E, TELEFONO_CLIENTE, PROFESION_CLIENTE, FECHA_NACIMIENTO, NOMBRE' +
        ', APELLIDOS, IBAN FROM suboc_clientes'
      'WHERE'
      '  CODIGO_CLIENTE = :CODIGO_CLIENTE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_clientes')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_clientes'
      ''
      'order by convert(CODIGO_CLIENTE, int) DESC')
    Active = True
    AfterInsert = unqryClientesAfterInsert
    BeforePost = unqryClientesBeforePost
    Left = 40
    Top = 88
  end
  object unqryFacturas: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_facturas'
      
        '  (NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZONSOCI' +
        'AL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTURA, ' +
        'EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION2_CL' +
        'IENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_FACT' +
        'URA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, FECHA_FACTUR' +
        'A, TOTAL_LIQUIDO_FACTURA, FORMA_PAGO_FACTURA, NRO_FACTURA_ABONO_' +
        'FACTURA, SERIE_FACTURA_ABONO_FACTURA, DOCUMENTO_FACTURA, COMENTA' +
        'RIOS_FACTURA)'
      'VALUES'
      
        '  (:NRO_FACTURA, :SERIE_FACTURA, :CODIGO_CLIENTE_FACTURA, :RAZON' +
        'SOCIAL_CLIENTE_FACTURA, :NIF_CLIENTE_FACTURA, :MOVIL_CLIENTE_FAC' +
        'TURA, :EMAIL_CLIENTE_FACTURA, :DIRECCION1_CLIENTE_FACTURA, :DIRE' +
        'CCION2_CLIENTE_FACTURA, :POBLACION_CLIENTE_FACTURA, :PROVINCIA_C' +
        'LIENTE_FACTURA, :CPOSTAL_CLIENTE_FACTURA, :PAIS_CLIENTE_FACTURA,' +
        ' :FECHA_FACTURA, :TOTAL_LIQUIDO_FACTURA, :FORMA_PAGO_FACTURA, :N' +
        'RO_FACTURA_ABONO_FACTURA, :SERIE_FACTURA_ABONO_FACTURA, :DOCUMEN' +
        'TO_FACTURA, :COMENTARIOS_FACTURA)')
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
        'LIENTE_FACTURA, PAIS_CLIENTE_FACTURA = :PAIS_CLIENTE_FACTURA, FE' +
        'CHA_FACTURA = :FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA = :TOTAL_LIQ' +
        'UIDO_FACTURA, FORMA_PAGO_FACTURA = :FORMA_PAGO_FACTURA, NRO_FACT' +
        'URA_ABONO_FACTURA = :NRO_FACTURA_ABONO_FACTURA, SERIE_FACTURA_AB' +
        'ONO_FACTURA = :SERIE_FACTURA_ABONO_FACTURA, DOCUMENTO_FACTURA = ' +
        ':DOCUMENTO_FACTURA, COMENTARIOS_FACTURA = :COMENTARIOS_FACTURA'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA')
    SQLLock.Strings = (
      'SELECT * FROM suboc_facturas'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZON' +
        'SOCIAL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTU' +
        'RA, EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION' +
        '2_CLIENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_' +
        'FACTURA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, FECHA_FA' +
        'CTURA, TOTAL_LIQUIDO_FACTURA, FORMA_PAGO_FACTURA, NRO_FACTURA_AB' +
        'ONO_FACTURA, SERIE_FACTURA_ABONO_FACTURA, DOCUMENTO_FACTURA, COM' +
        'ENTARIOS_FACTURA FROM suboc_facturas'
      'WHERE'
      '  NRO_FACTURA = :NRO_FACTURA AND SERIE_FACTURA = :SERIE_FACTURA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_facturas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * from suboc_Facturas'
      'where codigo_cliente_factura = :codigo_cliente')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE_FACTURA'
    Active = True
    Left = 120
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 18
      end>
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
      'SELECT F.CODIGO_CLIENTE_FACTURA, '
      '             L.*         '
      #9'FROM suboc_facturas_lineas L'
      #9'INNER JOIN suboc_facturas F'
      #9'ON L.NRO_FACTURA_LINEA = F.NRO_FACTURA'
      '                AND L.SERIE_FACTURA_LINEA = F.SERIE_FACTURA'
      #9'where F.CODIGO_CLIENTE_FACTURA = :codigo_cliente'
      'order by F.CODIGO_CLIENTE_FACTURA,'
      '              L.NRO_FACTURA_LINEA,'
      '              L.SERIE_FACTURA_LINEA,'
      '              L.LINEA_LINEA')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE_FACTURA'
    Active = True
    Left = 192
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 18
      end>
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
      'select * from VU_suboc_historia'
      'where codigo_cliente = :codigo_cliente'
      '')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE'
    AfterInsert = unqryHistoriaAfterInsert
    Left = 264
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 1
      end>
  end
  object unstrdprcContador: TUniStoredProc
    StoredProcName = 'GET_NEXT_CONT'
    SQL.Strings = (
      
        'CALL GET_NEXT_CONT(:pTipoDoc, @pcont); SELECT CAST(@pcont AS SIG' +
        'NED) AS '#39'@pcont'#39)
    Connection = dmConn.conUni
    Left = 40
    Top = 148
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
        Value = nil
      end>
    CommandStoredProcName = 'GET_NEXT_CONT'
  end
  object unqryArtDataHisCli: TUniQuery
    SQL.Strings = (
      'select * from suboc_articulos')
    Left = 344
    Top = 88
  end
  object unstrdprcGetDataArticulo: TUniStoredProc
    StoredProcName = 'PRC_GET_DATA_ARTICULO'
    SQL.Strings = (
      
        'CALL PRC_GET_DATA_ARTICULO(:pidcodarticulo, @pidnomarticulo, @pi' +
        'dprecioventa); SELECT @pidnomarticulo AS '#39'@pidnomarticulo'#39', @pid' +
        'precioventa AS '#39'@pidprecioventa'#39)
    Connection = dmConn.conUni
    Left = 163
    Top = 148
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
  object dsPresupuestos: TDataSource
    DataSet = unqryPresupuestos
    Left = 456
    Top = 16
  end
  object dsLinPre: TDataSource
    DataSet = unqryLinPre
    Left = 528
    Top = 16
  end
  object unqryPresupuestos: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_presupuestos'
      
        '  (NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZONSOCI' +
        'AL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTURA, ' +
        'EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION2_CL' +
        'IENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_FACT' +
        'URA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, FECHA_FACTUR' +
        'A, TOTAL_LIQUIDO_FACTURA, FORMA_PAGO_FACTURA, COMENTARIOS_FACTUR' +
        'A, NOMBRE, APELLIDOS)'
      'VALUES'
      
        '  (:NRO_FACTURA, :SERIE_FACTURA, :CODIGO_CLIENTE_FACTURA, :RAZON' +
        'SOCIAL_CLIENTE_FACTURA, :NIF_CLIENTE_FACTURA, :MOVIL_CLIENTE_FAC' +
        'TURA, :EMAIL_CLIENTE_FACTURA, :DIRECCION1_CLIENTE_FACTURA, :DIRE' +
        'CCION2_CLIENTE_FACTURA, :POBLACION_CLIENTE_FACTURA, :PROVINCIA_C' +
        'LIENTE_FACTURA, :CPOSTAL_CLIENTE_FACTURA, :PAIS_CLIENTE_FACTURA,' +
        ' :FECHA_FACTURA, :TOTAL_LIQUIDO_FACTURA, :FORMA_PAGO_FACTURA, :C' +
        'OMENTARIOS_FACTURA, :NOMBRE, :APELLIDOS)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_presupuestos'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA')
    SQLUpdate.Strings = (
      'UPDATE suboc_presupuestos'
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
        'LIENTE_FACTURA, PAIS_CLIENTE_FACTURA = :PAIS_CLIENTE_FACTURA, FE' +
        'CHA_FACTURA = :FECHA_FACTURA, TOTAL_LIQUIDO_FACTURA = :TOTAL_LIQ' +
        'UIDO_FACTURA, FORMA_PAGO_FACTURA = :FORMA_PAGO_FACTURA, COMENTAR' +
        'IOS_FACTURA = :COMENTARIOS_FACTURA, NOMBRE = :NOMBRE, APELLIDOS ' +
        '= :APELLIDOS'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA')
    SQLLock.Strings = (
      'SELECT * FROM suboc_presupuestos'
      'WHERE'
      
        '  NRO_FACTURA = :Old_NRO_FACTURA AND SERIE_FACTURA = :Old_SERIE_' +
        'FACTURA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT NRO_FACTURA, SERIE_FACTURA, CODIGO_CLIENTE_FACTURA, RAZON' +
        'SOCIAL_CLIENTE_FACTURA, NIF_CLIENTE_FACTURA, MOVIL_CLIENTE_FACTU' +
        'RA, EMAIL_CLIENTE_FACTURA, DIRECCION1_CLIENTE_FACTURA, DIRECCION' +
        '2_CLIENTE_FACTURA, POBLACION_CLIENTE_FACTURA, PROVINCIA_CLIENTE_' +
        'FACTURA, CPOSTAL_CLIENTE_FACTURA, PAIS_CLIENTE_FACTURA, FECHA_FA' +
        'CTURA, TOTAL_LIQUIDO_FACTURA, FORMA_PAGO_FACTURA, COMENTARIOS_FA' +
        'CTURA, NOMBRE, APELLIDOS FROM suboc_presupuestos'
      'WHERE'
      '  NRO_FACTURA = :NRO_FACTURA AND SERIE_FACTURA = :SERIE_FACTURA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_presupuestos')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * from suboc_presupuestos'
      'where codigo_cliente_factura = :codigo_cliente')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE_FACTURA'
    Left = 456
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 3128
      end>
  end
  object unqryLinPre: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_presupuestos_lineas'
      
        '  (SERIE_FACTURA_LINEA, NRO_FACTURA_LINEA, LINEA_LINEA, CODIGO_A' +
        'RTICULO_LINEA, DESCRIPCION_ARTICULO_LINEA, ZONA, PRECIOVENTA_ART' +
        'ICULO_LINEA, CANTIDAD_LINEA, SUM_TOTAL_LINEA, ODONTOLOGO)'
      'VALUES'
      
        '  (:SERIE_FACTURA_LINEA, :NRO_FACTURA_LINEA, :LINEA_LINEA, :CODI' +
        'GO_ARTICULO_LINEA, :DESCRIPCION_ARTICULO_LINEA, :ZONA, :PRECIOVE' +
        'NTA_ARTICULO_LINEA, :CANTIDAD_LINEA, :SUM_TOTAL_LINEA, :ODONTOLO' +
        'GO)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_presupuestos_lineas'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :Old_SERIE_FACTURA_LINEA AND NRO_FACTURA' +
        '_LINEA = :Old_NRO_FACTURA_LINEA AND LINEA_LINEA = :Old_LINEA_LIN' +
        'EA')
    SQLUpdate.Strings = (
      'UPDATE suboc_presupuestos_lineas'
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
      'SELECT * FROM suboc_presupuestos_lineas'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :Old_SERIE_FACTURA_LINEA AND NRO_FACTURA' +
        '_LINEA = :Old_NRO_FACTURA_LINEA AND LINEA_LINEA = :Old_LINEA_LIN' +
        'EA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT SERIE_FACTURA_LINEA, NRO_FACTURA_LINEA, LINEA_LINEA, CODI' +
        'GO_ARTICULO_LINEA, DESCRIPCION_ARTICULO_LINEA, ZONA, PRECIOVENTA' +
        '_ARTICULO_LINEA, CANTIDAD_LINEA, SUM_TOTAL_LINEA, ODONTOLOGO FRO' +
        'M suboc_presupuestos_lineas'
      'WHERE'
      
        '  SERIE_FACTURA_LINEA = :SERIE_FACTURA_LINEA AND NRO_FACTURA_LIN' +
        'EA = :NRO_FACTURA_LINEA AND LINEA_LINEA = :LINEA_LINEA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_presupuestos_lineas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT F.CODIGO_CLIENTE_FACTURA, '
      '             L.*         '
      #9'FROM suboc_presupuestos_lineas L'
      #9'INNER JOIN suboc_presupuestos F'
      #9'ON L.NRO_FACTURA_LINEA = F.NRO_FACTURA'
      '                AND L.SERIE_FACTURA_LINEA = F.SERIE_FACTURA'
      #9'where F.CODIGO_CLIENTE_FACTURA = :codigo_cliente'
      'order by F.CODIGO_CLIENTE_FACTURA,'
      '              L.NRO_FACTURA_LINEA,'
      '              L.SERIE_FACTURA_LINEA,'
      '              L.LINEA_LINEA')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE_FACTURA'
    Left = 528
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 3145
      end>
  end
  object unstrdprcHistoriaFactura: TUniStoredProc
    StoredProcName = 'PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA'
    SQL.Strings = (
      
        'CALL PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA(:pID_HISTORIA, :pSERI' +
        'Ein, :pFECHAin, :PFacturain, @pNroFactura, @pNroLinea); SELECT C' +
        'AST(@pNroFactura AS SIGNED) AS '#39'@pNroFactura'#39', @pNroLinea AS '#39'@p' +
        'NroLinea'#39)
    Connection = dmConn.conUni
    Left = 435
    Top = 196
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'pID_HISTORIA'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pSERIEin'
        ParamType = ptInput
        Size = 4
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'pFECHAin'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'PFacturain'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'pNroFactura'
        ParamType = ptOutput
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pNroLinea'
        ParamType = ptOutput
        Size = 3
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA'
  end
  object dsCliPrint: TDataSource
    DataSet = unqryCliPrint
    Left = 632
    Top = 72
  end
  object fxdsPrintCli: TfrxDBDataset
    Description = 'Clientes'
    UserName = 'Clientes'
    CloseDataSource = False
    FieldAliases.Strings = (
      '-CODIGO_CLIENTE=CODIGO_CLIENTE'
      'RAZONSOCIAL_CLIENTE=RAZONSOCIAL_CLIENTE'
      'NIF_CLIENTE=NIF_CLIENTE'
      'MOVIL_CLIENTE=MOVIL_CLIENTE'
      'EMAIL_CLIENTE=EMAIL_CLIENTE'
      'DIRECCION1_CLIENTE=DIRECCION1_CLIENTE'
      'DIRECCION2_CLIENTE=DIRECCION2_CLIENTE'
      'POBLACION_CLIENTE=POBLACION_CLIENTE'
      'PROVINCIA_CLIENTE=PROVINCIA_CLIENTE'
      'CPOSTAL_CLIENTE=CPOSTAL_CLIENTE'
      'PAIS_CLIENTE=PAIS_CLIENTE'
      'OBSERVACIONES_CLIENTE=OBSERVACIONES_CLIENTE'
      'REFERENCIA_CLIENTE=REFERENCIA_CLIENTE'
      'TELEFONO_CLIENTE=TELEFONO_CLIENTE'
      'PROFESION_CLIENTE=PROFESION_CLIENTE'
      'FECHA_NACIMIENTO=FECHA_NACIMIENTO'
      'NOMBRE=NOMBRE'
      'APELLIDOS=APELLIDOS'
      'IBAN=IBAN')
    DataSource = dsEtiquetas
    BCDToCurrency = False
    Left = 632
    Top = 8
  end
  object unqryCliPrint: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * '
      'from SUBOC_CLIENTES'
      'where cpostal_cliente <> '#39#39
      'order by CODIGO_CLIENTE Asc')
    Left = 632
    Top = 128
  end
  object cdsEtiquetas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO_CLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RAZONSOCIAL_CLIENTE'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'NIF_CLIENTE'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'MOVIL_CLIENTE'
        DataType = ftWideString
        Size = 40
      end
      item
        Name = 'EMAIL_CLIENTE'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'DIRECCION1_CLIENTE'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'DIRECCION2_CLIENTE'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'POBLACION_CLIENTE'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'PROVINCIA_CLIENTE'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'CPOSTAL_CLIENTE'
        DataType = ftWideString
        Size = 15
      end
      item
        Name = 'PAIS_CLIENTE'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'OBSERVACIONES_CLIENTE'
        DataType = ftWideMemo
      end
      item
        Name = 'REFERENCIA_CLIENTE'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'TELEFONO_CLIENTE'
        DataType = ftWideString
        Size = 40
      end
      item
        Name = 'PROFESION_CLIENTE'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FECHA_NACIMIENTO'
        DataType = ftDate
      end
      item
        Name = 'NOMBRE'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'APELLIDOS'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'IBAN'
        DataType = ftWideString
        Size = 34
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'CODIGO_CLIENTE'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    ProviderName = 'dtstprvEtiquetas'
    StoreDefs = True
    Left = 728
    Top = 136
  end
  object dtstprvEtiquetas: TDataSetProvider
    DataSet = unqryCliPrint
    Constraints = False
    Exported = False
    Options = []
    Left = 728
    Top = 72
  end
  object dsEtiquetas: TDataSource
    DataSet = cdsEtiquetas
    Left = 728
    Top = 24
  end
  object unqryGetSerie: TUniQuery
    SQL.Strings = (
      'select * from suboc_articulos')
    Left = 296
    Top = 192
  end
  object dsCuestionario: TDataSource
    DataSet = unqryCuestionario
    Left = 880
    Top = 32
  end
  object unqryCuestionario: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO suboc_cuestionario'
      
        '  (CODIGO_CUESTIONARIO, FECHA_CUESTIONARIO, CODIGO_CLIENTE, NOMB' +
        'RE, APELLIDOS)'
      'VALUES'
      
        '  (:CODIGO_CUESTIONARIO, :FECHA_CUESTIONARIO, :CODIGO_CLIENTE, :' +
        'NOMBRE, :APELLIDOS)')
    SQLDelete.Strings = (
      'DELETE FROM suboc_cuestionario'
      'WHERE'
      '  CODIGO_CUESTIONARIO = :Old_CODIGO_CUESTIONARIO')
    SQLUpdate.Strings = (
      'UPDATE suboc_cuestionario'
      'SET'
      
        '  CODIGO_CUESTIONARIO = :CODIGO_CUESTIONARIO, FECHA_CUESTIONARIO' +
        ' = :FECHA_CUESTIONARIO, CODIGO_CLIENTE = :CODIGO_CLIENTE, NOMBRE' +
        ' = :NOMBRE, APELLIDOS = :APELLIDOS'
      'WHERE'
      '  CODIGO_CUESTIONARIO = :Old_CODIGO_CUESTIONARIO')
    SQLLock.Strings = (
      'SELECT * FROM suboc_cuestionario'
      'WHERE'
      '  CODIGO_CUESTIONARIO = :Old_CODIGO_CUESTIONARIO'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_CUESTIONARIO, FECHA_CUESTIONARIO, CODIGO_CLIENTE, ' +
        'NOMBRE, APELLIDOS FROM suboc_cuestionario'
      'WHERE'
      '  CODIGO_CUESTIONARIO = :CODIGO_CUESTIONARIO')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_cuestionario')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * '
      'from suboc_cuestionario'
      'where CODIGO_CLIENTE = :codigo_cliente')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE'
    Left = 880
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 1
      end>
  end
  object unstrdprcCrearCuestionario: TUniStoredProc
    StoredProcName = 'PRC_CREAR_CUESTIONARIO'
    SQL.Strings = (
      
        'CALL PRC_CREAR_CUESTIONARIO(:pCODIGO_CLIENTE, :pNOMBRE, :pAPELLI' +
        'DOS, :pFECHA)')
    Connection = dmConn.conUni
    Left = 579
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODIGO_CLIENTE'
        ParamType = ptInput
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
        DataType = ftDate
        Name = 'pFECHA'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'PRC_CREAR_CUESTIONARIO'
  end
  object dsCuestionarioPreguntas: TDataSource
    DataSet = unqryCuestionarioPreguntas
    Left = 808
    Top = 32
  end
  object unqryCuestionarioPreguntas: TUniQuery
    UpdatingTable = 'suboc_cuestionario_respuestas'
    SQLInsert.Strings = (
      'INSERT INTO suboc_cuestionario_respuestas'
      '  (CODIGO_CUESTIONARIO, CODIGO_PREGUNTA, PREGUNTA, RESPUESTA)'
      'VALUES'
      
        '  (:CODIGO_CUESTIONARIO, :CODIGO_PREGUNTA, :PREGUNTA, :RESPUESTA' +
        ')')
    SQLDelete.Strings = (
      'DELETE FROM suboc_cuestionario_respuestas'
      'WHERE'
      
        '  CODIGO_CUESTIONARIO = :Old_CODIGO_CUESTIONARIO AND CODIGO_PREG' +
        'UNTA = :Old_CODIGO_PREGUNTA')
    SQLUpdate.Strings = (
      'UPDATE suboc_cuestionario_respuestas'
      'SET'
      
        '  CODIGO_CUESTIONARIO = :CODIGO_CUESTIONARIO, CODIGO_PREGUNTA = ' +
        ':CODIGO_PREGUNTA, PREGUNTA = :PREGUNTA, RESPUESTA = :RESPUESTA'
      'WHERE'
      
        '  CODIGO_CUESTIONARIO = :Old_CODIGO_CUESTIONARIO AND CODIGO_PREG' +
        'UNTA = :Old_CODIGO_PREGUNTA')
    SQLLock.Strings = (
      'SELECT * FROM suboc_cuestionario_respuestas'
      'WHERE'
      
        '  CODIGO_CUESTIONARIO = :Old_CODIGO_CUESTIONARIO AND CODIGO_PREG' +
        'UNTA = :Old_CODIGO_PREGUNTA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_CUESTIONARIO, CODIGO_PREGUNTA, PREGUNTA, RESPUESTA' +
        ' FROM suboc_cuestionario_respuestas'
      'WHERE'
      
        '  CODIGO_CUESTIONARIO = :CODIGO_CUESTIONARIO AND CODIGO_PREGUNTA' +
        ' = :CODIGO_PREGUNTA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM suboc_cuestionario_respuestas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * '
      'from suboc_cuestionario_respuestas cr'
      'inner join suboc_cuestionario sc '
      'ON cr.CODIGO_CUESTIONARIO = sc.CODIGO_CUESTIONARIO'
      'where sc.CODIGO_CLIENTE = :codigo_cliente')
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE'
    Left = 808
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsCliPrintCues: TDataSource
    DataSet = unqryCliPrintCues
    Left = 976
    Top = 88
  end
  object fxdsPrintCliCues: TfrxDBDataset
    Description = 'Clientes'
    UserName = 'Clientes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO_CLIENTE=CODIGO_CLIENTE'
      'RAZONSOCIAL_CLIENTE=RAZONSOCIAL_CLIENTE'
      'NIF_CLIENTE=NIF_CLIENTE'
      'MOVIL_CLIENTE=MOVIL_CLIENTE'
      'EMAIL_CLIENTE=EMAIL_CLIENTE'
      'DIRECCION1_CLIENTE=DIRECCION1_CLIENTE'
      'DIRECCION2_CLIENTE=DIRECCION2_CLIENTE'
      'POBLACION_CLIENTE=POBLACION_CLIENTE'
      'PROVINCIA_CLIENTE=PROVINCIA_CLIENTE'
      'CPOSTAL_CLIENTE=CPOSTAL_CLIENTE'
      'PAIS_CLIENTE=PAIS_CLIENTE'
      'OBSERVACIONES_CLIENTE=OBSERVACIONES_CLIENTE'
      'REFERENCIA_CLIENTE=REFERENCIA_CLIENTE'
      'TELEFONO_CLIENTE=TELEFONO_CLIENTE'
      'PROFESION_CLIENTE=PROFESION_CLIENTE'
      'FECHA_NACIMIENTO=FECHA_NACIMIENTO'
      'NOMBRE=NOMBRE'
      'APELLIDOS=APELLIDOS'
      'IBAN=IBAN'
      'CODIGO_CUESTIONARIO=CODIGO_CUESTIONARIO'
      'FECHA_CUESTIONARIO=FECHA_CUESTIONARIO'
      'CODIGO_CLIENTE_1=CODIGO_CLIENTE_1'
      'NOMBRE_1=NOMBRE_1'
      'APELLIDOS_1=APELLIDOS_1'
      'CODIGO_CUESTIONARIO_1=CODIGO_CUESTIONARIO_1'
      'CODIGO_PREGUNTA=CODIGO_PREGUNTA'
      'PREGUNTA=PREGUNTA'
      'RESPUESTA=RESPUESTA')
    DataSource = dsCliPrintCues
    BCDToCurrency = False
    Left = 976
    Top = 24
  end
  object unqryCliPrintCues: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * '
      'from suboc_clientes cli'
      'inner join suboc_cuestionario sc '
      'on cli.CODIGO_CLIENTE = sc.CODIGO_CLIENTE'
      'inner join suboc_cuestionario_respuestas sr'
      'on sc.CODIGO_CUESTIONARIO = sr.CODIGO_CUESTIONARIO')
    Left = 976
    Top = 144
  end
  object dsPaises: TDataSource
    DataSet = unqryPaisesCli
    Left = 840
    Top = 184
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
    MasterSource = frmMtoClientes.dsTablaG
    MasterFields = 'PAIS_CLIENTE'
    DetailFields = 'COD_PAIS_ALPHA2'
    ReadOnly = True
    Active = True
    AfterInsert = unqryHistoriaAfterInsert
    Left = 840
    Top = 240
    ParamData = <
      item
        DataType = ftWideString
        Name = 'PAIS_CLIENTE'
        ParamType = ptInput
        Value = 'ES'
      end>
  end
  object unqryPaises: TUniQuery
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
    ReadOnly = True
    Active = True
    AfterInsert = unqryHistoriaAfterInsert
    Left = 936
    Top = 240
  end
end
