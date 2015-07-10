require 'test_helper'

class RookTest < ActiveSupport::TestCase

  test "rook legal_move off board returns false" do
  	rook = FactoryGirl.create(:rook, :type => 'Rook', :row_position => 0, :col_position => 0)
    refute rook.legal_move?(0, -1)
    refute rook.legal_move?(-1, 0)
    refute rook.legal_move?(0, 8)
    refute rook.legal_move?(8, 0)
  end

  #add tests for castling once castling logic is done

end