require 'test_helper'

class PawnTest < ActiveSupport::TestCase
  test "white pawn_legal_move" do
    pawn = FactoryGirl.create(:pawn, :type => 'Pawn', :color => 'White', :row_position => 0, :col_position => 1)
    assert_equal true, pawn.pawn_legal_move?(2, 1)
  end
end