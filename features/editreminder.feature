Feature: Edit the reminder email
	
	As an event coordinator
	So that I can specify a particular email to send volunteers
	I want to be able to edit the email that gets sent to volunteers

Background:
	Given I am on the login page
	And I log in
	And that I am on the "Shifts Page"

Scenario: Make changes to generic email
	When I follow 'Edit Reminder'
	Then I should see the email editing pop-up
	When I make changes to the email
	And I follow 'Save'
	Then the email for that shift is changed

Scenario: Revert changes on shift email
	When I follow 'Edit Reminder'
	Then I should see the email editing pop-up
	When I follow 'Revert Changes'
	Then the email for that shift is changed to the original
