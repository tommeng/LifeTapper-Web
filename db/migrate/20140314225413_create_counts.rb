class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.integer :activity_id
      t.datetime :date

      t.timestamps
    end
  end
end
