FactoryGirl.define do
  factory :piece do
  	row_position 2
  	col_position 0
  	color "White"
  	type "Bishop"
  	alive true
  	association :player
    association :game
  end
end