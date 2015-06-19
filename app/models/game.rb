class Game < ActiveRecord::Base
	belongs_to :player
	has_many :pieces

	after_create :populate_board!


	def initialize()
		#creates empty array to store 32 pieces
		@set = []
	end

	def populate_board!
		
		#populate front rows
		8.times do |pawn|
			@set << Piece.new(pawn, white)
			@set << Piece.new(pawn, black)
		end

		#populate back rows
		#rook,knight,bishop,queen,king,bishop,knight,rook
		2.times do |rook|		
			@set << Piece.new(rook,white)		
			@set << Piece.new(rook,black)
		end
		
		2.times do |knight|		
			@set << Piece.new(knight,white)		
			@set << Piece.new(knight,black)
		end
		
		2.times do |bishop|		
			@set << Piece.new(bishop,white)	
			@set << Piece.new(bishop,black)
		end

		@set << Piece.new(queen,white)
		@set << Piece.new(king,white)
		
		@set << Piece.new(queen,black)
		@set << Piece.new(king,black)
		
		
	end
end

require 'test_helper'

class GameTest
	test "create a new set" do
		game = Game.create(:player_white => 1, :player_black => 2, :player_turn => 1, :winner => 1, :moves => 1)
    	puts game.inspect
    end

end


