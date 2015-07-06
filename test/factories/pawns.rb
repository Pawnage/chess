FactoryGirl.define do
  factory :pawn do
  	row_position 0
  	col_position 1
  	color "White"
  	type "Pawn"
  	alive true
  	association :player
    association :game
  end
end