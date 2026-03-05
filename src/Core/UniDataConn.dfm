object dmConn: TdmConn
  OnCreate = DataModuleCreate
  Height = 374
  Width = 633
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
    AfterConnect = conUniAfterConnect
    BeforeConnect = connBeforeConnect
    OnError = conUniError
    Left = 338
    Top = 188
    EncryptedPassword = 'A5FF9EFF92FF90FF8DFF9EFFCDFFCFFFCDFFCCFF'
  end
  object tmrKeepAlive: TTimer
    Enabled = False
    Interval = 1800
    Left = 460
    Top = 190
  end
end
