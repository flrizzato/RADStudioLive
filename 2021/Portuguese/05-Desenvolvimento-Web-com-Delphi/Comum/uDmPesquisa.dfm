object dmPesquisa: TdmPesquisa
  OldCreateOrder = False
  Height = 318
  Width = 457
  object con: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\21.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object qry: TFDQuery
    Connection = con
    SQL.Strings = (
      'select * from customer where cust_no = :cust_no')
    Left = 128
    Top = 32
    ParamData = <
      item
        Name = 'CUST_NO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 232
    Top = 32
  end
end
