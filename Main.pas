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
    ///   pela SaveDialog a propriedade FFileName do MainForm. Tamém atualiza o
    ///   caption do formulário com o nome do arquivo.
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
    ///   Altera o caption do formulário para exibir um status de modificado ou não.
    /// </summary>
    procedure SetModified(Value: Boolean);
    function FindDialogIsNewSearch : Boolean;
    function ReplaceDialogIsNewSearch : Boolean;
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
    ///   Rotina para habilitar ou desabilitar os botões de Desfazer, Recortar, Copiar e Colar
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
    procedure ReplaceDialogReplace(Sender: TObject);
    procedure ReplaceDialogReplaceAll(Sender: TObject);
    procedure ReplaceDialogFind(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
    SearchIndex : integer;
    SearchModified : Boolean;
  public
    { Public declarations }
  end;

resourcestring
  sSaveChanges = 'Deseja salvar as alterações em %s?';
  sOverWrite = '%s já existe.' + #13 + 'Deseja Substituí-lo?';
  sUntitled = 'Sem Título';
  sNotFound = 'Não é possível encontrar "%s".';
  sReplaces = 'Tudo pronto. Fizemos %s substituições.';

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

function TMainForm.FindDialogIsNewSearch : Boolean;
begin
  if (SynEditSearch.Pattern = FindDialog.FindText) and
     (SynEditSearch.CaseSensitive = (frMatchCase in FindDialog.Options)) and
     (SynEditSearch.Whole = (frWholeWord in FindDialog.Options)) and
     not SearchModified
  then
    Result := False
  else
    Result := True;
end;

function TMainForm.ReplaceDialogIsNewSearch : Boolean;
begin
  if (SynEditSearch.Pattern = ReplaceDialog.FindText) and
     (SynEditSearch.CaseSensitive = (frMatchCase in ReplaceDialog.Options)) and
     (SynEditSearch.Whole = (frWholeWord in ReplaceDialog.Options)) and
     not SearchModified
  then
    Result := False
  else
    Result := True;
end;

procedure TMainForm.SynEditChange(Sender: TObject);
begin
  SetModified(SynEdit.Modified);
  SearchModified :=  True;
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

procedure TMainForm.ReplaceDialogFind(Sender: TObject);
var
  I : Integer;
begin
  if ReplaceDialogIsNewSearch then // É uma nova busca
  begin
    SynEditSearch.Pattern := ReplaceDialog.FindText;
    SynEditSearch.CaseSensitive := frMatchCase in ReplaceDialog.Options;
    SynEditSearch.Whole := frWholeWord in ReplaceDialog.Options;

    SynEditSearch.FindAll(SynEdit.Lines.Text);
    SearchModified := False;
  end;

  if SynEditSearch.ResultCount > 0 then //Encontrou resutado
  begin
    SearchIndex := -1;
    //Pega Search Index:
    for I := 0 to (SynEditSearch.ResultCount-1) do
    begin
      if (SynEditSearch.Results[I]-1) >= SynEdit.SelStart then //O resultado está depois ou no começo do cursor
      begin
        if ((SynEditSearch.Results[I]-1) = SynEdit.SelStart) and (not SynEdit.SelText.IsEmpty) then //O resultado está no começo do cursor e já foi selecionado
          SearchIndex := I+1
        else
          SearchIndex := I;

        if SearchIndex >= SynEditSearch.ResultCount then //ìndice fora de alcance
          SearchIndex :=-1;

        break
      end;
    end;//For

    if SearchIndex >= 0 then //Há resultado para exibir
    begin
      SynEdit.SelStart := SynEditSearch.Results[SearchIndex]-1;
      SynEdit.SelLength := Length(ReplaceDialog.FindText); //Faz a seleção do resultado
    end
    else //Não há resultado para exibir
    begin
      ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
    end;
  end
  else //Não encontrou resultado
  begin
    ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
  end;

end;

procedure TMainForm.ReplaceDialogReplaceAll(Sender: TObject);
var
  Result, ResultCount: Integer;
begin
  SynEditSearch.Pattern := ReplaceDialog.FindText;
  SynEditSearch.CaseSensitive := frMatchCase in ReplaceDialog.Options;
  SynEditSearch.Whole := frWholeWord in ReplaceDialog.Options;

  //Se a string antiga está contida na nova string a opção Whole será ativada
  //obrigatoriamente para evitar uma substituição recursiva
  if pos(ReplaceDialog.FindText, ReplaceDialog.ReplaceText) > 0 then
    SynEditSearch.Whole := True;

  Result := SynEditSearch.FindFirst(SynEdit.Lines.Text);
  ResultCount := 0;

  while Result > 0 do
  begin
    SynEdit.SelStart := Result-1;
    SynEdit.SelLength := Length(ReplaceDialog.FindText); //Faz a seleção do resultado
    SynEdit.SelText := ReplaceDialog.ReplaceText;
    SearchModified := True;
    Inc(ResultCount);

    Result := SynEditSearch.FindFirst(SynEdit.Lines.Text);
  end;

  if ResultCount = 0 then
    ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]))
  else
    ShowMessage(Format(sReplaces, [ IntToStr(ResultCount) ]));
