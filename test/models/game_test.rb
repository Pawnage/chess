require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "#populate_board!" do
    player1 = FactoryGirl.create(:player)
    player2 = FactoryGirl.create(:player)
    game = FactoryGirl.create(:game, :player_white => player1.id, :player_black => player2.id)
  	assert_equal 32, @game.pieces.count
  end

end
