class King < Piece
  
  def obstructed_move?(x, y)
    return false
  end

  def legal_move?(x, y)
    (x >= 0 and x <= 7) and (y >= 0 and y <= 7)
    self.legal_horiz_move?(x, y) || self.legal_vert_move?(x, y) || self.legal_diag_move?(x, y)
  end

end