class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|

      t.integer :game_id
      
      t.integer :row_position
      t.integer :col_position
      t.string :color
      t.string :piece_type
      t.boolean :alive

      t.timestamps
    end
  end
end
