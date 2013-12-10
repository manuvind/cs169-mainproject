Feature: Order events in the list

  As a volunteer,
  In order to find my events quickly,
  I want to categorize/organize the events in the list


Background: 
  Given the following events exist:
  | title        | description | time                  | active | repeating |
  | A            | Aa          | 25-Nov-2226 00:00:01  | true   | true      |
  | B            | Bb          | 25-Nov-2225 00:00:01  | true   | false     |
  | C            | Cc          | 25-Nov-2224 00:00:01  | true   | true      |
  | D            | Dd          | 25-Nov-2223 00:00:01  | true   | true      |
  | E            | Ee          | 25-Nov-2222 00:00:01  | true   | false     |

  Given I am on the login page
  And I log in
  And I am on the events page


Scenario: Order by title
  When I select "Name" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: A, B, C, D, E

Scenario: Order by title, then by date
  When I select "Name" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: A, B, C, D, E
  When I select "Date" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: E, D, C, B, A

Scenario: Order by date
  When I select "Date" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: E, D, C, B, A

Scenario: Order by date, then by title
  When I select "Date" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: E, D, C, B, A
  When I select "Name" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: A, B, C, D, E

Scenario: Filter by recurring events
  When I select "Recurring" from "events_filter"
  And I press "Refresh"
  Then I should see "A"
  And I should not see "B"
  And I should see "C"
  And I should see "D"
  And I should see "E"

Scenario: Filter by recurring event and sort by name
  When I select "Recurring" from "events_filter"
  And I select "Name" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: A, C, D
  And I should not see "B"
  And I should see "E"

Scenario: Filter by recurring event and sort by date
  When I select "Recurring" from "events_filter"
  And I select "Date" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: D, C, A
  And I should not see "B"
  And I should see "E"

Scenario: Filter by one-time events
  When I select "One-Time" from "events_filter"
  And I press "Refresh"
  Then I should not see "C"
  And I should see "D"
  And I should see "E"
  And I should not see "A"
  And I should see "B"

Scenario: Filter by one-time event and sort by name
  When I select "One-Time" from "events_filter"
  And I select "Name" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: B, E
  And I should not see "A"
  And I should see "B"
  And I should not see "C"

Scenario: Filter by one-time event and sort by date
  When I select "One-Time" from "events_filter"
  And I select "Date" from "events_sort"
  And I press "Refresh"
  Then I should see the following in order: B, E
  And I should not see "A"
  And I should see "B"
  And I should not see "C"