Given /I log in/ do
  User.create!(:email => 'bob@bob.com', :password => 'password', :password_confirmation => 'password')
  fill_in('user[email]', :with => 'bob@bob.com')
  fill_in('user[password]', :with => 'password')
  click_button('Log in')
end