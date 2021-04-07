from os import system
from TicTac import TicTac
import random

class MainMenu:
      TABS = '\t\t\t\t'
      LN = '\n'
      sc_size = 80
      app_title = 'Jogo da Velha'
      msg_boas_vindas = 'Bem-Vindo(a) ao Jogo da Velha'
      msg_selecione_opcao = 'Por favor, selecione uma das opções abaixo'
      msg_op_1 = '1. Jogador'
      msg_op_2 = '2. Jogadores'
      msg_op_h = '?. Sobre'
      msg_op_s = 'S. Sair'      
      
      def print_tela_inicial(self):
          print(self.msg_boas_vindas.center(self.sc_size))
          print(self.msg_selecione_opcao.center(self.sc_size))
          print(self.LN)
          
          print(self.TABS + self.msg_op_1)
          print(self.TABS + self.msg_op_2)
          print(self.TABS + self.msg_op_h)
          print(self.TABS + self.msg_op_s)
          print(self.LN)
          
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
      def print_tela_1player(self):
          op = ''
          try:
              game = TicTac()
              
              print( (self.msg_op_1 + ' - ' + self.app_title).center(self.sc_size) )
              print(self.LN)              
              
              # Escolhe x ou o
              while (game.player1_choice != 'x') and (game.player1_choice != 'o'):
                 game.player1_choice = input('Como deseja jogar? [x] ou [o]: ')
              game.player2_choice = 'x' if game.player1_choice == 'o' else 'o'
              
              #Inicia o jogo
              while game.status == 'unfinished':
                 # Desennha o jogo
                 system('cls')
                 print( (self.msg_op_1 + ' - ' + self.app_title).center(self.sc_size) )
                 print(self.LN)    
                 game.draw_board()
                 # Exibe jogada anterior
                 if game.machine_move != '':
                    print('Player 2 jogou: ' + game.machine_move)
                 # Faz uma jogada
                 game.valid_move = False
                 while not game.valid_move:
                    game.player_move(1, input('Digite o número da sua jogada: '))
                 
                 game.update_status()
                 if game.status != 'unfinished':
                    break
                 
                 # Maquina faz uma jogada
                 game.valid_move = False
                 while not game.valid_move:
                    game.machine_move = str(random.randint(1, 9))
                    game.player_move(2, game.machine_move)
                 
                 game.update_status()
              
              # Exibe mensagem de fim de jogo
              system('cls')
              print( (self.msg_op_1 + ' - ' + self.app_title).center(self.sc_size) )
              print(self.LN)
              game.draw_board()
              if game.status == 'P1 Win':
                 print('Você ganhou!')
              elif game.status == 'P2 Win':
                 print('O computador ganhou!')
              else:
                 print('Velha!')
              print(self.LN)
          except:
              print('Ocorreu um erro\n')
          finally:
              print('V=Voltar, N=Novo Jogo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op

      # Op 2--------------------------------------------------------------------
      def print_tela_2players(self):
          op = ''
          try:
              game = TicTac()
              
              print( (self.msg_op_2 + ' - ' + self.app_title).center(self.sc_size) )
              print(self.LN)              
              
              # Escolhe x ou o
              while (game.player1_choice != 'x') and (game.player1_choice != 'o'):
                 game.player1_choice = input('Jogador 1, como deseja jogar? [x] ou [o]: ')
              game.player2_choice = 'x' if game.player1_choice == 'o' else 'o'
              
              #Inicia o jogo
              while game.status == 'unfinished':
                 # Desennha o jogo
                 system('cls')
                 print( (self.msg_op_2 + ' - ' + self.app_title).center(self.sc_size) )
                 print(self.LN)    
                 game.draw_board()

                 if game.player1_turn:
                    # Jogador 1 faz uma jogada
                    game.valid_move = False
                    while not game.valid_move:
                       game.player_move(1, input('Jogador 1, digite o número da sua jogada: '))
                    game.player1_turn = False
                    game.update_status()
                 else:
                    # Jogador 2 faz uma jogada
                    game.valid_move = False
                    while not game.valid_move:
                       game.player_move(2, input('Jogador 2, digite o número da sua jogada: '))
                    game.player1_turn = True
                    game.update_status()
              
              # Exibe mensagem de fim de jogo
              system('cls')
              print( (self.msg_op_2 + ' - ' + self.app_title).center(self.sc_size) )
              print(self.LN)
              game.draw_board()
              if game.status == 'P1 Win':
                 print('Jogador 1 ganhou!')
              elif game.status == 'P2 Win':
                 print('Jogador 2 ganhou!')
              else:
                 print('Velha!')
              print(self.LN)
          except:
              print('Ocorreu um erro\n')
          finally:
              print('V=Voltar, N=Novo Jogo\n')
              while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
                    op = input('Digite a opção e pressione <ENTER> : ')
          
          return op