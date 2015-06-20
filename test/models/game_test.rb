require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "populate_board" do

     game = Game.create
  	 assert_equal 32, @game.pieces.count

  end

end
