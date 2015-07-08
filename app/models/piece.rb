class Piece < ActiveRecord::Base
	belongs_to :player
  belongs_to :game

  after_initialize :set_default_for_alive
	

	self.inheritance_column = :type

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
	end

  def capture?(x, y)
    !Piece.where(game_id: game.id, row_position: x, col_position: y).where.not(color: color).empty?
  end

  def set_default_for_alive
    self.alive = true if self.alive.nil?
  end
end
