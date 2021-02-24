unit uGeradorBoletoACBr;

interface

uses
  uGeradorBoleto.Intf, uBoleto.Intf;

type
  TGeradorBoletoACBr = class(TInterfacedObject, IGeradorBoleto)
  public
    function GerarBoleto(pBoleto: IBoleto): string;
  end;

implementation

{ TGeradorBoletoACBr }

uses
  uContainerDefault;

function TGeradorBoletoACBr.GerarBoleto(pBoleto: IBoleto): string;
begin
  Result := 'Este é um boleto gerado pelo ACBr onde o(a) ' + pBoleto.Sacado.Nome + ' vai pagar para ' +
    pBoleto.Cedente.Nome;
end;

initialization
  TContainer.Default.Registrar<IGeradorBoleto>(
    function: IInterface
    begin
      Result := TGeradorBoletoACBr.Create;
    end);

end.
