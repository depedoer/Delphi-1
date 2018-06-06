unit UnitView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitTFeld, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Springen: TTimer;
    Hindernis: TTimer;
    Uhr: TTimer;
    allimg: TPaintBox;
    Allesweg: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SpringenTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HindernisTimer(Sender: TObject);
    procedure UhrTimer(Sender: TObject);
    procedure AlleswegTimer(Sender: TObject);
  private
    { Private-Deklarationen }
    Fensterbreite       : integer;
    Fensterhoehe        : integer;
    sperre              : boolean;
    punkte              : integer;
    Flevel              : integer; //Spiellevel: 1,2
    FmaxLevel           : Integer; //MaxLevel: aktuell:2
    xGegner             : array [1..1000] of integer;
    yGegner             : array [1..1000] of integer;
    IntervallFaktor     : integer; //(Zuwachs)
    MariovFaktor        : integer; //(Positiv)
    GeschwindigkeitApfel: integer; //Pro Uhr-Timer, wie viele Schritte in y-Richtung
    LebenFaktor         : integer; //Gibt die Anzahl der Leben an **max:10**
    Punkteerreichen     : Integer;
    Leben               : Integer;
    Meldung             : boolean;  //Gibt an, ob das Spiel verloren oder Gewonnen  worden ist
    Gecheated           : boolean;  //Gibt an, ob gecheatet wurde true=ja; Standart=false
    Puffer              : TBitmap;
    Apfel               : TBitmap;
    Hintergrund         : TBitmap;
    Mario               : TBitmap;
    procedure Starten;  //Ehemals ein Label
    procedure erzeugeMario;
    procedure zeichneGegner;
    procedure loescheGegner(x,y:integer);
    procedure Gegnererwischt(Nummer:integer;Verlore: Boolean);  //bzw. entwischt //Anzahl der noch übrigen Leben -1:2Leben; -2:1Leben; -3:0Leben
    procedure Verloren;
    procedure Gewonnen(Sender: TObject);
    procedure LevelFaktorenberechnen; //nach Gewinnen
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  Feld: TFeld;

implementation

{$R *.dfm}


procedure TForm1.erzeugeMario;
begin
  Feld:=TFeld.erzeugeSpielfeld;
  Feld.erzeugeMarios(1,50,Fensterhoehe-Mario.Height-30); //Anzahl,Startposition, Y-Position
  Mario.Canvas.Draw(Feld.getMarioStartposition,Fensterhoehe-Mario.Height-30,mario);
  Uhr.Enabled:=true;
  Sperre:=false;
  Feld.setMarioPosition(50);
end;



/////////////////////Bewegen///////////////////////////////////////////////////

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if sperre=False then begin
    Case Char(Key) of
      'S': If not (ssShift in Shift) then Feld.berechneMarioPosition(MariovFaktor);
      'A': If not (ssShift in Shift) then Feld.berechneMarioPosition(-MariovFaktor);
      'Z': If (ssShift in Shift) then begin
              Punkte:=punkte+5;
              gecheated:=true;
            end;
      'T': If (ssALT In Shift) AND NOT (ssShift in Shift) Then Punkte:=punkte+10;
    end;
  end
  else if Char(Key)='M' then If not (ssShift in Shift) then Starten;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (sperre=False) AND (Char(Key)='W') then begin
    If not (ssShift in Shift) then begin
      Sperre:=true;
      Feld.berechneMarioYPosition(-150);
      Form1.Springen.Enabled:=true;
    end;
  end
  else exit;
end;

procedure TForm1.SpringenTimer(Sender: TObject);
begin
  Mario.Canvas.Draw(Feld.getMarioPosition,Feld.berechneMarioYPosition(150),Mario);
  Form1.Springen.Enabled:=false;
  sperre:=false;
end;

///////////////////Bewegen und Fangen des Gegners///////////////////////////////


procedure TForm1.HindernisTimer(Sender: TObject);
var zufall,min,max:integer;
begin
  randomize;
  Min:=Feld.getMarioPosition-300;
  Max:=Feld.getMarioPosition+300;
  zufall:=random(Fensterbreite-100)+100;
  if (zufall>max) OR (zufall<min)then zufall:=random(600)+min;
  if zufall>fensterbreite then zufall:=zufall-fensterbreite;
  if zufall<0 then zufall:=zufall+fensterbreite;
  Feld.erzeugeGegner(Feld.getGegnerAnzahl+1,zufall);
  //zeichneGegner(zufall,0);
  xGegner[Feld.getGegnerAnzahl]:=zufall;
  yGegner[Feld.getGegnerAnzahl]:=0;
  Hindernis.Interval:=Hindernis.Interval+Intervallfaktor;
