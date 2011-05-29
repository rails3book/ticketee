require 'spec_helper'

describe User do
  it "resets user request count" do
    user = Factory(:user)
    user.update_attribute(:request_count, 42)
    User.reset_request_count!
    user.reload
    user.request_count.should eql(0)
  end
end