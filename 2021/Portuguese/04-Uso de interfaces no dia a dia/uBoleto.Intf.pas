unit uBoleto.Intf;

interface

type
  IContaBancaria = interface
    ['{1529D3A2-10E4-44DD-9259-DE0C9484B885}']

    function GetCodigoBanco: UInt16;
    procedure SetCodigoBanco(const pCodigoBanco: UInt16);

    property CodigoBanco: UInt16 read GetCodigoBanco write SetCodigoBanco;
  end;

  ICedente = interface
    ['{BBC3AAEB-0C49-4787-8917-245FD37BD073}']

    function GetNome: string;
    procedure SetNome(const pNome: string);

    function GetContaBancaria: IContaBancaria;

    property Nome: string read GetNome write SetNome;
    property ContaBancaria: IContaBancaria read GetContaBancaria;
  end;

  ISacado = interface
    ['{B207EDD2-F9C3-4DC6-B16E-ECD0CCFE43B8}']

    function GetNome: string;
    procedure SetNome(const pNome: string);

    property Nome: string read GetNome write SetNome;
  end;

  IBoleto = interface
    ['{E6B224CD-E794-4995-835E-982F680DF5F6}']

    function GetCedente: ICedente;
    function GetSacado: ISacado;

    property Cedente: ICedente read GetCedente;
    property Sacado: ISacado read GetSacado;
  end;

implementation

end.
