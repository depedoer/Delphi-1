unit Rechenprogramm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdZahl1: TEdit;
    EdZahl2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbErgebnisText: TLabel;
    lbErgebnisAnzeige: TLabel;
    btnplus: TButton;
    btnmal: TButton;
    btnminus: TButton;
    btndurch: TButton;
    BtnHelp: TButton;
    procedure btnplusClick(Sender: TObject);
    procedure btnmalClick(Sender: TObject);
    procedure btnminusClick(Sender: TObject);
    procedure btndurchClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure EdZahl1KeyPress(Sender: TObject; var Key: Char);
    procedure EdZahl2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses about;

{$R *.dfm}

procedure TForm1.btnplusClick(Sender: TObject);
var
zahl1, zahl2, ergebnis: real;
begin
  zahl1 := StrToFloat (EdZahl1.Text);
  zahl2 := StrToFloat (EdZahl2.Text);
  ergebnis := zahl1 + zahl2;
  lbErgebnisAnzeige.Caption := FloatToStr (ergebnis);
  showmessage ('Das Ergebnis der Addition lautet: ' + FloatToStr (ergebnis))
end;

procedure TForm1.EdZahl1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', Char(VK_BACK)]) then
    Key := #0;
end;

procedure TForm1.EdZahl2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', Char(VK_BACK)]) then
    Key := #0;
end;

procedure TForm1.btnmalClick(Sender: TObject);
var
zahl1, zahl2, ergebnis: real;
begin
  zahl1 := StrToFloat (EdZahl1.Text);
  zahl2 := StrToFloat (EdZahl2.Text);
  ergebnis := zahl1 * zahl2;
  lbErgebnisAnzeige.Caption := FloatToStr (ergebnis);
  showmessage ('Das Ergebnis der Multiplikation lautet: ' + FloatToStr (ergebnis))
end;

procedure TForm1.btnminusClick(Sender: TObject);
var
zahl1, zahl2, ergebnis: real;
begin
  zahl1 := StrToFloat (EdZahl1.Text);
  zahl2 := StrToFloat (EdZahl2.Text);
  ergebnis := zahl1 - zahl2;
  lbErgebnisAnzeige.Caption := FloatToStr (ergebnis);
  showmessage ('Das Ergebnis der Subtraktion lautet: ' + FloatToStr (ergebnis))
end;

procedure TForm1.btndurchClick(Sender: TObject);
var
zahl1, zahl2, ergebnis: real;
begin
  zahl1 := StrToFloat (EdZahl1.Text);
  zahl2 := StrToFloat (EdZahl2.Text);
  ergebnis := zahl1 / zahl2;
  lbErgebnisAnzeige.Caption := FloatToStr (ergebnis);
  showmessage ('Das Ergebnis der Division lautet: ' + FloatToStr (ergebnis))
end;

procedure TForm1.BtnHelpClick(Sender: TObject);
begin
  about.AboutBox1.ShowModal;
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
close;
end;

end.
