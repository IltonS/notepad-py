object FrmTextEditor: TFrmTextEditor
  Left = 342
  Top = 165
  Caption = 'Notepad Py'
  ClientHeight = 393
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 699
    Height = 393
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 624
    Top = 8
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object MNovo: TMenuItem
        Caption = 'Novo'
      end
      object MAbrir: TMenuItem
        Caption = 'Abrir'
      end
      object MSalvar: TMenuItem
        Caption = 'Salvar'
      end
      object MSalvarComo: TMenuItem
        Caption = 'Salvar como...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MPythonSetup: TMenuItem
        Caption = 'Python Setup'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MSair: TMenuItem
        Caption = 'Sair'
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
        Checked = True
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MRodar: TMenuItem
        Caption = 'Rodar'
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
      Caption = 'Ajuda'
      object MTopicosAjuda: TMenuItem
        Caption = 'T'#243'picos da ajuda (online)'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MSobre: TMenuItem
        Caption = 'Sobre o Notepad Py'
      end
    end
  end
end
