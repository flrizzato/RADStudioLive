object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 208
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 16
    Top = 80
    Width = 54
    Height = 23
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 16
    Top = 24
    Width = 105
    Height = 33
    Caption = 'Normal'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 128
    Width = 343
    Height = 31
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 127
    Top = 24
    Width = 113
    Height = 33
    Caption = 'Task run'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 246
    Top = 24
    Width = 113
    Height = 33
    Caption = 'Task start'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ProgressBar1: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 184
    Width = 494
    Height = 21
    Align = alBottom
    TabOrder = 4
  end
end
