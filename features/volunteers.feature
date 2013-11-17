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
  And I fill in "volunteer_email" with "Smith"
  And I press "Save"
  Then I should be on the show volunteer page for Bob
  When I follow "Edit"
  Then I should be on the edit volunteer page for Bob
  When I press "Save"
  And I follow "Back"
  Then I should be on the volunteers page
  When I follow "Destroy"
  Then I should not see "Bob"