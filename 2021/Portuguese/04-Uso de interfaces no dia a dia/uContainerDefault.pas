unit uContainerDefault;

interface

uses
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections;

type
  TGetter = TFunc<IInterface>;

  TContainer = class
  strict private
    FRegistros: TDictionary<PTypeInfo, TGetter>;

    class var FDefault: TContainer;
    class function GetDefault: TContainer; static;
  public
    class constructor Create;
    class destructor Destroy;

    constructor Create;
    destructor Destroy; override;

    procedure Registrar<I: IInterface>(const pGetter: TGetter);

    function Get<I: IInterface>: I;

    class property Default: TContainer read GetDefault;
  end;

implementation

{ TContainer }

constructor TContainer.Create;
begin
  FRegistros := TDictionary<PTypeInfo, TGetter>.Create;
end;

class constructor TContainer.Create;
begin
  FDefault := TContainer.Create;
end;

destructor TContainer.Destroy;
begin
  FRegistros.Free;

  inherited;
end;

class destructor TContainer.Destroy;
begin
  FDefault.Free;
end;

function TContainer.Get<I>: I;
var
  lTipo: PTypeInfo;
  lGetter: TGetter;
  lInterfaceGerada: IInterface;
begin
  lTipo := TypeInfo(I);
  lGetter := FRegistros.Items[lTipo];
  lInterfaceGerada := lGetter();
  if not Supports(lInterfaceGerada, lTipo^.TypeData^.GUID, Result) then
    raise Exception.Create('Opa, algum registro foi mal feito!');
end;

class function TContainer.GetDefault: TContainer;
begin
  Result := FDefault;
end;

procedure TContainer.Registrar<I>(const pGetter: TGetter);
begin
  FRegistros.Add(TypeInfo(I), pGetter);
end;

end.
