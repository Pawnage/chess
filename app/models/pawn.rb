class Pawn < Piece
  
  def obstructed_positions(x, y)
    puts "I'm a pawn"
  end

  def legal_move?(x, y)
    if self.color == 'White'
      # white pawn can move up to two spaces upward if current row_position is equal to initial row_position
      if self.row_position == 1
        return true if (x - self.row_position == 2 || x - self.row_position == 1) && (self.col_position - y == 0)
      # white pawn can move only one space upward if current row_position is not equal to initial row_position
      elsif self.row_position != 1
        return true if (x - self.row_position == 1) && (self.col_position - y == 0)
      end

      return false if x - self.row_position > 7
    end

    if self.color == 'Black'
      # black pawn can move up to two spaces downward if current row_position is equal to initial row_position
      if self.row_position == 6
        return true if (self.row_position - x == 2 || self.row_position - x == 1) && (self.col_position - y == 0)
      # black pawn can move only one space downward if current row_position is not equal to initial row_position
      elsif self.row_position != 6
        return true if (self.row_position - x == 1) && (self.col_position - y == 0)
      end

      return false if self.row_position - x < 0
    end

    return false
  end
  
end