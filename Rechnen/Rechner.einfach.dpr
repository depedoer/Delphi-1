program Rechner.einfach;

uses
  Forms,
  Rechenprogramm in 'Rechenprogramm.pas' {Form1},
  about in 'about.pas' {AboutBox1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rechenprogramm1';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.Run;
end.
