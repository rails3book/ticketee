Given /^"([^"]*)" can view the "([^"]*)" project$/ do |user, project|
  Permission.create(:user => User.find_by_email!(user), 
                    :thing => Project.find_by_name!(project),
                    :action => "view")
end