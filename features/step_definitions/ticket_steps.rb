Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    attributes.merge!(:user => User.find_by_email!(email))
    ticket = @project.tickets.create!(attributes)
    ticket.tag!(tags) if tags
  end
end