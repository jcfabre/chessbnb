class ChangeEndDateToBeDateTimeInGames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :end_date, :datetime
  end
end
