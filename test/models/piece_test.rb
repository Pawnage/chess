require 'test_helper'

class PieceTest < ActiveSupport::TestCase

  test "#capturable? returns false if specified coordinates not occupied by any piece" do
    white_pawn = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
    refute white_pawn.capturable?(2, 1)
  end

  test "#capturable? returns false if specified coordinates occupied by piece of same color" do
    game = FactoryGirl.create(:game)
    white_pawn_1 = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 1, :col_position => 1)
    white_pawn_2 = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 2, :col_position => 1)
    refute white_pawn_1.capturable?(white_pawn_2.row_position, white_pawn_2.col_position)
  end

  test "#capturable? returns true if specified coordinates occupied by piece of opposite color" do
    game = FactoryGirl.create(:game)
    white_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'White', :row_position => 1, :col_position => 1)
    black_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'Black', :row_position => 2, :col_position => 1)
    assert white_pawn.capturable?(black_pawn.row_position, black_pawn.col_position)
  end

  test "#capture! changes row_position, col_position, alive fields to nil, nil, false" do
    game = FactoryGirl.create(:game)
    white_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'White', :row_position => 1, :col_position => 1)
    black_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'Black', :row_position => 2, :col_position => 1)
    white_pawn.capture!(black_pawn.row_position, black_pawn.col_position)

    black_pawn.reload
    assert_nil black_pawn.row_position
    assert_nil black_pawn.col_position
    refute black_pawn.alive
  end

  test "#attempt_move true(nil_move), false(legal_move), returns false" do
    pawn = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
    rook = FactoryGirl.create(:rook, :row_position => 0, :col_position => 0)
    knight = FactoryGirl.create(:knight, :row_position => 1, :col_position => 0)
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    king= FactoryGirl.create(:king, :row_position => 3, :col_position => 0)
    queen = FactoryGirl.create(:queen, :row_position => 4, :col_position => 0)
    refute pawn.attempt_move(1, 1)
    refute rook.attempt_move(0, 0)
    refute knight.attempt_move(1, 0)
    refute bishop.attempt_move(2, 0)
    refute king.attempt_move(3, 0)
    refute queen.attempt_move(4, 0)
  end

  test "#attempt_move false(nil_move), true(legal_move) returns true" do
    pawn   = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
    rook   = FactoryGirl.create(:rook, :row_position => 0, :col_position => 0)
    knight = FactoryGirl.create(:knight, :row_position => 1, :col_position => 0)
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    king   = FactoryGirl.create(:king, :row_position => 3, :col_position => 0)
    queen  = FactoryGirl.create(:queen, :row_position => 4, :col_position => 0)
    assert pawn.attempt_move(1, 2)
    assert rook.attempt_move(0, 3)
    assert knight.attempt_move(2, 2)
    assert bishop.attempt_move(5, 3)
    assert king.attempt_move(4, 1)
  end

  test "#attempt_move false(nil_move), false(legal_move) returns false" do
    pawn   = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
    rook   = FactoryGirl.create(:rook, :row_position => 0, :col_position => 0)
    knight = FactoryGirl.create(:knight, :row_position => 1, :col_position => 0)
    bishop = FactoryGirl.create(:bishop, :row_position => 2, :col_position => 0)
    king   = FactoryGirl.create(:king, :row_position => 3, :col_position => 0)
    refute pawn.attempt_move(3, 2)
    refute rook.attempt_move(2, 3)
    refute knight.attempt_move(2, 5)
    refute bishop.attempt_move(6, 3)
    refute king.attempt_move(3, 0)
  end

  test "#attempt_move queen only: false(nil_move), true(legal_move), true (obstructed_move) returns false" do
    queen = FactoryGirl.create(:queen, :row_position => 4, :col_position => 0)
    refute queen.attempt_move(5, 3)
  end
end

