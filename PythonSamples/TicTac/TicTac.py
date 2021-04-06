class TicTac:
   sc_size: int
   move_count: int
   player1_choice: str
   player2_choice: str
   status: str
   machine_move: str
   valid_move: bool
   board = {
      "1" : "",
      "2" : "",
      "3" : "",
      "4" : "",
      "5" : "",
      "6" : "",
      "7" : "",
      "8" : "",
      "9" : ""
   }
   #----------------------------------------------------------------------------
   def __init__(self):
      self.sc_size = 80
      self.move_count = 0
      self.player1_choice = ''
      self.player2_choice = ''
      self.status = 'unfinished'
      self.machine_move = ''
      self.valid_move = False
      self.board = {
         "1" : "1",
         "2" : "2",
         "3" : "3",
         "4" : "4",
         "5" : "5",
         "6" : "6",
         "7" : "7",
         "8" : "8",
         "9" : "9"
      }  
   #----------------------------------------------------------------------------
   def update_status(self):
      if self.board['7'] == self.board['8'] == self.board['9']:
         self.status = 'P1 Win' if self.board['7'] == self.player1_choice else 'P2 Win'
      elif self.board['4'] == self.board['5'] == self.board['6']:
          self.status = 'P1 Win' if self.board['4'] == self.player1_choice else 'P2 Win'
      elif self.board['1'] == self.board['2'] == self.board['3']:
          self.status = 'P1 Win' if self.board['1'] == self.player1_choice else 'P2 Win'
      elif self.board['7'] == self.board['4'] == self.board['1']:
          self.status = 'P1 Win' if self.board['7'] == self.player1_choice else 'P2 Win'
      elif self.board['8'] == self.board['5'] == self.board['2']:
          self.status = 'P1 Win' if self.board['8'] == self.player1_choice else 'P2 Win'
      elif self.board['9'] == self.board['6'] == self.board['3']:
          self.status = 'P1 Win' if self.board['9'] == self.player1_choice else 'P2 Win'
      elif self.board['7'] == self.board['5'] == self.board['3']:
          self.status = 'P1 Win' if self.board['7'] == self.player1_choice else 'P2 Win'
      elif self.board['9'] == self.board['5'] == self.board['1']:
          self.status = 'P1 Win' if self.board['9'] == self.player1_choice else 'P2 Win'
      elif self.move_count == 9:
          self.status = 'draw'
      else:
          self.staus = 'unfinished'
   #----------------------------------------------------------------------------
   def player_move(self, player, n):
      try:
         if (1 <= int(n) <= 9) and (1 <= int(self.board[n]) <= 9):
            self.board[n] = self.player1_choice if player == 1 else self.player2_choice
            self.valid_move = True
            self.move_count += 1
         else:
            self.valid_move = False
      except:
         self.valid_move = False
               
   #----------------------------------------------------------------------------
   def draw_board(self):
      print( ('   ' + self.board["7"] + '   |   ' + self.board["8"] + '   |   ' + self.board["9"] + '   ').center(self.sc_size) )
      print( ('-------|-------|-------').center(self.sc_size) )
      print( ('   ' + self.board["4"] + '   |   ' + self.board["5"] + '   |   ' + self.board["6"] + '   ').center(self.sc_size) )
      print( ('-------|-------|-------').center(self.sc_size) )
      print( ('   ' + self.board["1"] + '   |   ' + self.board["2"] + '   |   ' + self.board["3"] + '   ').center(self.sc_size) )