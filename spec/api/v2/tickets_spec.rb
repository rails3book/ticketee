require 'spec_helper'

describe "/api/v2/tickets", :type => :api do
  let(:project) { Factory(:project, :name => "Ticketee") }

  before do
    @user = create_user!
    @user.update_attribute(:admin, true)
    @user.permissions.create!(:action => "view", 
                              :thing => project)
  end

  let(:token) { @user.authentication_token }
  
  context "index" do
    before do
      5.times do
        Factory(:ticket, :project => project, :user => @user)
      end
    end
    
    let(:url) { "/api/v2/projects/#{project.id}/tickets" }

    it "XML" do
      get "#{url}.xml", :token => token
      last_response.body.should eql(project.tickets.to_xml)
    end

    it "JSON" do
      get "#{url}.json", :token => token
      last_response.body.should eql(project.tickets.to_json)
    end
  end
  
  context "pagination" do
    before do
      100.times do
        Factory(:ticket, :project => project, :user => @user) 
      end
    end

    it "gets the first page" do
      get "/api/v2/projects/#{project.id}/tickets.json", 
        :token => token,
        :page => 1

      last_response.body.should eql(project.tickets.page(1).per(50).to_json)
    end

    it "gets the second page" do
      get "/api/v2/projects/#{project.id}/tickets.json?page=2",
        :token => token,
        :page => 2

      last_response.body.should eql(project.tickets.page(2).per(50).to_json)
    end
  end
end