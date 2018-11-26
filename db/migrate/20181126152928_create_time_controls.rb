class CreateTimeControls < ActiveRecord::Migration[5.2]
  def change
    create_table :time_controls do |t|
      t.string :name
      t.integer :duration

      t.timestamps
    end
  end
end
