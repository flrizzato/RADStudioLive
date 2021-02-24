unit uPrincipal;

interface

uses
  IdBaseComponent,
  IdComponent,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdTCPClient,
  IdTCPConnection,

  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Memo,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.StdCtrls,
  FMX.Types,

  System.Classes,
  System.JSON,
  System.Net.HttpClient,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memoToken: TMemo;
    memoMensagem: TMemo;
    memoLog: TMemo;
    btnAndroid: TButton;
    Label4: TLabel;
    lstListaProdutos: TListBox;
    Button1: TButton;
    Button5: TButton;
    edtProdutoID: TEdit;
    procedure btnAndroidClick(Sender: TObject);
    procedure IdSSLIOHandlerSocketOpenSSL1GetPassword(var Password: string);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    function HexToAscii(const AStrHexa: AnsiString): AnsiString;
    function GetMessage(const ADeviceToken, APayLoad: AnsiString): AnsiString;
    { Private declarations }
  public
    { Public declarations }
    Badge: integer;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btnAndroidClick(Sender: TObject);
var
  vHttpClient     : THttpClient;
  v_JSON          : TJSONObject;
  v_JsonData      : TJSONObject;
  v_RegisterIDs   : TJSONArray;
  v_Data          : TStringStream;
  v_Response      : TStringStream;

  Token           : String;
  CodigoProjeto   : String;
  API             : String;
  Link            : String;

  RegisterIDs     : TJSONArray;

  I               : Integer;
begin
  //
  Token         := memoToken.Lines.Text;
  CodigoProjeto := '';
  API           := '';
  //Link          := 'https://android.googleapis.com/gcm/send'; //cgm
  Link          := 'https://fcm.googleapis.com/fcm/send';

  try
    RegisterIDs := TJSONArray.Create;
    RegisterIDs.Add(Token);

    v_JsonData  := TJSONObject.Create;
    v_JsonData.AddPair('id', CodigoProjeto);                //obrigatório
    v_JsonData.AddPair('message', memoMensagem.Lines.Text); //obrigatório

    for I := 0 to Pred(lstListaProdutos.Items.Count) do
    begin
      v_JsonData.AddPair(Format('prodID%1.1d', [lstListaProdutos.Items[I].ToInteger]), lstListaProdutos.Items[I]);
    end;

    v_JSON      := TJSONObject.Create;
    v_JSON.AddPair('registration_ids', RegisterIDs);
    v_JSON.AddPair('priority', 'high'); //Para o novo formato e recebimento com ele fechado
    v_JSON.AddPair('data', v_JsonData);

    vHttpClient := THTTPClient.Create;
    vHttpClient.ContentType := 'application/json';
    vHttpClient.CustomHeaders['Authorization'] := 'key=' + API;

    memoLog.Lines.Add('---------------------------');
    memoLog.Lines.Add(v_JSON.ToString);

    //v_Data := TStringStream.Create(v_JSON.ToString);
    v_Data := TStringStream.Create(v_JSON.ToString, TEncoding.UTF8);
    v_Data.Position := 0;

    v_Response := TStringStream.Create;

    //Envio do Push
    vHttpClient.Post(Link, v_Data, v_Response);
    v_Response.Position := 0;

    memoLog.Lines.Add(v_Response.DataString);
  finally

  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  lstListaProdutos.Items.Add(edtProdutoID.Text);
end;

function TForm2.HexToAscii(const AStrHexa : AnsiString): AnsiString;
var
  strLen : Integer;
  I: Integer;
begin
  strLen := Length(AStrHexa) div 2;
  Result := '';
  for I := 0 to strLen -1 do
  begin
    Result := Result + AnsiChar(Byte(StrToInt('$'+Copy(AStrHexa, (I*2)+1, 2))));
  end;
end;

procedure TForm2.IdSSLIOHandlerSocketOpenSSL1GetPassword(var Password: string);
begin
  Password := '';
end;

function TForm2.GetMessage(const ADeviceToken : AnsiString; const APayLoad : AnsiString): AnsiString;
begin
  Result := AnsiChar(0) + AnsiChar(0) + AnsiChar(32); // Cabecera del Mensaje
  Result := Result + HexToAscii(ADeviceToken) + AnsiChar(0) + AnsiChar(Length(APayLoad)) + APayLoad;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  lstListaProdutos.Items.Clear;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Badge := 1;
end;

end.
