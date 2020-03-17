unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLProc, strutils, LazUTF8;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);

  private

  public

  end;
  function FindInMemo(Memo: TSynEdit; AString: String; StartPos: Integer): Integer;

var
  Form1: TForm1;

implementation

uses Unit1;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
const
  SearchStr: String = '';                     // Строка, которую ищем
  SearchStart: Integer = 0;                   // Позиция, с которой начинаем искать строку
begin
  if SearchStr <> Edit1.Text then begin
    SearchStart := 0;
    SearchStr := Edit1.Text;
  end;
  SearchStart := FindInMemo(SearchStr, SearchStart + 1);

  if SearchStart > 0 then
    Caption := 'Найдена в позиции['+IntToStr(SearchStart)+']!'
  else
    Caption := 'Нет совпадений!';
end;




// Функция FindInMemo: Возвращает позицию найденной строки
function FindInMemo(Memo: TSynEdit; AString: String; StartPos: Integer): Integer;
begin
  Result := PosEx(AString, Memo.Text, StartPos);
  if Result > 0 then
  begin
    Memo.SelStart := UTF8Length(PChar(Memo.Text), Result - 1);
    Memo.SelLength := Length(AString);
    Memo.SetFocus;
  end;
end;


end.

