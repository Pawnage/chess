class Piece < ActiveRecord::Base
	belongs_to :player
  belongs_to :game

  after_initialize :set_default_for_alive
	

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
    raise NotImplementedError
	end
  
  def legal_horiz_move?(x, y)
    x >= 0 and x <= 7 and y >= 0 and y <= 7 and (self.col_position - y) == 0
  end

  def legal_vert_move?(x, y)
    x >= 0 and x <= 7 and y >= 0 and y <= 7 and (self.row_position - x) == 0
  end  

  def legal_diag_move?(x, y)
    #x >= 0 and x <= 7 and y >= 0 and y <= 7
    (self.row_position - x).abs == (self.col_position - y).abs
  end

  def nil_move?(x, y)
    row_position == x && col_position == y
  end

  def valid_move?(x, y)
    self.attempt_move?(x, y)
  end

  def attempt_move?(x, y)
    #(x >= 0 and x <= 7) and (y >= 0 and y <= 7)
    self.nil_move?(x, y) 
    self.legal_move?(x, y)
    self.obstructed_move?(x, y)
  end

  def nil_move?(x, y)
    row_position == x && col_position == y
  end

  def legal_horiz_move?(x, y)
    x >= 0 and x <= 7 and y >= 0 and y <= 7 and (self.col_position - y) == 0
  end

  def legal_vert_move?(x, y)
    x >= 0 and x <= 7 and y >= 0 and y <= 7 and (self.row_position - x) == 0
  end  

  def legal_diag_move?(x, y)
    x >= 0 and x <= 7 and y >= 0 and y <= 7 and (self.row_position - x).abs == (self.col_position - y).abs
  end

  def capturable?(x, y)
    Piece.where(:game_id => game.id, :row_position => x, :col_position => y, :alive => true).where.not(color: color).present?
  end

  def capture!(x, y)
    opponent_piece = Piece.where(:game_id => game.id, :row_position => x, :col_position => y)
    if capturable?(x, y)
      opponent_piece[0].update_attributes(:row_position => nil, :col_position => nil, :alive => false)
    end
  end

  def set_default_for_alive
    self.alive = true if self.alive.nil?
  end
end
