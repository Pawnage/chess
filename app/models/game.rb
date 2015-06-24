class Game < ActiveRecord::Base
	belongs_to :player
	has_many :pieces

	after_create :populate_board!

	def obstruction(x, y)
    pieces.where(row_position: x, col_position: y).last
	end

	
	def populate_board!		
		#populate front rows wth pawns
		(0..7).each do |n|
			pieces.create(:type => 'Pawn', :color => :player_white, :row_position => 1, :col_position => n)
			
		end

		(0..7).each do |n|
			pieces.create(:type => 'Pawn', :color => :player_black, :row_position => 1, :col_position => n)
			
		end

	# 	#populate back rows
	# 	#rook,knight,bishop,queen,king,bishop,knight,rook
	# 	#rooks		
		pieces.create(:type => 'Rook', :color => :player_white, :row_position => 0, :col_position => 0)
		pieces.create(:type => 'Rook', :color => :player_white, :row_position => 0, :col_position => 7)
		pieces.create(:type => 'Rook', :color => :player_white, :row_position => 7, :col_position => 0)
		pieces.create(:type => 'Rook', :color => :player_white, :row_position => 7, :col_position => 7)
	
		
	# 	#knights
		pieces.create(:type => 'Knight', :color => :player_white, :row_position => 0, :col_position => 2)	
		pieces.create(:type => 'Knight', :color => :player_white, :row_position => 0, :col_position => 6)	
		pieces.create(:type => 'Knight', :color => :player_black, :row_position => 7, :col_position => 2)	
		pieces.create(:type => 'Knight', :color => :player_black, :row_position => 7, :col_position => 6)	

		
	# 	#bishops
		pieces.create(:type => 'Bishop', :color => :player_white, :row_position => 0, :col_position => 3)
		pieces.create(:type => 'Bishop', :color => :player_white, :row_position => 0, :col_position => 5)
		pieces.create(:type => 'Bishop', :color => :player_black, :row_position => 7, :col_position => 3)
		pieces.create(:type => 'Bishop', :color => :player_black, :row_position => 7, :col_position => 5)

	# 	#queens
		pieces.create(:type => 'Queen', :color => :player_white, :row_position => 0, :col_position => 3)
		pieces.create(:type => 'Queen', :color => :player_black, :row_position => 7, :col_position => 3)
	
	#kings
		pieces.create(:type => 'King', :color => :player_white, :row_position => 0, :col_position => 4)
		pieces.create(:type => 'King', :color => :player_black, :row_position => 7, :col_position => 4)
	

	end
end
