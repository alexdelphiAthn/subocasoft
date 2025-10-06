object dmConn: TdmConn
  OnCreate = DataModuleCreate
  Height = 239
  Width = 405
  object conUni: TUniConnection
    ProviderName = 'MySQL'
    Port = 3307
    Database = 'subocasana'
    SpecificOptions.Strings = (
      'MySQL.Charset=utf8'
      'MySQL.UseUnicode=True')
    Options.DefaultSortType = stCaseInsensitive
    DefaultTransaction.DefaultCloseAction = taCommit
    Username = 'root'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    BeforeConnect = connBeforeConnect
    Left = 216
    Top = 120
    EncryptedPassword = 'CEFFB9FFC9FFA8FFC9FF96FFCEFF95FFCEFF'
  end
end
