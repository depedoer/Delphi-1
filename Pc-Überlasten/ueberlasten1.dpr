program ueberlasten1;

uses
  Forms,
  Ueberlasten in 'Ueberlasten.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
