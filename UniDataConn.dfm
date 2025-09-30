object dmConn: TdmConn
  OnCreate = DataModuleCreate
  Height = 239
  Width = 405
  object conUni: TUniConnection
    ProviderName = 'MySQL'
    Port = 3310
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
    EncryptedPassword = 'A5FF9EFF92FF90FF8DFF9EFFCDFFCFFFCDFFCCFF'
  end
end
