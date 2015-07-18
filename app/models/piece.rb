class Piece < ActiveRecord::Base
	belongs_to :player
  belongs_to :game

  after_initialize :set_default_for_alive
	
  def obstructed_move?(x, y)
    obstruction_array = obstructed_positions(x, y)
 
      #maybe return false if error
    
      obstruction_array.each do |position|
        # return true if obstruction found
        return true if game.obstruction(position[x], position[y])
      end
  end

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
    raise NotImplementedError
	end
  
  def legal_horiz_move?(x, y)
    (self.col_position - y) == 0
  end

  def legal_vert_move?(x, y)
    (self.row_position - x) == 0
  end  

  def legal_diag_move?(x, y)
    (self.row_position - x).abs == (self.col_position - y).abs
  end

  def legal_horiz_move?(x, y)
    (self.col_position - y) == 0
  end

  def legal_vert_move?(x, y)
    (self.row_position - x) == 0
  end  

  def legal_diag_move?(x, y)
    (self.row_position - x).abs == (self.col_position - y).abs
  end

  def nil_move?(x, y)
    row_position == x && col_position == y
  end

  def valid_move?(x, y)
    return false unless self.legal_move?(x, y)
    return false if self.obstructed_move?(x, y)
    true
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
