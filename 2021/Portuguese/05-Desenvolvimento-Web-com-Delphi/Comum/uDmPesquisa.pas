unit uDmPesquisa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPesquisa = class(TDataModule)
    con: TFDConnection;
    qry: TFDQuery;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
  private
    { Private declarations }
  public
    class function ObterNomePeloId(const AID: Integer): String;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPesquisa }

class function TdmPesquisa.ObterNomePeloId(const AID: Integer): String;
begin
  var LDM: TdmPesquisa := TdmPesquisa.Create(nil);
  try
    LDM.qry.ParamByName('CUST_NO').AsInteger := AID;
    LDM.qry.Open;

    if LDM.qry.IsEmpty then
      raise Exception.Create('Not found');

    result := LDM.qry.FieldByName('CUSTOMER').AsString;
  finally
    LDM.Free;
  end;
end;

end.
