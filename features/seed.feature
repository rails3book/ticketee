Feature: Seed Data
  In order to fill the database with the basics
  As the system
  I want to run the seed task

  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    When I follow "Ticketee Beta"
    And I follow "New Ticket"
    And I fill in "Title" with "Comments with state"
    And I fill in "Description" with "Comments always have a state."
    And I press "Create Ticket"
    Then I should see "New" within "#comment_state_id"
    And I should see "Open" within "#comment_state_id"
    And I should see "Closed" within "#comment_state_id"