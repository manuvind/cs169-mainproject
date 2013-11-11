class Shift < ActiveRecord::Base
  belongs_to :event
  attr_accessible :description, :end, :event_id, :start, :title
end
