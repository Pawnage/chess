require 'test_helper'

 class PawnTest < ActiveSupport::TestCase
#when one or both destination squares are vacant  
  test "legal_move one square returns true" do
     pawn = FactoryGirl.create(:pawn, :row_position => 0, :col_position => 1)
     assert pawn.legal_move?(0, 2)
  end

  test "legal_move two squares returns true" do
     pawn = FactoryGirl.create(:pawn, :row_position => 0, :col_position => 1)
     assert pawn.legal_move?(0, 3)
  end
#when one or both destination squares are occupied
  test "legal_move one square returns false" do
     pawn = FactoryGirl.create(:pawn, :row_position => 0, :col_position => 1)
     refute pawn.legal_move?(0, 2)
  	 refute pawn.legal_move?(1, 1)
  	 refute pawn.legal_move?(-1, 1)
  	 refute pawn.legal_move?(0, 0) 
  end

  test "legal_move two squares returns false" do
     pawn = FactoryGirl.create(:pawn, :row_position => 0, :col_position => 1)
     refute pawn.legal_move?(0, 3)
  	 refute pawn.legal_move?(2, 1)
  	 refute pawn.legal_move?(-2, 1)
  	 refute pawn.legal_move?(0, -1)
  end

end