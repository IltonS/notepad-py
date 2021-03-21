object AboutBox: TAboutBox
  Left = 537
  Top = 219
  BorderStyle = bsDialog
  Caption = 'Sobre'
  ClientHeight = 321
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 24
    Top = 24
    Width = 32
    Height = 32
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200403000000815467C70000000F504C5445C0C0C0000000FFFFFF80808047
      704C8EE27D000000000574524E53FFFFFFFF00FBB60E53000000634944415478
      DA637461386B70F92F1431333030BAFC7FC0CFF8018AFE0B0305DE210404DFB2
      186013F8C00003FF3E1029F0FE0303A30003C387FF8C7CF85590622835CC780F
      13C1E7303AA820C32FA4FBF6FF5EB80023833330B219CEC20518980D180039BF
      92A1FBAAD1EF0000000049454E44AE426082}
    Stretch = True
  end
  object Label1: TLabel
    Left = 88
    Top = 24
    Width = 64
    Height = 13
    Caption = 'Notepad Py'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 43
    Width = 56
    Height = 13
    Caption = 'Vers'#227'o: 0.1'
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 39
    Height = 13
    Caption = 'Licensa:'
  end
  object Label4: TLabel
    Left = 24
    Top = 224
    Width = 182
    Height = 13
    Caption = 'Mem'#243'ria f'#237'sica dispon'#237'vel no Windows:'
  end
  object LblMemory: TLabel
    Left = 222
    Top = 224
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'LblMemory'
  end
  object MemoCopyright: TMemo
    Left = 24
    Top = 107
    Width = 249
    Height = 100
    Lines.Strings = (
      'MIT License'
      ''
      'Copyright (c) 2021 Ilton Sequeira'
      ''
      'Permission is hereby granted, free of charge, '
      'to any person obtaining a copy of this '
      'software and associated documentation files '
      '(the "Software"), to deal in the Software '
      'without restriction, including without limitation '
      'the rights to use, copy, modify, merge, '
      'publish, distribute, sublicense, and/or sell '
      'copies of the Software, and to permit '
      'persons to whom the Software is furnished to '
      'do so, subject to the following conditions:'
      ''
      'The above copyright notice and this '
      'permission notice shall be included in all copies '
      'or substantial portions of the Software.'
      ''
      'THE SOFTWARE IS PROVIDED "AS IS", '
      'WITHOUT WARRANTY OF ANY KIND, '
      'EXPRESS OR IMPLIED, INCLUDING BUT NOT '
      'LIMITED TO THE WARRANTIES OF '
      'MERCHANTABILITY, FITNESS FOR A '
      'PARTICULAR PURPOSE AND '
      'NONINFRINGEMENT. IN NO EVENT SHALL '
      'THE AUTHORS OR COPYRIGHT HOLDERS BE '
      'LIABLE FOR ANY CLAIM, DAMAGES OR '
      'OTHER LIABILITY, WHETHER IN AN ACTION '
      'OF CONTRACT, TORT OR OTHERWISE, '
      'ARISING FROM, OUT OF OR IN '
      'CONNECTION WITH THE SOFTWARE OR THE '
      'USE OR OTHER DEALINGS IN THE '
      'SOFTWARE.')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BtnFechar: TButton
    Left = 198
    Top = 281
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = BtnFecharClick
  end
end
