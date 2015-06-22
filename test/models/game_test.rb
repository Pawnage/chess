require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "#populate_board!" do
 #  game = FactoryGirl.create(:game)
 # 	uncomment after test succeeds
    assert_equal 32, @pieces.count
  end
end
