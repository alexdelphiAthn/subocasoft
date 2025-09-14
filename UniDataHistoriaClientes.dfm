object DMHistoriaClientes: TDMHistoriaClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 191
  Width = 549
  object unqryHistoria: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO SUBOC_HISTORIA'
      
        '  (ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE, PR' +
        'ECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_FACTU' +
        'RA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA, CANTIDAD)'
      'VALUES'
      
        '  (:ID, :CODIGO_ARTICULO, :DESCRIPCION_ARTICULO, :CODIGO_CLIENTE' +
        ', :PRECIOVENTA_ARTICULO, :FECHA, :ZONA, :DESCRIPCION_HISTORIA, :' +
        'NRO_FACTURA, :LINEA_LINEA, :ODONTOLOGO, :SERIE_FACTURA, :CANTIDA' +
        'D)')
    SQLDelete.Strings = (
      'DELETE FROM SUBOC_HISTORIA'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE SUBOC_HISTORIA'
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
      'SELECT * FROM SUBOC_HISTORIA'
      'WHERE'
      '  ID = :Old_ID'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE' +
        ', PRECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_F' +
        'ACTURA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA, CANTIDAD FROM SU' +
        'BOC_HISTORIA'
      'WHERE'
      '  ID = :ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM SUBOC_HISTORIA')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * FROM VU_SUBOC_HISTORIA'
      'ORDER BY ID DESC')
    Left = 320
    Top = 80
  end
  object unqryArtDataHis: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_articulos')
    Left = 464
    Top = 10
  end
  object unqryCliDataHis: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_clientes')
    Left = 464
    Top = 58
  end
  object unqryDocDataHis: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_odontologos')
    Left = 464
    Top = 114
  end
  object unstrdprcHistoriaFactura: TUniStoredProc
    StoredProcName = 'PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA'
    SQL.Strings = (
      
        'CALL PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA(:pID_HISTORIA, :pSERI' +
        'Ein, :pFECHAin, :PFacturain, @pNroFactura, @pNroLinea); SELECT C' +
        'AST(@pNroFactura AS SIGNED) AS '#39'@pNroFactura'#39', @pNroLinea AS '#39'@p' +
        'NroLinea'#39)
    Connection = dmConn.conUni
    Left = 195
    Top = 62
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
  object unqrySeriesFac: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT DISTINCT SERIE_CONTADOR'
      'FROM SUBOC_CONTADORES'
      'WHERE TIPODOC_CONTADOR='#39'FC'#39
      'ORDER BY DEFAULT_CONTADOR DESC')
    Left = 85
    Top = 98
  end
  object dsSeriesFac: TDataSource
    DataSet = unqrySeriesFac
    Left = 85
    Top = 42
  end
end
