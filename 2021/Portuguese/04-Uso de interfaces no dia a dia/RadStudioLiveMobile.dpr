program RadStudioLiveMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  fGeradorBoleto in 'fGeradorBoleto.pas' {frmGeradorBoleto},
  uGeradorBoletoAPIWeb.Impl in 'uGeradorBoletoAPIWeb.Impl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGeradorBoleto, frmGeradorBoleto);
  Application.Run;
end.
