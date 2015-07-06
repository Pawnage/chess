require 'test_helper'

class KingTest < ActiveSupport::TestCase
 
	test "white king_legal_move" do
  		king = FactoryGirl.create(:piece)
  		assert king.king_legal_move?(3, 1)
  	end
end