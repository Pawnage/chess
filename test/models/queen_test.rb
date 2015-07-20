require 'test_helper'

class QueenTest< ActiveSupport::TestCase
  
  test "legal_move one-square move in one direction returns true" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    assert queen.legal_move?(2, 0)
    assert queen.legal_move?(4, 0)
    assert queen.legal_move?(3, 1)
  end

  test "legal_move one-square move in one direction returns false" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    refute queen.legal_move?(3, -1)
  end

  test "legal_move one-square move in two directions returns true" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    assert queen.legal_move?(2, 1)
    assert queen.legal_move?(4, 1)
  end

  test "legal_move one-square move in two directions returns false" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    refute queen.legal_move?(2, -1)
    refute queen.legal_move?(4, -1)
  end

  test "legal_move multi-square move in one direction returns true" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    assert queen.legal_move?(3, 3)
    assert queen.legal_move?(0, 0)
    assert queen.legal_move?(7, 0)
  end

  test "legal_move multi-square move in one direction returns false" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    refute queen.legal_move?(3, 8)
    refute queen.legal_move?(-1, 0)
    refute queen.legal_move?(8, 0)
    refute queen.legal_move?(3, -1)
  end

  test "legal_move multi-square move in two directions returns true" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    assert queen.legal_move?(7, 4)
    assert queen.legal_move?(0, 3)
  end

  test "legal_move multi-square move in two directions returns false incl. knight-like moves" do
    queen = FactoryGirl.create(:queen, :row_position => 3, :col_position => 0)
    refute queen.legal_move?(4, 5)
    refute queen.legal_move?(6, 7)
    refute queen.legal_move?(0, -3)
    refute queen.legal_move?(5, -2)
  end

end