program RGB1;

uses
  Forms,
  RGB in 'RGB.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
