class Shift < ActiveRecord::Base
	belongs_to :event
  	attr_accessible :description, :end, :start, :title
end
