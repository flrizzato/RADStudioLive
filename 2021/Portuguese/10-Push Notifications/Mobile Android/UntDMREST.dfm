object DMREST: TDMREST
  OldCreateOrder = False
  Height = 441
  Width = 712
  object rstClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/TSmServicosPush/TesteServer'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 88
  end
  object rstRequest: TRESTRequest
    Client = rstClient
    Params = <>
    Response = rstResponse
    SynchronizedEvents = False
    Left = 104
    Top = 24
  end
  object rstResponse: TRESTResponse
    ContentType = 'text/html'
    Left = 160
    Top = 88
  end
  object rstAdapter: TRESTResponseDataSetAdapter
    Dataset = memREST
    FieldDefs = <>
    Response = rstResponse
    Left = 104
    Top = 144
  end
  object memREST: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 104
    Top = 208
  end
  object PushEvents1: TPushEvents
    Provider = EMSProvider1
    AutoActivate = False
    AutoRegisterDevice = False
    Left = 312
    Top = 24
  end
  object EMSProvider1: TEMSProvider
    AndroidPush.GCMAppID = '271332362079'
    ApiVersion = '2'
    URLPort = 0
    Left = 392
    Top = 24
  end
  object MemTemp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 392
    Top = 120
    object MemTempnome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object MemTempemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object MemTempsenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
    object MemTemptipo_dispositivo: TStringField
      FieldName = 'tipo_dispositivo'
      Size = 10
    end
    object MemTemptoken: TStringField
      FieldName = 'token'
      Size = 500
    end
  end
  object fdConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\adrianosantos\Downloads\RAD Studio Live\modulo' +
        '6-final\Mobile\database\Promocoes.sqlite'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = fdConnBeforeConnect
    Left = 104
    Top = 296
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 392
    Top = 304
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 536
    Top = 304
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 544
    Top = 368
  end
  object QryPromocoes: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * FROM PRODUTOS WHERE 1=2')
    Left = 104
    Top = 360
    object QryPromocoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object QryPromocoesdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object QryPromocoespreco: TFloatField
      FieldName = 'preco'
      Origin = 'preco'
    end
    object QryPromocoesfoto: TBlobField
      FieldName = 'foto'
      Origin = 'foto'
    end
  end
end
