unit RGB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    SL:TStringList; //Alte Stringlist
    imagesize:integer;
    AnzahlBuchstabe:integer;
    unicode: array of String;
    SLChar:array [1..5] of TStringList; //Stringlist mit Daten der einzelnen Buchstaben
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  farbe2: array of integer;

implementation

{$R *.dfm}


{procedure WriteArray(FileName : string;MyArray : array of Integer);
 var a:integer;
     f : Text;
begin
 AssignFile(f,FileName);
 Rewrite(f);
 for a:=0 to Length(MyArray)-1 do
 begin
  Writeln( f, IntToStr(a+1)+'. ='+IntToStr(farbe2[a]));
 end;
 CloseFile(f);
end;  }

procedure TForm1.Button1Click(Sender: TObject);
var f,i,j,k,farbe:integer; unistring,alt:string;
begin
  SL:=TStringList.Create;
  imagesize:=Image1.Picture.Bitmap.Height*Image1.Picture.Bitmap.Width;
  setlength(farbe2,imagesize);
  setlength(unicode,Image1.Picture.Bitmap.Width+1);
  unistring:='';
  f:=1;
  for I := 0 to Image1.Picture.Bitmap.Height do begin
    for J := 0 to Image1.Picture.Bitmap.Width do begin
      farbe:=Image1.Canvas.Pixels[j,i];
      farbe2[f]:=GetBValue(farbe);
      f:=f+1;
      if NOT (GetBValue(farbe)=49) OR (GetBValue(farbe)=32) OR (GetBValue(farbe)=55) then Image1.Canvas.Pixels[j,i]:=clwhite;
      Insert('$x'+InttoStr(GetBValue(Image1.Canvas.Pixels[j,i])),unistring,length(unistring)+1);
    end;
      SL.Add(unistring);
      unistring:='';
  end;
  SL.SaveToFile('Captcha.txt');
  ///////////////////////////////////////////////////////////////////////////
  for I := 0 to SL.Count-1 do begin
    alt:=SL.Strings[i];
    for J := 1 to Image1.Picture.Bitmap.Width do begin
      if Pos('$x255',alt)=1 then begin
        Delete(alt,1,5);
        Insert(InttoStr(0)+',',unistring,length(unistring)+1);
      end
      else begin
        Delete(alt,1,4);
        Insert(InttoStr(1)+',',unistring,length(unistring)+1);
      end;
    end;
    Delete(unistring,length(unistring),1);
    SL.Add(unistring);
    Unistring:='';
  end;
  for i:=0 to Image1.Picture.Bitmap.Height do SL.Delete(40-Image1.Picture.Bitmap.Height);
  SL.SaveToFile('Captcha-Pos.txt');
  /////////////////////////////////////////////////////////////////////////////
  for I := 0 to Image1.Picture.Bitmap.Height-1 do begin
    alt:=SL.Strings[i];
    for J := 1 to Image1.Picture.Bitmap.Width do begin
      if Pos(InttoStr(0),alt)=1 then Insert('5',unicode[j],length(unicode[j])+1)
      else Insert('8',unicode[j],length(unicode[j])+1);
      Delete(alt,1,2);
    end;
  end;
  for I := 1 to Image1.Picture.Bitmap.Width do begin
    if unicode[i]='5555555555555555555555555555555555555555' then begin
      SL.Add('Line '+Inttostr(i)+': leer');
      unicode[i]:='leer';
    end
    else begin
      SL.Add('Line '+Inttostr(i)+': voll');
      unicode[i]:='voll';
    end;
  end;
  SL.SaveToFile('Captcha-Genauer.txt');
  ///////////////////////////////////////////////////////////////////////////
  F:=0;
  for I := 0 to Image1.Picture.Bitmap.Height do begin
    alt:=SL.Strings[f];
    if Pos('1',alt)=0 then
      SL.Delete(f)
    else F:=f+1;
  end;
  SL.SaveToFile('Captcha-Oben_Unten-weg.txt');
  //////////////////////////////////////////////////////////////////////////
  for I := 1 to length(SlChar) do SLChar[i]:=TStringlist.Create;
  j:=0;
  AnzahlBuchstabe:=0;
  for I := 1 to length(unicode)-1 do begin    //38
    if (Unicode[i]='voll') AND (Unicode[i-1]='leer') then begin
      j:=i;
      AnzahlBuchstabe:=AnzahlBuchstabe+1;
      while Unicode[j]='voll' do begin
        J:=J+1;                          //i ist 1. voll
      end;                             //j ist leer  //j-1 ist letzter voll
      for k := 0 to f do begin
        alt:=SL.Strings[k];
        Delete(alt,(j-1)*2,(length(alt)-j)*2);
        Delete(alt,1,(i-1)*2);
        if Pos('1',alt)>0 then SLChar[AnzahlBuchstabe].Add(alt);
      end;
      SLChar[AnzahlBuchstabe].SaveToFile('Buchstabe'+InttoStr(AnzahlBuchstabe)+'.txt');
    end;
  end;


end;


end.
