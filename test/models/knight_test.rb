require 'test_helper'

class KnightTest < ActiveSupport::TestCase 
 test "white knight_legal_move" do
<<<<<<< HEAD
   knight = FactoryGirl.create(:knight, :type => 'Knight')
   assert knight.knight_legal_move?(2, 2) 
=======
   knight = FactoryGirl.create(:knight, :type => 'Knight', :color => 'White', :row_position => 1, :col_position => 0)
   assert_equal true, knight.knight_legal_move?(2, 2) 
>>>>>>> 79c880d37a4b6861fbe22b62b6608243a47e0c63
  end
end