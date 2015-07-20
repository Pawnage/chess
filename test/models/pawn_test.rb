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

end