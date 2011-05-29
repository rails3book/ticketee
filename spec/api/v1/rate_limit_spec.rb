require 'spec_helper'

describe "rate limiting", :type => :api do
  let(:user) { create_user! }

  it "counts the user's requests" do
    user.request_count.should eql(0)
    get '/api/v1/projects.json', :token => user.authentication_token
    user.reload
    user.request_count.should eql(1)
  end
  
  it "stops a user if they have exceeded the limit" do
    user.update_attribute(:request_count, 200)
    get '/api/v1/projects.json', :token => user.authentication_token
    error = { :error => "Rate limit exceeded." }
    last_response.status.should eql(403)
    last_response.body.should eql(error.to_json)
  end
end