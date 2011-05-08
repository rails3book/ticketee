Given /^there is a state called "([^"]*)"$/ do |name|
  State.create!(:name => name)
end