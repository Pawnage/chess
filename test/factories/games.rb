FactoryGirl.define do
  factory :game do
  	player_turn 1
  	winner nil
  	moves 10
  	association :player_white_id, factory: :player
  	association :player_black_id, factory: :player
  end
 
end