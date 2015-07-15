class King < Piece
  
  def obstructed_positions(x, y)
    puts "I'm a king"
  end

  def legal_move?(x, y)
      # move one step vertically
      (self.row_position - x) == 1 and (self.col_position - y) == 0
      # move one step horizontally
      (self.row_position - x) == 0 and (self.col_position - y) == 1
      # move one step diagonally
      (self.row_position - x) == 1 and (self.col_position - y) == 1
  
  end

end