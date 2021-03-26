unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, SynEdit,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPython, ShellAPI, About,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, RichEdit, SynEditMiscClasses,
  Vcl.AppEvnts, SynEditSearch;

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
    BuscarLocalizarItem: TMenuItem;
    BuscarLocalizarProximaItem: TMenuItem;
    BuscarSubstituirItem: TMenuItem;
    SynEdit: TSynEdit;
    {
      Algumas palavras reservadas como o 'if' n�o eram reconhecidas.
      Altera��o feita com base em: https://stackoverflow.com/questions/29576141/delphi-synedit-does-not-recognize-all-keywords-from-the-list-python

      Adicionado o seguinte c�digo na linha 361 de SynHighlighterPython.pas
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
    ArquivoNovaJanelaCmd: TAction;
    ArquivoNovaJanelaItem: TMenuItem;
    BuscarLocalizarCmd: TAction;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;
    ApplicationEvents: TApplicationEvents;
    BuscarSubstituirCmd: TAction;
    SynEditSearch: TSynEditSearch;
    BuscarLocalizarProximaCmd: TAction;
    procedure FormCreate(Sender: TObject);
    /// <summary>
    ///   Rotina para associar o nome de um arquivo recebido pela OpenDialog ou
    ///   pela SaveDialog a propriedade FFileName do MainForm. Tam�m atualiza o
    ///   caption do formul�rio com o nome do arquivo.
    /// </summary>
    procedure SetFileName(const FileName: String);
    /// <summary>
    ///   Rotina para verificar se o arquivo foi modificado. Em caso afirmativo
    ///   chama a rotina para salvar.
    /// </summary>
    procedure CheckFileSave;
    /// <summary>
    ///   Rotina para carregar um arquivo
    /// </summary>
    procedure PerformFileOpen(const AFileName: string);
    /// <summary>
    ///   Altera o caption do formul�rio para exibir um status de modificado ou n�o.
    /// </summary>
    procedure SetModified(Value: Boolean);
    function IsNewSearch : Boolean;
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
    procedure AjudaDocumentacaoPyhton(Sender: TObject);
    procedure AjudaSobre(Sender: TObject);
    procedure EditarDesfazer(Sender: TObject);
    /// <summary>
    ///   Rotina para habilitar ou desabilitar os bot�es de Desfazer, Recortar, Copiar e Colar
    /// </summary>
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ArquivoNovaJanela(Sender: TObject);
    procedure BuscarLocalizar(Sender: TObject);
    procedure FindDialogClose(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure BuscarSubstituir(Sender: TObject);
    procedure ReplaceDialogClose(Sender: TObject);
    procedure FindDialogFind(Sender: TObject);
    procedure BuscarLocalizarProxima(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
    SearchIndex : integer;
  public
    { Public declarations }
  end;

resourcestring
  sSaveChanges = 'Deseja salvar as altera��es em %s?';
  sOverWrite = '%s j� existe.' + #13 + 'Deseja Substitu�-lo?';
  sUntitled = 'Sem T�tulo';
  sNotFound = 'N�o � poss�vel encontrar "%s".';

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

function TMainForm.IsNewSearch : Boolean;
begin
  if (SynEditSearch.Pattern = FindDialog.FindText) and
     (SynEditSearch.CaseSensitive = (frMatchCase in FindDialog.Options)) and
     (SynEditSearch.Whole = (frWholeWord in FindDialog.Options))
  then Result := False
  else Result := True;
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

procedure TMainForm.ReplaceDialogClose(Sender: TObject);
begin
  MainForm.SetFocus
end;

procedure TMainForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  EditarRecortarCmd.Enabled := SynEdit.SelLength > 0;
  EditarCopiarCmd.Enabled := EditarRecortarCmd.Enabled;
  EditarDesfazerCmd.Enabled := SynEdit.CanUndo;
  EditarColarCmd.Enabled := SynEdit.CanPaste;
  BuscarLocalizarProximaCmd.Enabled := (SynEditSearch.ResultCount > 0);
end;

procedure TMainForm.AjudaDocumentacaoPyhton(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('https://docs.python.org/pt-br/3/'), '', '', SW_NORMAL);
end;

procedure TMainForm.AjudaSobre(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  //By-pass para a mensagem de erro gerada pela FindDialog ao ser aberta pela primeira vez
  if E.Message <> 'Cannot focus a disabled or invisible window' then
    MessageDlg(E.Message,mtError,[mbOK], 0)
end;

procedure TMainForm.ArquivoAbrir(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
  end
end;

procedure TMainForm.ArquivoNovaJanela(Sender: TObject);
begin
  ShellExecute(0, nil, PChar(ParamStr(0)), '', '', SW_NORMAL);
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
  Close;
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

procedure TMainForm.BuscarLocalizarProxima(Sender: TObject);
begin
  FindDialogFind(Sender);
end;

procedure TMainForm.BuscarLocalizar(Sender: TObject);
begin
    FindDialog.Execute;
end;

procedure TMainForm.BuscarSubstituir(Sender: TObject);
begin
  ReplaceDialog.Execute;
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

procedure TMainForm.FindDialogClose(Sender: TObject);
begin
  MainForm.SetFocus
end;

procedure TMainForm.FindDialogFind(Sender: TObject);
var
  StillHasResults : Boolean;
begin

  if IsNewSearch then //� uma nova busca
  begin
    SynEditSearch.Pattern := FindDialog.FindText;
    SynEditSearch.CaseSensitive := frMatchCase in FindDialog.Options;
    SynEditSearch.Whole := frWholeWord in FindDialog.Options;

    SynEditSearch.FindAll(SynEdit.Lines.Text);

    if SynEditSearch.ResultCount > 0 then //Encontrou resutado
    begin
      if frDown in FindDialog.Options then
        SearchIndex := 0 //Buscar de Maneira Descendente
      else
        SearchIndex := SynEditSearch.ResultCount-1; //Buscar de maneira Ascendente

      SynEdit.SelStart := SynEditSearch.Results[SearchIndex]-1;
      SynEdit.SelLength := Length(FindDialog.FindText); //Faz a sele��o do resultado
    end
    else //N�o Encontrou resultado
    begin
      ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
    end;
  end
  else
  begin //N�o � uma nova busca
    if SynEditSearch.ResultCount > 0 then //Encontrou resutado
    begin
      if frDown in FindDialog.Options then //Busca Descendente
        StillHasResults := (SearchIndex+1) < SynEditSearch.ResultCount
      else //Busca Ascendente
        StillHasResults := (SearchIndex-1) >= 0;

      if StillHasResults then //Ainda possui resultado para selecionar
      begin
        if frDown in FindDialog.Options then
          Inc(SearchIndex) //Incrementa o �ndice de busca
        else
          Dec(SearchIndex); //Decrementa o �ndice de busca

        SynEdit.SelStart := SynEditSearch.Results[SearchIndex]-1;
        SynEdit.SelLength := Length(FindDialog.FindText); //Faz a sele��o do resultado
      end
      else //N�o possui mais resultados para mostrar
        ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
    end
    else // N�o encontrou resultado
    begin
      ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
    end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CheckFileSave
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetFileName(sUntitled);
  SearchIndex := -1;
end;

end.
