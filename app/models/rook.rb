class Rook < Piece

  def legal_move?
  end

  def obstructed_positions(x, y)
    puts "I'm a rook"
  end

  	def legal_move?(x, y)
		#rook's move is purely horizontal or vertical
		self.horiz_move? || self.vert_move?
		 		#add conditions for kingside and queenside castling (i.e. rook moves horizontally (or vertically?) around king or queen)
	end
  
end