class Rook < Piece

  def legal_move?
  end

  def obstructed_positions(x, y)
    puts "I'm a rook"
  end

  def rook_legal_move?(x, y)
		#rook's move is purely horizontal or vertical
		if (piece.row_position - x).abs == 0 or (piece.col_position - y).abs == 0 
		 		#add conditions for kingside and queenside castling (i.e. rook moves horizontally (or vertically?) around king or queen)
			return true
		else
			return false
		end
	
  
end