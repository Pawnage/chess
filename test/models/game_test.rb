require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "create_game" do
<<<<<<< HEAD
     game = Game.create(:player_white => 1, :player_black => 2, :player_turn => 1, :winner => 1, :moves => 1)
  	 puts game.inspect
  	 assert_true(false, "Set of pieces not created")
=======
    game = Game.create(:player_white => 1, :player_black => 2, :player_turn => 1, :winner => 1, :moves => 1)
  	puts game.inspect
>>>>>>> 4a37b5136e5c048b16ac370ad1f63feb2cb7d40c
  end

end
