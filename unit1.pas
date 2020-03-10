unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus,unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    mainMnu_Edit: TMenuItem;
    OpenDialog1: TOpenDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    subMnu_Theme: TMenuItem;
    subMnu_selAll: TMenuItem;
    subMnu_Cut: TMenuItem;
    subMnu_Copy: TMenuItem;
    subMnu_Paste: TMenuItem;
    subMnu_New: TMenuItem;
    subMnu_Open: TMenuItem;
    subMnu_Close: TMenuItem;
    subMnu_Save: TMenuItem;
    subMnu_SaveAs: TMenuItem;
    mainMnu_View: TMenuItem;
    subMnu_Exit: TMenuItem;
    mainMnu_Search: TMenuItem;
    mainMnu_Sprav: TMenuItem;
    subMnu_Sprav: TMenuItem;
    subMnu_About: TMenuItem;
    subMnu_Find: TMenuItem;
    subMnu_Replace: TMenuItem;
    subMnu_Font: TMenuItem;
    mainMnu_File: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure mainMnu_SearchClick(Sender: TObject);
    procedure mainMnu_SpravClick(Sender: TObject);
    procedure mainMnu_EditClick(Sender: TObject);
    procedure mainMnu_FileClick(Sender: TObject);
    procedure subMnu_AboutClick(Sender: TObject);
    procedure subMnu_CloseClick(Sender: TObject);
    procedure subMnu_CopyClick(Sender: TObject);
    procedure subMnu_CutClick(Sender: TObject);
    procedure subMnu_ExitClick(Sender: TObject);
    procedure subMnu_FindClick(Sender: TObject);
    procedure subMnu_FontClick(Sender: TObject);
    procedure subMnu_NewClick(Sender: TObject);
    procedure subMnu_OpenClick(Sender: TObject);
    procedure subMnu_PasteClick(Sender: TObject);
    procedure subMnu_ReplaceClick(Sender: TObject);
    procedure subMnu_SaveAsClick(Sender: TObject);
    procedure subMnu_SaveClick(Sender: TObject);
    procedure subMnu_selAllClick(Sender: TObject);
    procedure subMnu_SpravClick(Sender: TObject);
    procedure subMnu_ThemeClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  txtFile:string;
  file1:string;

implementation

{$R *.lfm}

{ TForm1 }

procedure memoLoad(txtFile: string);
var
tfile: TStringList;
str: string;
begin
tfile:= TStringList.Create;
tfile.LoadFromFile(txtFile);
str:= tfile.Text;
Form1.Memo1.Lines.Add(str);
tfile.Free;
end;

procedure memoSave(txtFile: string);
var
tfile: TStringList;
str: string;
begin
tfile:= TStringList.Create;
str:=Form1.Memo1.text;
tfile.Add(str);
tfile.SaveToFile(txtFile);
tfile.Free;
end;

procedure TForm1.mainMnu_SearchClick(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption:= 'Текстовый Редактор';
end;

procedure TForm1.mainMnu_SpravClick(Sender: TObject);
begin

end;

procedure TForm1.mainMnu_EditClick(Sender: TObject);
begin

end;

procedure TForm1.mainMnu_FileClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_AboutClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.subMnu_CloseClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_CopyClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_CutClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_ExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.subMnu_FindClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_FontClick(Sender: TObject);
begin
  FontDialog1.Font:= memo1.Font;
  if FontDialog1.Execute = true then
     begin
        Form1.Memo1.Font := FontDialog1.Font;
     end;
end;

procedure TForm1.subMnu_NewClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_OpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
     begin
        file1:=OpenDialog1.FileName;
        memoLoad(file1);
     end;
end;

procedure TForm1.subMnu_PasteClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_ReplaceClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_SaveAsClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
     begin
        file1:=SaveDialog1.FileName;
        memoSave(file1);
     end;
end;

procedure TForm1.subMnu_SaveClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_selAllClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_SpravClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_ThemeClick(Sender: TObject);
begin

end;


end.

