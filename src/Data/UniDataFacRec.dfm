object dmFacRec: TdmFacRec
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 401
  Width = 800
  object zqryFacRec: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'FECHA'
    SortType = stDescending
    BeforeDelete = zqryFacRecBeforeDelete
    SQL.Strings = (
      'SELECT * '
      'from glt_facturas;')
    Params = <>
    IndexFieldNames = 'FECHA Desc'
    Left = 40
    Top = 72
  end
  object zqryLinFacRec: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'numfac;serie;linea'
    AutoCalcFields = False
    BeforePost = zqryLinFacRecBeforePost
    AfterPost = zqryLinFacRecAfterPost
    AfterDelete = zqryLinFacRecAfterDelete
    SQL.Strings = (
      'SELECT *'
      ' FROM glt_linfac '
      'WHERE numfac = :numfac '
      '  AND serie = :serie'
      'ORDER BY linea;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'numfac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end>
    DataSource = frmMtoFacRec.dsTablaG
    MasterFields = 'NUMFAC; SERIE'
    MasterSource = frmMtoFacRec.dsTablaG
    LinkedFields = 'numfac; serie'
    IndexFieldNames = 'numfac Asc;serie Asc;linea Asc'
    WhereMode = wmWhereAll
    SequenceField = 'numfac;serie;linea'
    Left = 120
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numfac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end>
  end
  object dsLinFacRec: TDataSource
    DataSet = zqryLinFacRec
    Left = 120
    Top = 24
  end
  object dsFacturas: TDataSource
    DataSet = zqryFacturas
    Left = 248
    Top = 24
  end
  object dsLinFac: TDataSource
    DataSet = zqryLinFac
    Left = 312
    Top = 24
  end
  object zqryFacturas: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'SERIE; NUMFAC'
    ReadOnly = True
    SQL.Strings = (
      'SELECT * from Facturas'
      'where numfac = :NUM_FRA_RECTIFICADA'
      'and serie = :SERIE_FRA_RECTIFICADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUM_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end>
    DataSource = frmMtoFacRec.dsTablaG
    MasterFields = 'NUM_FRA_RECTIFICADA; SERIE_FRA_RECTIFICADA'
    MasterSource = frmMtoFacRec.dsTablaG
    LinkedFields = 'NUMFAC; SERIE'
    IndexFieldNames = 'SERIE Asc; NUMFAC Asc'
    Left = 248
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUM_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end>
  end
  object zqryLinFac: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'NUMFAC;serie; LINEA'
    SQL.Strings = (
      'SELECT L.*'
      #9'FROM V_linfac L'
      #9'where L.numfac = :NUM_FRA_RECTIFICADA'
      '          and L.serie = :SERIE_FRA_RECTIFICADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUM_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end>
    DataSource = frmMtoFacRec.dsTablaG
    MasterFields = 'numfac; serie'
    LinkedFields = 'numfac; SERIE'
    IndexFieldNames = 'NUMFAC Asc;serie Asc; LINEA Asc'
    Left = 312
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUM_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE_FRA_RECTIFICADA'
        ParamType = ptUnknown
      end>
  end
  object zqryClientes: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'CODIGO_CLIENTE'
    SortType = stDescending
    SQL.Strings = (
      'SELECT * from Clientes')
    Params = <>
    MasterFields = 'CODCLI'
    MasterSource = frmMtoFacRec.dsTablaG
    LinkedFields = 'CODIGO_CLIENTE'
    IndexFieldNames = 'CODIGO_CLIENTE Desc'
    Left = 456
    Top = 80
  end
  object dsClientes: TDataSource
    DataSet = zqryClientes
    Left = 456
    Top = 32
  end
  object fxdstPrintFacRec: TfrxDBDataset
    UserName = 'FacturasRec'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SERIE=SERIE'
      'NUMFAC=NUMFAC'
      'FECHA=FECHA'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'BASE0=BASE0'
      'BASE1=BASE1'
      'IVA0=IVA0'
      'IVA1=IVA1'
      'RE1=RE1'
      'SUM_IVA=SUM_IVA'
      'SUM_BASE=SUM_BASE'
      'SUM_RE=SUM_RE'
      'SUM_IRPF=SUM_IRPF'
      'SUBTOTAL=SUBTOTAL'
      'TOTAL=TOTAL'
      'PAGADO=PAGADO'
      'COMENTARIO=COMENTARIO'
      'COMENTARIO2=COMENTARIO2'
      'COMENTARIO3=COMENTARIO3'
      'AGENTE=AGENTE'
      'PEDIDO=PEDIDO'
      'ESTADO=ESTADO'
      'PORCENTAJE_RETENCION=PORCENTAJE_RETENCION'
      'IMPORTE_RETENCION=IMPORTE_RETENCION'
      'APLICADA_RETENCION=APLICADA_RETENCION'
      'CONCEPTO_RETENCION=CONCEPTO_RETENCION'
      'DESCONTAR_RETENCION=DESCONTAR_RETENCION'
      'LIQUIDADA=LIQUIDADA'
      'PENDIENTE=PENDIENTE'
      'ANTICIPO=ANTICIPO'
      'REFERENCIA=REFERENCIA'
      'FACTURA_ABONO=FACTURA_ABONO'
      'DEVOLUCION_FACTURA=DEVOLUCION_FACTURA'
      'IBAN=IBAN'
      'BIC=BIC'
      'IMPORTADO=IMPORTADO'
      'Hora=Hora'
      'nombreCliente=nombreCliente'
      'apellidosCliente=apellidosCliente'
      'razonsocialCliente=razonsocialCliente'
      'dniCliente=dniCliente'
      'MovilCliente=MovilCliente'
      'emailCliente=emailCliente'
      'direccionCliente=direccionCliente'
      'poblacionCliente=poblacionCliente'
      'provinciaCliente=provinciaCliente'
      'CPCliente=CPCliente'
      'PaisCliente=PaisCliente'
      'Nombre_Envio_AuxCliente=Nombre_Envio_AuxCliente'
      'Direccion_Envio_AuxCliente=Direccion_Envio_AuxCliente'
      'CP_Envio_AuxCliente=CP_Envio_AuxCliente'
      'Poblacion_Envio_AuxCliente=Poblacion_Envio_AuxCliente'
      'Provincia_Envio_AuxCliente=Provincia_Envio_AuxCliente'
      'Pais_Envio_auxCliente=Pais_Envio_auxCliente'
      'instantemodif=instantemodif'
      'usuariomodif=usuariomodif'
      'NUM_FRA_RECTIFICADA=NUM_FRA_RECTIFICADA'
      'SERIE_FRA_RECTIFICADA=SERIE_FRA_RECTIFICADA'
      'TIPO_FRA_RECTIFICADA=TIPO_FRA_RECTIFICADA'
      'FECHA_FRA_RECTIFICADA=FECHA_FRA_RECTIFICADA')
    DataSet = zqryFacRecPrint
    BCDToCurrency = False
    Left = 552
    Top = 24
  end
  object fxdstPrintLinFacRec: TfrxDBDataset
    UserName = 'Lineas Facturas Rec'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SERIE=SERIE'
      'NUMFAC=NUMFAC'
      'LINEA=LINEA'
      'CODIGO=CODIGO'
      'NOMBRE=NOMBRE'
      'PRECIO=PRECIO'
      'CANTIDAD=CANTIDAD'
      'P_UNI=P_UNI'
      'PCOSTE=PCOSTE'
      'IVA=IVA'
      'IMP_IVA=IMP_IVA'
      'NETO=NETO'
      '-instantemodif=instantemodif'
      '-usuariomodif=usuariomodif')
    DataSet = zqryLinFacRecPrint
    BCDToCurrency = False
    Left = 632
    Top = 24
  end
  object zqryLinFacRecPrint: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'NUMFAC; SERIE; LINEA'
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT *'
      ' FROM glt_linfac '
      'WHERE numfac = :NUMFAC'
      '  AND serie = :SERIE'
      'ORDER BY linea;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUMFAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
    DataSource = dsFacRecPrint
    MasterFields = 'SERIE; NUMFAC'
    MasterSource = dsFacRecPrint
    LinkedFields = 'SERIE; NUMFAC'
    IndexFieldNames = 'NUMFAC Asc; SERIE Asc; LINEA Asc'
    WhereMode = wmWhereAll
    SequenceField = 'numfac;serie;linea'
    Left = 640
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMFAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
  end
  object zqryFacRecPrint: TZQuery
    Connection = dmConn.ZconnGlent
    SortedFields = 'NUMFAC'
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * '
      'from glt_facturas where numfac ='#39'000279'#39';')
    Params = <>
    IndexFieldNames = 'NUMFAC Asc'
    Left = 552
    Top = 136
  end
  object dsFacRecPrint: TDataSource
    DataSet = zqryFacRecPrint
    Left = 552
    Top = 88
  end
  object dsLinFacRecPrint: TDataSource
    DataSet = zqryLinFacRecPrint
    Left = 632
    Top = 88
  end
end
