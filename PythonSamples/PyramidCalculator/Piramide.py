class Piramide:
      largura = 0
      volume = 0
      comprimento = 0
      area_base = 0
      altura = 0

      def __init__(self,
                   largura=None, 
                   volume=None, 
                   comprimento=None,
                   area_base=None,
                   altura=None):
          if largura is not None:
             self.largura = largura
          if volume is not None:
             self.volume = volume
          if comprimento is not None:
             self.comprimento = comprimento
          if area_base is not None:
             self.area_base = area_base
          if altura is not None:
             self.altura = altura

      # Op 1--------------------------------------------------------------------
      def get_formula_altura(self):
          return '3 * ( V / (w*l))'

      def calcula_altura(self):
          return 3 * (self.volume / (self.comprimento*self.largura) )
      
      # Op 2--------------------------------------------------------------------       
      def get_formula_area_base(self):
          return 'l * w'

      def calcula_area_base(self):
          return self.largura * self.comprimento
      
      # Op 4--------------------------------------------------------------------
      def get_formula_comprimento_base(self):
          return 'A / w'

      def calcula_comprimento_base(self):
          return self.area_base / self.largura

      # Op 5--------------------------------------------------------------------
      def get_formula_largura_base(self):
          return 'A / l'

      def calcula_largura_base(self):
          return self.area_base / self.comprimento

      # Op 7--------------------------------------------------------------------
      def get_formula_volume(self):
          return '(l * w) * (h / 3)'

      def calcula_volume(self):
          return (self.comprimento*self.largura)*(self.altura/3) 