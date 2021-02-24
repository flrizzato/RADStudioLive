object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
  Caption = 'Unigui'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Ol'#225' Mundo'
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object UniEdit1: TUniEdit
    Left = 16
    Top = 56
    Width = 121
    Hint = ''
    Text = '1010'
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 143
    Top = 56
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = UniButton2Click
  end
end
