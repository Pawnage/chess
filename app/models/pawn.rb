class Pawn < Piece
	def legal_move?
	end

	def obstructed_positions(x, y)
  	puts "I'm a pawn"
	end

	def pawn_legal_move?(x, y)	
		#pawns cannot move backward or left to right (ability to capture left to right handled by capture function)
		
		# initial move: 1 sq
		#white pawn condition
		if self.type == 'Pawn' and self.color == 'White'
			if (self.row_position - x).abs == 1 and (self.col_position - y) == 0 
				return true
			end
		# black pawn condition, varies from white due to different positions on board...	
		elsif self.type == 'Pawn' and self.color == 'Black'
			if (self.row_position - x) == 1 and (self.col_position - y) == 0 
				return true
			end	
			# add conditions (and/or new methods) for promotion, en passant
		
		# initial move: 2sq
		# white pawn condition 
		elsif self.type == 'Pawn' and self.color == 'White'
			if (self.row_position - x).abs == 2 and (self.col_position - y) == 0 
				return true
			end 
		#black pawn condition
		elsif self.type == 'Pawn' and self.color == 'Black'
			if (self.row_position - x) == 2 and (self.col_position - y) == 0
				return true 
			end
		else
			return false
		end
	end
end