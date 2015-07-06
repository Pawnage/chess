require 'test_helper'

class RookTest < ActiveSupport::TestCase

  test "white rook_legal_move" do
    rook = FactoryGirl.create(:rook, :type => 'Rook', :color => 'White', :row_position => 0, :col_position => 0)
    assert_equal true, rook.rook_legal_move?(0, 2)
  end
end