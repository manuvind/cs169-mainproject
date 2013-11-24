class ShiftNotifier < ActionMailer::Base
  default from: "volunteer-scheduler@heroku.com"

  def shift_notify(volunteer, shift)
  	@volunteer = volunteer
  	@shift = shift
  	mail(:to => "#{@volunteer.name} <manuvind@gmail.com>", :subject => "Reminder for #{@shift.title}")
  end
end
