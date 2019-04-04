class Entry < ActiveRecord::Base
  belongs_to :user

  has_many :moods_entries
  has_many :moods, through: :moods_entries

  has_many :activities_entries
  has_many :activities, through: :activities_entries
end
