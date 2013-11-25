class Shift < ActiveRecord::Base
  belongs_to :event
  belongs_to :volunteer
  attr_accessible :description, :end, :event_id, :start, :title, :volunteer_id, :reminder

  def self.delay_notify(shift)
    seconds_to_shift = shift.start - shift.reminder
    debugger
    ShiftNotifier.delay(run_at: seconds_to_shift.seconds.from_now).shift_notify(shift)
  end
end
