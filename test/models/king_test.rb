require 'test_helper'

class KingTest < ActiveSupport::TestCase

  test "king legal_move? off board returns false" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    refute king.legal_move?(8, 8)
    refute king.legal_move?(-1, 3)
  end

  test "king legal_move? 1 square to the left or right returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 5)
    assert king.legal_move?(3, 5)
    assert king.legal_move?(5, 5)
  end

  test "king legal_move? 1 square diagonal downward left or upward right returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 5)
    assert king.legal_move?(3, 4)
    assert king.legal_move?(5, 6)
  end

  test "king legal_move? 1 square upward or downward returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 5)
    assert king.legal_move?(4, 4)
    assert king.legal_move?(4, 6)
  end

end