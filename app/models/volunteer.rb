class Volunteer < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :temp
  has_many :shifts
  validates_presence_of :email, :name
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
end
