unit uBoleto.Factory;

interface

uses
  uBoleto.Intf;

type
  TFactoryBoleto = class
  public
    class function Criar: IBoleto;
  end;

implementation

uses
  uBoleto.Impl;

{ TFactoryBoleto }

class function TFactoryBoleto.Criar: IBoleto;
begin
  Result := TBoleto.Create;
end;

end.
