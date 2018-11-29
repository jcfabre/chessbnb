class AddTimeColumnsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :start_time, :time
    add_column :games, :end_time, :time
  end
end
