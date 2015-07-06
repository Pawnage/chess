require 'test_helper'

class KnightTest < ActiveSupport::TestCase
 
 test "knight_legal_move" do
    piece = FactoryGirl.create(:piece)
    type = 'Knight'
    assert piece.knight_legal_move?(1, 1) 
  end
end