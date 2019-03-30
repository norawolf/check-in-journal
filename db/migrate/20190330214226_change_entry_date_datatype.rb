class ChangeEntryDateDatatype < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.change :date, :datetime
    end
  end
end
