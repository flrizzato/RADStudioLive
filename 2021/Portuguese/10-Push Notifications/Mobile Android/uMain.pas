unit uMain;

interface

uses
  Data.Bind.Components,
  Data.Bind.ObjectScope,

  FMX.ActnList,
  FMX.Controls,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Memo,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  FMX.Memo.Types,

  {$IFDEF ANDROID}
    FMX.PushNotification.Android,
    FMX.Platform.Android,
    Androidapi.JNI.Os,
  {$ENDIF}

  System.Notification,
  System.DateUtils,

  System.Actions,
  System.Classes,
  System.JSON,
  System.Net.HTTPClient,
  System.PushNotification,
  System.SysUtils,
  System.Threading,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TForm1 = class(TForm)
    tbctrlMain: TTabControl;
    tbitemLogin: TTabItem;
    tbitemCadastro: TTabItem;
    tbitemNavegacao: TTabItem;
    recBackground: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtEmail: TEdit;
    edtSenha: TEdit;
    lytLogin: TLayout;
    recLogin: TRectangle;
    speLogin: TSpeedButton;
    lblLogin: TLabel;
    lytNovo: TLayout;
    recNovo: TRectangle;
    speNovo: TSpeedButton;
    lytFundoNovo: TLabel;
    Rectangle1: TRectangle;
    recBackNavega: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    edtCadNome: TEdit;
    Label6: TLabel;
    edtCadSenha: TEdit;
    Label7: TLabel;
    edtCadEmail: TEdit;
    lytCadBtnNovo: TLayout;
    lytCadBackNovo: TRectangle;
    speBtnGravar: TSpeedButton;
    bblGravar: TLabel;
    Label8: TLabel;
    lytToolbar: TLayout;
    lytBtnLeft: TLayout;
    pthLeft: TPath;
    speLeft: TSpeedButton;
    Layout3: TLayout;
    Layout4: TLayout;
    Path1: TPath;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    recPopup: TRectangle;
    lytBottomPropaganda: TLayout;
    Layout6: TLayout;
    lytBackPropaganda: TLayout;
    pthBackPropaganda: TPath;
    speBackPropaganda: TSpeedButton;
    lytProxPropaganda: TLayout;
    pthProxPropaganda: TPath;
    speProxPropaganda: TSpeedButton;
    lytTopPropaganda: TLayout;
    lytClosePropaganda: TLayout;
    pthClosePropaganda: TPath;
    speClosePropaganda: TSpeedButton;
    tabPropaganda: TTabControl;
    recBackPop: TRectangle;
    actPropaganda: TChangeTabAction;
    TabItem1: TTabItem;
    Label9: TLabel;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    MemoLog: TMemo;
    memMensagens: TMemo;
    tbiLog: TTabItem;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);

    procedure speLoginClick(Sender: TObject);

    procedure speNovoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure speLeftClick(Sender: TObject);
    procedure speBtnGravarClick(Sender: TObject);
    procedure speClosePropagandaClick(Sender: TObject);
    procedure speProxPropagandaClick(Sender: TObject);
    procedure speBackPropagandaClick(Sender: TObject);
    procedure recBackPopClick(Sender: TObject);
  private
    FPushService      : TPushService;
    FServiceConn      : TPushServiceConnection;
    FDeviceID         : string;
    FDeviceToken      : string;
    FMinhaNotificacao : TNotification;
    FMessage          : string;

    function  MonitorApp(AEventoApp: TApplicationEvent; AContext: TObject): Boolean;

    procedure MostrarBackGround;
    procedure OcultarBackGround;

    procedure MostrarPromocoes;
    procedure MostrarPopUp;
    procedure OcultarPopup;
    { Private declarations }
  public
    { Public declarations }
    procedure OnServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
    procedure OnReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);

    procedure OnIdle(Sender: TObject; var ADone: Boolean);
    procedure MudarAba(const ATabItem: TTabItem; Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses
  UntDMREST;

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
var
  EventosApp : IFMXApplicationEventService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, IInterface(EventosApp)) then
    EventosApp.SetApplicationEventHandler(MonitorApp);

  FPushService                       := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.FCM);
  FServiceConn                       := TPushServiceConnection.Create(FPushService);
  FServiceConn.Active                := True;
  FServiceConn.OnChange              := OnServiceConnectionChange;
  FServiceConn.OnReceiveNotification := OnReceiveNotificationEvent;

  FDeviceID                          := FPushService.DeviceIDValue[TPushService.TDeviceIDNames.DeviceID];

  MemoLog.Lines.Add('DeviceID: ' + FDeviceID);
  MemoLog.Lines.Add('Pronto para receber');

  Application.OnIdle     := OnIdle;
  OcultarBackGround;
  OcultarPopup;
