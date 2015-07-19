class Queen < Piece
	

	def obstructed_positions(x, y)
		puts "I'm a queen"
	end

	def piece_exists?(x, y)
	    Piece.where(row_position: x, col_position: y).exists?
	end

	# def is_obstructed?(x, y)
	# 	return true if self.piece_exists? (x, y) and Piece.color != self.piece.color
	# 	else
	# 		return false
	# end

	def legal_move?(x, y)
		#queen can move any amount of vacant squares in any direction
		self.legal_horiz_move?(x, y) || self.legal_vert_move?(x, y) || self.legal_diag_move?(x, y)
	end

end