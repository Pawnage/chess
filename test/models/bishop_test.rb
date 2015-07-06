require 'test_helper'

class BishopTest< ActiveSupport::TestCase
	test "white bishop_legal_move" do
    	bishop = FactoryGirl.create(:piece, :type => 'Bishop')
    	assert bishop.bishop_legal_move?(1, 1)
	end
end