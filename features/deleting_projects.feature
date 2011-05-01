Feature: Deleting projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear
  
  Background:
    Given there are the following users:
       | email              | password | admin | 
       | admin@ticketee.com | password | true  |
     And I am signed in as them

  Scenario: Deleting a project
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    And I follow "Delete Project"
    Then I should see "Project has been deleted."
    Then I should not see "TextMate 2"