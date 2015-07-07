require 'test_helper'

class KingTest < ActiveSupport::TestCase
  test "white king_legal_move" do
    king = FactoryGirl.create(:king, :type => 'King', :color => 'White', :row_position => 4, :col_position => 0)
    assert_equal true, king.king_legal_move?(3, 1)
  end
end