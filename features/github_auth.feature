Feature: GitHub auth
  In order to sign in using GitHub
  As a GitHub user
  I want to click an icon and be signed in

  Background:
    Given I have mocked a successful GitHub response

  Scenario: Signing in with GitHub
    Given I am on the homepage
    And I follow "sign_in_with_github"
    Then I should see "Signed in with Github successfully."
    Then I should see "Signed in as A GitHubber"