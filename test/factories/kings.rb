FactoryGirl.define do
  factory :king do
  	row_position 4
  	col_position 0
  	color "White"
  	type "King"
  	alive true
  	association :player
    association :game
  end
end