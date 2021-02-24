program TMSWebCore;

uses
  Vcl.Forms,
  WEBLib.Forms,
  Unit3 in 'Unit3.pas' {Form3: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
