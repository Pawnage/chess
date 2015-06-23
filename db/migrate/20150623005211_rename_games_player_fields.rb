class RenameGamesPlayerFields < ActiveRecord::Migration
  def change
    rename_column :games, :player_white, :player_white_id
    rename_column :games, :player_black, :player_black_id
  end
end
