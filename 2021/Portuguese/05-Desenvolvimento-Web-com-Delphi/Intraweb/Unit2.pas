unit Unit2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompButton;

type
  TIWForm2 = class(TIWAppForm)
    IWButton1: TIWButton;
    IWEdit1: TIWEdit;
    IWButton2: TIWButton;
    procedure IWButton1Click(Sender: TObject);
    procedure IWButton2AsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses uDmPesquisa;


procedure TIWForm2.IWButton1Click(Sender: TObject);
begin
  WebApplication.ShowNotification('Olá Mundo!');
end;

procedure TIWForm2.IWButton2AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  try
    var LNome: String := TdmPesquisa.ObterNomePeloId(StrToInt(IWEdit1.Text));
    WebApplication.ShowMessage(LNome);
  except on E: Exception do
    WebApplication.ShowAlert('Deu ruim: ' + E.Message);
  end;
end;

initialization
  TIWForm2.SetAsMainForm;

end.
