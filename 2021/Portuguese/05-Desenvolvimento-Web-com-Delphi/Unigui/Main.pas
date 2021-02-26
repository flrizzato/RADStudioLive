unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniEdit, uniGUIBaseClasses,
  uniButton;

type
  TMainForm = class(TUniForm)
    UniButton1: TUniButton;
    UniEdit1: TUniEdit;
    UniButton2: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uDmPesquisa;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
  ShowToast('Olá Mundo!');
end;

procedure TMainForm.UniButton2Click(Sender: TObject);
begin
  try
    var LNome: String := TdmPesquisa.ObterNomePeloId(StrToInt(UniEdit1.Text));
    ShowMessage(LNome);
  except on E: Exception do
    ShowMessageN('Deu ruim: ' + E.Message);
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
