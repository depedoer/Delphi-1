program Shut1;

uses
  Forms,
  Shut in 'Shut.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.ShowMainForm:=false;
  Application.Run;
end.
