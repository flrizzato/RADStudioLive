unit UntDMREST;

interface

uses
  SmartPoint,

  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.DB,

  FMX.Dialogs,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.UI,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.FMXUI.Wait,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.Stan.StorageBin,
  FireDAC.UI.Intf,

  REST.Backend.BindSource,
  REST.Backend.EMSProvider,
  REST.Backend.EMSPushDevice,
  REST.Backend.PushDevice,
  REST.Backend.PushTypes,
  REST.Client,
  REST.Response.Adapter,
  REST.Types,

  System.Classes,
  System.IOUtils,
  System.JSON,
  System.PushNotification,
  System.SysUtils,
  System.Threading,
  System.Types,
  System.UITypes,
  System.Variants,

  Utils.DataSet.JSON.Helper;

type
  TDMREST = class(TDataModule)
    rstClient: TRESTClient;
    rstRequest: TRESTRequest;
    rstResponse: TRESTResponse;
    rstAdapter: TRESTResponseDataSetAdapter;
    memREST: TFDMemTable;
    PushEvents1: TPushEvents;
    EMSProvider1: TEMSProvider;
    MemTemp: TFDMemTable;
    MemTempnome: TStringField;
    MemTempemail: TStringField;
    MemTempsenha: TStringField;
    MemTemptipo_dispositivo: TStringField;
    MemTemptoken: TStringField;
    fdConn: TFDConnection;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QryPromocoes: TFDQuery;
    QryPromocoesid: TIntegerField;
    QryPromocoesdescricao: TStringField;
    QryPromocoespreco: TFloatField;
    QryPromocoesfoto: TBlobField;
    procedure fdConnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    GToken             : string;
    FPushService       : TPushService;
    FServiceConnection : TPushServiceConnection;

    function Execute(const AServerMethod, AColecaoMetodo: string; AElementos: TStrings): Boolean;overload;
    function Execute(const AServerMethod, AColecaoMetodo: string; AElementos: TStrings;
      AConteudo: TJSONArray;
      ARequestMethod: TRESTRequestMethod): Boolean;overload;

    procedure ClearToDefaults;

  public
    { Public declarations }
    function  RegistrarUsuario (const ANome, AEmail, ASenha: string): Boolean;
    procedure AtualizarPromocoes(AExtraFields: string);

    function  Login(const AEmail, ASenha: string): Boolean;

    property  PushService       : TPushService           read FPushService       write FPushService;
    property  ServiceConnection : TPushServiceConnection read fServiceConnection write FServiceConnection;
  end;

var
  DMREST: TDMREST;

implementation

uses
  Constantes;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDMREST }

function TDMREST.Execute(const AServerMethod, AColecaoMetodo: string;
  AElementos: TStrings; AConteudo: TJSONArray;
  ARequestMethod: TRESTRequestMethod): Boolean;
var
  I       : integer;
  LParams : string;
begin
  //
  Result := False;
  try
    ClearToDefaults; //Limpar e ativar os padrões dos Componentes

    memREST.Active := False;

    //RESTClient
    rstClient.BaseURL := Format('%s%s', [C_BaseURL, AServerMethod]);

    //RESTRequest
    rstRequest.Method := ARequestMethod;

    //{chave}{valor}
    //usuario/adriano
    //senha/123456
    if (AElementos <> nil) and (AElementos.Count > 0) then
    begin
      for I := 0 to Pred(AElementos.Count) do
      begin
        rstRequest.Params.AddItem(
          AElementos.Names[I],
          AElementos.ValueFromIndex[I],
          TRESTRequestParameterKind.pkURLSEGMENT
        );
        if LParams.Equals(EmptyStr)
        then LParams := LParams +       '{' + AElementos.Names[I] + '}'
        else LParams := LParams + '/' + '{' + AElementos.Names[I] + '}';
      end;
      rstRequest.Resource := Format('%s/%s', [AColecaoMetodo, LParams]);
    end
    else
      rstRequest.Resource := AColecaoMetodo;

    rstRequest.Body.Add(AConteudo.ToString, ContentTypeFromString('application/json'));

    rstRequest.Execute;

    Result := True;
  except on E:Exception do
    begin
      Result := False;
      raise Exception.Create('Ocorreu um erro com o servidor. ' + E.Message);
    end;
  end;

