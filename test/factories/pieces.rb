FactoryGirl.define do
  factory :piece do
  	row_position 1
  	col_position 1
  	color "white"
  	type "Rook"
  	alive true
  	association :player
    association :game
  end

  factory :piece do
  	row_position 0
  	col_position 3
  	color "white"
  	type "King"
  	alive true
  	association :player
    association :game
  end
end