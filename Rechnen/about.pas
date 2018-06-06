unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg;

type
  TAboutBox1 = class(TForm)
    Panel1: TPanel;
    OurProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  AboutBox1: TAboutBox1;

implementation

{$R *.dfm}

procedure TAboutBox1.OKButtonClick(Sender: TObject);
begin
close;
end;

end.
 
