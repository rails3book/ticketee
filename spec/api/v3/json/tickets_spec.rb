require 'spec_helper'

describe Api::V3::JSON::Tickets, :type => :api do
  let(:project) { Factory(:project) }
  let(:user) { Factory(:user) }
  let(:token) { user.authentication_token }

  before do
    Factory(:ticket, :project => project)
    user.permissions.create!(:thing => project, :action => "view")
  end

  let(:url) { "/api/v3/json/projects/#{project.id}/tickets" }

  context "successful requests" do

    it "can get a list of tickets" do
      get url, :token => token 
      last_response.body.should eql(project.tickets.to_json)
    end
  end
  
  context "unsuccessful requests" do
    it "doesn't pass through a token" do
      get url
      last_response.status.should eql(401)
      last_response.body.should eql("Token is invalid.")
    end

    it "cannot access a project that they don't have permission to" do
      user.permissions.delete_all
      get url, :token => token
      last_response.status.should eql(404)
    end
  end
end