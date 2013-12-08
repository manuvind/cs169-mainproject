class Event < ActiveRecord::Base
	has_many :shifts, dependent: :destroy
	attr_accessible :description, :time, :title, :active
	validates_presence_of :description, :title
	validates_inclusion_of :active, :in => [true, false]

	def self.updateActive()
		maybe_active_events = find_all_by_active(true)
		maybe_active_events.each do |event|
			if event.time + 90000 < Time.now # add 90000 seconds (24 hours) to make sure event active all day
				event.active = false
				if not event.save
					return false
				end
				return true
			end
		end
	end
end
