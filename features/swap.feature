Feature: Swap a shift
  As a volunteer
  So that I can switch shifts with another volunteer
  I want to request to switch shifts with another volunteer and receive an email confirming the change.

Background:
  Given I am signed up for a shift
  And there are other shifts

Scenario: request a swap
  When I click on another person's shift
  Then I should see the shift swap pop-up
  When I click request swap
  Then the other person should be notified of a swap request

Scenario: confirm a swap
  When I am notified of a swap request
  And I click accept
  Then my shift is swapped

Scenario: deny a swap
  When I am notified of a swap request
  And I click "No, thanks"
  Then my shift is not swapped


