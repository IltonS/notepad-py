unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, SynEdit,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPython, ShellAPI, About,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, RichEdit;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Arquivo1: TMenuItem;
    N1: TMenuItem;
    ArquivoSairItem: TMenuItem;
    Ajuda1: TMenuItem;
    ArquivoNovoItem: TMenuItem;
    ArquivoAbrirItem: TMenuItem;
    ArquivoSalvarItem: TMenuItem;
    ArquivoSalvarComoItem: TMenuItem;
    AjudaDocumentacaoPythonItem: TMenuItem;
    N3: TMenuItem;
    AjudaSobreItem: TMenuItem;
    Editar1: TMenuItem;
    EditarDesfazerItem: TMenuItem;
    N4: TMenuItem;
    EditarRecortarItem: TMenuItem;
    EditarCopiarItem: TMenuItem;
    EditarColarItem: TMenuItem;
    N5: TMenuItem;
    EditarSelecionarTudoItem: TMenuItem;
    EditarQuebraLinhaItem: TMenuItem;
    N6: TMenuItem;
    EditarRodarItem: TMenuItem;
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
    ActionList: TActionList;
    ArquivoNovoCmd: TAction;
    ArquivoAbrirCmd: TAction;
    ArquivoSalvarCmd: TAction;
    ArquivoSalvarComoCmd: TAction;
    ArquivoSairCmd: TAction;
    EditarDesfazerCmd: TAction;
    EditarRecortarCmd: TAction;
    EditarCopiarCmd: TAction;
    EditarColarCmd: TAction;
    EditarSelecionarTudoCmd: TAction;
    EditarQuebraLinhaCmd: TAction;
    EditarRodarCmd: TAction;
    AjudaDocumentacaoPythonCmd: TAction;
    AjudaSobreCmd: TAction;
    procedure FormCreate(Sender: TObject);
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
    procedure SynEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ArquivoNovo(Sender: TObject);
    procedure ArquivoAbrir(Sender: TObject);
    procedure ArquivoSalvar(Sender: TObject);
    procedure ArquivoSalvarComo(Sender: TObject);
    procedure ArquivoSair(Sender: TObject);
    procedure EditarRecortar(Sender: TObject);
    procedure EditarCopiar(Sender: TObject);
    procedure EditarColar(Sender: TObject);
    procedure EditarSelecionarTudo(Sender: TObject);
    procedure EditarQuebraLinha(Sender: TObject);
    procedure EditarRodar(Sender: TObject);
    procedure AjudaDocumentacaoPython(Sender: TObject);
    procedure AjudaSobre(Sender: TObject);
    procedure EditarDesfazer(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    FFileName: string;
  public
    { Public declarations }
  end;

resourcestring
  sSaveChanges = 'Deseja salvar as alterações em %s?';
  sOverWrite = '%s já existe.' + #13 + 'Deseja Substituí-lo?';
  sUntitled = 'Sem Título';

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not SynEdit.Modified then Exit;

  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]), mtConfirmation, mbYesNoCancel, 0);

  case SaveResp of
    idYes: ArquivoSalvar(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TMainForm.SetFileName(const FileName: string);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

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

procedure TMainForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  EditarRecortarCmd.Enabled := SynEdit.SelLength > 0;
  EditarCopiarCmd.Enabled := EditarRecortarCmd.Enabled;
  EditarDesfazerCmd.Enabled := SynEdit.CanUndo;
  EditarColarCmd.Enabled := SynEdit.CanPaste;
end;

procedure TMainForm.AjudaDocumentacaoPython(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('https://docs.python.org/pt-br/3/'), '', '', SW_NORMAL);
end;

procedure TMainForm.AjudaSobre(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.ArquivoAbrir(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
  end
end;

procedure TMainForm.ArquivoNovo(Sender: TObject);
begin
  CheckFileSave;
  SetFileName(sUntitled);
  SynEdit.Lines.Clear;
  SynEdit.Modified := False;
  SetModified(False);
end;

procedure TMainForm.ArquivoSair(Sender: TObject);
begin
  Close
end;

procedure TMainForm.ArquivoSalvar(Sender: TObject);
begin
  if FFileName = sUntitled then
    ArquivoSalvarComo(Sender)
  else
  begin
    SynEdit.Lines.SaveToFile(FFileName, TEncoding.UTF8);
    SynEdit.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.ArquivoSalvarComo(Sender: TObject);
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

procedure TMainForm.EditarColar(Sender: TObject);
begin
  SynEdit.PasteFromClipboard;
end;

procedure TMainForm.EditarCopiar(Sender: TObject);
begin
  SynEdit.CopyToClipboard
end;

procedure TMainForm.EditarDesfazer(Sender: TObject);
begin
  SynEdit.Undo
end;

procedure TMainForm.EditarQuebraLinha(Sender: TObject);
begin
  EditarQuebraLinhaItem.Checked := not EditarQuebraLinhaItem.Checked;
  SynEdit.WordWrap := EditarQuebraLinhaItem.Checked;
end;

procedure TMainForm.EditarRecortar(Sender: TObject);
begin
  SynEdit.CutToClipboard
end;

procedure TMainForm.EditarRodar(Sender: TObject);
begin
  CheckFileSave;
  ShellExecute(0, nil,'cmd', PChar('/C py ' + FFileName + ' & pause'), '', SW_NORMAL);
end;

procedure TMainForm.EditarSelecionarTudo(Sender: TObject);
begin
  SynEdit.SelectAll
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CheckFileSave
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetFileName(sUntitled);
end;

end.
