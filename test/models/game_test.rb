require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "#populate_board!" do
 	game = FactoryGirl.create(:game)
 # 	uncomment after test succeeds
    assert_equal 1, @game.pieces.count
  end
end
