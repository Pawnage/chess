class Piece < ActiveRecord::Base
	belongs_to :game

	attr_accessor :piece_type, :color

	def initialize(type, color)
		self.piece_type = type
		self.color = color
	end
end
