object dmConn: TdmConn
  OnCreate = DataModuleCreate
  Height = 299
  Width = 506
  PixelsPerInch = 120
  object conUni: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'subocasana'
    SpecificOptions.Strings = (
      'MySQL.Charset=utf8'
      'MySQL.UseUnicode=True')
    Options.DefaultSortType = stCaseInsensitive
    DefaultTransaction.DefaultCloseAction = taCommit
    Username = 'root'
    Server = '127.0.0.1'
    LoginPrompt = False
    BeforeConnect = connBeforeConnect
    Left = 270
    Top = 150
    EncryptedPassword = 'A5FF9EFF92FF90FF8DFF9EFFCDFFCFFFCDFFCCFF'
  end
end
