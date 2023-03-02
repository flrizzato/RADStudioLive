unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts;

type
  TVertScrollBox = class(FMX.Layouts.TVertScrollBox)
  protected
    procedure PaintChildren; override;
  end;

  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    CheckBox1: TCheckBox;
    Button8: TButton;
    Button9: TButton;
    StyleBook1: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  Skia, Skia.FMX.Graphics;

procedure TVertScrollBox.PaintChildren;
begin
  if (Canvas is TSkCanvasCustom) and Form1.CheckBox1.IsChecked then
  begin
    var LCanvas: ISkCanvas := TSkCanvasCustom(Canvas).Canvas;

    var LShader := TSkShader.MakeGradientLinear(PointF(0, 0), PointF(0, Height), [TAlphaCOlors.Black, TAlphaColors.Null], [0.9, 0.97]);
    var LPaint: ISkPaint := TSkPaint.Create;
    LPaint.ImageFilter := TSkImageFilter.MakeBlend(TSkBlendMode.SrcIn, TSkImageFilter.MakeShader(LShader, False));
    LCanvas.SaveLayer(LPaint);
    try
      inherited;
    finally
      LCanvas.Restore;
    end;
  end
  else
    inherited;
end;

end.
