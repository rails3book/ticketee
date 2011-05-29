require "spec_helper"

describe "Project API errors", :type => :api do
  context "standard users" do 
    let(:user) { create_user! }

    it "cannot create projects" do
      post "/api/v1/projects.json", 
        :token => user.authentication_token,
        :project => {
          :name => "Ticketee"
        }
      error = { :error => "You must be an admin to do that." }
      last_response.body.should eql(error.to_json)
      last_response.status.should eql(401)
      Project.find_by_name("Ticketee").should be_nil
    end
    
    it "cannot view projects they do not have access to" do
      project = Factory(:project)

      get "/api/v1/projects/#{project.id}.json", 
        :token => user.authentication_token
      error = { :error => "The project you were looking for" +
                          " could not be found." }
      last_response.status.should eql(404)
      last_response.body.should eql(error.to_json)
    end
  end
end