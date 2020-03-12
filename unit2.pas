unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { THelpForm }

  THelpForm = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);

  private

  public

  end;
  procedure RunHelpForm(message: String);
var
  HelpForm: THelpForm;
  helpmess: string;

implementation

{$R *.lfm}

{ THelpForm }

procedure THelpForm.Label1Click(Sender: TObject);
begin

end;

procedure THelpForm.FormCreate(Sender: TObject);
begin
  if helpmess = 'help' then
     Label1.Caption:= 'В скором времени здесь будет отображаться справка'
  else if helpmess = 'about' then
     Label1.Caption:= 'О программе';
end;

procedure RunHelpForm(message: String);
begin
  helpmess:= message;
  with THelpForm.Create(Application) do
       try
         ShowModal;
       finally
         Free;
       end;
end;

end.

