program Intraweb;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWStart,
  Unit2 in 'Unit2.pas' {IWForm2: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  uDmPesquisa in '..\Comum\uDmPesquisa.pas' {dmPesquisa: TDataModule};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
