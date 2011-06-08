Given /^we are mocking a successful Twitter response$/ do
  OmniAuth.config.mock_auth[:twitter] = {
    "extra" => {
      "user_hash" => {
        "id" => '12345',
        "screen_name" => 'twit',
        "display_name" => "A Twit"
      }
    }
  }
end

Given /^I have mocked a successful GitHub response$/ do
  OmniAuth.config.mock_auth[:github] = {
    "extra" => {
      "user_hash" => {
        "id" => '12345',
        "email" => 'githubber@example.com',
        "login" => "githubber",
        "name" => "A GitHubber"
      }
    }
  }
end