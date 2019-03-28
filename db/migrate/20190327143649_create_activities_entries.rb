class CreateActivitiesEntries < ActiveRecord::Migration
  def change
    create_table :activities_entries do |t|
      t.integer :activity_id
      t.integer :entry_id
      t.timestamps null: false
    end
  end
end
