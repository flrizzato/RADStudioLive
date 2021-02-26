unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1waOlaAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1waPesquisaAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    function GetBotaoVoltar: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDmPesquisa;

{$R *.dfm}

function TWebModule1.GetBotaoVoltar: String;
begin
  result := '<p><br /><a href="javascript:history.back();">Voltar</a></p>';
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body><h3>Web Server Application</h3>' +

    '<p><a href="/olamundo">Olá mundo!</a></p>' +
    '<p><form action="/pesquisa" method="post">' +
    '<input type="text" name="edit1" value="1010">&nbsp' +
    '<input type="submit" value="Pesquisar">' +
    '</form></p>' +

    '</body></html>';
end;

procedure TWebModule1.WebModule1waOlaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<h1>Ola mundo!</h1>' + GetBotaoVoltar;
end;

procedure TWebModule1.WebModule1waPesquisaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  try
    var LNome: String := TdmPesquisa.ObterNomePeloId(StrToInt(Request.ContentFields.Values['edit1']));
    Response.Content := '<p><b>Encontrei: </b>' + LNome + '</p>';
  except on E: Exception do
    Response.Content := '<p><font color="red">Deu ruim:</font> ' + E.Message + '</p>';
  end;

  Response.Content := Response.Content + GetBotaoVoltar;
end;

end.
