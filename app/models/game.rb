class Game < ActiveRecord::Base
	belongs_to :player
	has_many :pieces

	after_create :populate_board!

	def obstruction(x, y)
    	pieces.where(row_position: x, col_position: y).last
	end


	def obstructed_positions #<= I think this needs to pass different args so individual piece args aren't hosed 
		#fail NotImplementedError 'Pieces must implement #obstructed_positions'
		# individual pieces should override piece.rb
		# no obstructions for knight as it jumps over pieces
  	# is there a way to shorten obstructed_positions array possibilities based on piece movement restrictions like straight lines and
  	# diagonal?
  		return self.pieces.to_a
	end
	
	def populate_board!		
		#populate front rows wth pawns
		(0..7).each do |n|
			pieces.create(:type => 'Pawn', :color => "White", :row_position => 1, :col_position => n)
			
		end

		(0..7).each do |n|
			pieces.create(:type => 'Pawn', :color => "Black", :row_position => 6, :col_position => n)
			
		end

	# 	#populate back rows
	# 	#rook,knight,bishop,queen,king,bishop,knight,rook
	# 	#rooks		
		pieces.create(:type => 'Rook', :color => "White", :row_position => 0, :col_position => 0)
		pieces.create(:type => 'Rook', :color => "White", :row_position => 0, :col_position => 7)
		pieces.create(:type => 'Rook', :color => "Black", :row_position => 7, :col_position => 0)
		pieces.create(:type => 'Rook', :color => "Black", :row_position => 7, :col_position => 7)
	
		
	# 	#knights
		pieces.create(:type => 'Knight', :color => "White", :row_position => 0, :col_position => 1)	
		pieces.create(:type => 'Knight', :color => "White", :row_position => 0, :col_position => 6)	
		pieces.create(:type => 'Knight', :color => "Black", :row_position => 7, :col_position => 1)	
		pieces.create(:type => 'Knight', :color => "Black", :row_position => 7, :col_position => 6)	

		
	# 	#bishops
		pieces.create(:type => 'Bishop', :color => "White", :row_position => 0, :col_position => 2)
		pieces.create(:type => 'Bishop', :color => "White", :row_position => 0, :col_position => 5)
		pieces.create(:type => 'Bishop', :color => "Black", :row_position => 7, :col_position => 2)
		pieces.create(:type => 'Bishop', :color => "Black", :row_position => 7, :col_position => 5)

	# 	#queens
		pieces.create(:type => 'Queen', :color => "White", :row_position => 0, :col_position => 3)
		pieces.create(:type => 'Queen', :color => "Black", :row_position => 7, :col_position => 3)
	
	#kings
		pieces.create(:type => 'King', :color => "White", :row_position => 0, :col_position => 4)
		pieces.create(:type => 'King', :color => "Black", :row_position => 7, :col_position => 4)
	end

	#return true if the game in progress and false otherwise
	def is_joined?
		if player_black_id && player_white_id
			return true
		end

		return false
	end

	def legal_move_king?(x, y)
		if (game.piece.row_position - x).abs = 1 or (game.piece.col_position - y).abs = 1
			return true
		else
			return false
		end	
	end
end
