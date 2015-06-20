FactoryGirl.define do
  factory :game do
  	player_turn 1
  	winner nil
  	moves 10
  	association :player_white, factory: :player
  	association :player_black, factory: :player
  end
end