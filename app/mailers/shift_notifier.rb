class ShiftNotifier < ActionMailer::Base
  default from: "app19355191@heroku.com"

  def shift_notify(volunteer, shift)
  	@volunteer = volunteer
  	@shift = shift
  	mail(:to => "#{@volunteer.name} <#{@volunteer.email}>", :subject => "Reminder for #{@shift.title}")
  end
end
