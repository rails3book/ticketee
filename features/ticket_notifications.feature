Feature: Ticket Notifications
  Background:
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
      | bob@ticketee.com   | password |
    
    Given a clear email queue
    
    Given there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "bob@ticketee.com" can view the "TextMate 2" project
    And "alice@ticketee.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very shortly. |
    
    Given I am signed in as "bob@ticketee.com"
    Given I am on the homepage
    
  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"
  
    Then "alice@ticketee.com" should receive an email
    When "alice@ticketee.com" opens the email
    Then they should see "updated the Release date ticket" in the email body
    And they should see "[ticketee] TextMate 2 - Release date" in the email subject
    Then they click the first link in the email
    Then I should see "Release date" within "#ticket h2"