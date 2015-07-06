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
		if piece.type == 'Pawn' and piece.color == 'White'
			if (piece.col_position - y) == 1 and (piece.row_position - x) == 0 
				return true
			end
		# black pawn condition, varies from white due to different positions on board...	
		elsif piece.type == 'Pawn' and piece.color == 'Black'
			if (piece.col_position - y) == -1 and (piece.row_position - x) == 0 
				return true
			end	
			# add conditions (and/or new methods) for promotion, en passant
		
		# initial move: 2sq
		# white pawn condition 
		elsif pieces.type == 'Pawn' and piece.color == 'White'
			if (piece.col_position - y) == 2 and (piece.row_position - x) == 0 
				return true
			end 
		#black pawn condition
		elsif pieces.type == 'Pawn' and piece.color == 'Black'
			if (piece.col_position - y) == -2
				return true 
			end
		else
			return false
		end
		
	end
end