class Volunteer < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :temp
  has_many :shifts
end
