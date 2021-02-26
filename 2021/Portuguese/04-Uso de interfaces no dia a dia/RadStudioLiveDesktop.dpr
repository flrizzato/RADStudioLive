program RadStudioLiveDesktop;

uses
  System.StartUpCopy,
  FMX.Forms,
  fPrincipalDesktop in 'fPrincipalDesktop.pas' {frmPrincipalDesktop},
  uBoleto.Intf in 'uBoleto.Intf.pas',
  uBoleto.Impl in 'uBoleto.Impl.pas',
  uBoleto.Factory in 'uBoleto.Factory.pas',
  uContainerDefault in 'uContainerDefault.pas',
  fGeradorBoleto in 'fGeradorBoleto.pas' {frmGeradorBoleto},
  uGeradorBoleto.Intf in 'uGeradorBoleto.Intf.pas',
  uGeradorBoletoACBr in 'uGeradorBoletoACBr.pas',
  uGeradorBoleto.Factory in 'uGeradorBoleto.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalDesktop, frmPrincipalDesktop);
  Application.CreateForm(TfrmGeradorBoleto, frmGeradorBoleto);
  Application.Run;
end.
