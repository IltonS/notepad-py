from os import system
from MainMenu import MainMenu

def main():
    menu = MainMenu()
    op = ''
    
    while (op != 's') and (op != 'S'):
          system('cls')
          if op == '1':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_altura()
          elif op == '2':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_area_base()
          elif op == '3':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_area_superficie()
          elif op == '4':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_comprimento_base()
          elif op == '5':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_largura_base()
          elif op == '6':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_superficie_lateral()
          elif op == '7':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_volume()
          elif op == '?':
               system('cls')
               op = menu.print_tela_sobre()
          else:
             op = menu.print_tela_inicial()
    
    return 0

if __name__ == "__main__":
   main()