Feature: Sign up for a shift
  As a volunteer
  So that I can sign up for a shift for a specific volunteer event
  I want to assign myself to a shift in the database.

Background:
  Given I am on the event page

Scenario: sign up for a shift
  When I click on a shift
  Then I should see the shift signup pop-up
  When I click signup
  Then I am signed up
  And I am on the event page
