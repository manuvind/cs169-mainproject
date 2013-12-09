class Event < ActiveRecord::Base
	has_many :shifts, dependent: :destroy
	has_many :reminders
	has_many :users, :through => :reminders
	attr_accessible :description, :time, :title
	validates_presence_of :description, :title
end
