class Rotation < ActiveRecord::Base
  has_many :shifts, dependent: :destroy
  belongs_to :event
  attr_accessible :number, :event
end
