from os import system
from MainMenu import MainMenu

def main():
    menu = MainMenu()
    op = -1
    
    while op != 0:
          system('cls')
          if op == 1:
             op = menu.print_tela_altura()
          else:
             op = menu.print_tela_inicial()
    
    return 0

if __name__ == "__main__":
   main()