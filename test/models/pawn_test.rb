require 'test_helper'

class PawnTest < ActiveSupport::TestCase

	test "white pawn_legal_move" do
	    pawn = FactoryGirl.create(:piece, :type => 'Pawn')
	    assert pawn.pawn_legal_move?(2, 1)
  	end
end