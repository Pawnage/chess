require 'test_helper'

class KingTest < ActiveSupport::TestCase
 
	test "king_legal_move" do
  		piece = FactoryGirl.create(:piece)
  		assert piece.king_legal_move?(1, 1)
  		assert_equal expected, actual
  	end
end