object MainForm: TMainForm
  Left = 342
  Top = 165
  Caption = 'Notepad Py'
  ClientHeight = 393
  ClientWidth = 817
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
    Width = 817
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
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.Visible = False
    Gutter.Width = 0
    Highlighter = PythonHighlight
    Options = [eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
    WantTabs = True
    OnChange = SynEditChange
    FontSmoothing = fsmNone
  end
  object MainMenu: TMainMenu
    Left = 664
    Top = 16
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object MNovo: TMenuItem
        Caption = 'Novo'
      end
      object MAbrir: TMenuItem
        Caption = 'Abri&r'
        ShortCut = 16463
        OnClick = MAbrirClick
      end
      object MSalvar: TMenuItem
        Caption = 'Salvar'
      end
      object MSalvarComo: TMenuItem
        Caption = 'Salvar como...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MSair: TMenuItem
        Caption = '&Sair'
        ShortCut = 32883
        OnClick = MSairClick
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object MDesfazer: TMenuItem
        Caption = 'Desfazer'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MRecortar: TMenuItem
        Caption = 'Recortar'
      end
      object MCopiar: TMenuItem
        Caption = 'Copiar'
      end
      object MColar: TMenuItem
        Caption = 'Colar'
      end
      object MDeletar: TMenuItem
        Caption = 'Deletar'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MSelecionarTudo: TMenuItem
        Caption = 'Selecionar tudo'
      end
      object MQuebraLinha: TMenuItem
        Caption = 'Quebra de linha'
        OnClick = MQuebraLinhaClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MRodar: TMenuItem
        Caption = '&Rodar'
        ShortCut = 116
        OnClick = MRodarClick
      end
    end
    object Busca1: TMenuItem
      Caption = 'Busca'
      object MLocalizar: TMenuItem
        Caption = 'Localizar'
      end
      object MLocalizarProxima: TMenuItem
        Caption = 'Localizar Pr'#243'xima'
      end
      object MSubstituir: TMenuItem
        Caption = 'Substituir'
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Aj&uda'
      object MTopicosAjuda: TMenuItem
        Caption = 'T'#243'picos da ajuda (online)'
        ShortCut = 112
        OnClick = MTopicosAjudaClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MSobre: TMenuItem
        Caption = 'So&bre o Notepad Py'
        OnClick = MSobreClick
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
    StringAttri.Foreground = clSkyBlue
    Left = 736
    Top = 16
  end
  object OpenDialog: TOpenDialog
    Filter = 'Python Files|*.py'
    Left = 744
    Top = 80
  end
end
