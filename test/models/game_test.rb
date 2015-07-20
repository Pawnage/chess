require 'test_helper'

class GameTest < ActiveSupport::TestCase
 
  test "#populate_board!" do
    game = FactoryGirl.create(:game)
    assert_equal 32, game.pieces.count
  end

  test "test_rook.rb" do
    game = FactoryGirl.create(:game)
    expected = 'Rook'
    actual = game.obstruction(0, 0).type
    assert_equal expected, actual
  end

  test "#player_turn_change!" do
    game = FactoryGirl.create(:game, :player_white_id => 1, :player_black_id => 2, :player_turn => 1)
    game.player_turn_change!
    assert_equal 2, game.player_turn
    game.player_turn_change!
    assert_equal 1, game.player_turn
  end
  
end
