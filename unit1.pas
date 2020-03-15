unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, LCLType, Dialogs, Menus, ComCtrls,
  ExtCtrls, SynEdit, SynHighlighterPas, SynHighlighterHTML, SynHighlighterCss,
  SynHighlighterPHP, SynHighlighterJScript, DefaultTranslator, LCLTranslator;

type

  { TMainForm }

  TMainForm = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    menuFile: TMenuItem;
    menuCut: TMenuItem;
    menuCopy: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    menuThemeStandart: TMenuItem;
    menuThemeSpringColors: TMenuItem;
    menuThemeDarkness: TMenuItem;
    menuPaste: TMenuItem;
    menuView: TMenuItem;
    menuSyntax: TMenuItem;
    menuFont: TMenuItem;
    menuTheme: TMenuItem;
    menuFind: TMenuItem;
    menuSearch: TMenuItem;
    MenuItem19: TMenuItem;
    menuNewFile: TMenuItem;
    menuHelp: TMenuItem;
    menuDocumentation: TMenuItem;
    menuAbout: TMenuItem;
    menuSyntaxPascal: TMenuItem;
    menuSyntaxHtml: TMenuItem;
    menuSyntaxJScript: TMenuItem;
    menuSyntaxPhp: TMenuItem;
    menuSyntaxCss: TMenuItem;
    menuOpenFile: TMenuItem;
    menuCloseFile: TMenuItem;
    menuSaveFile: TMenuItem;
    menuSaveAsFile: TMenuItem;
    menuExit: TMenuItem;
    menuEdit: TMenuItem;
    menuSelectAll: TMenuItem;
    OpenDialog1: TOpenDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    SynCssSyn1: TSynCssSyn;
    SynEdit1: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    SynJScriptSyn1: TSynJScriptSyn;
    SynPasSyn1: TSynPasSyn;
    SynPHPSyn1: TSynPHPSyn;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure menuAboutClick(Sender: TObject);
    procedure menuCopyClick(Sender: TObject);
    procedure menuCutClick(Sender: TObject);
    procedure menuDocumentationClick(Sender: TObject);
    procedure menuFontClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure menuThemeDarknessClick(Sender: TObject);
    procedure menuThemeSpringColorsClick(Sender: TObject);
    procedure menuPasteClick(Sender: TObject);
    procedure menuSearchClick(Sender: TObject);
    procedure menuSelectAllClick(Sender: TObject);
    procedure menuSyntaxPascalClick(Sender: TObject);
    procedure menuSyntaxHtmlClick(Sender: TObject);
    procedure menuSyntaxJScriptClick(Sender: TObject);
    procedure menuSyntaxPhpClick(Sender: TObject);
    procedure menuSyntaxCssClick(Sender: TObject);
    procedure menuNewFileClick(Sender: TObject);
    procedure menuOpenFileClick(Sender: TObject);
    procedure menuCloseFileClick(Sender: TObject);
    procedure menuSaveFileClick(Sender: TObject);
    procedure menuSaveAsFileClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure menuThemeStandartClick(Sender: TObject);
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    procedure AppClose();
    procedure FileSave();
    procedure FileSaveAs();
    procedure ChangeSyntax();
  public

  end;

resourcestring
  rNewDocument = 'Новый документ';
  rLines = 'Строка: ';
  rSaved = 'Сохранен';
  rEdited = 'Изменен';
  rSaveFile = 'Сохранить';
  rNotSaveFile = 'Не сохранять';
  rWarning = 'Предупреждение!';
  rFile = 'Файл';
  rFiledNotSaved = 'не был сохранен. Сохранить?';

var
  MainForm: TMainForm;
  FileName: String;
  FileFlag: boolean; //true if file saved and was unedited after

implementation

uses Unit2;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.menuExitClick(Sender: TObject);
begin
     AppClose();
end;

procedure TMainForm.menuThemeStandartClick(Sender: TObject);
begin
  synEdit1.Color:= clWhite;
  SynEdit1.Font.Color:= clBlack;
end;

procedure TMainForm.menuNewFileClick(Sender: TObject);
begin
  if FileFlag = false then
    begin
      case QuestionDlg(rWarning, rFile + filename + rFiledNotSaved, mtCustom, [mrYes, rSaveFile, mrNo, rNotSaveFile], '') of
         mrYes: begin
           FileSave();
         end;
      end;
    end;
  SynEdit1.Lines.Clear;
  MainForm.Caption:= rNewDocument;
  filename:= '';
  FileFlag:= True;
  StatusBar1.Panels.Items[1].Text:= '';
end;

procedure TMainForm.menuSaveFileClick(Sender: TObject);
begin
  FileSave();
end;

procedure TMainForm.menuSaveAsFileClick(Sender: TObject);
begin
  FileSaveAs();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SynEdit1.Font.Color:= clBlack;
  SynEdit1.Lines.Clear;
  MainForm.Caption:= rNewDocument;
  FileFlag:= True;
  StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  AppClose();
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SynEdit1.Height:= (MainForm.ClientHeight-23);
  SynEdit1.Width:= MainForm.ClientWidth;
end;

procedure TMainForm.menuCopyClick(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
end;

procedure TMainForm.menuCutClick(Sender: TObject);
begin
  SynEdit1.CutToClipboard;
end;

procedure TMainForm.menuDocumentationClick(Sender: TObject);
begin
  RunHelpForm('help');
end;

procedure TMainForm.menuAboutClick(Sender: TObject);
begin
  RunHelpForm('about');
end;

procedure TMainForm.menuFontClick(Sender: TObject);
begin
 if FontDialog1.Execute then
     SynEdit1.Font.Assign(FontDialog1.Font);
 SynEdit1.SetFocus;
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  SetDefaultLang('en');
  StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);
  if MainForm.Caption = 'Новый документ' then MainForm.Caption:= rNewDocument;
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
 SetDefaultLang('ru');
 StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);
 if MainForm.Caption = 'New document' then MainForm.Caption:= rNewDocument;
