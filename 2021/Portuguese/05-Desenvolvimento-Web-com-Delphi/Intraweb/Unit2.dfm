object IWForm2: TIWForm2
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWButton1: TIWButton
    Left = 24
    Top = 24
    Width = 120
    Height = 30
    Caption = 'Ol'#225' Mundo!'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    OnClick = IWButton1Click
  end
  object IWEdit1: TIWEdit
    Left = 24
    Top = 80
    Width = 200
    Height = 32
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    Text = '1010'
  end
  object IWButton2: TIWButton
    Left = 240
    Top = 82
    Width = 120
    Height = 30
    Caption = 'Pesquisar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton2'
    OnAsyncClick = IWButton2AsyncClick
  end
end
