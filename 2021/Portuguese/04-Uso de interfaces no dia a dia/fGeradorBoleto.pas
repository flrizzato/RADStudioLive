unit fGeradorBoleto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls;

type
  TfrmGeradorBoleto = class(TForm)
    edtCedente: TEdit;
    lblCedente: TLabel;
    edtSacado: TEdit;
    lblSacado: TLabel;
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeradorBoleto: TfrmGeradorBoleto;

implementation

{$R *.fmx}

uses
  uBoleto.Intf,
  uBoleto.Factory,
  uGeradorBoleto.Intf,
  uContainerDefault;

procedure TfrmGeradorBoleto.btnGerarClick(Sender: TObject);
var
  lBoleto: IBoleto;
begin
  lBoleto := TFactoryBoleto.Criar;

  lBoleto.Cedente.Nome := edtCedente.Text;
  lBoleto.Sacado.Nome := edtSacado.Text;

  ShowMessage(TContainer.Default.Get<IGeradorBoleto>.GerarBoleto(lBoleto));
end;

procedure TfrmGeradorBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