end;

procedure TMainForm.ReplaceDialogReplace(Sender: TObject);
begin
  if frReplaceAll in ReplaceDialog.Options then //Rotina para substituir tudo
  begin
    ReplaceDialogReplaceAll(Sender);
  end
  else //Rotina para substituir 1 por vez
  begin
    // Verifica se não existe um texto selecionado
    // Ou exite um texto selecionado porém é diferente do texto buscado
    if (SynEdit.SelText.IsEmpty) or ( (not SynEdit.SelText.IsEmpty) and (SynEdit.SelText<>ReplaceDialog.FindText) ) then
      ReplaceDialogFind(Sender) //Seleciona um resultado
    else
    begin
      SynEdit.SelText := ReplaceDialog.ReplaceText; //Faz a substituição
      SearchModified := True;
    end
  end;
end;

procedure TMainForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  EditarRecortarCmd.Enabled := SynEdit.SelLength > 0;
  EditarCopiarCmd.Enabled := EditarRecortarCmd.Enabled;
  EditarDesfazerCmd.Enabled := SynEdit.CanUndo;
  EditarColarCmd.Enabled := SynEdit.CanPaste;
  BuscarLocalizarProximaCmd.Enabled := (SynEditSearch.ResultCount > 0) and (not FindDialog.FindText.IsEmpty);
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
  ShellExecute(0, nil,'cmd', PChar('/C py "' + FFileName + '" & pause'), '', SW_NORMAL);
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
  if FindDialogIsNewSearch then //É uma nova busca
  begin
    SynEditSearch.Pattern := FindDialog.FindText;
    SynEditSearch.CaseSensitive := frMatchCase in FindDialog.Options;
    SynEditSearch.Whole := frWholeWord in FindDialog.Options;

    SynEditSearch.FindAll(SynEdit.Lines.Text);
    SearchModified := False;

    if SynEditSearch.ResultCount > 0 then //Encontrou resutado
    begin
      if frDown in FindDialog.Options then
        SearchIndex := 0 //Buscar de Maneira Descendente
      else
        SearchIndex := SynEditSearch.ResultCount-1; //Buscar de maneira Ascendente

      SynEdit.SelStart := SynEditSearch.Results[SearchIndex]-1;
      SynEdit.SelLength := Length(FindDialog.FindText); //Faz a seleção do resultado
    end
    else //Não Encontrou resultado
    begin
      ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
    end;
  end
  else
  begin //Não é uma nova busca
    if SynEditSearch.ResultCount > 0 then //Encontrou resutado
    begin
      if frDown in FindDialog.Options then //Busca Descendente
        StillHasResults := (SearchIndex+1) < SynEditSearch.ResultCount
      else //Busca Ascendente
        StillHasResults := (SearchIndex-1) >= 0;

      if StillHasResults then //Ainda possui resultado para selecionar
      begin
        if frDown in FindDialog.Options then
          Inc(SearchIndex) //Incrementa o índice de busca
        else
          Dec(SearchIndex); //Decrementa o índice de busca

        SynEdit.SelStart := SynEditSearch.Results[SearchIndex]-1;
        SynEdit.SelLength := Length(FindDialog.FindText); //Faz a seleção do resultado
      end
      else //Não possui mais resultados para mostrar
        ShowMessage(Format(sNotFound, [SynEditSearch.Pattern]));
    end
    else // Não encontrou resultado
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
  SearchModified := True;
end;

end.
