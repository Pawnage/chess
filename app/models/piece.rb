class Piece < ActiveRecord::Base
	belongs_to :player
	
	def obstructed_move?(x, y)
    obstruction_array = obstructed_positions(x, y)
 
      #maybe return false if error
    
      obstruction_array.each do |position|
        # return true if obstruction found
        return true if game.obstruction(position[x], position[y])
      end
	end


	self.inheritance_column = :type

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
	end

	def obstructed_positions(xx, yy) #<= I think this needs to pass different args so individual piece args aren't hosed 
		fail NotImplementedError 'Pieces must implement #obstructed_positions'
		# individual pieces should override piece.rb
		# no obstructions for knight as it jumps over pieces
  	# is there a way to shorten obstructed_positions array possibilities based on piece movement restrictions like straight lines and
  	# diagonal?
	end
end
