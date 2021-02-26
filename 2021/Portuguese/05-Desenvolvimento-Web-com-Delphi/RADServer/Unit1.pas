unit Unit1;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes;

type
  [ResourceName('customers')]
  {$METHODINFO ON}
  TCustomersResource = class
  published
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;
  {$METHODINFO OFF}

implementation

uses uDmPesquisa;

procedure TCustomersResource.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];

  try
    var LNome: String := TdmPesquisa.ObterNomePeloId(StrToInt(LItem));
    AResponse.Body.SetValue(TJSONObject.Create.AddPair('name', LNome), True)
  except on E: Exception do
    if E.Message.ToLower = 'not found' then
      AResponse.RaiseNotFound()
    else
      AResponse.RaiseError(500, 'deu ruim', E.Message);
  end;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TCustomersResource));
end;

initialization
  Register;
end.


