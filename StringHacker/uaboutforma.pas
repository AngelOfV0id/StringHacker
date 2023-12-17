unit UAboutForma;

{$MODE Delphi}

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  { TAboutForma }

  TAboutForma = class(TForm)
    InfoMemo: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  PROGRAM_VERSION = 1.7;

var
  AboutForma: TAboutForma;

implementation

{$R *.lfm}

{ TAboutForma }

procedure TAboutForma.FormCreate(Sender: TObject);
begin
  InfoMemo.Lines.Text := InfoMemo.Lines.Text.Replace('$VERSION', FloatToStr(PROGRAM_VERSION));
  InfoMemo.Lines.Text := InfoMemo.Lines.Text.Replace('$BUILD_TIME', {$I %DATE%} + ' ' + {$I %TIME%});
end;

end.
