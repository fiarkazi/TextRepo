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


  resourcestring
    rSpravka = 'В скором времени здесь будет отображаться справка';
    rAbout = 'О программе';
    rSpravkaCaption = 'Справка';
    rAboutCaption = 'О программе';

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
     begin
     Label1.Caption:= rSpravka;
     HelpForm.Caption:= rSpravkaCaption;
     end
  else if helpmess = 'about' then
     begin
     Label1.Caption:= rAbout;
     HelpForm.Caption:= rAboutCaption;
     end;
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

