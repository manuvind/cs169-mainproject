Feature: Create an event

  As an event coordinator
  So that I can organize a volunteer event
  I want to add an event to the database that tracks volunteers and their shifts.

Background: 
  Given I am on the events page

Scenario: create an event
  When I follow "New Event"
  Then I should be on the event creation page
  When I fill in "event_title" with "Pick up trash"
  And I fill in "event_description" with "on Shattuck"
  And I press "Create Event"
  Then I should be on the shifts page for Pick up trash
  When I go to the events page
  Then I should see "Pick up trash"
  And I should see "on Shattuck"
  When I follow "Edit"
  Then I should be on the edit event page for Pick up trash
  When I fill in "event_title" with "Don't pick up trash"
  And I fill in "event_description" with "Not on Shattuck"
  And I press "Update Event"
  Then I should be on the events page
  Then I should see "Don't pick up trash"
  And I should see "Not on Shattuck"
