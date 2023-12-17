program StrHack;

{$MODE Delphi}

uses
  Forms, Interfaces,
  UMainForma {MainForma},
  UAboutForma {AboutForma};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'String Hacker';
  Application.CreateForm(TMainForma, MainForma);
  Application.CreateForm(TAboutForma, AboutForma);
  Application.Run;
end.
