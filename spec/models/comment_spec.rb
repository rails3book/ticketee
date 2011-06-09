require 'spec_helper'

describe Comment do
  let(:user) { Factory(:user) }
  
  before do
    @ticket = Factory(:ticket)
    @ticket.watchers << user
  end

  it "notifies people through a delayed job" do
    Delayed::Job.count.should eql(0)
    ticket.comments.create!(:text => "This is a comment",
                            :user => ticket.user)
    Delayed::Job.count.should eql(1)

    Delayed::Worker.new.work_off!
    Delayed::Job.count.should eql(0)

    email = ActionMailer::Base.deliveries.last
    email.to.should eql(user.email)
  end
end