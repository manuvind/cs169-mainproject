Feature: Create an event

  As an event coordinator
  So that I can organize a volunteer event
  I want to add an event to the database that tracks volunteers and their shifts.

Background: 
  Given I am on the login page
  And I log in
  And I am on the event creation page

Scenario: create an event
  Then I should see "New event"
  When I complete the event creation form
  When I press "create_event"
  Then I should see "Hello World"