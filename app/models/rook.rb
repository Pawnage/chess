class Rook < Piece

  def legal_move?
  end

  def obstructed_move?(x, y)
    current_row = self.row_position
    current_col = self.col_position

    #check if a piece is blocking the path in the first vertical direction
    	#if y is the same column as current column and x is larger than the current_row
    	if current_col == y && x > current_row
    		#for each row from current_row to x in curren_column check if a piece exists
    		for i in current_row + 1..x do
    			#if it does return true
    			
    			#otherwise return false
    		end
    	end


   	#check if a piece is blocking the path in the second vertical direction

   	#check if a piece is blocking the path in the first horizontal direction

   	#check if a piece is blocking the path in the second horizontal direction


  end
  
end