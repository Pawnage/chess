class Pawn < Piece
  

  def obstructed_positions(x, y)
    puts "I'm a pawn"
  end

  def legal_move?(x, y)	
    # pawns cannot move backward or left to right (ability to capture left to right handled by capture function)
		
    # initial move: 1 sq
    # white pawn condition
    if self.color == 'White'
      if (self.row_position - x) == 1 and (self.col_position - y) == 0 
        return true
      end
    # black pawn condition
    elsif self.color == 'Black'  
      if (self.row_position - x) == 1 and (self.col_position - y) == 0 
        return true
      end
      # initial move: 2 sq
      # white pawn condition 
    elsif self.color == 'White'  
      if (self.row_position - x) == 2 and (self.col_position - y) == 0 
        return true
      end
    # black pawn condition, varies from white due to different positions on board...	
    elsif self.color == 'Black'  
      if (self.row_position - x) == 2 and (self.col_position - y) == 0
        return true 
      end
    # add conditions (and/or new methods) for promotion, en passant			
    else
      return false
    end
  end
end