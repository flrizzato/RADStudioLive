unit Unit3;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls,
  WEBLib.REST, WEBLib.JSON;

type
  TForm3 = class(TWebForm)
    WebButton1: TWebButton;
    WebEdit1: TWebEdit;
    WebButton2: TWebButton;
    WebHttpRequest1: TWebHttpRequest;
    procedure WebButton1Click(Sender: TObject);
    procedure WebButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.WebButton1Click(Sender: TObject);
begin
  ShowMessage('Olá Mundo!');
end;

procedure TForm3.WebButton2Click(Sender: TObject);
begin
  WebHttpRequest1.URL := 'http://localhost:8080/customers/' + WebEdit1.Text;
  WebHttpRequest1.Execute(

      procedure(AResponse: string; AReq: TJSXMLHttpRequest)
      var
        js: TJSON;
        jo: TJSONObject;
      begin
        if AReq.Status = 200 then
        begin
          js := TJSON.Create;
          try
            jo := TJSONObject(js.Parse(AResponse));
            ShowMessage('Name: ' + jo.GetJSONValue('name'));
          finally
            js.Free;
          end;
        end

        else if AReq.Status = 404 then
          ShowMessage('Customer não encontrado!')

        else
        begin
          js := TJSON.Create;
          try
            jo := TJSONObject(js.Parse(AResponse));
            ShowMessage(jo.GetJSONValue('error') + ': ' + jo.GetJSONValue('description'));
          finally
            js.Free;
          end;
        end;
      end
  );
end;

end.