require 'test_helper'

class PawnTest < ActiveSupport::TestCase

	test "pawn_legal_move" do
	    piece = FactoryGirl.create(:piece)
	    expected = 'Pawn'
	    assert game.pawn_legal_move?(1, 1)
  	end
end