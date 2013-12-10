class ShiftNotifier < ActionMailer::Base
  default from: "app19355191@heroku.com"

  def shift_notify(shift)
  	@shift = shift
  	@volunteer = shift.volunteer
    debugger
  	mail(:to => "#{@volunteer.name} <#{@volunteer.email}>", :subject => "Reminder for #{@shift.title}")
  end

  def coordinator_notify(user, shift, available)
  	@shift = shift
  	@coordinator = user
  	@volunteer = @shift.volunteer
    @available = available
    @time = @shift.start
  	mail(:to => "#{@coordinator.name} <#{@coordinator.email}", :subject => "Reminder about #{@volunteer.name} and #{@shift.title}")
  end
end
