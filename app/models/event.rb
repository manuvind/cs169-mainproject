class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title
end
