class ActivitiesEntry < ActiveRecord::Base
  belongs_to :activity
  belongs_to :entry
end