end;

procedure TForm1.MudarAba(const ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

procedure TForm1.OnIdle(Sender: TObject; var ADone: Boolean);
begin
  if (DMREST.QryPromocoes.Active) and (not (DMREST.QryPromocoes.IsEmpty)) then
    MostrarPromocoes;
end;

procedure TForm1.OnReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
var
  LMensagemPush        : String;
  I                    : Integer;
  LCampoExtra          : string;
  LID                  : string;
begin
  LCampoExtra   := EmptyStr;
  try
    LMensagemPush := ServiceNotification.DataObject.ToString;
    for I := 0 to Pred(ServiceNotification.DataObject.Count) do
    begin
      //iOS
      //if ServiceNotification.DataKey.Equals('aps') then
      //begin
      //  if ServiceNotification.DataObject.Pairs[I].JsonString.Value.Equals('alert') then
      //    LMensagemPush := ServiceNotification.DataObject.Pairs[I].JsonValue.Value;
      //end;

    {$Region "Exemplo de JSON recebido por Push"}
    {
       "google.c.a.c_l":"asdfasdf",
       "google.c.a.udt":"0",
       "google.delivered_priority":"high",
       "google.ttl":"2419200",
       "google.original_priority":"high",
       "gcm.notification.e":"1",
       "prodID123":"41000",
       "google.c.a.c_id":"6658943683550717101",
       "google.c.a.ts":"1614085870",
       "gcm.notification.title":"asdfasdf",
       "gcm.n.e":"1",
       "from":"271332362079",
       "google.message_id":"0:1614085885088589%3aee76673aee7667",
       "gcm.notification.body":"asdfasdf",
       "google.c.a.e":"1",
       "google.c.sender.id":"271332362079",
       "gcm.notification.tag":"campaign_collapse_key_6658943683550717101",
       "campo_extra":"123456",
       "collapse_key":"com.embarcadero.RADLivePush"
    }
    {$EndRegion}

      //Android
      if ServiceNotification.DataKey.Equals('fcm') then
      begin
        if ServiceNotification.DataObject.Pairs[I].JsonString.Value.Equals('message') then
          LMensagemPush := ServiceNotification.DataObject.Pairs[I].JsonValue.Value;

        if ServiceNotification.DataObject.Pairs[I].JsonString.Value.Equals('campo_extra') then
          LCampoExtra := ServiceNotification.DataObject.Pairs[I].JsonValue.Value;

        if Pos('prodID', ServiceNotification.DataObject.Pairs[I].JsonString.Value) > 0 then
        begin
          LID := ServiceNotification.DataObject.GetValue<string>(ServiceNotification.DataObject.Pairs[I].JsonString.Value);
          if LCampoExtra.Equals(EmptyStr)
          then LCampoExtra := LID
          else LCampoExtra := LCampoExtra + ', ' + LID;
        end;
      end;
    end;

    if not (LCampoExtra.Equals(EmptyStr)) then
      DMREST.AtualizarPromocoes(LCampoExtra);

    memMensagens.Lines.Clear;
    memMensagens.Lines.Add(LMensagemPush);
    memMensagens.Lines.Add(LCampoExtra + ' : ' + LID);

  except on E:Exception do
    begin
      //Seu tratamento de erro
    end;
  end;
end;

procedure TForm1.OnServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
begin
  if TPushService.TChange.DeviceToken in PushChanges then
  begin
    {$IFDEF ANDROID}
      FPushService := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.FCM); //FCM
      FDeviceToken := FPushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
      MemoLog.Lines.Add(FDeviceToken);
    {$ENDIF}
  end;
end;

procedure TForm1.recBackPopClick(Sender: TObject);
begin
  OcultarPopup;
end;

procedure TForm1.MostrarPromocoes;
const
  tbItemName    = 'tbitem%4.4d';
  ImgName       = 'Img%4.4d';
  lblDescName   = 'lblDesc%4.4d';
  lblPrecoName  = 'lblPreco%4.4d';
var
  LTabItem   : TTabItem;
  LLblDesc   : TLabel;
  ImgFoto    : TImage;
  lblPreco   : TLabel;

  Indice     : Integer;
  I          : Integer;
  J          : Integer;
