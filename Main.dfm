object MainForm: TMainForm
  Left = 342
  Top = 165
  Caption = 'Notepad Py'
  ClientHeight = 393
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SynEdit: TSynEdit
    Left = 0
    Top = 0
    Width = 841
    Height = 393
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.ShowCollapsedLine = True
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    UseCodeFolding = False
    BorderStyle = bsNone
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.Visible = False
    Gutter.Width = 0
    Highlighter = PythonHighlight
    Options = [eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
    SearchEngine = SynEditSearch
    WantTabs = True
    OnChange = SynEditChange
    FontSmoothing = fsmNone
  end
  object MainMenu: TMainMenu
    Left = 664
    Top = 16
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object ArquivoNovoItem: TMenuItem
        Action = ArquivoNovoCmd
      end
      object ArquivoNovaJanelaItem: TMenuItem
        Action = ArquivoNovaJanelaCmd
      end
      object ArquivoAbrirItem: TMenuItem
        Action = ArquivoAbrirCmd
      end
      object ArquivoSalvarItem: TMenuItem
        Action = ArquivoSalvarCmd
      end
      object ArquivoSalvarComoItem: TMenuItem
        Action = ArquivoSalvarComoCmd
      end
      object Preferncias1: TMenuItem
        Caption = '&Prefer'#234'ncias'
        object ArquivoTemaEscuroItem: TMenuItem
          Action = ArquivoTemaEscuroCmd
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ArquivoSairItem: TMenuItem
        Action = ArquivoSairCmd
      end
    end
    object Editar1: TMenuItem
      Caption = '&Editar'
      object EditarDesfazerItem: TMenuItem
        Action = EditarDesfazerCmd
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object EditarRecortarItem: TMenuItem
        Action = EditarRecortarCmd
      end
      object EditarCopiarItem: TMenuItem
        Action = EditarCopiarCmd
      end
      object EditarColarItem: TMenuItem
        Action = EditarColarCmd
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object EditarSelecionarTudoItem: TMenuItem
        Action = EditarSelecionarTudoCmd
      end
      object EditarQuebraLinhaItem: TMenuItem
        Action = EditarQuebraLinhaCmd
      end
    end
    object Executar1: TMenuItem
      Caption = 'E&xecutar'
      object ExecutarRodarItem: TMenuItem
        Action = ExecutarRodarCmd
      end
      object ExecutarRodarIdleItem: TMenuItem
        Action = ExecutarRodarIdleCmd
      end
      object ExecutarRodarIdleDebugItem: TMenuItem
        Action = ExecutarRodarIdleDebugCmd
      end
    end
    object Busca1: TMenuItem
      Caption = '&Buscar'
      object BuscarLocalizarItem: TMenuItem
        Action = BuscarLocalizarCmd
      end
      object BuscarLocalizarProximaItem: TMenuItem
        Action = BuscarLocalizarProximaCmd
      end
      object BuscarSubstituirItem: TMenuItem
        Action = BuscarSubstituirCmd
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Aj&uda'
      object AjudadoNotepadPyItem: TMenuItem
        Action = AjudaNotepadPyCmd
      end
      object AjudaDocumentacaoPythonItem: TMenuItem
        Action = AjudaDocumentacaoPythonCmd
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object AjudaSobreItem: TMenuItem
        Action = AjudaSobreCmd
      end
    end
  end
  object PythonHighlight: TSynPythonSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NonKeyAttri.Foreground = clNone
    StringAttri.Foreground = clGray
    Left = 672
    Top = 272
  end
  object OpenDialog: TOpenDialog
    Filter = 'Python Files|*.py'
    Left = 752
    Top = 80
  end
  object SaveDialog: TSaveDialog
    Filter = 'Python Files|*.py'
    Left = 664
    Top = 80
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 752
    Top = 16
    object ArquivoNovoCmd: TAction
      Category = 'Arquivo'
      Caption = '&Novo'
      ShortCut = 16462
      OnExecute = ArquivoNovo
    end
    object ArquivoAbrirCmd: TAction
      Category = 'Arquivo'
      Caption = 'A&brir'
      ShortCut = 16463
      OnExecute = ArquivoAbrir
    end
    object ArquivoSalvarCmd: TAction
      Category = 'Arquivo'
      Caption = 'Salva&r'
      ShortCut = 16467
      OnExecute = ArquivoSalvar
    end
    object ArquivoSalvarComoCmd: TAction
      Category = 'Arquivo'
      Caption = 'Salvar &como'
      ShortCut = 24659
      OnExecute = ArquivoSalvarComo
    end
    object ArquivoSairCmd: TAction
      Category = 'Arquivo'
      Caption = '&Sair'
      OnExecute = ArquivoSair
    end
    object EditarDesfazerCmd: TAction
      Category = 'Editar'
      Caption = 'Des&fazer'
      ShortCut = 16474
      OnExecute = EditarDesfazer
    end
    object EditarRecortarCmd: TAction
      Category = 'Editar'
      Caption = '&Recortar'
      ShortCut = 16472
      OnExecute = EditarRecortar
    end
    object EditarCopiarCmd: TAction
      Category = 'Editar'
      Caption = '&Copiar'
      ShortCut = 16451
      OnExecute = EditarCopiar
    end
    object EditarColarCmd: TAction
      Category = 'Editar'
      Caption = 'Co&lar'
      ShortCut = 16470
      OnExecute = EditarColar
    end
    object EditarSelecionarTudoCmd: TAction
      Category = 'Editar'
      Caption = 'Selecionar &tudo'
      ShortCut = 16449
      OnExecute = EditarSelecionarTudo
    end
    object EditarQuebraLinhaCmd: TAction
      Category = 'Editar'
      Caption = '&Quebra autom'#225'tica de linha'
      OnExecute = EditarQuebraLinha
    end
    object AjudaDocumentacaoPythonCmd: TAction
      Category = 'Ajuda'
      Caption = '&Documenta'#231#227'o do Python'
      ShortCut = 112
      OnExecute = AjudaDocumentacaoPyhton
    end
    object AjudaSobreCmd: TAction
      Category = 'Ajuda'
      Caption = 'So&bre o Notepad Py'
      OnExecute = AjudaSobre
    end
    object ArquivoNovaJanelaCmd: TAction
      Category = 'Arquivo'
      Caption = 'Nova &janela'
      ShortCut = 24654
      OnExecute = ArquivoNovaJanela
    end
    object BuscarLocalizarCmd: TAction
      Category = 'Buscar'
      Caption = '&Localizar'
      ShortCut = 16454
      OnExecute = BuscarLocalizar
    end
    object BuscarSubstituirCmd: TAction
      Category = 'Buscar'
      Caption = '&Substituir'
      ShortCut = 16456
      OnExecute = BuscarSubstituir
    end
    object BuscarLocalizarProximaCmd: TAction
      Category = 'Buscar'
      Caption = 'Localizar &pr'#243'xima'
      ShortCut = 114
      OnExecute = BuscarLocalizarProxima
    end
    object AjudaNotepadPyCmd: TAction
      Category = 'Ajuda'
      Caption = '&Ajuda do Notepad Py'
      ShortCut = 16496
      OnExecute = AjudaNotepadPy
    end
    object ArquivoTemaEscuroCmd: TAction
      Category = 'Arquivo'
      Caption = 'Tema &Escuro'
      ShortCut = 16452
      OnExecute = ArquivoTemaEscuro
    end
    object ExecutarRodarCmd: TAction
      Category = 'Executar'
      Caption = '&Rodar'
      ShortCut = 116
      OnExecute = ExecutarRodar
    end
    object ExecutarRodarIdleCmd: TAction
      Category = 'Executar'
      Caption = 'Rodar no &IDLE'
      ShortCut = 16500
      OnExecute = ExecutarRodarIdle
    end
    object ExecutarRodarIdleDebugCmd: TAction
      Category = 'Executar'
      Caption = 'Rodar no IDLE (&Debug Mode)'
      ShortCut = 24692
      OnExecute = ExecutarRodarIdleDebug
    end
  end
  object FindDialog: TFindDialog
    OnClose = FindDialogClose
    Options = [frDown, frFindNext]
    OnFind = FindDialogFind
    Left = 664
    Top = 144
  end
  object ReplaceDialog: TReplaceDialog
    OnClose = ReplaceDialogClose
    OnFind = ReplaceDialogFind
    OnReplace = ReplaceDialogReplace
    Left = 752
    Top = 144
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 680
    Top = 208
  end
  object SynEditSearch: TSynEditSearch
    Left = 760
    Top = 272
  end
end
