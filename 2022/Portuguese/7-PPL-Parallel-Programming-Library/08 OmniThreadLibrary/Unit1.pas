unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btnAsync: TButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Edit1: TEdit;
    procedure btnAsyncClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  OtlParallel, OtlTaskControl;

{$R *.dfm}

procedure TForm1.btnAsyncClick(Sender: TObject);
begin
  btnAsync.Enabled := False;
  ProgressBar1.Style := TProgressBarStyle.pbstMarquee;
  Parallel.Async(
    procedure
    begin
      // Faz algo lento
      Sleep(5000);
    end, Parallel.TaskConfig.OnTerminated(
    procedure(const task: IOmniTaskControl)
    begin
      Label1.Caption := DateTimeToStr(Now);
      ProgressBar1.Style := TProgressBarStyle.pbstNormal;
      btnAsync.Enabled := True;
    end));
end;

end.
