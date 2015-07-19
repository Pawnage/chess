FactoryGirl.define do
  factory :piece do
    alive true
    association :player
    association :game
  end

  factory :pawn, parent: :piece, class: 'Pawn' do
    type "Pawn"
  end

  factory :rook, parent: :piece, class: 'Rook' do
    type "Rook"
  end

  factory :knight, parent: :piece, class: 'Knight' do
    type "Knight"
  end

  factory :bishop, parent: :piece, class: 'Bishop' do
    type "Bishop"
  end

  factory :king, parent: :piece, class: 'King' do
    type "King"
  end

  factory :queen, parent: :piece, class: 'Queen' do
    type "Queen"
  end

end