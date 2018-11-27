class ChangeStartDateToBeDateTimeInGames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :start_date, :datetime
  end
end
