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
end
