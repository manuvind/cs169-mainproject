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

