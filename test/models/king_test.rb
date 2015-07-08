require 'test_helper'

class KingTest < ActiveSupport::TestCase
  
  test "king legal_move +1 sq" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(1, 1)
  end

  test "king legal_move backward off board top" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(8, 8)
  end

  test "king legal_move backward off board bottom" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(4, -1)
  end

  test "white king legal_move left" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(3, 7)
  end

  test "white king legal_move right" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(5, 7)
  end

  test "king legal_move 1 sq diag fwd left" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(3, 6)
  end

  test "king legal_move 1 sq diag fwd right" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(5, 6)
  end

  test "king legal_move 1 sq fwd" do
    king = FactoryGirl.create(:king, :type => 'King', :row_position => 4, :col_position => 7)
    assert_equal true, king.legal_move?(4, 6)
  end

end