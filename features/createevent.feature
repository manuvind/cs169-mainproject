Feature: Create an event

  As an event coordinator
  So that I can organize a volunteer event
  I want to add an event to the database that tracks volunteers and their shifts.

Background: 
  Given I am on the login page
  And I log in
  And I am on the event creation page

Scenario: create an event
  When I follow "Create Event"
  Then I should see the event creation pop-up
  When I complete the event creation form
  Then a new event is created
  And I am on the event page
