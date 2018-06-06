program Mario;

uses
  Forms,
  UnitView in 'UnitView.pas' {Form1},
  UnitTMario in 'UnitTMario.pas',
  UnitTFeld in 'UnitTFeld.pas',
  UnitTGegner in 'UnitTGegner.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Mario';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
