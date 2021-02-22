object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Manejo de Usuarios y Grupos RAD Server'
  ClientHeight = 311
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 592
    Height = 33
    Align = alTop
    Caption = 'Manejo de Usuarios y Grupos - RAD Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 509
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 592
    Height = 278
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Usuarios'
      object Label2: TLabel
        Left = 272
        Top = 9
        Width = 93
        Height = 13
        Caption = 'Listado de Usuarios'
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 9
        Width = 246
        Height = 209
        Caption = ' Datos del Usuario '
        TabOrder = 0
        object edtUserName: TLabeledEdit
          Left = 16
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'edtUserName'
          TabOrder = 0
        end
        object edtPassword: TLabeledEdit
          Left = 16
          Top = 88
          Width = 121
          Height = 21
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'edtUserName'
          TabOrder = 1
        end
        object Button1: TButton
          Left = 160
          Top = 38
          Width = 75
          Height = 25
          Caption = 'Crear'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
      object ListBox1: TListBox
        Left = 272
        Top = 28
        Width = 201
        Height = 189
        ItemHeight = 13
        TabOrder = 1
      end
      object Button2: TButton
        Left = 488
        Top = 28
        Width = 75
        Height = 25
        Caption = 'Usuarios'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Grupos'
      ImageIndex = 1
      object Label3: TLabel
        Left = 216
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Listado de Grupos'
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 16
        Width = 169
        Height = 193
        Caption = ' Datos del Grupo'
        TabOrder = 0
        object edtGroupName: TLabeledEdit
          Left = 16
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'Nombre:'
          TabOrder = 0
        end
        object Button3: TButton
          Left = 62
          Top = 80
          Width = 75
          Height = 25
          Caption = 'Crear'
          TabOrder = 1
          OnClick = Button3Click
        end
      end
      object ListBox2: TListBox
        Left = 216
        Top = 35
        Width = 193
        Height = 174
        ItemHeight = 13
        TabOrder = 1
      end
      object Button4: TButton
        Left = 432
        Top = 35
        Width = 75
        Height = 25
        Caption = 'Grupos'
        TabOrder = 2
        OnClick = Button4Click
      end
    end
  end
  object EMSProvider1: TEMSProvider
    ApiVersion = '2'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 520
    Top = 152
  end
  object BackendAuth1: TBackendAuth
    Provider = EMSProvider1
    UserName = 'test'
    Password = 'testpass'
    LoginPrompt = False
    UserDetails = <>
    DefaultAuthentication = Application
    Left = 440
    Top = 168
  end
  object BackendUsers1: TBackendUsers
    Provider = EMSProvider1
    Auth = BackendAuth1
    Left = 48
    Top = 192
  end
  object BackendQueryUsers: TBackendQuery
    Provider = EMSProvider1
    Auth = BackendAuth1
    BackendService = 'Users'
    Left = 48
    Top = 248
  end
  object BackendGroups1: TBackendGroups
    Provider = EMSProvider1
    Auth = BackendAuth1
    Left = 288
    Top = 160
  end
  object BackendQueryGroups: TBackendQuery
    Provider = EMSProvider1
    Auth = BackendAuth1
    BackendService = 'Groups'
    Left = 288
    Top = 216
  end
end
