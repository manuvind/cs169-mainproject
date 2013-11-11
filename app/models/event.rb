class Event < ActiveRecord::Base
	has_many :shifts, dependent: :destroy
	attr_accessible :description, :time, :title
end
