Feature: Order events in the list

  As a volunteer,
  In order to find my events quickly,
  I want to categorize/organize the events in the list


Background: 
  Given the following events exist:
  | title        | description | time                  | active |
  | A            | Aa          | 25-Nov-1996 00:00:01  | true   |
  | B            | Bb          | 25-Nov-1995 00:00:01  | true   |
  | C            | Cc          | 25-Nov-1994 00:00:01  | false  |
  | D            | Dd          | 25-Nov-1993 00:00:01  | false  |
  | E            | Ee          | 25-Nov-1992 00:00:01  | false  |

  Given I am on the login page
  And I log in
  And I am on the events page


Scenario: Order by title
  When I select "Name" from "order_by"
  Then I should be on the "Order by" "name" events page
  And I should see the following in order: A, B, C, D, E

Scenario: Order by title, then by date
  When I select "Name" from "order_by"
  Then I should be on the "Order by" "name" events page
  And I should see the following in order: A, B, C, D, E
  When I select "Date" from "order_by"
  Then I should be on the "Order by" "date" events page
  And I should see the following in order: E, D, C, B, A

Scenario: Order by date
  When I select "Date" from "order_by"
  Then I should be on the "Order by" "date" events page
  And I should see the following in order: E, D, C, B, A

Scenario: Order by date, then by title
  When I select "Date" from "order_by"
  Then I should be on the "Order by" "date" events page
  And I should see the following in order: E, D, C, B, A
  When I select "Name" from "order_by"
  Then I should be on the "Order by" "name" events page
  And I should see the following in order: A, B, C, D, E

Scenario: Filter by recurring events
  When I select "Recurring Events" from "filter_by"
  Then I should be on the "Filter by" "recurrence" events page
  And I should see "A"
  And I should see "B"
  And I should not see "C"
  And I should not see "D"
  And I should not see "E"

Scenario: Filter by recurring event and sort by name
  When I select "Recurring Events" from "filter_by"
  And I select "Name" from "sort_by"
  Then I should be on the "Order by" "name" and "Filter by" "recurrence" events page
  Then I should see the following in order: A, B
  And I should not see "C"
  And I should not see "D"
  And I should not see "E"

Scenario: Filter by recurring event and sort by date
  When I select "Recurring Events" from "filter_by"
  And I select "Name" from "sort_by"
  Then I should be on the "Order by" "name" and "Filter by" "recurrence" events page
  Then I should see the following in order: B, A
  And I should not see "C"
  And I should not see "D"
  And I should not see "E"

Scenario: Filter by one-time events
  When I select "One-Time Events" from "filter_by"
  Then I should be on the "Filter by" "one_time" events page
  And I should see "C"
  And I should see "D"
  And I should see "E"
  And I should not see "A"
  And I should not see "B"

Scenario: Filter by one-time event and sort by name
  When I select "One-Time Events" from "filter_by"
  And I select "Name" from "sort_by"
  Then I should be on the "Order by" "name" and "Filter by" "one_time" events page
  Then I should see the following in order: C, D, E
  And I should not see "A"
  And I should not see "B"

Scenario: Filter by one-time event and sort by date
  When I select "One-Time Events" from "filter_by"
  And I select "Date" from "sort_by"
  Then I should be on the "Order by" "date" and "Filter by" "one_time" events page
  Then I should see the following in order: E, D, C
  And I should not see "A"
  And I should not see "B"