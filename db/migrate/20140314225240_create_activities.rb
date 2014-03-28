class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.string     :name
      t.boolean    :is_count

      t.timestamps
    end
  end
end
