unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Loop: TLabel;
    Close: TButton;
    procedure CloseClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CloseClick(Sender: TObject);
var
  x:Integer;
begin
x:=6;
repeat showmessage ('Fehler')
until x=7;
end;


end.
