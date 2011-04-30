Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title           | description                   |
      |  Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"

  Scenario: Deleting a ticket
    When I follow "Delete"
    Then I should see "Ticket has been deleted."
    And I should be on the project page for "TextMate 2"