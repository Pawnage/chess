require 'test_helper'

class RookTest < ActiveSupport::TestCase

  test "rook_legal_move" do
    piece = FactoryGirl.create(:piece)
    type = 'Rook'
    assert piece.rook_legal_move?(1, 1)
  end
end