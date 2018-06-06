unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnFakultaet: TButton;
    lbFakultaet: TLabel;
    edout: TEdit;
    procedure btnFakultaetClick(Sender: TObject);
  private
    editText:integer;
    function Fakultaet(n:integer):extended;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnFakultaetClick(Sender: TObject);
begin
  editText:=StrtoIntdef(edout.Text,5);
  lbfakultaet.Caption:=FloattoStr(Fakultaet(editText));
end;

function TForm1.Fakultaet(n:integer):extended;
begin
  if n=1 then begin result:=1; exit; end;
  result:=n*Fakultaet(n-1);
end;

end.
