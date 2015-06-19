class Piece < ActiveRecord::Base
	belongs_to :game

	attr_accessor :type, :color, :row_position, :col_position

	def initialize(type, color, row, col)
		self.type = type
		self.color = color
		self.row_position = row
		self.col_position = col
	end

	def legal_move?
	end

	def obstructed_positions
		fail NotImplementedError 'Pieces must implement #obstructed_positions'
	end
end
