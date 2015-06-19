class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      
      t.integer :player_white
      t.integer :player_black
      t.integer :player_turn
      t.integer :winner
      t.integer :moves

      t.timestamps
    end
  end
end