end;

function TDMREST.Execute(const AServerMethod, AColecaoMetodo: string;
  AElementos: TStrings): Boolean;
var
  I       : integer;
  LParams : string;
begin
  //
  Result := False;
  try
    ClearToDefaults; //Limpar e ativar os padrões dos Componentes

    memREST.Active := False;

    //RESTClient
    rstClient.BaseURL := Format('%s%s', [C_BaseURL, AServerMethod]);

    //{chave}{valor}
    //usuario/adriano
    //senha/123456
    if (AElementos <> nil) and (AElementos.Count > 0) then
    begin
      for I := 0 to Pred(AElementos.Count) do
      begin
        rstRequest.Params.AddItem(
          AElementos.Names[I],
          AElementos.ValueFromIndex[I],
          TRESTRequestParameterKind.pkURLSEGMENT
        );
        if LParams.Equals(EmptyStr)
        then LParams := LParams +       '{' + AElementos.Names[I] + '}'
        else LParams := LParams + '/' + '{' + AElementos.Names[I] + '}';
      end;
      rstRequest.Resource := Format('%s/%s', [AColecaoMetodo, LParams]);
    end
    else
      rstRequest.Resource := AColecaoMetodo;

    rstRequest.Execute;

    Result := True;
  except on E:Exception do
    begin
      Result := False;
      raise Exception.Create('Ocorreu um erro com o servidor. ' + E.Message);
    end;
  end;
end;

procedure TDMREST.fdConnBeforeConnect(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
    fdConn.Params.Values['Database'] := 'D:\Cursos\T001-Push-Notifications\Módulo 6 - Final\Mobile\database\Promocoes.sqlite';
  {$ELSE}
    fdConn.Params.Values['OpenMode'] := 'ReadWrite';
    fdConn.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'Promocoes.sqlite');
  {$ENDIF}
end;

function TDMREST.Login(const AEmail, ASenha: string): Boolean;
var
  LParams : TSmartPointer<TStringList>;
begin
  try
    LParams.Value.AddPair('email', AEmail);
    LParams.Value.AddPair('senha', ASenha);
    Result := Execute(C_ServicoPush, C_Login, LParams) and (rstResponse.StatusCode = 201);
  finally
  end;
end;

function TDMREST.RegistrarUsuario(const ANome, AEmail, ASenha: string): Boolean;
var
  AConteudo: TJSONArray;
begin
  try
    MemTemp.Active := False;
    MemTemp.Active := True;
    MemTemp.EmptyDataSet;
    MemTemp.Append;
    MemTempnome.AsString  := ANome;
    MemTempemail.AsString := AEmail;
    MemTempsenha.AsString := ASenha;
    {$IFDEF ANDROID}
      MemTemptipo_dispositivo.AsString := 'ANDROID';
    {$ENDIF}

    {$IFDEF IOS}
      MemTemptipo_dispositivo.AsString := 'IOS';
    {$ENDIF}

    MemTemptoken.AsString := GToken;

    MemTemp.Post;
    AConteudo := MemTemp.DatasetToJson();

    if Execute(C_ServicoPush, C_Usuarios, nil, AConteudo, rmPost) then
    begin
      //Ação
      Result := True;
    end
    else
      Result := False;
  except on E:Exception do
    begin

    end;
  end;
end;

procedure TDMREST.AtualizarPromocoes(AExtraFields: string);
const
  _SQL = 'SELECT * FROM PRODUTOS WHERE ID IN (%s)';
begin
  //Conta := 0;
  try
    QryPromocoes.Active := False;
    QryPromocoes.SQL.Clear;
    QryPromocoes.SQL.Text := Format(_SQL, [AExtraFields]);
    QryPromocoes.Active := True;
  except on E:Exception do
    begin

    end;
  end;
end;

procedure TDMREST.ClearToDefaults;
begin
  rstRequest.ResetToDefaults;
  rstClient.ResetToDefaults;
  rstResponse.ResetToDefaults;
end;

end.
