program radstudiolive2021;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.Generics.Collections,
  System.SysUtils,

  Horse,

  Horse.jhonson,
  System.json,

  Spring.collections,
  rest.json,

  Model.Artista in 'Model\Model.Artista.pas',
  Model.Conexao in 'Model\Model.Conexao.pas';

begin
  thorse.get('/artista',
      procedure(req: Thorserequest; res: Thorseresponse; next: Tproc)
    var
      LArtistaLista: IList<TArtista>;
      LArtistas: TObjectList<TArtista>;
      LArtista: TArtista;
    begin
      LArtistaLista := TConnection.Session.FindAll<TArtista>;
      LArtistas := TObjectList<TArtista>.create;

      for LArtista in LArtistaLista.ExtractRange(0,LArtistaLista.Count) do
        LArtistas.Add(LArtista);

      res.send(tjson.objecttojsonstring(lartistas));
    end);
  thorse.listen(9000);

  Readln;

end.
