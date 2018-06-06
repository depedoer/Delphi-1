unit Ueberlasten;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button4: TButton;
    Button5: TButton;
    Button1: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
label start1;
begin
start1:
goto start1;
end;

procedure TForm1.Button4Click(Sender: TObject);
label start1;
begin
start1:
goto start1;
end;


procedure TForm1.Button5Click(Sender: TObject);
label start2;
begin
start2:
goto start2;
end;

end.
