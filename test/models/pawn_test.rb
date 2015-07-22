require 'test_helper'

class PawnTest < ActiveSupport::TestCase

  test "white pawn can only move one space forward if current position is not equal to initial position; all other moves illegal" do
    white_pawn = FactoryGirl.create(:pawn, :color => 'White', :row_position => 2, :col_position => 2)
    assert white_pawn.legal_move?(3, 2) # move one space
    refute white_pawn.legal_move?(4, 2) # move two spaces
    refute white_pawn.legal_move?(3, 3) # move diagonally
    refute white_pawn.legal_move?(1, 2) # move backwards
  end
 
  test "white pawn can move one or two spaces vertically if current position is equal to initial position" do
    game = FactoryGirl.create(:game)
    white_pawn = game.pieces.where(:row_position => 1, :col_position => 2)[0]
    assert white_pawn.legal_move?(2, 2)
    assert white_pawn.legal_move?(3, 2)
  end
 
  test "black pawn can only move one space forward if current position is not equal to initial position; all other moves illegal" do
    black_pawn = FactoryGirl.create(:pawn, :color => 'Black', :row_position => 5, :col_position => 2)
    assert black_pawn.legal_move?(4, 2) # move one space
    refute black_pawn.legal_move?(3, 2) # move two spaces
    refute black_pawn.legal_move?(4, 3) # move diagonally
    refute black_pawn.legal_move?(6, 2) # move backwards
  end
 
  test "black pawn can move one or two spaces vertically if current position is equal to initial position" do
    game = FactoryGirl.create(:game)
    black_pawn = game.pieces.where(:row_position => 6, :col_position => 2)[0]
    assert black_pawn.legal_move?(5, 2)
    assert black_pawn.legal_move?(4, 2)
  end

  test "#obstructed_move? returns true if a piece exists in between the pawn and its destination when trying to move two spaces forward" do
    game = FactoryGirl.create(:game)
    pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'White', :row_position => 1, :col_position => 1)
    blocking_piece = FactoryGirl.create(:bishop, :game_id => game.id, :color => 'White', :row_position => 2, :col_position => 1)
    assert pawn.obstructed_move?(3, 1)
  end

  test "#obstructed_move? returns false if no piece exists in between the pawn and its destination when trying to move two spaces forward" do
    game = FactoryGirl.create(:game)
    pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'White', :row_position => 1, :col_position => 1)
    refute pawn.obstructed_move?(3, 1)
  end

end