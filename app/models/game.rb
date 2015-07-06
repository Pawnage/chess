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

	def king_legal_move?(x, y)
		if (piece.row_position - x).abs == 1 or (piece.col_position - y).abs == 1
				return true		
			end	
		end
	end

	def rook_legal_move?(x, y)
		#rook's move is purely horizontal or vertical
		if (piece.row_position - x).abs == 0 or (piece.col_position - y).abs == 0 
		 		#add conditions for kingside and queenside castling (i.e. rook moves horizontally (or vertically?) around king or queen)
			return true
		end
	end

	def bishop_legal_move?(x, y)
		#bishop can only move diagonally so easiest condition is to exclude any purely horiz. or vertical moves 
		if (piece.row_position - x).abs != 0 or (piece.col_position - y).abs != 0
			return true		
		end	
		
	end

	def knight_legal_move?(x, y)
		#knight moves two squares in horiz. or vertical then one space in the other of the two directions 
		if ((piece.row_position - x).abs == 2 and (piece.col_position - y).abs == 1)) or ((piece.col_position - y).abs == 2 and (piece.row_position - x).abs == 1))
			return true		
		end	
	end
		
	def pawn_legal_move?(x, y)	
		#pawns cannot move backward or left to right (ability to capture left to right handled by capture function)
		
		# initial move: 1 sq
		#white pawn condition
		if piece.type == 'Pawn' and piece.color == 'White'
			if (piece.col_position - y) == 1 and (piece.row_position - x) == 0 
				return true
			end
		# black pawn condition, varies from white due to different positions on board...	
		elsif piece.type == 'Pawn' and piece.color == 'Black'
			if (piece.col_position - y) == -1 and (piece.row_position - x) == 0 
				return true
			end	
			# add conditions (and/or new methods) for promotion, en passant
		
		# initial move: 2sq
		# white pawn condition 
		if pieces.type == 'Pawn' and piece.color == 'White'
			if (piece.col_position - y) == 2 and (piece.row_position - x) == 0 
				return true
			end 
		#black pawn condition
		elsif pieces.type == 'Pawn' and piece.color == 'Black'
			if (piece.col_position - y) == -2
				return true 
			end
		else
			return false
		end
		
	end

end
