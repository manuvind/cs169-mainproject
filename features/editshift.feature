Feature: Edit a shift

  As an event coordinator
  So that I can assign people to do tasks at an event
  I want to add a shift to an event

Background: 
  Given I am on the login page
  And I log in
  And I am on the events page

  And the following events exist:
  | id | title        | description          | time                  |
  | 1  | World Peace  | An event to end war  | 25-Nov-1992 00:00:01  |

  And the following volunteers exist:
  | id | email       | name | phone        |
  | 1  | goo@goo.com | goo  | 409-456-0079 |
  | 2  | poo@poo.com | poo  | 410-457-0080 |

  And the following shifts exist:
  | id | title  | description | start   | end     | volunteer_id | event_id |
  | 1  | title  | description | 06:30PM | 07:00PM | 1            | 1        |

  And I am on the shifts page for "World Peace"

Scenario: edit a shift title
  When I follow "Edit."
  When I fill in "shift_title" with "Eating vegetables"
  And I press "Update Shift"
  Then I should be on the shifts page for "World Peace"
  And I should see "Eating vegetables"

Scenario: edit a shift description
  When I follow "Edit."
  And I fill in "shift_description" with "Being a vegetarian"
  And I press "Update Shift"
  Then I should be on the shifts page for "World Peace"
  And I should see "Being a vegetarian"

Scenario: edit a shift volunteer to an existing volunteer
  When I follow "Edit."
  Then I should see "goo"
  When I select "poo" from "shift_volunteers"
  And I press "Update Shift"
  Then I should be on the shifts page for "World Peace"
  And I should see "poo"

Scenario: edit a shift volunteer to a new volunteer
  When I follow "Edit."
  And I select "poo" from "shift_volunteers"
  And I fill in "shift_volunteer_name" with "bob"
  And I fill in "shift_volunteer_email" with "bob@bob.com"
  And I fill in "shift_volunteer_phone" with "408-455-0078"
  And I press "Update Shift"
  Then I should be on the shifts page for "World Peace"
  And I should see "bob"
