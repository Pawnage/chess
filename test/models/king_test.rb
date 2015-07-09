require 'test_helper'

class KingTest < ActiveSupport::TestCase

  test "king legal_move? backward off board top returns false" do
    king = FactoryGirl.create(:king, :row_position => 7, :col_position => 7)
    refute king.legal_move?(8, 8)
  end

  test "king legal_move? backward off board bottom returns false" do
    king = FactoryGirl.create(:king, :row_position => 0, :col_position => 7)
    refute king.legal_move?(-1, 7)
  end

  test "king legal_move? 1 square to the left returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(4, 6)
  end

  test "king legal_move? 1 square to the right returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 6)
    assert king.legal_move?(4, 7)
  end

  test "king legal_move? 1 square diagonal downward left returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(3, 6)
  end

  test "king legal_move? 1 square diagonal upward right returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 6)
    assert king.legal_move?(5, 7)
  end

  test "king legal_move? 1 square upward returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(5, 7)
  end

  test "king legal_move? 1 square downward returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(3, 7)
  end

end