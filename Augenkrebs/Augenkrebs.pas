unit Augenkrebs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MPlayer;

type
  TForm1 = class(TForm)
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb7: TLabel;
    MediaPlayer1: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure Syscommand(var msg: TMessage); message WM_SYSCOMMAND;
    procedure Keydown(var msg: TMessage); message WM_Keydown;
    procedure FormMouseEnter(Sender: TObject);
    procedure lb3MouseEnter(Sender: TObject);
    procedure lb2MouseEnter(Sender: TObject);
    procedure lb6MouseEnter(Sender: TObject);
    procedure lb7MouseEnter(Sender: TObject);
    procedure lb5MouseEnter(Sender: TObject);
    procedure lb4MouseEnter(Sender: TObject);
    procedure lb1MouseEnter(Sender: TObject);
  private
  procedure Mediaplayern;
  procedure Refreshen;
  procedure Hauptprocedure(FormMouseEnter: TObject);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  unendlich:boolean=true;
  Zufallsbereichb:integer;
  Zufallsbereichh:integer;

implementation

{$R *.dfm}


/////////////////////////Hilfsproceduren/////////////////////////////////////

procedure TForm1.Refreshen;
begin
  Form1.refresh;
  Form1.lb1.Refresh;
  Form1.lb2.Refresh;
  Form1.lb3.Refresh;
  Form1.lb4.refresh;
  Form1.lb5.Refresh;
  Form1.lb6.Refresh;
  Form1.lb7.Refresh;
end;

procedure TForm1.Mediaplayern;
begin
  form1.MediaPlayer1.FileName:='Afro Circus 30 Seconds.mp3';
  form1.MediaPlayer1.Open;
  form1.MediaPlayer1.Play;
end;

procedure TForm1.Hauptprocedure(FormMouseEnter: TObject);
begin
  Form1.Mediaplayern;
Form1.lb1.Visible:=true;
Form1.lb2.Visible:=true;
Form1.lb3.Visible:=true;
Form1.lb4.Visible:=true;
Form1.lb5.Visible:=true;
Form1.lb6.Visible:=true;
Form1.lb7.Visible:=true;
repeat
//**********************Teil1**************************************************
Form1.color:=clred;
Form1.lb1.Color:=clLime;
Form1.lb2.Color:=clHighlight;
Form1.lb3.Color:=clYellow;
form1.lb4.color :=clYellow;
form1.lb5.color:=clred;
Form1.lb6.Color:=clLime;
Form1.lb7.Color:=clHighlight;
Form1.lb1.Left:=Random(Zufallsbereichb);
Form1.lb1.Top:=Random(Zufallsbereichh);
Form1.lb3.Left:=Random(Zufallsbereichb);
Form1.lb3.Top:=Random(Zufallsbereichh);
Form1.lb4.Left:=Random(Zufallsbereichb);
Form1.lb4.Top:=Random(Zufallsbereichh);
Form1.lb6.Left:=Random(Zufallsbereichb);
Form1.lb6.Top:=Random(Zufallsbereichh);
sleep(10);
//*********************Refresh1************************************************
Form1.Refreshen;
//**********************Teil2**************************************************
Form1.color:=cllime;
Form1.lb1.color :=clHighlight;
Form1.lb2.Color:=clYellow;
Form1.lb3.Color:=clRed;
form1.lb5.color :=clYellow;
form1.lb6.color:=clred;
Form1.lb7.Color:=clLime;
Form1.lb4.Color:=clHighlight;
Form1.lb2.Left:=Random(Zufallsbereichb);
Form1.lb2.Top:=Random(Zufallsbereichh);
Form1.lb5.Left:=Random(Zufallsbereichb);
Form1.lb5.Top:=Random(Zufallsbereichh);
Form1.lb7.Left:=Random(Zufallsbereichb);
Form1.lb7.Top:=Random(Zufallsbereichh);
sleep(10);
//**********************Refresh2***********************************************
Form1.Refreshen;
//**********************Teil3**************************************************
form1.color :=clHighlight;
form1.lb1.color :=clYellow;
Form1.lb2.Color:=clRed;
Form1.lb3.Color:=clLime;
form1.lb6.color :=clYellow;
form1.lb7.color:=clred;
Form1.lb4.Color:=clLime;
Form1.lb5.Color:=clHighlight;
Form1.lb1.Left:=Random(Zufallsbereichb);
Form1.lb1.Top:=Random(Zufallsbereichh);
Form1.lb3.Left:=Random(Zufallsbereichb);
Form1.lb3.Top:=Random(Zufallsbereichh);
Form1.lb6.Left:=Random(Zufallsbereichb);
Form1.lb6.Top:=Random(Zufallsbereichh);
Form1.lb4.Left:=Random(Zufallsbereichb);
Form1.lb4.Top:=Random(Zufallsbereichh);
sleep (10);
//**********************Refresh3***********************************************
Form1.Refreshen;
//**********************Teil4**************************************************
form1.color :=clYellow;
form1.lb1.color:=clred;
Form1.lb2.Color:=clLime;
Form1.lb3.Color:=clHighlight;
form1.lb7.color :=clYellow;
form1.lb4.color:=clred;
Form1.lb5.Color:=clLime;
Form1.lb6.Color:=clHighlight;
Form1.lb2.Left:=Random(Zufallsbereichb);
Form1.lb2.Top:=Random(Zufallsbereichh);
Form1.lb7.Left:=Random(Zufallsbereichb);
Form1.lb7.Top:=Random(Zufallsbereichh);
Form1.lb5.Left:=Random(Zufallsbereichb);
Form1.lb5.Top:=Random(Zufallsbereichh);
sleep (10);
//**********************Refresh4***********************************************
Form1.Refreshen; 
if (mediaplayer1.position=mediaplayer1.Length) then unendlich:=false;
until unendlich=false;
//*****************************Wiederholen************************************
unendlich:=true;
mediaplayer1.Position:=0;
mediaplayer1.resume;
mediaplayer1.Play;
end;


/////////////////////////Startbedingungern////////////////////////////////////

procedure TForm1.FormCreate(Sender: TObject);
var   hoehe,breite: integer;
begin
  breite:=screen.width-210;
  hoehe:=screen.Height-200;
  randomize;
  zufallsbereichb:=(breite)+10;
  zufallsbereichh:=(hoehe)+10;
end;



procedure TForm1.FormMouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;


procedure TForm1.lb1MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.lb2MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.lb3MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.lb4MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.lb5MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.lb6MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.lb7MouseEnter(Sender: TObject);
begin
Form1.Hauptprocedure(Sender);
end;

procedure TForm1.Syscommand(var msg: TMessage);
begin
  //
end;

procedure TForm1.Keydown(var msg: TMessage);
begin
  //
end;



end.
