Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = Factory(:project, :name => name)
end