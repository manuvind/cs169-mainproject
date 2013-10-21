Feature: Create an event
  As an event coordinator
  So that I can organize a volunteer event
  I want to add an event to the database that tracks volunteers and their shifts.

Background: 
  Given I am on the event creation page

Scenario: create an event
  When I follow "Create Event"
  Then I should see the event creation pop-up
  When I complete the event creation form
  Then a new event is created
  And I am on the event page


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


Feature: Remind a volunteer about a shift
  As the system
  So that I can automatically receive a reminder about an upcoming shift that the coordinator also receives
  I want to receive an automated email or text a few hours or a day before my shift.

Background:
  Given a volunteer is signed up for a shift
  And the shift is 6 hours from now

Scenario: send a shift reminder
  When it is 6 hours from the shift time
  Then the volunteer has been sent a reminder
