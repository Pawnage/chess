# require 'test_helper'

# class PieceTest < ActiveSupport::TestCase

#  test "#nil_move? method" do
#    pawn = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
#    assert pawn.nil_move?(1, 1)
#    refute pawn.nil_move?(2, 1)
#  end

#  test "#capturable? returns false if specified coordinates not occupied by any piece" do
#    white_pawn = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
#    refute white_pawn.capturable?(2, 1)
#  end

#   test "#capturable? returns false if specified coordinates not occupied by any piece" do
#     white_pawn = FactoryGirl.create(:pawn, :row_position => 1, :col_position => 1)
#     refute white_pawn.capturable?(2, 1)
#   end

#   test "#capturable? returns false if specified coordinates occupied by piece of same color" do
#     game = FactoryGirl.create(:game)
#     white_pawn_1 = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 1, :col_position => 1)
#     white_pawn_2 = FactoryGirl.create(:pawn, :game_id => game.id, :row_position => 2, :col_position => 1)
#     refute white_pawn_1.capturable?(white_pawn_2.row_position, white_pawn_2.col_position)
#   end

#   test "#capturable? returns true if specified coordinates occupied by piece of opposite color" do
#     game = FactoryGirl.create(:game)
#     white_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'White', :row_position => 1, :col_position => 1)
#     black_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'Black', :row_position => 2, :col_position => 1)
#     assert white_pawn.capturable?(black_pawn.row_position, black_pawn.col_position)
#   end

#   test "#capture! changes row_position, col_position, alive fields to nil, nil, false" do
#     game = FactoryGirl.create(:game)
#     white_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'White', :row_position => 1, :col_position => 1)
#     black_pawn = FactoryGirl.create(:pawn, :game_id => game.id, :color => 'Black', :row_position => 2, :col_position => 1)
#     white_pawn.capture!(black_pawn.row_position, black_pawn.col_position)

#     black_pawn.reload
#     assert_nil black_pawn.row_position
#     assert_nil black_pawn.col_position
#     refute black_pawn.alive
#   end

# end
