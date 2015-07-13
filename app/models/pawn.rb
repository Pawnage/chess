class Pawn < Piece
  

  def obstructed_positions(x, y)
    puts "I'm a pawn"
  end

  def legal_move?(x, y)	
    # pawns cannot move backward or left to right (ability to capture left to right handled by capture function)
		
    # initial move: 1 sq or 2 sq
    # white pawn conditions
    if self.color == 'White'
      return true if (self.row_position - x) == 1 and (self.col_position - y) == 0 
      return true if (self.row_position - x) == 2 and (self.col_position - y) == 0 
      
    # black pawn condition, varies from white due to different positions on board...  
    elsif self.color == 'Black'  
      return true if (self.row_position - x) == 1 and (self.col_position - y) == 0 
      return true if (self.row_position - x).abs == 2 and (self.col_position - y).abs == 0
      
    
    # add conditions (and/or new methods) for promotion, en passant			
    else
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
end