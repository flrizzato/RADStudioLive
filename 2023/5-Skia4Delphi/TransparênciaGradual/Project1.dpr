program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  GlobalUseSkia := True;
  GlobalUseSkiaRasterWhenAvailable := False;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
