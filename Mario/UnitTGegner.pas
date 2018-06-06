unit UnitTGegner;

interface

type
  TGegner = class
  private
    FPosition  : integer; //momentane Position der Figur; Y=?
  public
    constructor erzeugeGegner(Position:integer);
    destructor loescheGegner;
    function getPosition:integer;
    procedure setPosition(Position:integer);
  end;


implementation

constructor TGegner.erzeugeGegner(Position: integer);
begin
  self.FPosition:=Position;
end;

destructor TGegner.loescheGegner;
begin
  FPosition:=0;
  inherited destroy;
end;

///////////////Unwichtige get & set's/////////////////////////////////////////

procedure TGegner.setPosition(Position: Integer);
begin
  FPosition:=Position;
end;

function TGegner.getPosition;
begin
  result:=FPosition;
end;

end.
