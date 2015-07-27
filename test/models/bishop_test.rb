require 'test_helper'

class BishopTest< ActiveSupport::TestCase
  test "legal_move diag (in two directions) returns true" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    assert bishop.legal_move?(5, 3)
    assert bishop.legal_move?(3, 3)
    assert bishop.legal_move?(5, 1)
    assert bishop.legal_move?(3, 1)
  end

  test "legal_move move in two directions returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    refute bishop.legal_move?(4, 1)
    refute bishop.legal_move?(6, 7)
  end

  test "legal_move move in one direction returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 2)
    refute bishop.legal_move?(4, 3)
    refute bishop.legal_move?(4, 1)
    refute bishop.legal_move?(5, 2)
    refute bishop.legal_move?(3, 2)
  end

  test "legal_move diag off board returns false" do
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    refute bishop.legal_move?(3, -1)
    refute bishop.legal_move?(1, -1)
    refute bishop.legal_move?(8, 6)
    refute bishop.legal_move?(-1, 3)
  end

  # test "#obstructed_move? for all four directions without any pieces existing in between current position and destination" do
  #   bishop = FactoryGirl.create(:bishop, :row_position => 4, :col_position => 4)
  #   refute bishop.obstructed_move?(5, 5) # move upward and rightward
  #   refute bishop.obstructed_move?(2, 6) # move downward and rightward
  #   refute bishop.obstructed_move?(5, 3) # move upward and leftward
  #   refute bishop.obstructed_move?(2, 2) # move downward and leftward
  # end

  test "#obstructed_move? for all four directions with pieces existing in between current position and destination" do
    game = FactoryGirl.create(:game)
    game.pieces.destroy_all

    bishop = FactoryGirl.create(:bishop, :game_id => game.id, :row_position => 3, :col_position => 3)
    pawn_top_right = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 4, :col_position => 4)
    pawn_bottom_right = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 2, :col_position => 4)
    pawn_top_left = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 5, :col_position => 1)
    pawn_bottom_left = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 1, :col_position => 1)

    assert bishop.obstructed_move?(7, 7) # move upward and rightward
    assert bishop.obstructed_move?(0, 6) # move downward and rightward
    assert bishop.obstructed_move?(6, 0) # move upward and leftward
    assert bishop.obstructed_move?(0, 0) # move downward and leftward
  end
end

