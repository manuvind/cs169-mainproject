Given /I log in/ do
  User.create!(:name => 'Satan', :email => 'bob@bob.com', :password => 'password', :password_confirmation => 'password')
  fill_in('user[email]', :with => 'bob@bob.com')
  fill_in('user[password]', :with => 'password')
  click_button('Log in')
end

Given /I admin log in/ do
  User.create!(:name => 'Satan', :email => 'bob@bob.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
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

Then /I should see the following in order: (.*)/ do |e|
  elements = e.split(/, /)
  order = '(.*)'
  elements.each do |element|
  	order += '+' + element + '+(.*)'
  end
  html_page = page.body
  pattern = Regexp.new(order, Regexp::MULTILINE)
end