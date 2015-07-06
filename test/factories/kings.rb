FactoryGirl.define do
  factory :piece do
  	row_position 4
  	col_position 0
  	color "White"
  	type "King"
  	alive true
  	association :player
    association :game
  end
end