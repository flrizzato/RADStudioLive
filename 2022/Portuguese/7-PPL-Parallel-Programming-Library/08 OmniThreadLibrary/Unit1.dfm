object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 257
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 25
  object Label1: TLabel
    Left = 16
    Top = 80
    Width = 55
    Height = 25
    Caption = 'Label1'
  end
  object btnAsync: TButton
    Left = 16
    Top = 24
    Width = 121
    Height = 41
    Caption = 'Async'
    TabOrder = 0
    OnClick = btnAsyncClick
  end
  object ProgressBar1: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 233
    Width = 618
    Height = 21
    Align = alBottom
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 16
    Top = 128
    Width = 343
    Height = 33
    TabOrder = 2
    Text = 'Edit1'
  end
end
