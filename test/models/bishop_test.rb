require 'test_helper'


class BishopTest< ActiveSupport::TestCase
  test "legal_move diag (in two directions) returns true" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    assert bishop.legal_move?(5, 3)
    assert bishop.legal_move?(3, 3)
    assert bishop.legal_move?(5, 1)
    assert bishop.legal_move?(3, 1)
  end

  test "legal_move move in two directions returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    refute bishop.legal_move?(4, 1)
    refute bishop.legal_move?(6, 7)
  end

  test "legal_move move in one direction returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    refute bishop.legal_move?(4, 3)
    refute bishop.legal_move?(4, 1)
    refute bishop.legal_move?(5, 2)
    refute bishop.legal_move?(3, 2)
  end

  test "legal_move diag off board returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    refute bishop.legal_move?(3, -1)
    refute bishop.legal_move?(1, -1)
    refute bishop.legal_move?(8, 6)
    refute bishop.legal_move?(-1, 3)
  end
end

