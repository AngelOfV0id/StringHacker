unit Unit2;

{$MODE Delphi}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, Unit3, ExtCtrls;

type
  TSettingsForma = class(TForm)
    WordWrapCheck: TCheckBox;
    LangRadioGroup: TRadioGroup;
    ChgEditFontBtn: TButton;
    FontDlg: TFontDialog;
    procedure WordWrapCheckClick(Sender: TObject);
    procedure LangRadioGroupClick(Sender: TObject);
    procedure ChgEditFontBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForma: TSettingsForma;

implementation

{$R *.lfm}

procedure TSettingsForma.WordWrapCheckClick(Sender: TObject);
begin
MainForma.StuffMemo.WordWrap := WordWrapCheck.Checked;
if WordWrapCheck.Checked
then MainForma.StuffMemo.ScrollBars := ssVertical
else MainForma.StuffMemo.ScrollBars := ssBoth;
end;

procedure TSettingsForma.LangRadioGroupClick(Sender: TObject);
begin

end;

procedure TSettingsForma.ChgEditFontBtnClick(Sender: TObject);
begin
if FontDlg.Execute then MainForma.StuffMemo.Font := FontDlg.Font;
end;

end.
