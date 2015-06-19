require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "create_game" do
     game = Game.create(:player_white => 1, :player_black => 2, :player_turn => 1, :winner => 1, :moves => 1)
  	 puts game.inspect
  end


end
