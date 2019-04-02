class Activity < ActiveRecord::Base
  has_many :activities_entries
  has_many :entries, through: :activities_entries

  validates :name, presence: true
end
