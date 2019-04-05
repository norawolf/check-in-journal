class RemoveSeverityFromMoods < ActiveRecord::Migration
  def change
    remove_column :moods, :severity
  end
end
