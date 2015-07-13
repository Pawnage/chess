class Queen < Piece
	

	def obstructed_positions(x, y)
		puts "I'm a queen"
	end

	def piece_exists?(x, y)
	    Piece.where(row_position: x, col_position: y).exists?
	end

	def is_obstructed?
		return true if piece_exists? and piece.color != self.piece.color
		else
			return false
	end

	def legal_move?
		if x >= 0 and x <= 7 and y >= 0 and y <= 7
			return false if self.is_obstructed?
		else
			return true
		end
	end
end