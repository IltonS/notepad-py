import math

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

      # Op 3--------------------------------------------------------------------       
      def get_formula_area_superficie(self):
          return '(l*w) + l*sqrt((w/2)^2 + h^2) + w*sqrt((l/2)^2 + h^2)'

      def calcula_area_superficie(self):
          return (self.comprimento * self.largura) + self.comprimento*math.sqrt( (self.largura/2)**2 + self.altura**2) + self.largura*math.sqrt( (self.comprimento/2)**2 + self.altura**2) 
      
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

      # Op 6--------------------------------------------------------------------
      def get_formula_superficie_lateral(self):
          return 'l*sqrt((w/2)^2 + h^2) + w*sqrt((l/2)^2 + h^2)'

      def calcula_superficie_lateral(self):
          return self.comprimento*math.sqrt((self.largura/2)**2 + self.altura**2) + self.largura*math.sqrt((self.comprimento/2)**2 + self.altura**2)

      # Op 7--------------------------------------------------------------------
      def get_formula_volume(self):
          return '(l * w) * (h / 3)'

      def calcula_volume(self):
          return (self.comprimento*self.largura)*(self.altura/3) 