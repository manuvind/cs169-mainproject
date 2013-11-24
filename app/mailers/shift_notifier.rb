class ShiftNotifier < ActionMailer::Base
  default from: "from@example.com"

  def shift_notify(volunteer, shift)
  	@volunteer = volunteer
  	@shift = shift
  	mail(:to => "#{@volunteer.name} <#{@volunteer.email}>", :subject => "Reminder for #{@shift.title}")
  end
end
