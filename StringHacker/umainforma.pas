unit UMainForma;

{$MODE Delphi}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, {XPMan,} ExtCtrls, Buttons, Spin;

type

  { TMainForma }

  TMainForma = class(TForm)
    KeyGroup: TGroupBox;
    StringKeyEdit: TEdit;
    MainFormaMenu: TMainMenu;
    FileMenu: TMenuItem;
    HelpMenu: TMenuItem;
    AboutProgram: TMenuItem;
    OperGroup: TRadioGroup;
    IntegerRadio: TRadioButton;
    IntegerSpinEdit: TSpinEdit;
    StringRadio: TRadioButton;
    ReadF: TMenuItem;
    WriteF: TMenuItem;
    ExitProgram: TMenuItem;
    StuffMemo: TMemo;
    HackButton: TButton;
    JustOpenDialog: TOpenDialog;
    JustSaveDialog: TSaveDialog;
    procedure AboutProgramClick(Sender: TObject);
    procedure ExitProgramClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IntegerRadioChange(Sender: TObject);
    procedure StringKeyEditKeyPress(Sender: TObject; var Key: Char);
    procedure HackButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure PreferencesClick(Sender: TObject);
    procedure ReadFClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure SaveAsButtonClick(Sender: TObject);
    procedure SettingsButtonClick(Sender: TObject);
    procedure AboutButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure StringKeyEditChange(Sender: TObject);
    procedure StringRadioChange(Sender: TObject);
    procedure StuffMemoChange(Sender: TObject);
    procedure StuffMemoKeyPress(Sender: TObject; var Key: char);
    procedure WordWrapCheckClick(Sender: TObject);
    procedure WriteFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForma: TMainForma;
  fn: String;

implementation

uses UAboutForma;

{$R *.lfm}

procedure TMainForma.StringKeyEditKeyPress(Sender: TObject; var Key: Char);
begin
if IntegerRadio.Checked
then begin
if not ((Key >= #48) and (Key <= #57)) and (Key <> '-') and (Key <> #13) and (Key <> #8)
then begin
Key := #0;
MessageBeep(MB_ICONERROR);
end;
end;
end;

procedure TMainForma.FormCreate(Sender: TObject);
begin

end;

procedure TMainForma.ExitProgramClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForma.AboutProgramClick(Sender: TObject);
begin
  AboutForma.Show;
end;

procedure TMainForma.IntegerRadioChange(Sender: TObject);
begin
  IntegerSpinEdit.Enabled := IntegerRadio.Checked;
end;

procedure HackString(intkey: Integer; strkey: String; opr: Integer);
var
i, k: Integer;
x, y: String;
begin
x := MainForma.StuffMemo.Text; y := ''; k := 0;

if strkey <> '' then begin
  for i := 1 to Length(x)
  do begin
  case opr of
  0: y := y + Chr(Ord(x[i]) xor Ord(strkey[k]));
  1: y := y + Chr(not Ord(x[i]));
  2: y := y + Chr(Ord(x[i]) and Ord(strkey[k]));
  3: y := y + Chr(Ord(x[i]) or Ord(strkey[k]));
  4: y := y + Chr(Ord(x[i]) shl Ord(strkey[k]));
  5: y := y + Chr(Ord(x[i]) shr Ord(strkey[k]));
  end;
  k := k + 1;
  if k > Length(strkey) then k := 0;
  end;
end;

if intkey <> 0 then begin
  for i := 1 to Length(x)
  do begin
  case opr of
  0: y := y + Chr(Ord(x[i]) xor intkey);
  1: y := y + Chr(not Ord(x[i]));
  2: y := y + Chr(Ord(x[i]) and intkey);
  3: y := y + Chr(Ord(x[i]) or intkey);
  4: y := y + Chr(Ord(x[i]) shl intkey);
  5: y := y + Chr(Ord(x[i]) shr intkey);
  end;
  end;
end;

MainForma.StuffMemo.Text := y;
end;

procedure TMainForma.HackButtonClick(Sender: TObject);
begin
if IntegerRadio.Checked
then HackString(IntegerSpinEdit.Value, '', OperGroup.ItemIndex)
else if StringRadio.Checked
then HackString(0, StringKeyEdit.Text, OperGroup.ItemIndex);
end;

procedure TMainForma.LoadButtonClick(Sender: TObject);
begin

end;

procedure TMainForma.PreferencesClick(Sender: TObject);
begin

end;

procedure TMainForma.ReadFClick(Sender: TObject);
begin
if JustOpenDialog.Execute then StuffMemo.Lines.LoadFromFile(JustOpenDialog.FileName);
end;

procedure TMainForma.SaveButtonClick(Sender: TObject);
begin

end;

procedure TMainForma.SaveAsButtonClick(Sender: TObject);
begin

end;

procedure TMainForma.SettingsButtonClick(Sender: TObject);
begin

end;

procedure TMainForma.AboutButtonClick(Sender: TObject);
begin

end;

procedure TMainForma.ExitButtonClick(Sender: TObject);
begin
Close;
end;

procedure TMainForma.StringKeyEditChange(Sender: TObject);
begin

end;

procedure TMainForma.StringRadioChange(Sender: TObject);
begin
  StringKeyEdit.Enabled := StringRadio.Checked;
end;

procedure TMainForma.StuffMemoChange(Sender: TObject);
begin
  HackButton.Enabled := (StuffMemo.Lines.Text.Length > 0);
end;

procedure TMainForma.StuffMemoKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TMainForma.WordWrapCheckClick(Sender: TObject);
begin

end;

procedure TMainForma.WriteFClick(Sender: TObject);
begin
if JustSaveDialog.Execute then StuffMemo.Lines.SaveToFile(JustSaveDialog.FileName);
end;

end.
