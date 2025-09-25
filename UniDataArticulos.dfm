object DMArticulos: TDMArticulos
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 324
  Width = 800
  object unqryArticulos: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from suboc_articulos')
    Left = 384
    Top = 144
  end
end
