require 'test_helper'

class BishopTest< ActiveSupport::TestCase
  test "white bishop_legal_move" do
    bishop = FactoryGirl.create(:bishop, :type => 'Bishop', :color => 'White', :row_position => 2, :col_position => 0)
    assert_equal true, bishop.bishop_legal_move?(1, 1)
  end
end