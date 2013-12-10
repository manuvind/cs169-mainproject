Feature: Make recurring events

  As a coordinator,
  In order to make recurring events,
  I want to set recurring days of the week and amount of repetitions for events,

Background: 

  Given I am on the login page
  And I log in
  And I am on the events page

Scenario: Create a recurring event
  When I follow "New Event"
  Then I should be on the "New Event" page
  When I fill in "Title" with "Come to church"
  And I select "2013" from "event_time_1i"
  And I select "December" from "event_time_2i"
  And I select "1" from "event_time_3i"
  And I fill in "Description" with "Come to church every Sunday"
  And I select "Weekly" from "When to repeat"
  And I fill in "Repeat Until" with "Forever"
  And I follow "Create Event"
  Then I should be on the events page
  And I should send reminders weekly for "Come to church"
