require 'test_helper'

class BishopTest< ActiveSupport::TestCase
  test "legal_move diag returns true" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    assert true, bishop.legal_move?(5, 3)
    assert true, bishop.legal_move?(3, 3)
    assert true, bishop.legal_move?(5, 1)
    assert true, bishop.legal_move?(3, 1)
  end

  test "legal_move move in one direction returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    assert true, bishop.legal_move?(5, 3)
    assert true, bishop.legal_move?(3, 3)
    assert true, bishop.legal_move?(5, 1)
    assert true, bishop.legal_move?(3, 1)
  end

  test "legal_move off board returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    refute bishop.legal_move?(3, -1)
    refute bishop.legal_move?(1, -1)
    refute bishop.legal_move?(8, 6)
    refute bishop.legal_move?(-1, 3)
  end
end