class Event < ActiveRecord::Base
	has_many :rotations, dependent: :destroy
	has_many :shifts, through: :rotations
	attr_accessible :description, :time, :title
	validates_presence_of :description, :title
end
