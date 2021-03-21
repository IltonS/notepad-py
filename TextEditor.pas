unit TextEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, SynEdit,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPython, ShellAPI, About;

type
  TFrmTextEditor = class(TForm)
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
    MDeletar: TMenuItem;
    N5: TMenuItem;
    MSelecionarTudo: TMenuItem;
    MQuebraLinha: TMenuItem;
    N6: TMenuItem;
    MRodar: TMenuItem;
    Busca1: TMenuItem;
    MLocalizar: TMenuItem;
    MLocalizarProxima: TMenuItem;
    MSubstituir: TMenuItem;
    CodeEditor: TSynEdit;
    {
      Algumas palavras reservadas como o 'if' não eram reconhecidas.
      Alteração feita com base em: https://stackoverflow.com/questions/29576141/delphi-synedit-does-not-recognize-all-keywords-from-the-list-python

      Adicionado o seguinte código na linha 361 de SynHighlighterPython.pas
      FKeywords.Sort;
    }
    PythonHighlight: TSynPythonSyn;
    OpenDialog: TOpenDialog;
    procedure MSairClick(Sender: TObject);
    procedure MTopicosAjudaClick(Sender: TObject);
    procedure MAbrirClick(Sender: TObject);
    procedure MRodarClick(Sender: TObject);
    procedure MQuebraLinhaClick(Sender: TObject);
    procedure MSobreClick(Sender: TObject);
  private
    { Private declarations }
    OpenedFileName : string;
  public
    { Public declarations }
  end;

var
  FrmTextEditor: TFrmTextEditor;

implementation

{$R *.dfm}

procedure TFrmTextEditor.MAbrirClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    CodeEditor.Lines.LoadFromFile(OpenDialog.FileName,TEncoding.UTF8);
    Self.OpenedFileName := OpenDialog.FileName;
    Self.Caption := ExtractFileName(OpenDialog.FileName) + ' - Notepad Py';
  end;
end;

procedure TFrmTextEditor.MQuebraLinhaClick(Sender: TObject);
begin
  MQuebraLinha.Checked := not MQuebraLinha.Checked;
  CodeEditor.WordWrap := MQuebraLinha.Checked;
end;

procedure TFrmTextEditor.MRodarClick(Sender: TObject);
begin
  ShellExecute(0, nil,'cmd', PChar('/C py ' + Self.OpenedFileName + ' & pause'), '', SW_NORMAL);
end;

procedure TFrmTextEditor.MSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTextEditor.MSobreClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TFrmTextEditor.MTopicosAjudaClick(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('https://docs.python.org/pt-br/3/'), '', '', SW_NORMAL);
end;

end.
