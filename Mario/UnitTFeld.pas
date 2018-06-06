unit UnitTFeld;

interface

uses
  UnitTMario, UnitTGegner;

type
  TFeld = class
  private
    FAnzahl       : integer; //Anzahl der Marios --> später verschiedene Looks von Mario
    FGegnerAnzahl : Integer; //aktuelle Anzahl der Gegner
    FMario        : array [1..4] of TMario;
    FGegner       : array [1..1000] of TGegner;
  public
    constructor erzeugeSpielfeld;
    destructor loescheSpielfeld;
    procedure erzeugeMarios(anzahl,startposition,yposition:integer);
    procedure loescheMario(positiv:boolean);
    procedure erzeugeGegner(nummer,position:integer);  //Position nur ein y Richtung
    procedure loescheGegner;
    procedure setMarioStartposition(Startposition:integer);
    procedure setMariov(v:integer);
    procedure setMarioPosition(Position:integer);
    procedure setGegnerAnzahl(GegnerAnzahl:integer);
    procedure setMarioYPosition(y:integer);
    function getMarioYPosition:integer;
    function getGegnerAnzahl:integer;
    function berechneMarioPosition(v:integer):integer;
    function berechneMarioYPosition(Y:integer):integer;
    function getMarioPosition:integer;
    function getMariov:integer;
    function getMarioStartposition:integer;
  end;


implementation

constructor TFeld.erzeugeSpielfeld;
begin
end;

destructor TFeld.loescheSpielfeld;
begin
  inherited destroy;
end;

procedure TFeld.erzeugeMarios(anzahl,startposition,yposition: Integer);
begin
  self.FAnzahl:=anzahl;
  FMario[1]:=TMario.erzeugeMario(startposition,yposition);
end;

procedure TFeld.loescheMario(positiv:boolean);
begin
  FMario[1].loescheMario(positiv);
  FAnzahl:=0;
end;

procedure TFeld.erzeugeGegner(nummer: Integer; position: Integer);
begin
  self.FGegnerAnzahl:=nummer;
  FGegner[nummer]:=TGegner.erzeugeGegner(position);
end;

procedure TFeld.loescheGegner;
var i:integer;
begin
  for I := 1 to FGegnerAnzahl do FGegner[i].loescheGegner;
  FGegnerAnzahl:=0;
end;

function TFeld.berechneMarioPosition(V:integer):integer;
begin
  result:=FMario[1].berechnePosition(v);
end;

function TFeld.berechneMarioYPosition(Y: Integer):integer;
begin
  result:=FMario[1].berechnerYPosition(Y);
end;






/////////////////////unwichtige Get & sets////////////////////////////////////

procedure TFeld.setMarioStartposition(Startposition: Integer);
begin
  FMario[1].setStartPosition(Startposition);
end;

procedure TFeld.setMariov(v: Integer);
begin
  FMario[1].setv(v);
end;

procedure TFeld.setMarioPosition(Position: Integer);
begin
  FMario[1].setPosition(Position);
end;

procedure TFeld.setGegnerAnzahl(GegnerAnzahl: Integer);
begin
  FGegnerAnzahl:=GegnerAnzahl;
end;

procedure TFeld.setMarioYPosition(y: Integer);
begin
  FMario[1].setyPosition(y);
end;

function TFeld.getMarioYPosition;
begin
  result:=FMario[1].getyPosition;
end;

function TFeld.getGegnerAnzahl;
begin
  result:=FGegnerAnzahl;
end;

function TFeld.getMarioPosition;
begin
  result:=FMario[1].getPosition;
end;

function TFeld.getMariov;
begin
  result:=FMario[1].getv;
end;

function TFeld.getMarioStartposition;
begin
  result:= FMario[1].getStartPosition;
end;

end.
