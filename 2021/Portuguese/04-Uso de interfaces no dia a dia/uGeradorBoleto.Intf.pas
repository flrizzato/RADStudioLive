unit uGeradorBoleto.Intf;

interface

uses
  uBoleto.Intf;

type
  IGeradorBoleto = interface
    ['{4700F5A2-E1A1-4DB4-B29C-356A3EDE768A}']

    function GerarBoleto(pBoleto: IBoleto): string;
  end;

implementation

end.
