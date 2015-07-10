require 'test_helper'

class KingTest < ActiveSupport::TestCase

  test "king legal_move? off board returns false" do
    king = FactoryGirl.create(:king, :row_position => 7, :col_position => 7)
    refute king.legal_move?(8, 8)
    refute king.legal_move?(-1, 7)
  end

  test "king legal_move? 1 square left-right returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(3, 7)
    assert king.legal_move?(5, 7)
  end

  test "king legal_move? 1 square diagonal move returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(3, 6)
    assert king.legal_move?(5, 6)
  end

  test "king legal_move? 1 square up or down returns true" do
    king = FactoryGirl.create(:king, :row_position => 4, :col_position => 7)
    assert king.legal_move?(4, 6)
  end

end