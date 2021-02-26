unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDmPesquisa;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('Olá Mundo!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  try
    var LNome: String := TdmPesquisa.ObterNomePeloId(StrToInt(Edit1.Text));
    ShowMessage(LNome);
  except on E: Exception do
    ShowMessage('Deu ruim: ' + E.Message);
  end;
end;

end.
