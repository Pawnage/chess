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

	self.inheritance_column = :type

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
	end

  def capturable?(x, y)
    !Piece.where(:game_id => game.id, :row_position => x, :col_position => y, :alive => true).where.not(color: color).empty?
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
