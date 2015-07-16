require 'test_helper'

class RookTest < ActiveSupport::TestCase

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

  #add tests for castling once castling logic is done

end