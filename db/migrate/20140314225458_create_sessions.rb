class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :activity_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
