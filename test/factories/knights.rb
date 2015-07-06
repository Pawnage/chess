FactoryGirl.define do
  factory :piece do
  	row_position 1
  	col_position 0
  	color "White"
  	type "Knight"
  	alive true
  	association :player
    association :game
  end