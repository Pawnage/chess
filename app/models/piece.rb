class Piece < ActiveRecord::Base
	belongs_to :game

	attr_accessor :row_position, :col_position, :color, :type, :alive

	def initialize(row, col, color, type, alive=true)
>>>>>>> 4a37b5136e5c048b16ac370ad1f63feb2cb7d40c
		self.row_position = row
		self.col_position = col
		self.color = color
		self.type = type
		self.alive = alive
	end

	def legal_move?
	end

	def obstructed_positions
		fail NotImplementedError 'Pieces must implement #obstructed_positions'
	end
end
