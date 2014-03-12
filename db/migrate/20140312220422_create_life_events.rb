class CreateLifeEvents < ActiveRecord::Migration
  def change
    create_table :life_events do |t|
      t.string :name
      t.text :type
      t.integer :count
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
