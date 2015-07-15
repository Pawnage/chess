class Knight < Piece
#   def legal_move?(x, y)
#     # knight moves two squares in horiz. or vertical then one space in the other of the two directions 
#     if ((self.row_position - x).abs == 2 and (self.col_position - y).abs == 1) or ((self.col_position - y).abs == 2 and (self.row_position - x).abs == 1)
#       return true		
#     else
#       return false
#     end	
#   end

#   def obstructed_positions(x, y)
#     # has no obstructed positions
#   end

#   def move(new_row_position, new_col_position)
#     current_row_position = self.row_position
#     current_col_position = self.col_position
#     color = self.color

#     # if obstructed(new_position_row, new_position_col)
#     # return false
#     # elsif ##check if move is not legal
#     # end

#     self.update_attributes(:row_position => new_row_position, :col_position => new_col_position)

#     return true
#   end
end