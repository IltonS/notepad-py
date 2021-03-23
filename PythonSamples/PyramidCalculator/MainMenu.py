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
      msg_op_0 = '0. Sair'      
      
      def print_tela_inicial(self):
          op = -1
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
          print(self.TABS + self.msg_op_0)
          print('\n')

          try:
              op = int(input('Digite a opção e pressione <ENTER> : '))
          except:
              op = -1   
          return op

      def print_tela_altura(self):
          op = -1
          print( (self.msg_op_1 + ' - ' + self.app_title).center(self.sc_size) )
          # Recebe input de calculo
          piramide = Piramide(
                   largura = float(input('Entre com o valor da largura (w): ')),
                   volume = float(input('Entre com o valor do volume (V): ')),
                   comprimento = float(input('Entre com o valor do comprimento (l): '))   
          )
          
          print( '\nO Valor da Altura é: ' + "{:.2f}".format(piramide.calcula_altura()) + '\n')
          print('Fórmula: ' + piramide.get_formula_altura() + '\n')
          input('Pressione <ENTER> para voltar ao menu principal...')
          return op
          
          
          