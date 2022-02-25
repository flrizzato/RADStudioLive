object FiredacDemoResource1: TFiredacDemoResource1
  OldCreateOrder = False
  Height = 454
  Width = 772
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 30
    Top = 16
  end
  object qryCOUNTRY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from COUNTRY')
    Left = 130
    Top = 16
  end
  object dsrCOUNTRY: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCOUNTRY
    Left = 130
    Top = 64
  end
  object qryCUSTOMER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CUSTOMER')
    Left = 230
    Top = 16
  end
  object dsrCUSTOMER: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCUSTOMER
    Left = 230
    Top = 64
  end
  object qryDEPARTMENT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from DEPARTMENT')
    Left = 330
    Top = 16
  end
  object dsrDEPARTMENT: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryDEPARTMENT
    Left = 330
    Top = 64
  end
  object qryEMPLOYEE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from EMPLOYEE')
    Left = 430
    Top = 16
  end
  object dsrEMPLOYEE: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryEMPLOYEE
    Left = 430
    Top = 64
  end
  object qryEMPLOYEE_PROJECT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from EMPLOYEE_PROJECT')
    Left = 530
    Top = 16
  end
  object dsrEMPLOYEE_PROJECT: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryEMPLOYEE_PROJECT
    Left = 530
    Top = 64
  end
  object qryJOB: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from JOB')
    Left = 130
    Top = 112
  end
  object dsrJOB: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryJOB
    Left = 130
    Top = 160
  end
  object qryPHONE_LIST: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from PHONE_LIST')
    Left = 230
    Top = 112
  end
  object dsrPHONE_LIST: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryPHONE_LIST
    Left = 230
    Top = 160
  end
  object qryPROJECT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from PROJECT')
    Left = 330
    Top = 112
  end
  object dsrPROJECT: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryPROJECT
    Left = 330
    Top = 160
  end
  object qryPROJ_DEPT_BUDGET: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from PROJ_DEPT_BUDGET')
    Left = 430
    Top = 112
  end
  object dsrPROJ_DEPT_BUDGET: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryPROJ_DEPT_BUDGET
    Left = 430
    Top = 160
  end
  object qrySALARY_HISTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from SALARY_HISTORY')
    Left = 530
    Top = 112
  end
  object dsrSALARY_HISTORY: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrySALARY_HISTORY
    Left = 530
    Top = 160
  end
  object qrySALES: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from SALES')
    Left = 130
    Top = 208
  end
  object dsrSALES: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrySALES
    Left = 130
    Top = 256
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 448
    Top = 272
  end
end
