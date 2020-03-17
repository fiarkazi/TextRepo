unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLProc, strutils, LazUTF8, SynEdit;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

  function FindInMemo(AMemo: TSynEdit; AString: String; StartPos: Integer): Integer;

resourcestring
  rFindAndReplacCaption = 'Найти и заменить';
  rNomatchesCaption = 'Нет совпадений!';

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
const
  SearchStr: String = '';                     // Строка, которую ищем
  SearchStart: Integer = 0;                   // Позиция, с которой начинаем искать строку
begin
  if SearchStr <> Edit1.Text then begin
    SearchStart := 0;
    SearchStr := Edit1.Text;
  end;
  SearchStart := FindInMemo(MainForm.SynEdit1, SearchStr, SearchStart + 1);

  if not(SearchStart > 0) then
  else
    Caption:= rNomatchesCaption;
end;

procedure TForm2.Button2Click(Sender: TObject);
var temp: String;
  newTemp: String;
begin
  temp:= MainForm.synEdit1.Text;
  newTemp:= StringReplace(temp, Edit1.Text, Edit2.Text, []);
  MainForm.SynEdit1.Text:= newTemp;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Caption:= rFindAndReplacCaption;
end;


// Функция FindInMemo: Возвращает позицию найденной строки
function FindInMemo(AMemo: TSynEdit; AString: String; StartPos: Integer): Integer;
begin
  Result := PosEx(AString, AMemo.Text, StartPos);
  if Result > 0 then
  begin
    AMemo.SelStart := UTF8Length(PChar(AMemo.Text), Result);
    AMemo.SelEnd := AMemo.SelStart + Length(AString);
  end;
end;

end.

