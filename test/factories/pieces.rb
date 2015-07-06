FactoryGirl.define do
  factory :piece do
  	row_position 1
  	col_position 1
  	color "White"
  	type "Rook"
  	alive true
  	association :player
    association :game
  end

  factory :rook, parent: :piece, class: 'Rook' do
  end

  factory :bishop, parent: :piece, class: 'Bishop' do
  end
end