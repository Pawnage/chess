# require 'test_helper'

# class RookTest < ActiveSupport::TestCase

<<<<<<< HEAD
  test "rook legal_move off board returns false" do
  	rook = FactoryGirl.create(:rook, :row_position => 0, :col_position => 0)
    refute rook.legal_move?(0, -1)
    refute rook.legal_move?(-1, 0)
    refute rook.legal_move?(0, 8)
    refute rook.legal_move?(8, 0)
  end

  test "rook legal_move one move in two directions returns false" do
  	rook = FactoryGirl.create(:rook, :row_position => 0, :col_position => 0)
    refute rook.legal_move?(3, 1)
    refute rook.legal_move?(5, 5)
    refute rook.legal_move?(1, 1)
  end

  test "rook legal_move one move in one direction returns true" do
    rook = FactoryGirl.create(:rook, :row_position => 0, :col_position => 0)
    assert rook.legal_move?(0, 2)
    assert rook.legal_move?(1, 0)
    assert rook.legal_move?(0, 6)
    assert rook.legal_move?(6, 0)
  end

  #add tests for castling once castling logic is done

end
=======
#   test "rook legal_move" do

#     rook = FactoryGirl.create(:rook, :type => 'Rook', :color => 'White', :row_position => 0, :col_position => 0)
#     assert_equal true, rook.legal_move?(0, 2)
#   end
# end
>>>>>>> master
