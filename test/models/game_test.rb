require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "#populate_board!" do
    game = FactoryGirl.create(:game)
    assert_equal 32, game.pieces.count
  end
end
