FactoryGirl.define do
  factory :piece do
  	row_position 0
  	col_position 0
  	color "White"
  	type "Rook"
  	alive true
  	association :player
    association :game
  end