unit UnitTMario;

interface

type
  TMario = class
  private
    FStartPosition: integer;  //Position der Figur
    FPosition     : integer; //momentane Position der Figur
    FyPosition    : integer; //y-Position der Figur (Springen)
    Fv            : integer; //aktuelle Geschwindigkeit der Figur
  public
    constructor erzeugeMario(StartPosition,YPosition:integer);
    destructor loescheMario(Positiv:boolean);
    function getStartPosition: integer; //nur x Position; y=0
    function getv:integer;
    function getPosition:integer;
    function getyPosition:integer;
    function berechnePosition(V:integer):integer;
    function berechnerYPosition(Y:integer):integer;
    procedure setyPosition(y:integer);
    procedure setPosition(Position:integer);
    procedure setv(v:integer);
    procedure setStartPosition(StartPosition:integer); //nur x Position; y=0
  end;

var
  Verloren : integer=0; //Anzahl der Verlorenden Spiele
  Gewonnen : Integer=0; //Anzahl der Gewonnenen Spiele


implementation

constructor TMario.erzeugeMario(StartPosition,YPosition: integer);
begin
  self.FStartPosition:=StartPosition;
  self.FPosition:=StartPosition;
  self.FyPosition:=YPosition;
  self.Fv:=0;
end;

destructor TMario.loescheMario(positiv:boolean);
begin
  FStartPosition:=0;
  FyPosition:=0;
  FPosition:=0;
  Fv:=0;
  if positiv=true then Gewonnen:=Gewonnen+1 else Verloren:=Verloren+1;
  inherited destroy;
end;

function TMario.berechnePosition(V:integer):integer;
begin
  FPosition:=FPosition+V;
  result:=FPosition;
end;

function TMario.berechnerYPosition(Y: Integer):integer;
begin
  FYPosition:=FYPosition+Y;
  result:=FYPosition;
end;



/////////////////////////unwichtige get & set//////////////////////////////////

function TMario.getStartPosition;
begin
  result:=FStartPosition;
end;

function TMario.getv;
begin
  result:=Fv;
end;

function TMario.getPosition;
begin
  result:=FPosition;
end;

function TMario.getyPosition;
begin
  result:=FyPosition;
end;

procedure TMario.setyPosition(y: Integer);
begin
  Fyposition:=y;
end;

procedure TMario.setStartPosition(StartPosition: Integer);
begin
  FStartPosition:=StartPosition;
end;

procedure TMario.setv(v: Integer);
begin
  Fv:=v;
end;

procedure TMario.setPosition(Position: Integer);
begin
  FPosition:=Position;
end;

end.
