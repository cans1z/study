unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }



procedure TForm2.Button2Click(Sender: TObject);
begin
     edit1.clear;
     edit2.clear;
     edit3.clear;
     edit4.clear;
     edit5.clear;
     edit1.setfocus;
     label8.caption:='alfa=';
     label9.caption:='betta=';
     label10.caption:='gamma=';
end;

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
  var a,b,c,P:integer;
  alfa,betta,gamma,S,r:real;
begin
  a:=strtoint(edit1.text);
  b:=strtoint(edit2.text);
  c:=strtoint(edit3.text);
  P:= a+b+c;
  r:=Р/2;
  S:=sqrt(r*(r-a)*(r-b)*(r-c));
  alfa:=arccos((sqr(b)+sqr(c)sqr(a))/(2*b*c));
  betta:=arcsin(b/a*sin(alfa));
  gamma:=pi-(alfa+betta);
  alfa:=alfa*180/pi;
  betta:=betta*180/pi;
  gamma:=gamma*180/pi;
  Label8.caption:='alfa='+floattostr(alfa);
  Label9.caption:='betta='+floattostr(betta);
  Label10.caption:='gamma='+floattostr(gamma);
  Edit4.text:=inttostr(P);
  Edit5.text:=floattostr(S);
end;



end.

