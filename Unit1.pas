unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    LKontostand: TLabel;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    LMessage: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure LabeledEdit1Enter(Sender: TObject);
    procedure LabeledEdit1Exit(Sender: TObject);
    procedure StatsUpdate();
  private
    { Private-Deklarationen }
  public
    KOntostand:UInt64;
    wol:integer;
    aw:UInt64;
    errorRoulette:boolean;
    WettenCount:UInt64;
    WinMoneyCount:UInt64;
    WinCount:UInt64;
    LoseMoneyCount:UInt64;
    LoseCount:UInt64;
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure FixSGWidth(WhichSG:TStringGrid; const WhichCol: Integer); overload; //Calcute Column Width
var
  i, Temp, Longest: Integer;
const
  Padding = 20;
begin
  Longest := WhichSG.Canvas.TextWidth(WhichSG.Cells[WhichCol, 0]);
  for i := 1 to WhichSG.RowCount - 1 do
  begin
    Temp := WhichSG.Canvas.TextWidth(WhichSG.Cells[WhichCol, i]);
    if Temp > Longest then
    begin
      Longest := Temp;
    end;
  end;
  WhichSG.ColWidths[WhichCol] := Longest + Padding;
end;
procedure FixSGWidth(WhichSG:TStringGrid); overload; //Calcute Column Width
var
  i, k, Temp, Longest: Integer;
const
  Padding = 20;
begin
  for k := 1 to WhichSG.ColCount-1 do
  begin
    Longest := WhichSG.Canvas.TextWidth(WhichSG.Cells[k, 0]);
    for i := 1 to WhichSG.RowCount - 1 do
    begin
      Temp := WhichSG.Canvas.TextWidth(WhichSG.Cells[k, i]);
      if Temp > Longest then
      begin
        Longest := Temp;
      end;
    end;
    WhichSG.ColWidths[k] := Longest + Padding;
  end;
end;
procedure waitp(WaitTime: integer);
var
  StartTime: integer;
begin
  StartTime := GetTickCount; while GetTickCount < startTime + WaitTime do begin sleep(100); Application.ProcessMessages; end;
end;
procedure TForm1.StatsUpdate();
begin
  StringGrid1.Cells[0,0]:='Gewettet';
  StringGrid1.Cells[0,1]:='Gewonnen';
  StringGrid1.Cells[0,2]:='Verloren';
  StringGrid1.Cells[0,3]:='Geld +';
  StringGrid1.Cells[0,4]:='Geld -';
  StringGrid1.Cells[0,5]:='Geld +-';
  StringGrid1.Cells[1,0]:=UIntToStr(WettenCount);
  StringGrid1.Cells[1,1]:=UIntToStr(WinCount);
  StringGrid1.Cells[1,2]:=UIntToStr(LoseCount);
  StringGrid1.Cells[1,3]:=UIntToStr(WinMoneyCount);
  StringGrid1.Cells[1,4]:=UIntToStr(LoseMoneyCount);
  StringGrid1.Cells[1,5]:=UIntToStr(WinMoneyCount-LoseMoneyCount);
  FixSGWidth(StringGrid1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Button1.Enabled:=false;
Label3.Caption:='0';
while Label3.Caption<>'0' do
begin
  Label3.Caption:=IntToStr(StrToInt(Label3.Caption)-1);
  waitp(1000);
end;
Button1.Enabled:=true;
Kontostand:=Kontostand+10;
LKontostand.Caption:=UIntToStr(Kontostand);
Form1.Caption:='Casino - Kontostand: '+LKontostand.Caption;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
WettenCount:=WettenCount+1;
if (StrToUInt64(LabeledEdit1.Text)>Kontostand) or (LabeledEdit1.Text='') then
begin
  errorRoulette:=true;
end
else
begin
  wol:=random(StrToInt(Edit3.Text));
  if wol=0 then
  begin
    WinMoneyCount:=WinMoneyCount+StrToUInt64(LabeledEdit1.Text);
    WinCount:=WinCount+1;
    Kontostand:=Kontostand+StrToUInt64(LabeledEdit1.Text);
    LKontostand.Caption:=UIntToStr(Kontostand);
    Form1.Caption:='Casino - Kontostand: '+LKontostand.Caption;
    LMessage.Caption:='Du hast gewonnen!';
    LMessage.Font.Color:=clGreen;
  end
  else
  begin
    LoseMoneyCount:=LoseMoneyCount+StrToUInt64(LabeledEdit1.Text);
    LoseCount:=LoseCount+1;
    Kontostand:=Kontostand-StrToUInt64(LabeledEdit1.Text);
    LKontostand.Caption:=UIntToStr(Kontostand);
    Form1.Caption:='Casino - Kontostand: '+LKontostand.Caption;
    LMessage.Caption:='Du hast verloren!';
    LMessage.Font.Color:=clRed;
  end;
end;
StatsUpdate;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i:uint64;
begin
Kontostand:=StrToUint64(Edit4.Text);
LKontostand.Caption:=UIntToStr(Kontostand);
Form1.Caption:='Casino - Kontostand: '+LKontostand.Caption;
Edit4.Text:='';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then
Timer1.Enabled:=true
else
Timer1.Enabled:=false;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if Edit1.Text='' then
begin
  Edit1.Text:='0';
  Edit1.SelectAll;
end;
end;


procedure TForm1.Edit1Click(Sender: TObject);
begin
Edit1.SelectAll;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
if Edit2.Text='' then
begin
  Edit2.Text:='1';
  Edit2.SelectAll;
end;
Timer1.Interval:=StrToInt(Edit2.Text);
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
Edit2.SelectAll;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
if (2>StrToInt(Edit3.Text)) or (Edit3.Text='') then
begin
  Edit3.Text:='2';
  Edit3.SelectAll;
end;
end;

procedure TForm1.Edit3Click(Sender: TObject);
begin
Edit3.SelectAll;
end;

procedure TForm1.Edit4Enter(Sender: TObject);
begin
Button3.Default:=true;
end;

procedure TForm1.Edit4Exit(Sender: TObject);
begin
Button3.Default:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Kontostand:=0;
errorRoulette:=false;
WettenCount:=0;
WinMoneyCount:=0;
LoseMoneyCount:=0;
WinCount:=0;
LoseCount:=0;
end;

procedure TForm1.LabeledEdit1Enter(Sender: TObject);
begin
Button2.Default:=true;
end;

procedure TForm1.LabeledEdit1Exit(Sender: TObject);
begin
Button2.Default:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if errorRoulette=true then
begin
  aw:=StrToInt(Edit1.Text);
  {Timer1.Enabled:=false;
  CheckBox1.Checked:=false;
  wol:=1;
  waitp(100);
  LMessage.Caption:='Die Taktik wurde abgebrochen!';
  LMessage.Font.Color:=clRed;}
  ErrorRoulette:=false;
  if Kontostand<2 then
  begin
    Timer1.Enabled:=false;
    CheckBox1.Checked:=false;
    wol:=1;
    waitp(100);
    LMessage.Caption:='Die Taktik hat nicht funktioniert! Du bist jetzt arm!';
    LMessage.Font.Color:=clRed;
  end;
end
else if wol=0 then
begin
  aw:=StrToInt(Edit1.Text);
  LabeledEdit1.Text:=IntToStr(aw);
  Button2.Click;
end
else
begin
  aw:=aw*2;
  LabeledEdit1.Text:=IntToStr(aw);
  Button2.Click;
end;

end;

end.
