Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

Then /^I should not see the "([^"]*)" element$/ do |css|
  page.should_not(have_css(css), 
    "Expected to not see the #{css} element, but did.")
end