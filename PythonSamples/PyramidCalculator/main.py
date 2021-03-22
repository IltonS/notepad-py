def main():
    menu = -1
    
    print("Bem-Vindo(a) a Calculadora de Pirâmides")
    
    while menu != 0:
          print("\nSelecione uma opção:\n")
          print("    [1] Calcular área da base")
          print("    [2] Calcular largura da base")
          print("    [3] Calcular comprimento da base")
          print("    [4] Calcular altura")
          print("    [5] Calcular volume")
          print("    [0] Sair\n")
          menu = int(input(">"))
    
    return 0

if __name__ == "__main__":
   main()