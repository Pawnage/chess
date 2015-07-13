class King < Piece
	
  def obstructed_positions(x, y)
    puts "I'm a king"
  end

  def legal_move?(x, y)
    if (x >= 0 and x <= 7) and (y >= 0 and y <= 7)
      # move one step vertically
      return true if (self.row_position - x).abs == 1 and (self.col_position - y).abs == 0
      # move one step horizontally
      return true if (self.row_position - x).abs == 0 and (self.col_position - y).abs == 1
      # move one step diagonally
      return true if (self.row_position - x).abs == 1 and (self.col_position - y).abs == 1
    end
    return false
  end

  def piece_exists?(x, y)
      Piece.where(row_position: x, col_position: y).exists?
  end

  def is_obstructed?
    return true if piece_exists? and piece.color != self.piece.color
    else
      return false
  end
  
end