class Piece < ActiveRecord::Base
	belongs_to :game
	
	def legal_move?
	end

	def obstructed_positions
		fail NotImplementedError 'Pieces must implement #obstructed_positions'
	end
end
