require 'test_helper'

class BishopTest< ActiveSupport::TestCase
	test "bishop_legal_move" do
    	piece = FactoryGirl.create(:piece)
    	assert piece.bishop_legal_move?(1, 1)
	end
end