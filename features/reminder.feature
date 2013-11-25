Feature: Remind a volunteer about a shift
  As the system
  So that I can automatically receive a reminder about an upcoming shift that the coordinator also receives
  I want to receive an automated email or text a few hours or a day before my shift.

Background:
  Given I am on the login page
  And I log in

  And the following events exist:
  | id | title         | description   | time                  |
  | 1  | Ecclesiastes  | Old Testament | 25-Nov-1992 00:00:01  |

  And the following volunteers exist:
  | id | email       | name | phone        |
  | 1  | bob@bob.com | bob  | 408-455-0078 |

  And the following shifts exist:
  | id | title                             | description   | start   | end     | volunteer_id | event_id | reminder |
  | 1  | Vanity of vanities, all is vanity | 1-2           | 05:30PM | 11:30PM | 1            | 1        | 05:30PM  |

Scenario: send a shift reminder
  When it is 6 hours from the shift time
  Then the volunteer has been sent a reminder