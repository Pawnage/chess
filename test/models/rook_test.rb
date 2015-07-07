require 'test_helper'

class RookTest < ActiveSupport::TestCase

  test "white rook_legal_move" do
<<<<<<< HEAD
    rook = FactoryGirl.create(:rook, :type => 'Rook')
    assert rook.rook_legal_move?(0, 2)
=======
    rook = FactoryGirl.create(:rook, :type => 'Rook', :color => 'White', :row_position => 0, :col_position => 0)
    assert_equal true, rook.rook_legal_move?(0, 2)
>>>>>>> 79c880d37a4b6861fbe22b62b6608243a47e0c63
  end
end