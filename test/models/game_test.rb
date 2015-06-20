require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "#populate_board!" do
    game = FactoryGirl.create(:game)
  	assert_equal 32, game.pieces.count
  	assert_equal 16, Pawn.all.count
  	assert_equal 4, Rook.all.count
  	assert_equal 4, Knight.all.count
  	assert_equal 4, Bishop.all.count
  	assert_equal 2, Queen.all.count
  	assert_equal 2, King.all.count
  end
end
