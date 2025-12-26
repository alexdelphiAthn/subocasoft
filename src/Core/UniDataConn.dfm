object dmConn: TdmConn
  OnCreate = DataModuleCreate
  Height = 299
  Width = 506
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
    AfterConnect = conUniAfterConnect
    BeforeConnect = connBeforeConnect
    Left = 270
    Top = 150
    EncryptedPassword = 'A5FF9EFF92FF90FF8DFF9EFFCDFFCFFFCDFFCCFF'
  end
  object tmrKeepAlive: TTimer
    Enabled = False
    Interval = 1800
    Left = 368
    Top = 152
  end
end
