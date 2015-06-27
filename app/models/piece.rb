class Piece < ActiveRecord::Base
	belongs_to :player

  after_initialize :set_default_for_alive

  attr_accessor :selected
	
	def obstructed_move?(x, y)
    obstruction_array = obstructed_positions(x, y)
 
      #maybe return false if error
    
      obstruction_array.each do |position|
        # return true if obstruction found
        return true if game.obstruction(position[x], position[y])
      end
	end

  # for highlighting piece when selected
  def selected!
    self.selected = true
  end

	self.inheritance_column = :type

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

	def legal_move?
	end

  def set_default_for_alive
    self.alive = true if self.alive.nil?
  end
end
