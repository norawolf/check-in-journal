class Entry < ActiveRecord::Base
  belongs_to :user

  has_many :moods_entries
  has_many :moods, through: :moods_entries

  has_many :activities_entries
  has_many :activities, through: :activities_entries

  def check_collection_for_empty_string_and_create_objects(moods, activities)
    moods.each do |mood|
      if !mood.empty?
        self.moods << Mood.find_or_create_by(name: mood)
      end
    end
    activities.each do |activity|
      if !activity.empty?
        self.activities << Activity.find_or_create_by(name: activity)
      end
    end
  end

end
