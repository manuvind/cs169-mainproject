class Event < ActiveRecord::Base
	has_many :shifts, dependent: :destroy
	attr_accessible :description, :time, :title
	validates_presence_of :description, :title
end
