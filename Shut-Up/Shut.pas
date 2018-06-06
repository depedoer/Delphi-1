unit Shut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
mediaplayer1.Close;
MediaPlayer1.FileName:='shut-up.mp3';
Mediaplayer1.Open;
Mediaplayer1.Position:=0;
MediaPlayer1.Play;
Timer1.Enabled:=false;
Timer2.Enabled:=true;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
application.Terminate;
end;

end.
