require 'spec_helper'

describe Receiver do

  it "parses a reply from a comment update into a comment" do
    comment = Factory(:comment)
    ticket = comment.ticket

    comment_email = ActionMailer::Base.deliveries.last

    user = Factory(:user)

    mail = Mail.new(:from => user.email,
                    :subject => "Re: #{comment_email.subject}",
                    :body => %Q{This is a brand new comment
                        #{comment_email.default_part_body} <co id="ch11_923_3"/>
                   },
                    :to => comment_email.from) 


    lambda { Receiver.parse(mail) }.should(
      change(ticket.comments, :count).by(1)
    )
    
    ticket.comments.last.text.should eql("This is a brand new comment")

  end
end