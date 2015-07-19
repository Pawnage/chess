class Rook < Piece

  def legal_move?
  end

  def obstructed_positions(x, y)
    puts "I'm a rook"
  end

  def legal_move?(x, y)
		#rook's move is purely horizontal or vertical
		x > 0 and y > 0
    if self.legal_horiz_move?(x, y) || self.legal_vert_move?(x, y)
		 		#add conditions for kingside and queenside castling (i.e. rook moves horizontally (or vertically?) around king or queen) 
      return true
    else
      return false	   
    end
  end
end