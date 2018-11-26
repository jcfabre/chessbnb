class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :title
      t.text :description
      t.boolean :availability
      t.boolean :time_flexible
      t.date :start_date
      t.date :end_date
      t.references :time_control, foreign_key: true

      t.timestamps
    end
  end
end
