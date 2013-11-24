class Shift < ActiveRecord::Base
  belongs_to :event
  belongs_to :volunteer
  attr_accessible :description, :end, :event_id, :start, :title, :volunteer_id, :email
end
