class King < Piece
	

	def obstructed_positions(x, y)
		puts "I'm a king"
	end

	def king_legal_move?(x, y)
		if (piece.row_position - x).abs == 1 or (piece.col_position - y).abs == 1
			return true		
		else
			return false
		end	

	end
end