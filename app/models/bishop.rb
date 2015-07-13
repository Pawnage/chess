class Bishop < Piece
  
  def obstructed_positions(x, y)
    puts "I'm a bishop"
  end

  def legal_move?(x, y)
  # bishop can only move diagonally so easiest condition is to exclude any purely horiz. or vertical moves 
    if (x >= 0 and x <= 7) and (y >= 0 and y <= 7)
      return true if (self.row_position - x) == (self.col_position - y)
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