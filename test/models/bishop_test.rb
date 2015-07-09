require 'test_helper'

class BishopTest< ActiveSupport::TestCase
  test "legal_move forward returns true" do
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    assert true, bishop.legal_move?(1, 1)
    assert true, bishop.legal_move?(6, 1)
    assert true, bishop.legal_move?(1, 6)
    assert true, bishop.legal_move?(6, 6)
  end

  test "legal_move off board returns false" do
    refute bishop.legal_move?(1, -1)
    refute bishop.legal_move?(6, -1)
    refute bishop.legal_move?(1, 8)
    refute bishop.legal_move?(6, 8)
  end
end