require 'test_helper'

class KnightTest < ActiveSupport::TestCase 
 test "white knight_legal_move" do

   knight = FactoryGirl.create(:knight, :type => 'Knight', :row_position => 1, :col_position => 0)
   assert_equal true, knight.legal_move?(2, 2) 
  end
end