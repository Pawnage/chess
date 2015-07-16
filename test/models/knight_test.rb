require 'test_helper'

class KnightTest < ActiveSupport::TestCase 
 test "knight_legal_move left-right then up-down return true" do
   knight = FactoryGirl.create(:knight, :row_position => 4, :col_position => 3)
   assert knight.legal_move?(6, 4)
   assert knight.legal_move?(6, 2)
   assert knight.legal_move?(2, 4)
   assert knight.legal_move?(2, 2) 
  end

  test "knight_legal_move up-down then left-right return true" do

   knight = FactoryGirl.create(:knight, :row_position => 4, :col_position => 3)
   assert knight.legal_move?(5, 5)
   assert knight.legal_move?(5, 1)
   assert knight.legal_move?(3, 5) 
   assert knight.legal_move?(3, 1)
  end

  test "knight_legal_move off board return false" do
   knight = FactoryGirl.create(:knight, :row_position => 1, :col_position => 0)
   refute knight.legal_move?(-1, 1)
   refute knight.legal_move?(-1, -1)
   refute knight.legal_move?(3, -1)
   refute knight.legal_move?(0, -2)
   refute knight.legal_move?(2, -2) 
  end
end