unit uGeradorBoletoAPIWeb.Impl;

interface

uses
  uGeradorBoleto.Intf,
  uBoleto.Intf;

type
  TGeradorBoletoAPIWeb = class(TInterfacedObject, IGeradorBoleto)
  public
    function GerarBoleto(pBoleto: IBoleto): string;
  end;

implementation

uses
  uContainerDefault;

{ TGeradorBoletoAPIWeb }

function TGeradorBoletoAPIWeb.GerarBoleto(pBoleto: IBoleto): string;
begin
  Result := 'Gerando boleto pelo API Web para ' + pBoleto.Sacado.Nome + ' pagar para ' + pBoleto.Cedente.Nome;
end;

initialization
  TContainer.Default.Registrar<IGeradorBoleto>(
    function: IInterface
    begin
      Result := TGeradorBoletoAPIWeb.Create;
    end);

end.
