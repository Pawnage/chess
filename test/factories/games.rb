FactoryGirl.define do
  factory :game do
  	player_white 1
  	player_black 2
  	player_turn 1
  	winner nil
  	moves 10
  end
end