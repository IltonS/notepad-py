unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, SynEdit,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPython, ShellAPI, About;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Arquivo1: TMenuItem;
    N1: TMenuItem;
    MSair: TMenuItem;
    Ajuda1: TMenuItem;
    MNovo: TMenuItem;
    MAbrir: TMenuItem;
    MSalvar: TMenuItem;
    MSalvarComo: TMenuItem;
    MTopicosAjuda: TMenuItem;
    N3: TMenuItem;
    MSobre: TMenuItem;
    Editar1: TMenuItem;
    MDesfazer: TMenuItem;
    N4: TMenuItem;
    MRecortar: TMenuItem;
    MCopiar: TMenuItem;
    MColar: TMenuItem;
    N5: TMenuItem;
    MSelecionarTudo: TMenuItem;
    MQuebraLinha: TMenuItem;
    N6: TMenuItem;
    MRodar: TMenuItem;
    Busca1: TMenuItem;
    MLocalizar: TMenuItem;
    MLocalizarProxima: TMenuItem;
    MSubstituir: TMenuItem;
    SynEdit: TSynEdit;
    {
      Algumas palavras reservadas como o 'if' não eram reconhecidas.
      Alteração feita com base em: https://stackoverflow.com/questions/29576141/delphi-synedit-does-not-recognize-all-keywords-from-the-list-python

      Adicionado o seguinte código na linha 361 de SynHighlighterPython.pas
      FKeywords.Sort;
    }
    PythonHighlight: TSynPythonSyn;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure MSairClick(Sender: TObject);
    procedure MTopicosAjudaClick(Sender: TObject);
    procedure MAbrirClick(Sender: TObject);
    procedure MRodarClick(Sender: TObject);
    procedure MQuebraLinhaClick(Sender: TObject);
    procedure MSobreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
    procedure SynEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MNovoClick(Sender: TObject);
    procedure MSalvarComoClick(Sender: TObject);
    procedure MSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
  public
    { Public declarations }
  end;

resourcestring
  sSaveChanges = 'Deseja salvar as alterações em %s?';
  sOverWrite = 'OK para substituir %s';
  sUntitled = 'Sem Título';

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure TMainForm.SetModified(Value: Boolean);
begin
  if Value then
    Caption := Format('*%s - %s', [ExtractFileName(FFileName), Application.Title])
  else
    Caption := Format('%s - %s', [ExtractFileName(FFileName), Application.Title]);
end;

procedure TMainForm.SynEditChange(Sender: TObject);
begin
  SetModified(SynEdit.Modified);
end;

procedure TMainForm.PerformFileOpen(const AFileName: string);
begin
  SynEdit.Lines.LoadFromFile(AFileName, TEncoding.UTF8);
  SetFileName(AFileName);
  SynEdit.SetFocus;
  SynEdit.Modified := False;
  SetModified(False);
end;

procedure TMainForm.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not SynEdit.Modified then Exit;

  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]), mtConfirmation, mbYesNoCancel, 0);

  case SaveResp of
    idYes: MSalvarClick(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TMainForm.SetFileName(const FileName: string);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CheckFileSave
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(sUntitled);
end;

procedure TMainForm.MAbrirClick(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
  end
end;

procedure TMainForm.MNovoClick(Sender: TObject);
begin
  CheckFileSave;
  SetFileName(sUntitled);
  SynEdit.Lines.Clear;
  SynEdit.Modified := False;
  SetModified(False);
end;

procedure TMainForm.MQuebraLinhaClick(Sender: TObject);
begin
  MQuebraLinha.Checked := not MQuebraLinha.Checked;
  SynEdit.WordWrap := MQuebraLinha.Checked;
end;

procedure TMainForm.MRodarClick(Sender: TObject);
begin
  CheckFileSave;
  ShellExecute(0, nil,'cmd', PChar('/C py ' + FFileName + ' & pause'), '', SW_NORMAL);
end;

procedure TMainForm.MSairClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MSalvarClick(Sender: TObject);
begin
  if FFileName = sUntitled then
    MSalvarComoClick(Sender)
  else
  begin
    SynEdit.Lines.SaveToFile(FFileName, TEncoding.UTF8);
    SynEdit.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.MSalvarComoClick(Sender: TObject);
begin
if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]), mtConfirmation, mbYesNoCancel, 0) <> idYes then
        Exit;

    if ExtractFileExt(SaveDialog.FileName) <> '.py' then
      SaveDialog.FileName := SaveDialog.FileName + '.py';

    SynEdit.Lines.SaveToFile(SaveDialog.FileName, TEncoding.UTF8);
    SetFileName(SaveDialog.FileName);
    SynEdit.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.MSobreClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.MTopicosAjudaClick(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('https://docs.python.org/pt-br/3/'), '', '', SW_NORMAL);
end;

end.
