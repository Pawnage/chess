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
		(0..7).each do |n|
			@set << Piece.new(Pawn, white, 1, n)
			@set << Piece.new(Pawn, black, 6, n)
		end

		#populate back rows
		#rook,knight,bishop,queen,king,bishop,knight,rook
		#rooks		
			@set << Piece.new(Rook, white, 0, 0)
			@set << Piece.new(Rook, white, 0, 7)
			@set << Piece.new(Rook, black, 7, 0)
			@set << Piece.new(Rook, black, 7, 7)
		
		#knights	
			@set << Piece.new(Knight, white, 0, 2)		
			@set << Piece.new(Knight, white, 0, 6)
			@set << Piece.new(Knight, black, 7, 2)
			@set << Piece.new(Knight, black, 7, 6)
		
		#bishops		
			@set << Piece.new(Bishop, white, 0, 3)
			@set << Piece.new(Bishop, white, 0, 5)	
			@set << Piece.new(Bishop, black, 7, 3)
			@set << Piece.new(Bishop, black, 7, 5)

		#queens
			@set << Piece.new(Queen, white, 0, 3)
			@set << Piece.new(Queen, white, 7, 3)
		
		#kings
			@set << Piece.new(King, black, 0, 4)
			@set << Piece.new(King, black, 7, 4)
		
		
	end
end



