class Game < ActiveRecord::Base
	belongs_to :player
	has_many :pieces

	after_create :populate_board!

	# def initialize
		# creates empty array to store 32 pieces
		# @set = []
	# end

	def populate_board!
		# create black pieces
		Piece.create(:game_id => id, :row_position => 8, :col_position => 1, :color => "black", :type => "Rook", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 2, :color => "black", :type => "Knight", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 3, :color => "black", :type => "Bishop", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 4, :color => "black", :type => "Queen", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 5, :color => "black", :type => "King", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 6, :color => "black", :type => "Bishop", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 7, :color => "black", :type => "Knight", :alive => true)
		Piece.create(:game_id => id, :row_position => 8, :col_position => 8, :color => "black", :type => "Rook", :alive => true)

		(1..8).each do |col|
      Piece.create(:game_id => id, :row_position => 7, :col_position => col, :color => "black", :type => "Pawn", :alive => true)
		end

    # create white pieces
    (1..8).each do |col|
      Piece.create(:game_id => id, :row_position => 2, :col_position => col, :color => "white", :type => "Pawn", :alive => true)
		end

    Piece.create(:game_id => id, :row_position => 1, :col_position => 1, :color => "white", :type => "Rook", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 2, :color => "white", :type => "Knight", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 3, :color => "white", :type => "Bishop", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 4, :color => "white", :type => "Queen", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 5, :color => "white", :type => "King", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 6, :color => "white", :type => "Bishop", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 7, :color => "white", :type => "Knight", :alive => true)
		Piece.create(:game_id => id, :row_position => 1, :col_position => 8, :color => "white", :type => "Rook", :alive => true)

		# populate front rows
		# (0..7).each do |n|
		# 	@set << Piece.new(Pawn, white, 1, n)
		# 	@set << Piece.new(Pawn, black, 6, n)
		# end

		# populate back rows
		# rook,knight,bishop,queen,king,bishop,knight,rook
		# rooks		
		# @set << Piece.new(Rook, white, 0, 0)
		# @set << Piece.new(Rook, white, 0, 7)
		# @set << Piece.new(Rook, black, 7, 0)
		# @set << Piece.new(Rook, black, 7, 7)
		
		# knights	
		# @set << Piece.new(Knight, white, 0, 2)		
		# @set << Piece.new(Knight, white, 0, 6)
		# @set << Piece.new(Knight, black, 7, 2)
		# @set << Piece.new(Knight, black, 7, 6)
		
		# bishops		
		# @set << Piece.new(Bishop, white, 0, 3)
		# @set << Piece.new(Bishop, white, 0, 5)	
		# @set << Piece.new(Bishop, black, 7, 3)
		# @set << Piece.new(Bishop, black, 7, 5)

		# queens
		# @set << Piece.new(Queen, white, 0, 3)
		# @set << Piece.new(Queen, white, 7, 3)
		
		# kings
		# @set << Piece.new(King, black, 0, 4)
		# @set << Piece.new(King, black, 7, 4)	

		# return @set
	end
end
