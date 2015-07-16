class King < Piece
  
  def obstructed_positions(x, y)
    puts "I'm a king"
  end

  def legal_move?(x, y)
    self.legal_horiz_move? || self.legal_vert_move? || self.legal_diag_move?
  end

end