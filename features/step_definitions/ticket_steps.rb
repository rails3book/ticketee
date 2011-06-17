Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    ticket = @project.tickets.create!(
      attributes.merge!(:user => 
                          User.find_by_email!(email)))
    ticket.state = State.find_or_create_by_name(state) if state
    ticket.tag!(tags) if tags
    ticket.save
  end
end

Given /^there are (\d+) tickets for this project$/ do |number|
  number.to_i.times do |i|
    @project.tickets.create!(:title => "Test",
                             :description => "Placeholder ticket.",
                             :user => @user)
  end
end