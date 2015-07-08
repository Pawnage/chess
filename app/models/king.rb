class King < Piece
	

	def obstructed_positions(x, y)
		puts "I'm a king"
	end


	def legal_move?(x, y)
		if x >= 0 and x < 7 and y >= 0 and y < 7	
			if (self.row_position - x).abs == 1 or (self.col_position - y).abs == 1
				return true		
			else	
				return false
			end

		else
			return false
		end
	end
end