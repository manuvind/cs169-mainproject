class Rotation < ActiveRecord::Base
  has_many :shifts, dependent: :destroy
  belongs_to :event
  attr_accessible :description, :event_id, :time, :title, :number
end