begin
  Application.OnIdle        := nil;
  tabPropaganda.TabPosition := TTabPosition.None;

  if (DMREST.QryPromocoes.Active) and (not (DMREST.QryPromocoes.IsEmpty)) then
  begin
    //Limpar a lista de TabItens
    for I := Pred(tabPropaganda.TabCount) downto 0 do
    begin
      tabPropaganda.Tabs[I].DisposeOf;
    end;

    DMREST.QryPromocoes.First;
    Indice := 0;
    while not DMREST.QryPromocoes.EOF do
    begin
      Inc(Indice);

      LTabItem               := TTabItem.Create(tabPropaganda);
      LTabItem.Parent        := tabPropaganda;
      LTabItem.Name          := Format(tbItemName, [Indice]);

      LLblDesc               := TLabel.Create(LTabItem);
      LLblDesc.Parent        := LTabItem;
      LLblDesc.Align         := TAlignLayout.Top;
      LLblDesc.Name          := Format(lblDescName, [Indice]);
      LLblDesc.Text          := DMREST.QryPromocoes.FieldByName('DESCRICAO').AsString;

      lblPreco               := TLabel.Create(LTabItem);
      lblPreco.Parent        := LTabItem;
      lblPreco.Align         := TAlignLayout.Bottom;
      lblPreco.Name          := Format(lblPrecoName, [Indice]);
      lblPreco.Text          := FormatFloat('R$ ###,###,###.##', DMREST.QryPromocoes.FieldByName('PRECO').AsFloat);

      ImgFoto                := TImage.Create(LTabItem);
      ImgFoto.Parent         := LTabItem;
      ImgFoto.Align          := TAlignLayout.Client;
      ImgFoto.Name           := Format(ImgName, [Indice]);
      ImgFoto.Margins.Bottom := 10;
      ImgFoto.Margins.Left   := 10;
      ImgFoto.Margins.Right  := 10;
      ImgFoto.Margins.Top    := 10;

      ImgFoto.Bitmap.Assign(DMREST.QryPromocoesFOTO);

      DMREST.QryPromocoes.Next;
    end;

    tabPropaganda.First();
    MostrarPopUp;
  end;

end;

procedure TForm1.MostrarPopUp;
begin
  MostrarBackGround;
  recPopup.Align := TAlignLayout.Center;
  recPopup.Visible := True;
  recPopup.BringToFront;
  recPopup.AnimateFloat('OPACITY', 1);
end;

procedure TForm1.OcultarPopup;
begin
  recPopup.AnimateFloat('OPACITY', 0);
  recPopup.Visible := False;
  OcultarBackGround;

  DMREST.QryPromocoes.Active := False;
  Application.OnIdle := OnIdle;
end;

function TForm1.MonitorApp(AEventoApp: TApplicationEvent; AContext: TObject): Boolean;
begin
  if (AEventoApp = TApplicationEvent.BecameActive) then
  begin
    if not FMessage.Equals(EmptyStr) then
      memMensagens.Lines.Add('Mensagem Nova: ' + FMessage);
  end;
end;

procedure TForm1.MostrarBackGround;
begin
  recBackPop.Visible := True;
  recBackPop.BringToFront;
  recBackPop.AnimateFloat('OPACITY', 0.6);
end;

procedure TForm1.OcultarBackGround;
begin
  recBackPop.AnimateFloat('OPACITY', 0);
  recBackPop.Visible := False;
end;

procedure TForm1.speBackPropagandaClick(Sender: TObject);
begin
  tabPropaganda.Previous();
end;

procedure TForm1.speBtnGravarClick(Sender: TObject);
begin
  //MudarAba(tbitemNavegacao, Sender);

  DMREST.RegistrarUsuario(
    edtCadNome.Text,
    edtCadEmail.Text,
    edtCadSenha.Text);
end;

procedure TForm1.speClosePropagandaClick(Sender: TObject);
begin
  OcultarPopup;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  MudarAba(tbitemLogin, Sender);
end;

procedure TForm1.speLeftClick(Sender: TObject);
begin
  MudarAba(tbitemLogin, Sender);
end;

procedure TForm1.speLoginClick(Sender: TObject);
begin
  if DMREST.Login(edtEmail.Text, edtSenha.Text) then
  begin
    edtEmail.Text := EmptyStr;
    edtSenha.Text := EmptyStr;
    MudarAba(tbitemNavegacao, Sender);
  end
  else
    ShowMessage('Usuário ou Senha inválido!')
end;

procedure TForm1.speNovoClick(Sender: TObject);
begin
  edtCadNome.Text  := EmptyStr;
  edtCadEmail.Text := EmptyStr;
  edtCadSenha.Text := EmptyStr;
  MudarAba(tbitemCadastro, Sender);
end;

procedure TForm1.speProxPropagandaClick(Sender: TObject);
begin
  tabPropaganda.Next();
end;

end.
