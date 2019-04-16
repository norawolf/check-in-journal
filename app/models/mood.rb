class Mood < ActiveRecord::Base
  has_many :moods_entries
  has_many :entries, through: :moods_entries

  validates :name, presence: true

end
