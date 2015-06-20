FactoryGirl.define do
  factory :piece do
  	game_id 1
  	row_position 1
  	col_position 1
  	color "white"
  	type "rook"
  	alive true
    association :game
  end
end