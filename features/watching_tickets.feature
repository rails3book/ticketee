Feature: Watching tickets
  In order to keep up to date with tickets
  As a user
  I want to choose to subscribe to their updates

Background:
  Given there are the following users:
    | email             | password |
    | user@ticketee.com | password |
  Given there is a project called "TextMate 2"
  And "user@ticketee.com" can view the "TextMate 2" project
  And "user@ticketee.com" has created a ticket for this project:
    | title        | description       |
    | Release date | TBA very shortly. |

  Given I am signed in as "user@ticketee.com"
  Given I am on the homepage
  
  Scenario: Ticket watch toggling
    When I follow "TextMate 2"
    And I follow "Release date"
    Then I should see "user@ticketee.com" within "#watchers"
    And I press "Stop watching this ticket"
    Then I should see "You are no longer watching this ticket"
    And I should not see "user@ticketee.com" within "#watchers"
    When I press "Watch this ticket"
    Then I should see "You are now watching this ticket"
    And I should see "user@ticketee.com" within "#watchers"