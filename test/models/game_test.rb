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

  test "legal_move" do
  	game = FactoryGirl.create(:game)
  	expected = 'King'
    actual = game.legal_move?(1, 1)
  	assert_equal expected, actual
  end
end
