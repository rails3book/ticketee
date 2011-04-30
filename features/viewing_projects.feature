Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Scenario: Listing all projects
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    Then I should be on the project page for "TextMate 2"