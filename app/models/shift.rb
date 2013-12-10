class Shift < ActiveRecord::Base
  belongs_to :rotation
  belongs_to :volunteer

  attr_accessible :description, :end, :rotation_id, :start, :title, :volunteer_id, :email, :reminder, :event_id, :created_at, :updated_at
  validates_presence_of :title

  def self.delay_notify(shift)
    seconds_to_shift = shift.start - shift.reminder
    ShiftNotifier.delay(run_at: seconds_to_shift.seconds.from_now).shift_notify(shift)
  end

end
