Feature: Create a shift

  As an event coordinator
  So that I can assign people to do tasks at an event
  I want to add a shift to an event

Background:
  Given the following volunteers exist:
  | id | email       | name | phone        | temp  |
  | 1  | goo@goo.com | goo  | 409-456-0079 | false |
  And I am on the login page
  And I log in
  And I am on the events page

Scenario: create an shift for an existing volunteer after creating an event
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
  And I select "goo" from "shift_volunteers"
  And I press "Create Shift"
  Then I should be on the shifts page for Pick up trash
  And I should see "Destroying weapons"
  And I should see "Volunteer will destroy all the world's weapons"
#  And I should see "goo"

Scenario: create an shift for a new volunteer after creating an event
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
  And I fill in "shift_volunteer_name" with "bob"
  And I fill in "shift_volunteer_email" with "bob@bob.com"
  And I fill in "shift_volunteer_phone" with "123-123-1234"
  And I press "Create Shift"
  Then I should be on the shifts page for Pick up trash
  And I should see "Destroying weapons"
  And I should see "Volunteer will destroy all the world's weapons"
  And I should see "bob"

Scenario: create a shift for an existing volunteer from the events page
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
  And I fill in "shift_volunteer_name" with "bob"
  And I fill in "shift_volunteer_email" with "bob@bob.com"
  And I fill in "shift_volunteer_phone" with "123-123-1234"
  And I press "Create Shift"
  Then I should be on the shifts page for Pick up trash
  And I should see "Destroying weapons"
  And I should see "Volunteer will destroy all the world's weapons"
 # And I should see "bob"
 
