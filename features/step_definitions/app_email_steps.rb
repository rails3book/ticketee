Then /^the email should contain (\d+) parts$/ do |num|
  current_email.parts.size.should eql(num.to_i)
end

Then /^there should be a part with content type "([^"]*)"$/ do |content_type|
  current_email.parts.detect do |p|
    p.content_type.include?(content_type)
  end.should_not be_nil
end

Given /^Action Mailer delivers via SMTP$/ do
  ActionMailer::Base.delivery_method = :smtp
end

When /^I log into gmail with:$/ do |table|
  details = table.hashes.first
  @gmail = Gmail.connect(details["username"], details["password"])
end

Then /^there should be an email from Ticketee in my inbox$/ do
@mails = @gmail.inbox.find(:unread, 
            :from => "ticketee@gmail.com") do |mail|
    if mail.message.subject =~ /^\[ticketee\]/
      mail.delete!
      @received_mail = true
    end
  end
  @received_mail.should be_true
end