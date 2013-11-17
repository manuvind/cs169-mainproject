Feature: Create a shift

  As an event coordinator
  So that I can assign people to do tasks at an event
  I want to add a shift to an event

Background: 
  Given I am on the login page
  And I log in
  And I am on the events page

Scenario: create an shift after creating an event
  When I follow "New Event"
  Then I should be on the event creation page
  When I fill in "event_title" with "Pick up trash"
  And I fill in "event_description" with "on Shattuck"
  And I press "Create Event"
  Then I should be on the shifts page for Pick up trash
  When I follow "New Shift"
  Then I should be on the new shift page for Pick up trash
  When I fill in "shift_title" with "Destroying weapons"
  And I fill in "shift_description" with "Volunteer will destroy all the world's weapons"
  And I press "Create Shift"
  Then I should be on the shifts page for Pick up trash
  And I should see "Destroying weapons"
  And I should see "Volunteer will destroy all the world's weapons"

Scenario: create a shift from the events page
  When I follow "New Event"
  Then I should be on the event creation page
  When I fill in "event_title" with "Pick up trash"
  And I fill in "event_description" with "on Shattuck"
  And I press "Create Event"
  Then I should be on the shifts page for Pick up trash
  When I go to the events page
  And I follow "Pick up trash"
  Then I should be on the shifts page for Pick up trash
  When I follow "New Shift"
  Then I should be on the new shift page for Pick up trash
  When I fill in "shift_title" with "Destroying weapons"
  And I fill in "shift_description" with "Volunteer will destroy all the world's weapons"
  And I press "Create Shift"
  Then I should be on the shifts page for Pick up trash
  And I should see "Destroying weapons"
  And I should see "Volunteer will destroy all the world's weapons"
