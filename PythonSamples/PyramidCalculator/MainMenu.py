from Piramide import Piramide

class MainMenu:
      TABS = '\t\t\t\t'
      sc_size = 80
      app_title = 'Calculadora de Prirâmides'
      msg_boas_vindas = 'Bem-Vindo(a) a Calculadora de Pirâmides'
      msg_selecione_opcao = 'Por favor, selecione uma das opções abaixo'
      msg_op_1 = '1. Altura'
      msg_op_2 = '2. Área da base'
      msg_op_3 = '3. Área da superfície'
      msg_op_4 = '4. Comprimento da base'
      msg_op_5 = '5. Largura da base'
      msg_op_6 = '6. Superfície lateral'
      msg_op_7 = '7. Volume'
      msg_op_h = '?. Sobre'
      msg_op_s = 'S. Sair'      
      
      def print_tela_inicial(self):
          print(self.msg_boas_vindas.center(self.sc_size))
          print(self.msg_selecione_opcao.center(self.sc_size))
          print('\n')
          
          print(self.TABS + self.msg_op_1)
          print(self.TABS + self.msg_op_2)
          print(self.TABS + self.msg_op_3)
          print(self.TABS + self.msg_op_4)
          print(self.TABS + self.msg_op_5)
          print(self.TABS + self.msg_op_6)
          print(self.TABS + self.msg_op_7)
          print(self.TABS + self.msg_op_h)
          print(self.TABS + self.msg_op_s)
          print('\n')
          
          return input('Digite a opção e pressione <ENTER> : ')

      def print_tela_sobre(self):
          op = ''
          print( (self.msg_op_h + ' - ' + self.app_title).center(self.sc_size) )
          print('MIT License\n')
          print('Copyright (c) 2021 Ilton Sequeira\n')
          print('Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n')
          print('The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n')
          print('THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n')
          op = input('Pressione <ENTER> para voltar...')
          return 'v'          

      # Op 1--------------------------------------------------------------------
      def print_tela_altura(self):
          op = ''
          print( (self.msg_op_1 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:
              piramide = Piramide(
                       largura = float(input('Entre com o valor da largura (w): ')),
                       volume = float(input('Entre com o valor do volume (V): ')),
                       comprimento = float(input('Entre com o valor do comprimento (l): '))   
              )
          
              print( '\nO Valor da Altura é: [' + "{:.2f}".format(piramide.calcula_altura()) + ']\n')
          
              print('+----------------------------------------+')
              print('+\tFórmula: ' + piramide.get_formula_altura() + '        +')
              print('+----------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 2--------------------------------------------------------------------
      def print_tela_area_base(self):
          op = ''
          print( (self.msg_op_2 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:
              piramide = Piramide(
                       largura = float(input('Entre com o valor da largura (w): ')),
                       comprimento = float(input('Entre com o valor do comprimento (l): '))   
              )
          
              print( '\nO Valor da Área da base é: [' + "{:.2f}".format(piramide.calcula_area_base()) + ']\n')
          
              print('+----------------------------------------+')
              print('+\tFórmula: ' + piramide.get_formula_area_base() + '                   +')
              print('+----------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 3--------------------------------------------------------------------
      def print_tela_area_superficie(self):
          op = ''
          print( (self.msg_op_3 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:
              piramide = Piramide(
                                  comprimento = float(input('Entre com o valor do comprimento (l): ')),
                                  largura = float(input('Entre com o valor da largura (w): ')),
                                  altura = float(input('Entre com o valor da altura (h): '))   
              )
          
              print( '\nO Valor da Área da superficie é: [' + "{:.2f}".format(piramide.calcula_area_superficie()) + ']\n')
          
              print('+----------------------------------------------------------------+')
              print('+ Fórmula: ' + piramide.get_formula_area_superficie() + ' +')
              print('+----------------------------------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 4--------------------------------------------------------------------
      def print_tela_comprimento_base(self):
          op = ''
          print( (self.msg_op_4 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:
              piramide = Piramide(
                       area_base = float(input('Entre com o valor da área da base (A): ')),
                       largura = float(input('Entre com o valor da largura (w): '))   
              )
          
              print( '\nO Valor do comprimento da base é: [' + "{:.2f}".format(piramide.calcula_comprimento_base()) + ']\n')
          
              print('+----------------------------------------+')
              print('+\tFórmula: ' + piramide.get_formula_comprimento_base() + '                   +')
              print('+----------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 5--------------------------------------------------------------------
      def print_tela_largura_base(self):
          op = ''
          print( (self.msg_op_5 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:
              piramide = Piramide(
                       area_base = float(input('Entre com o valor da área da base (A): ')),
                       comprimento = float(input('Entre com o valor do comprimento (l): '))   
              )
          
              print( '\nO Valor da largura da base é: [' + "{:.2f}".format(piramide.calcula_largura_base()) + ']\n')
          
              print('+----------------------------------------+')
              print('+\tFórmula: ' + piramide.get_formula_largura_base() + '                   +')
              print('+----------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 6--------------------------------------------------------------------
      def print_tela_superficie_lateral(self):
          op = ''
          print( (self.msg_op_6 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:
              piramide = Piramide(
                                  comprimento = float(input('Entre com o valor do comprimento (l): ')),
                                  largura = float(input('Entre com o valor da largura (w): ')),
                                  altura = float(input('Entre com o valor da altura (h): '))   
              )
          
              print( '\nO Valor da superfície lateral é: [' + "{:.2f}".format(piramide.calcula_superficie_lateral()) + ']\n')
          
              print('+----------------------------------------------------------------+')
              print('+ Fórmula: ' + piramide.get_formula_superficie_lateral() + '         +')
              print('+----------------------------------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 7--------------------------------------------------------------------
      def print_tela_volume(self):
          op = ''
          print( (self.msg_op_7 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          try:

              piramide = Piramide(
                       comprimento = float(input('Entre com o valor do comprimento (l): ')),
                       largura = float(input('Entre com o valor da largura (w): ')),
                       altura = float(input('Entre com o valor da altura (h): '))   
              )
          
              print( '\nO Valor do volume é: [' + "{:.2f}".format(piramide.calcula_volume()) + ']\n')
          
              print('+----------------------------------------+')
              print('+\tFórmula: ' + piramide.get_formula_volume() + '       +')
              print('+----------------------------------------+')
              print('\n')
          except:
              print('Entrada Inválida de dados\n')
          finally:
              print('V=Voltar, N=Novo Cálculo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op