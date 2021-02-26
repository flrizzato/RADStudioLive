unit uBoleto.Impl;

interface

uses
  uBoleto.Intf;

type
  TContaBancaria = class(TInterfacedObject, IContaBancaria)
  strict private
    FCodigoBanco: UInt16;
  public
    function GetCodigoBanco: UInt16;
    procedure SetCodigoBanco(const pCodigoBanco: UInt16);
  end;

  TCedente = class(TInterfacedObject, ICedente)
  strict private
    FNome: string;
    FContaBancaria: IContaBancaria;
  public
    constructor Create;

    function GetNome: string;
    procedure SetNome(const pNome: string);

    function GetContaBancaria: IContaBancaria;
  end;

  TSacado = class(TInterfacedObject, ISacado)
  strict private
    FNome: string;
  public
    function GetNome: string;
    procedure SetNome(const pNome: string);
  end;

  TBoleto = class(TInterfacedObject, IBoleto)
  strict private
    FCedente: ICedente;
    FSacado: ISacado;
  public
    constructor Create;

    function GetCedente: ICedente;
    function GetSacado: ISacado;
  end;


implementation

{ TContaBancaria }

function TContaBancaria.GetCodigoBanco: UInt16;
begin
  Result := FCodigoBanco;
end;

procedure TContaBancaria.SetCodigoBanco(const pCodigoBanco: UInt16);
begin
  FCodigoBanco := pCodigoBanco;
end;

{ TCedente }

constructor TCedente.Create;
begin
  FContaBancaria := TContaBancaria.Create;
end;

function TCedente.GetContaBancaria: IContaBancaria;
begin
  Result := FContaBancaria;
end;

function TCedente.GetNome: string;
begin
  Result := FNome;
end;

procedure TCedente.SetNome(const pNome: string);
begin
  FNome := pNome;
end;

{ TSacado }

function TSacado.GetNome: string;
begin
  Result := FNome;
end;

procedure TSacado.SetNome(const pNome: string);
begin
  FNome := pNome;
end;

{ TBoleto }

constructor TBoleto.Create;
begin
  FCedente := TCedente.Create;
  FSacado := TSacado.Create;
end;

function TBoleto.GetCedente: ICedente;
begin
  Result := FCedente;
end;

function TBoleto.GetSacado: ISacado;
begin
  Result := FSacado;
end;

end.
