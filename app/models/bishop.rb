class Bishop < Piece

  
  def obstructed_positions(x, y)
    puts "I'm a bishop"
  end

  def legal_move?(x, y)
  # bishop can only move diagonally so easiest condition is to exclude any purely horiz. or vertical moves 
      self.legal_diag_move?(x, y)      
    else
      return false
    end
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