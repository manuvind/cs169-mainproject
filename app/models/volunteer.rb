class Volunteer < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  has_many :shifts
end
