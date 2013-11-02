class Event < ActiveRecord::Base
	has_many :shift
	attr_accessible :description, :time, :title
end
