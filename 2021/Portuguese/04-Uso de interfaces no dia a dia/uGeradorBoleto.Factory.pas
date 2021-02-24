unit uGeradorBoleto.Factory;

interface

uses
  uGeradorBoleto.Intf;

type
  TGeradorBoletoFactory = class
  public
    class function Criar: IGeradorBoleto;
  end;

implementation

uses
  uGeradorBoletoACBr;

{ TGeradorBoletoFactory }

class function TGeradorBoletoFactory.Criar: IGeradorBoleto;
begin
  Result := TGeradorBoletoACBr.Create;
end;

end.
