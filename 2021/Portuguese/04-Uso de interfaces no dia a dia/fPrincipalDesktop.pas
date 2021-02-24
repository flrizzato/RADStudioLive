unit fPrincipalDesktop;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmPrincipalDesktop = class(TForm)
    btnEmitirBoleto: TButton;
    btnAbrirGeradorBoleto: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAbrirGeradorBoletoClick(Sender: TObject);
    procedure btnEmitirBoletoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalDesktop: TfrmPrincipalDesktop;

implementation

uses
  uBoleto.Intf,
  uBoleto.Factory,
  fGeradorBoleto, uGeradorBoleto.Intf, uBoleto.Impl, uGeradorBoleto.Factory;

{$R *.fmx}

procedure TfrmPrincipalDesktop.btnAbrirGeradorBoletoClick(Sender: TObject);
begin
  TFrmGeradorBoleto.Create(Self).Show;
end;

procedure TfrmPrincipalDesktop.btnEmitirBoletoClick(Sender: TObject);
var
  lBoleto: IBoleto;
  lGeradorBoleto: IGeradorBoleto;
begin
  lBoleto := TBoleto.Create;

  lGeradorBoleto := TGeradorBoletoFactory.Criar;

  lBoleto.Cedente.Nome := 'Empresa ABC';
  lBoleto.Sacado.Nome := 'Radical';

  ShowMessage(lGeradorBoleto.GerarBoleto(lBoleto));
end;

procedure TfrmPrincipalDesktop.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
