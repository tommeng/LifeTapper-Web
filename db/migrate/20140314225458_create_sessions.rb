class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :activity
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
