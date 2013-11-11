class ShiftNotifier < ActionMailer::Base
  default from: "from@example.com"

  def shift_notify(user, shift)
  	@user = user
  	@shift = shift
  	mail(:to => "Fellow Volunteer Creator <#{user.email}>", :subject => "#{shift.title} created")
  end
end
