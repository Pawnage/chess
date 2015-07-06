require 'test_helper'

class RookTest < ActiveSupport::TestCase

  test "white rook_legal_move" do
    rook = FactoryGirl.create(:piece, :type => 'Rook')
    assert rook.rook_legal_move?(0, 2)
  end
end