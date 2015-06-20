class Game < ActiveRecord::Base
	belongs_to :player
	has_many :pieces

	after_create :populate_board!

	# def initialize
		# creates empty array to store 32 pieces
		# @set = []
	# end

	def populate_board!
    @set = []

		# populate front rows
		(0..7).each do |n|
			@set << Piece.create(:game_id => id, :type => "Pawn", :color => "white", :row_position => 1, :col_position => n, :alive => true)
			@set << Piece.create(:game_id => id, :type => "Pawn", :color => "black", :row_position => 6, :col_position => n, :alive => true)
		end

		# populate back rows
		# rook,knight,bishop,queen,king,bishop,knight,rook
		# rooks
		@set << Piece.create(:game_id => id, :type => "Rook", :color => "white", :row_position => 0, :col_position => 0, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Rook", :color => "white", :row_position => 0, :col_position => 7, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Rook", :color => "black", :row_position => 7, :col_position => 0, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Rook", :color => "black", :row_position => 7, :col_position => 7, :alive => true)
		
		# knights	
		@set << Piece.create(:game_id => id, :type => "Knight", :color => "white", :row_position => 0, :col_position => 2, :alive => true)		
		@set << Piece.create(:game_id => id, :type => "Knight", :color => "white", :row_position => 0, :col_position => 6, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Knight", :color => "black", :row_position => 7, :col_position => 2, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Knight", :color => "black", :row_position => 7, :col_position => 6, :alive => true)
		
		# bishops		
		@set << Piece.create(:game_id => id, :type => "Bishop", :color => "white", :row_position => 0, :col_position => 3, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Bishop", :color => "white", :row_position => 0, :col_position => 5, :alive => true)	
		@set << Piece.create(:game_id => id, :type => "Bishop", :color => "black", :row_position => 7, :col_position => 3, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Bishop", :color => "black", :row_position => 7, :col_position => 5, :alive => true)

		# queens
		@set << Piece.create(:game_id => id, :type => "Queen", :color => "white", :row_position => 0, :col_position => 3, :alive => true)
		@set << Piece.create(:game_id => id, :type => "Queen", :color => "white", :row_position => 7, :col_position => 3, :alive => true)
		
		# kings
		@set << Piece.create(:game_id => id, :type => "King", :color => "black", :row_position => 0, :col_position => 4, :alive => true)
		@set << Piece.create(:game_id => id, :type => "King", :color => "black", :row_position => 7, :col_position => 4, :alive => true)	

		return @set
	end
end
