class Queen < Piece
	

	def obstructed_positions(x, y)
		puts "I'm a queen"
	end

	def piece_exists?(x, y)
	    Piece.where(row_position: x, col_position: y).exists?
	end

	def is_obstructed?(x, y)
		return true if self.piece_exists? (x, y) and Piece.color != self.piece.color
		else
			return false
	end
#only illegal move for queen is to jump over pieces
	def legal_move?(x, y)
		#allows queen to move to obstructed square anyway and (ultimately) capture piece if it's of a different color
		self.attempt_move?(x, y)
		# elsif Piece.where(row_position: x, col_position: y).exists?
		# 	return false if 
	end


			
		
	end
end