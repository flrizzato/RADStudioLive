program RADLivePush;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form1},
  UntDMREST in 'UntDMREST.pas' {DMREST: TDataModule},
  Constantes in '..\comum\Constantes.pas',
  SmartPoint in '..\comum\SmartPoint.pas',
  Utils.DataSet.JSON.Helper in '..\comum\Utils.DataSet.JSON.Helper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMREST, DMREST);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
