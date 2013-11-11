Feature: Create a shift

  As an event coordinator
  So that I can assign people to do tasks at an event
  I want to add a shift to an event

Background: 
  Given the following events exist:
  | title        | description          | time                  |
  | World Peace  | An event to end war  | 25-Nov-1992 00:00:01  |
  and I am on the events page

Scenario: create an event
  When I follow "Show"
  Then I should be on the World Peace event page
  When I fill in "shift[title]" with "Destroying weapons"
  And I fill in "shift[description]" with "Volunteer will destroy all the world's weapons"
  And I follow "Create Shift"
  Then I should be on the World Peace event page
  And I should see "Destroying weapons"
  And I should see "Volunteer will destroy all the world's weapons"

Scenario: creating an event with an incomplete form
  When I follow "Show"
  Then I should be on the World Peace event page
  When I fill in "shift[title]" with "Failed Shift"
  And I follow "Create Shift"
  Then I should see "Please enter a description and a title"
