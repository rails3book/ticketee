Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the backend
  
  Background:
   Given there are the following users:
     | email              | password | admin | 
     | admin@ticketee.com | password | true  |
    And I am signed in as them
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"
    When I follow "New User"
  
  Scenario: Creating a new user
    And I fill in "Email" with "newbie@ticketee.com" 
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has been created."
  
 Scenario: Leaving email blank results in an error
   When I fill in "Email" with ""
   And I fill in "Password" with "password"
   And I press "Create User"
   Then I should see "User has not been created."
   And I should see "Email can't be blank"
   
 Scenario: Creating an admin user
   When I fill in "Email" with "newadmin@ticketee.com"
   And I fill in "Password" with "password"
   And I check "Is an admin?"
   And I press "Create User"
   Then I should see "User has been created"
   And I should see "newadmin@ticketee.com (Admin)"