end;

procedure TForm1.UhrTimer(Sender: TObject);
begin
  randomize;
  zeichneGegner;
  if punkte>=punkteerreichen then Gewonnen(Sender); //nach ca. 1 Minute(20 Punkte) sagt er Gewonnen
end;

procedure TForm1.Gegnererwischt(Nummer: Integer;Verlore: Boolean);
var min,max,zufall:integer;
begin
  yGegner[Nummer]:=0;
  zufall:=random(fensterbreite-100)+100;
  Min:=Feld.getMarioPosition-300;
  Max:=Feld.getMarioPosition+300;
  zufall:=random(Fensterbreite-100)+100;
  if (zufall>max) OR (zufall<min)then zufall:=random(600)+min;
  if zufall>fensterbreite then zufall:=zufall-fensterbreite;
  if zufall<0 then zufall:=zufall+fensterbreite;
  xGegner[Nummer]:=zufall;
  if Leben=0 then begin
    Verloren;
    exit;
  end;
  if Verlore=True then exit;
  punkte:=punkte+1;
end;


procedure TForm1.zeichneGegner;
var I:integer;
begin
  Puffer.Canvas.Draw(0,0,Hintergrund);
  for I := 1 to Feld.getGegnerAnzahl do begin
    yGegner[i]:=YGegner[i]+GeschwindigkeitApfel;
    Puffer.Canvas.Draw(xGegner[i],yGegner[i],Apfel);
    if (Feld.getMarioYPosition<yGegner[i]) AND (Feld.getMarioYPosition+Mario.Height>yGegner[i]) AND (Feld.getMarioPosition<xGegner[i]) AND (Feld.getMarioPosition+Mario.Width>xGegner[i])
    then Gegnererwischt(i,false);
    if yGegner[i]>Fensterhoehe then begin
      Leben:=Leben-1;
      Gegnererwischt(i,true);
    end;
  end;
  ////////////////////Zeichnen/////////////////////////////////////////////////
  if Feld.getMarioPosition<-60 then Feld.setMarioPosition(screen.Width-(Mario.Width div 2));
  if Feld.getMarioPosition>screen.Width-(Mario.Width div 2) then Feld.setMarioPosition(-60);
  Puffer.Canvas.Draw(Feld.getMarioPosition,Feld.getMarioYPosition,Mario);
  Puffer.Canvas.Brush.Style:=bsClear;
  Puffer.Canvas.Font.Size:=8;
  Puffer.Canvas.Font.Color:=clyellow;
  Puffer.Canvas.Font.Style:=[];
  Puffer.Canvas.TextOut(6,6,'Punkte: '+InttoStr(punkte)+'/'+InttoStr(punkteerreichen));
  Puffer.Canvas.TextOut(6,30,'Level: '+InttoStr(Flevel));
  Puffer.Canvas.TextOut(6,80,'Leben: '+InttoStr(Leben));
  Puffer.Canvas.Font.Size:=7;
  Puffer.Canvas.TextOut(6,40,'max. Levelanzahl: '+InttoStr(FmaxLevel));
  if gecheated=true then begin
    Puffer.Canvas.Font.Color:=clred;
    Puffer.Canvas.Font.Size:=13;
    Puffer.Canvas.Font.Style:=[fsBold];
    Puffer.Canvas.TextOut(6,55,'Gecheated!!!');
  end;
  allimg.Canvas.Draw(0,0,Puffer);
end;



procedure TForm1.loescheGegner(x: Integer; y: Integer);
begin
  {with Canvas do begin
    Pen.Width:=1;
    Pen.Color:=clSilver;
    Brush.Color:=clSilver;
    Ellipse(x,y,x+20,y+20);
    Pen.Width:=2;
    MoveTo(x+10,y);
    LineTo(x+10,y-5);
  end;}
end;

////////////////(Neues Level:) Gewonnnen bzw. Verloren///////////////////////////


procedure TForm1.Verloren;
begin
  Uhr.Enabled:=false;
  Springen.Enabled:=false;
  Hindernis.Enabled:=false;
  Allesweg.Enabled:=true;
end;