end;

procedure TMainForm.menuThemeDarknessClick(Sender: TObject);
begin
  SynEdit1.Color:= clBtnShadow;
  SynEdit1.Font.Color:= clWhite;
end;

procedure TMainForm.menuThemeSpringColorsClick(Sender: TObject);
begin
  SynEdit1.Color:= clMoneyGreen;
  SynEdit1.Font.Color:= clBlack;
end;

procedure TMainForm.menuPasteClick(Sender: TObject);
begin
  SynEdit1.PasteFromClipboard;
end;

procedure TMainForm.menuSearchClick(Sender: TObject);
begin

end;

procedure TMainForm.menuSelectAllClick(Sender: TObject);
begin
  SynEdit1.SelectAll;
end;

procedure TMainForm.menuSyntaxPascalClick(Sender: TObject);
begin
   SynEdit1.Highlighter:= SynPasSyn1;
   StatusBar1.Panels.Items[2].Text:= 'Pascal';
end;

procedure TMainForm.menuSyntaxHtmlClick(Sender: TObject);
begin
  SynEdit1.Highlighter:= SynHTMLSyn1;
  StatusBar1.Panels.Items[2].Text:= 'HTML';
end;

procedure TMainForm.menuSyntaxJScriptClick(Sender: TObject);
begin
  SynEdit1.Highlighter:= SynJScriptSyn1;
  StatusBar1.Panels.Items[2].Text:= 'JScript';
end;

procedure TMainForm.menuSyntaxPhpClick(Sender: TObject);
begin
  SynEdit1.Highlighter:= SynPHPSyn1;
  StatusBar1.Panels.Items[2].Text:= 'PHP';
end;

procedure TMainForm.menuSyntaxCssClick(Sender: TObject);
begin
  SynEdit1.Highlighter:= SynCSSSyn1;
  StatusBar1.Panels.Items[2].Text:= 'CSS';

end;

procedure TMainForm.menuOpenFileClick(Sender: TObject);
begin
  openDialog1.Filter:= 'All ext|*|Text files|*.txt|Pascal|*.pas|HTML|*.html|CSS|*.css|PHP|*.php|JavaScript|*.js';
  if FileFlag = True then
    begin
     if OpenDialog1.Execute then
       begin
            filename:= OpenDialog1.FileName;
            SynEdit1.Lines.LoadFromFile(filename);
            MainForm.Caption:= filename;
       end;
    end
  else
    begin
      case QuestionDlg(rWarning, rFile + filename + rFiledNotSaved, mtCustom, [mrYes, rSaveFile, mrNo, rNotSaveFile], '') of
         mrYes: begin
           FileSave();
         end;
      end;
      if OpenDialog1.Execute then
       begin
            filename:= OpenDialog1.FileName;
            SynEdit1.Lines.LoadFromFile(filename);
            MainForm.Caption:= filename;
       end;
    end;
end;

procedure TMainForm.menuCloseFileClick(Sender: TObject);
begin
    AppClose();
end;

procedure TMainForm.FileSave();
var i: integer;
  n: integer;
  tempfile: text;
begin
  if FileName <> '' then
    begin
      if FileExists(FileName) then
         begin
            AssignFile(tempfile, filename);
            Rewrite(tempfile);
            n:= SynEdit1.Lines.Count;
            for i:=0 to n-1 do
                Writeln(tempfile, SynEdit1.Lines[i]);
            CloseFile(tempfile);
            FileFlag:= True;
            StatusBar1.Panels.Items[1].Text:= rSaved;
        end
      else FileSaveAs();
    end
 else FileSaveAs();
end;

procedure TMainForm.FileSaveAs();
begin
 SaveDialog1.Filter:= 'Text files|*.txt|Pascal|*.pas|HTML|*.html|CSS|*.css|PHP|*.php|JavaScript|*.js';
 if SaveDialog1.Execute then
    begin
      filename:= SaveDialog1.filename;
      MainForm.Caption:= filename;
      SynEdit1.Lines.SaveToFile(filename);
    end;
 StatusBar1.Panels.Items[1].Text:= rSaved;
end;

procedure TMainForm.SynEdit1Change(Sender: TObject);
begin
  FileFlag:= false;
  StatusBar1.Panels.Items[1].Text:= rEdited;
  StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);

end;

procedure TMainForm.AppClose();
begin
if FileFlag = false then
 begin
   case QuestionDlg(rWarning, rFile + filename + rFiledNotSaved, mtCustom, [mrYes, rSaveFile, mrNo, rNotSaveFile], '') of
   mrYes: begin
     FileSave();
     Application.Terminate;
   end;
   mrNo: Application.Terminate;
   end;
 end
else Application.Terminate;
end;

procedure TMainForm.ChangeSyntax();
begin

end;

procedure TMainForm.SynEdit1Click(Sender: TObject);
begin
     StatusBar1.Panels.Items[0].Text:= rLines + IntToStr(SynEdit1.CaretY);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var hr: word;
  min: word;
  sec: word;
  ms: word;
begin
  DecodeTime(Time, hr, min, sec, ms);
  StatusBar1.Panels.Items[3].Text:= IntToStr(hr) + ':' + IntToStr(min);
end;

end.

