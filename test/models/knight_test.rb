require 'test_helper'

class KnightTest < ActiveSupport::TestCase
 
 test "white knight_legal_move" do
   knight = FactoryGirl.create(:piece, :type => 'Knight')
   assert knight.knight_legal_move?(2, 2) 
  end
end