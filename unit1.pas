unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    mainMnu_Edit: TMenuItem;
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
    ToggleBox1: TToggleBox;
    procedure mainMnu_SearchClick(Sender: TObject);
    procedure mainMnu_SpravClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
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
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.mainMnu_SearchClick(Sender: TObject);
begin

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

end;

procedure TForm1.subMnu_FindClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_FontClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_NewClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_OpenClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_PasteClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_ReplaceClick(Sender: TObject);
begin

end;

procedure TForm1.subMnu_SaveAsClick(Sender: TObject);
begin

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

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin

end;

end.

