class Knight < Piece
  
  def legal_move?(x, y)
    # knight moves two squares in horiz. or vertical then one space in the other of the two directions 
    if x >= 0 and x <= 7 and y >= 0 and y <= 7
      return true if ((self.row_position - x).abs == 2 and (self.col_position - y).abs == 1) or ((self.col_position - y).abs == 2 and (self.row_position - x).abs == 1)		
    end
    return false	
  end 

  def obstructed_positions(x, y)
    # has no obstructed positions
  end

  def move(new_row_position, new_col_position)
    current_row_position = self.row_position
    current_col_position = self.col_position
    color = self.color

    # if obstructed(new_position_row, new_position_col)
    # return false
    # elsif ##check if move is not legal
    # end

    self.update_attributes(:row_position => new_row_position, :col_position => new_col_position)

    return true
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