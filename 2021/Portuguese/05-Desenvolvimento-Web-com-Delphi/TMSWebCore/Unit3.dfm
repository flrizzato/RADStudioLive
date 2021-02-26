object Form3: TForm3
  Width = 640
  Height = 480
  object WebButton1: TWebButton
    Left = 16
    Top = 16
    Width = 96
    Height = 25
    Caption = 'Ol'#225' Mundo'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object WebEdit1: TWebEdit
    Left = 16
    Top = 64
    Width = 121
    Height = 22
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    Text = '1010'
    WidthPercent = 100.000000000000000000
  end
  object WebButton2: TWebButton
    Left = 143
    Top = 64
    Width = 96
    Height = 25
    Caption = 'Pesquisar'
    ChildOrder = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton2Click
  end
  object WebHttpRequest1: TWebHttpRequest
    Left = 296
    Top = 72
  end
end
