unit Model.Conexao;

interface

uses
  FireDAc.Comp.Client,

  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Core.ConnectionFactory,
  Spring.Persistence.Adapters.FireDAc,

  FireDAc.Stan.Intf,
  FireDAc.Stan.Option,
  FireDAc.Stan.Error,
  FireDAc.UI.Intf,
  FireDAc.Phys.Intf,
  FireDAc.Stan.Def,
  FireDAc.Stan.Pool,
  FireDAc.Stan.Async,
  FireDAc.Phys,
  FireDAc.Phys.SQLite,
  FireDAc.Phys.SQLiteDef,
  FireDAc.Stan.ExprFuncs,
  FireDAc.Phys.SQLiteWrapper.Stat,
  FireDAc.VCLUI.Wait,
  Data.DB;

type
  TConnection = class
  private
    class var FFDConnection: TFDConnection;
    class var FConnection  : IDBConnection;
    class var FSession     : TSession;
  public
    class function Session: TSession;
  end;

implementation

  { TConnection }

class function TConnection.Session: TSession;
begin
  if not Assigned(FSession) then
  begin
    FFDConnection                 := TFDConnection.Create(nil);
    FFDConnection.params.driverid := 'SQLite';
    FFDConnection.params.database := 'C:\Users\juliomar\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db';

    FConnection                    := TConnectionFactory.GetInstance(dtFireDAC, FFDConnection);
    FConnection.autoFreeConnection := true;
    FSession                       := TSession.Create(FConnection);
  end;
  Result := FSession;

end;

end.
