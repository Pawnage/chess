require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  test "#capturable? returns false if specified coordinates not occupied by any piece" do
    white_pawn = FactoryGirl.create(:piece, :type => 'Pawn', :row_position => 1, :col_position => 1)
    assert_equal false, white_pawn.capturable?(2, 1)
  end

  test "#capture? returns false if specified coordinates occupied by piece of same color" do
    game = FactoryGirl.create(:game)
    white_pawn_1 = FactoryGirl.create(:piece, :game_id => game.id, :type => 'Pawn', :row_position => 1, :col_position => 1)
    white_pawn_2 = FactoryGirl.create(:piece, :game_id => game.id, :type => 'Pawn', :row_position => 2, :col_position => 1)
    assert_equal false, white_pawn_1.capturable?(2, 1)
  end

  test "#capturable? returns true if specified coordinates occupied by piece of opposite color" do
    game = FactoryGirl.create(:game)
    white_pawn = FactoryGirl.create(:piece, :game_id => game.id, :type => 'Pawn', :color => 'White', :row_position => 1, :col_position => 1)
    black_pawn = FactoryGirl.create(:piece, :game_id => game.id, :type => 'Pawn', :color => 'Black', :row_position => 2, :col_position => 1)
    assert_equal true, white_pawn.capturable?(black_pawn.row_position, black_pawn.col_position)
  end

  test "#capture! changes row_position, col_position, alive fields to nil, nil, false" do
    game = FactoryGirl.create(:game)
    white_pawn = FactoryGirl.create(:piece, :id => 1, :game_id => game.id, :type => 'Pawn', :color => 'White', :row_position => 1, :col_position => 1)
    black_pawn = FactoryGirl.create(:piece, :id => 2, :game_id => game.id, :type => 'Pawn', :color => 'Black', :row_position => 2, :col_position => 1)
    white_pawn.capture!(black_pawn.row_position, black_pawn.col_position)

    updated_black_pawn = Piece.find(2)
    assert_equal nil, updated_black_pawn.row_position
    assert_equal nil, updated_black_pawn.col_position
    assert_equal false, updated_black_pawn.alive
  end
end
