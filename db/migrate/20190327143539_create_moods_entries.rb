class CreateMoodsEntries < ActiveRecord::Migration
  def change
    create_table :moods_entries do |t|
      t.integer :mood_id
      t.integer :entry_id
      t.timestamps null: false
    end
  end
end
