class ShiftNotifier < ActionMailer::Base
  default from: "app19355191@heroku.com"

  def shift_notify(shift)
  	@shift = shift
  	@volunteer = shift.volunteer
  	mail(:to => "#{@volunteer.name} <#{@volunteer.email}>", :subject => "Reminder for #{@shift.title}")
  end
end
