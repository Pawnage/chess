class Piece < ActiveRecord::Base
	belongs_to :game

	attr_accessor :piece_type, :color, :row_position, :col_position

	def initialize(type, color, row, col)
		self.piece_type = type
		self.color = color
		self.row_position = row
		self.col_position = col
	end
end