procedure TForm1.AlleswegTimer(Sender: TObject);
var I,p:integer;
begin
  Allesweg.Enabled:=false;
   p:=Punkte;
  for I := 1 to Feld.getGegnerAnzahl do begin
    xGegner[i]:=0;
    yGegner[i]:=0;
  end;
  Feld.loescheMario(false);
  FLevel:=1;
  Feld.loescheGegner;
  Feld.loescheSpielfeld;
  Sperre:=true;
  Leben:=LebenFaktor;
  Punkte:=0;
  gecheated:=false;
  Hindernis.Interval:=500;
  showmessage('Sie haben leider verloren, dafür haben Sie aber '+InttoStr(p)+' Punkte erreicht!');
  Meldung:=true;
  Puffer.Canvas.Draw(0,0,Hintergrund);
end;

procedure TForm1.Gewonnen(Sender: TObject);
var I:integer;
begin
  Flevel:=FLevel+1;
  for I := 1 to Feld.getGegnerAnzahl do begin
    xGegner[i]:=0;
    yGegner[i]:=0;
  end;
  Feld.loescheMario(true);
  Feld.loescheGegner;
  Feld.loescheSpielfeld;
  Uhr.Enabled:=false;
  Springen.Enabled:=false;
  Hindernis.Enabled:=false;
  Leben:=LebenFaktor;
  Hindernis.Interval:=500;
  Form1.Meldung:=true;
  if FLevel=FmaxLevel+1 then begin
    showmessage('Du hast mit '+InttoStr(Punkte)+' Punkten gewonnen!'+#10#13#14+'Hinweis: Dieses Fenster schließt sich nach dem Drücken des Buttons ''Ok'' automatisch.'+#14);
    application.Terminate;
  end;
  Form1.Starten;
end;




/////////////////////Unwichtige Variabelkonfiguration & Hilfsproceduren/////////


procedure TForm1.FormCreate(Sender: TObject);
begin
  FmaxLevel:=4;
  FLevel:=1;
  Fensterbreite:=screen.Width-20;
  Fensterhoehe:=screen.Height;
  sperre:=true;
  Meldung:=true;
  gecheated:=false;
  ///////////////////////Bitmaps & Puffer//////////////////////////////////////
  Puffer:=TBitmap.Create;
  Puffer.Width:=Screen.Width;
  Puffer.height:=screen.Height-30;
  Apfel:=TBitmap.Create;
  Apfel.LoadFromFile('Apfel.bmp');
  Apfel.Transparent:=true;
  allimg.Left:=0;
  allimg.Top:=0;
  allimg.Height:=screen.Height-30;
  allimg.Width:=screen.Width;
  Hintergrund:=TBitmap.Create;
  Hintergrund.Height:=screen.Height-30;
  Hintergrund.Width:=screen.Width;
  Hintergrund.LoadFromFile('Hintergrund.bmp');
  mario:=TBitmap.Create;
  mario.LoadFromFile('mario.bmp');
  mario.Transparent:=true;
end;

procedure TForm1.Starten;
begin
  if Meldung=true then begin
    Form1.LevelFaktorenberechnen;
    Form1.erzeugeMario;
    Form1.Hindernis.Enabled:=true;
    Meldung:=false;
    Leben:=LebenFaktor;
  end
  else exit;
end;

procedure TForm1.LevelFaktorenberechnen;
begin
  if FLevel=1 then begin
      IntervallFaktor:=4000;       //(Zuwachs) Level1:8000
      MariovFaktor:=6;            //(Positiv) Level1:2
      GeschwindigkeitApfel:=1;    //(UhrTimer) Level1:20
      Punkteerreichen:=20;        //Level1:20
      LebenFaktor:=3;
    end;
    if FLevel=2 then begin
      IntervallFaktor:=3500;        //(Zuwachs) Level2:5500
      MariovFaktor:=8;             //(Positiv) Level2:4
      GeschwindigkeitApfel:=2;      //(UhrTimer) Level2:15
      Punkteerreichen:=50;          //Level2:40
      LebenFaktor:=4;
    end;
    if FLevel=3 then begin
      IntervallFaktor:=3000;        //(Zuwachs) Level3:4000
      MariovFaktor:=10;             //(Positiv) Level3:6
      GeschwindigkeitApfel:=3;      //(UhrTimer) Level3:10
      Punkteerreichen:=80;          //Level3:60
      LebenFaktor:=5;
    end;
    if FLevel=4 then begin
      IntervallFaktor:=2500;
      MariovFaktor:=12;
      GeschwindigkeitApfel:=3;
      Punkteerreichen:=120;
      LebenFaktor:=6;
    end;

end;



end.
