class Piece < ActiveRecord::Base
	belongs_to :player
	


	self.inheritance_column = :type

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
	end

	def obstructed_positions
		fail NotImplementedError 'Pieces must implement #obstructed_positions'
	end
end
