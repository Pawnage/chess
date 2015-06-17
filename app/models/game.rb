class Game < ActiveRecord::Base
	belongs_to :player
	has_many :pieces

	after_create :populate_board!


	def initialize
		@game = []
	
		#leave coloring of squares completely to bootstrap?
	end

	def populate_board!
		
		#populate front rows
		8.times do |pawn|
			@game << Piece.new(pawn, white)
		end

		8.times do |pawn|
			@game << Piece.new(pawn, black)
		end

		#populate back rows from both ends going in
		#rook,knight,bishop,queen,king,bishop,knight,rook
		2.times do |rook|		
			@game << Piece.new(rook,white)
		end

		2.times do |rook|		
			@game << Piece.new(rook,black)
		end
		
		2.times do |knight|		
			@game << Piece.new(knight,white)
		end		

		2.times do |knight|		
			@game << Piece.new(knight,black)
		end
		
		2.times do |bishop|		
			@game << Piece.new(bishop,white)
		end

		2.times do |bishop|		
			@game << Piece.new(bishop,black)
		end

		@game << Piece.new(queen,white)
		@game << Piece.new(king,white)
		
		@game << Piece.new(queen,black)
		@game << Piece.new(king,black)
		
		
	end

end


