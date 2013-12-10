Feature: Create a new user

  As a site administrator
  So that I can allow another event coordinator to use the site
  I want to create a new user account.

Background: 
  Given I am on the login page
  And I admin log in

Scenario: create a user
  When I follow "Users"
  Then I should be on the users page
  When I follow "New"
  Then I should be on the new user page
  When I fill in "user_name" with "Joe Shmoe"
  And I fill in "user_email" with "joe@shmoe.edu"
  And I fill in "user_password" with "12341234"
  And I fill in "user_password_confirmation" with "12341234"
  And I press "Create"
  Then I should be on the users page
  And I should see "Joe Shmoe"

Scenario: create user sad path
  When I follow "Users"
  Then I should be on the users page
  When I follow "New"
  Then I should be on the new user page
  When I fill in "user_name" with "Joe Shmoe"
  And I press "Create"
  Then I should be on the new user page
  And I should see "Uh-oh. Something went wrong. Please try again."