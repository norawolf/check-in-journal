class Mood < ActiveRecord::Base
  has_many :moods_entries
  has_many :moods, through: :moods_entries
end
