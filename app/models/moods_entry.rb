class MoodsEntry < ActiveRecord::Base
  belongs_to :mood
  belongs_to :entry
end
