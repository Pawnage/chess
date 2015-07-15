# class Bishop < Piece
#   def legal_move?
#   end

#   def obstructed_positions(x, y)
#     puts "I'm a bishop"
#   end

#   def legal_move?(x, y)
#   # bishop can only move diagonally so easiest condition is to exclude any purely horiz. or vertical moves 
#     if (self.row_position - x).abs != 0 or (self.col_position - y).abs != 0
#       return true		
#     else
#       return false
#     end			
#   end
# end