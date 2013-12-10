Feature: CRUD volunteers

  As an event coordinator
  So that I can keep track of my volunteers
  I want to manage a database full of their contact info.

Background: 
  Given I am on the login page
  And I log in
  And I am on the volunteers page

Scenario: create an event
  When I follow "New Volunteer"
  Then I should be on the new volunteer page
  When I fill in "volunteer_name" with "Bob"
  And I fill in "volunteer_email" with "bob@gmail.com"
  And I fill in "volunteer_phone" with "11111111"
  And I press "Save"
  Then I should be on the volunteers page
  When I follow "Edit"
  Then I should be on the edit volunteer page for Bob
  And I fill in "volunteer_phone" with "22222222"
  When I press "Save"
  Then I should be on the volunteers page
  When I follow "Edit"
  Then I should be on the edit volunteer page for Bob
  When I follow "Cancel"
  Then I should be on the volunteers page
  When I follow "Delete"
  Then I should not see "Bob"