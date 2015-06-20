class Piece < ActiveRecord::Base
	belongs_to :player
	belongs_to :game

	self.inheritance_column = :type

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	# attr_accessor :row_position, :col_position, :color, :type, :alive

	# def initialize(row, col, color, type, alive=true)
	# 	self.row_position = row
	# 	self.col_position = col
	# 	self.color = color
	# 	self.type = type
	# 	self.alive = alive
	# end

	def legal_move?
	end

	def obstructed_positions
		fail NotImplementedError 'Pieces must implement #obstructed_positions'
	end
end
