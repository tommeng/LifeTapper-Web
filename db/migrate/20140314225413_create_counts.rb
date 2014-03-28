class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.belongs_to :activity
      t.datetime :date

      t.timestamps
    end
  end
end
