unit TextEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, SynEdit,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPython;

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
    MPythonSetup: TMenuItem;
    N2: TMenuItem;
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
    procedure MSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTextEditor: TFrmTextEditor;

implementation

{$R *.dfm}

procedure TFrmTextEditor.MSairClick(Sender: TObject);
begin
  Close;
end;

end.
