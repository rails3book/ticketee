Feature: Paginating tickets
In order to ease the load on the server
As the system
I want paginate ticket results

Background:
  Given there is a project called "Internet Explorer"
  Given there are the following users:
    | email             | password |
    | user@ticketee.com | password |
  And "user@ticketee.com" can view the "Internet Explorer" project
  And I am signed in as them
  And there are 100 tickets for this project

  When I am on the homepage
  And I follow "Internet Explorer"

Scenario: Viewing the second page
 Then I should see 2 pages of pagination
 When I follow "Next" within ".pagination .next"
 Then I see page 2 of tickets for this project