Given /I log in/ do
  User.create!(:email => 'bob@bob.com', :password => 'password', :password_confirmation => 'password')
  fill_in('user[email]', :with => 'bob@bob.com')
  fill_in('user[password]', :with => 'password')
  click_button('Log in')
end

When /it is 6 hours from the shift time/ do
  shift_time = Shift.find_by_id(1).start
  reminder_time = DateTime.new shift_time.year, shift_time.month, shift_time.day, shift_time.hour - 6
end

When /I complete the event creation form/ do
	fill_in('event[title]', :with => 'Hello World')
	fill_in('event[description]', :with => 'Saying hello to the world')
end