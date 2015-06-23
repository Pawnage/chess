class AlterPiecesToHavePlayerId < ActiveRecord::Migration
  def change
  	add_column :pieces, :player_id, :integer
  end
end
