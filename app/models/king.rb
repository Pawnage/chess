class King < Piece
  
  def obstructed_positions(x, y)
    puts "I'm a king"
  end

  def legal_move?(x, y)
    self.horiz_move? || self.vert_move? || self.diag_move?
  end

end