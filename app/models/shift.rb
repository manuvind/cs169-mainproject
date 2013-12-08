class Shift < ActiveRecord::Base
  belongs_to :rotation
  belongs_to :volunteer

  attr_accessible :description, :end, :event_id, :start, :title, :volunteer_id, :email, :reminder
  validates_presence_of :description, :title

  def self.delay_notify(shift)
  	scheduler = Rufus::Scheduler.new
    seconds_to_shift = shift.start - shift.reminder
    scheduler.in (seconds_to_shift.to_s) do
    	ShiftNotifier.shift_notify(shift).deliver
    end
    scheduler.join
  end

end
