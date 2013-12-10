Feature: Edit the text for shift reminder emails

  As an event coordinator
  So that I tailor reminder emails according to shift
  I should be able to edit the shift reminder email text

Background: 
  Given the following events exist:
  | id | title        | description          | time                  | active |
  | 1  | World Peace  | An event to end war  | 25-Nov-1992 00:00:01  | true   |

  And the following volunteers exist:
  | id | email       | name | phone        |
  | 1  | bob@bob.com | bob  | 408-455-0078 |

  And the following shifts exist:
  | id | title  | description | start   | end     | volunteer_id | event_id |
  | 1  | title  | description | 06:30PM | 07:00PM | 1            | 1        |

  Given I am on the login page
  And I log in
  And I am on the shifts page for "World Peace"

Scenario: Make changes to generic email
  When I follow "Edit."
  Then I should be on the edit shift page for "title" of the event "World Peace"
  And I should see "Email"
  When I fill in "shift_email" with "Don't forget to come"
  And I press "Update Shift"
  Then I should be on the shifts page for World Peace
  When I follow "Edit."
  Then I should see "Don't forget to come"
