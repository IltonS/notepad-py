from SquarePyramidalNumber import *

TABS = '\t\t\t\t'
sc_size = 80
app_title = 'Número Piramidal Quadrado'
msg_boas_vindas_1 = 'Bem vindo(a) ao ' + app_title 
msg_boas_vindas_2 = 'Este programa determina se um número N é um número piramidal quadrado.'
msg_selecione_opcao = 'Por favor, selecione uma das opções abaixo'
msg_op_1 = '1. Quadrado Perfeito'
msg_op_2 = '2. Número Piramidal Quadrado'
msg_op_h = '?. Sobre'
msg_op_s = 'S. Sair'      

# ------------------------------------------------------------------------------      
def print_tela_inicial():
    print(msg_boas_vindas_1.center(sc_size))
    print(msg_boas_vindas_2.center(sc_size))
    print(msg_selecione_opcao.center(sc_size))
    print('\n')
          
    print(TABS + msg_op_1)
    print(TABS + msg_op_2)
    print(TABS + msg_op_h)
    print(TABS + msg_op_s)
    print('\n')     
    
    return input('Digite a opção e pressione <ENTER> : ')
# ------------------------------------------------------------------------------
def print_tela_sobre():
    op = ''
    print( (msg_op_h + ' - ' + app_title).center(sc_size) )
    print('1. LICENÇA\n')
    print('MIT License\n')
    print('Copyright (c) 2021 Ilton Sequeira\n')
    print('Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n')
    print('The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n')
    print('THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n')
    print('2. SOBRE\n')
    print('Este programa determina se um número N digitado pelo usuário é um número piramidal quadrado. Ou seja, se ccm este número N é possível formar uma pirâmide quadrangular.\n')
    op = input('Pressione <ENTER> para voltar...')
    return 'v'          

# Op 1--------------------------------------------------------------------------
def print_tela_square_number():
    op = ''
    print( (msg_op_1 + ' - ' + app_title).center(sc_size) )
    # Entrada e processamento de dados
    try:
       N = int(input('Entre com um número N: '))
       if isSquareNumber(N):
          print('\n['+str(N)+'] É um quadrado perfeito\n')
       else:
          print('\n['+str(N)+'] Não é um quadrado perfeito\n') 
    except:
       print('Entrada Inválida de dados.') 
    finally:          
       print('V=Voltar, N=Novo Cálculo\n')
       while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
          op = input('Digite a opção e pressione <ENTER> : ')
          
    return op

# Op 2--------------------------------------------------------------------------
def print_tela_square_pyramidal_number():
    op = ''
    print( (msg_op_2 + ' - ' + app_title).center(sc_size) )
    # Entrada e processamento de dados
    try:
       N = int(input('Entre com um número N: '))
       if isPyramidalNumber(N):
          print('\n['+str(N)+'] É um número piramidal perfeito\n')
       else:
          print('\n['+str(N)+'] Não é um número piramidal perfeito\n') 
    except:
       print('Entrada Inválida de dados.') 
    finally:          
       print('V=Voltar, N=Novo Cálculo\n')
       while (op != 'n') and (op != 'N') and (op != 'v') and(op != 'V'):
          op = input('Digite a opção e pressione <ENTER> : ')
          
    return op
