Feature: Searching
  In order to find specific tickets
  As a user
  I want to enter a search query and get results

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" can tag the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
      | title | description     | tags        | state |
      | Tag!  | Hey! You're it! | iteration_1 | Open  |
    And "user@ticketee.com" has created a ticket for this project:
      | title   | description      | tags        | state  |
      | Tagged! | Hey! I'm it now! | iteration_2 | Closed |
    Given I am on the homepage
    And I follow "Ticketee" within "#projects"

  Scenario: Finding by tag
    When I fill in "Search" with "tag:iteration_1"
    And I press "Search"
    Then I should see "Tag!"
    And I should not see "Tagged!"
    
  Scenario: Finding by state
    When I fill in "Search" with "state:Open"
    And I press "Search"
    Then I should see "Tag!"
    And I should not see "Tagged!"
    
  Scenario: Clicking a tag goes to search results
    When I follow "Tag!"
    And I follow "iteration_1"
    Then I should see "Tag!"
    And I should not see "Tagged!"