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
                   op = menu.print_tela_1player()
          elif op == '2':
             while (op != 'v') and (op != 'V'):
                   system('cls') 
                   op = menu.print_tela_2players()
          elif op == '?':
               system('cls')
               op = menu.print_tela_sobre()
          else:
             op = menu.print_tela_inicial()
    
    return 0

if __name__ == "__main__":
   main()