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
          print(self.TABS + self.msg_op_s)
          print('\n')
          
          return input('Digite a opção e pressione <ENTER> : ')

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