class Piramide:
      largura = 0
      volume = 0
      comprimento = 0

      def __init__(self, largura=None, volume=None, comprimento=None):
          if largura is not None:
             self.largura = largura
          if volume is not None:
             self.volume = volume
          if comprimento is not None:
             self.comprimento = comprimento

      def get_formula_altura(self):
          return '3 * ( V / (w*l))'

      def calcula_altura(self):
          return 3 * (self.volume / (self.comprimento*self.largura) ) 