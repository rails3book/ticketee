require "spec_helper"

describe "/api/v2/projects", :type => :api do
  let(:user) {  create_user! }
  let(:token) { user.authentication_token }
  
  before do
    @project = Factory(:project)
    user.permissions.create!(:action => "view", :thing => @project)
  end

  context "projects viewable by this user" do
    before do
      Factory(:project, :name => "Access denied.")
    end

    let(:url) { "/api/v2/projects" }
    let(:options) { { :except => :name, :methods => :title } }

    it "JSON" do
      get "#{url}.json", :token => token

      body = Project.readable_by(user).to_json(options)

      last_response.body.should eql(body)
      last_response.status.should eql(200)

      projects = JSON.parse(last_response.body)
      projects.any? do |p|
        p["project"]["title"] == "Ticketee"
      end.should be_true

      projects.all? do |p|
        p["project"]["name"].blank? 
      end.should be_true
    end
    
    it "XML" do
      get "#{url}.xml", :token => token

      body = Project.readable_by(user).to_xml(options)
      last_response.body.should eql(body)
      projects = Nokogiri::XML(last_response.body)
      projects.css("project title").text.should eql("Ticketee")
      projects.css("project name").text.should eql("")
    end
  end
  
  context "creating a project" do
    before do
      user.admin = true
      user.save
    end

    let(:url) { "/api/v1/projects" }

    it "sucessful JSON" do
      post "#{url}.json", :token => token,
                          :project => {
                            :name => "Inspector"
                          }

      project = Project.find_by_name("Inspector")
      route = "/api/v1/projects/#{project.id}"

      last_response.status.should eql(201)
      last_response.headers["Location"].should eql(route)
      
      last_response.body.should eql(project.to_json)
    end
    
    it "unsuccessful JSON" do
      post "#{url}.json", :token => token,
                          :project => {}
      last_response.status.should eql(422)
      errors = {"name" => ["can't be blank"]}.to_json
      last_response.body.should eql(errors)
    end
  end
  
  context "show" do
    let(:url) { "/api/v1/projects/#{@project.id}"}

    before do
      Factory(:ticket, :project => @project)
    end

    it "JSON" do
      get "#{url}.json", :token => token
      project = @project.to_json(:methods => "last_ticket")
      last_response.body.should eql(project)
      last_response.status.should eql(200)

      project_response = JSON.parse(last_response.body)["project"]

      ticket_title = project_response["last_ticket"]["ticket"]["title"]
      ticket_title.should_not be_blank
    end
  end
  
  context "updating a project" do
    before do
      user.admin = true
      user.save
    end

    let(:url) { "/api/v1/projects/#{@project.id}" }
    it "successful JSON" do
      @project.name.should eql("Ticketee")
      put "#{url}.json", :token => token,
                          :project => { 
                            :name => "Not Ticketee"
                          }
      last_response.status.should eql(200)

      @project.reload
      @project.name.should eql("Not Ticketee")
      last_response.body.should eql("{}")
    end
    
    it "unsuccessful JSON" do
      @project.name.should eql("Ticketee")
      put "#{url}.json", :token => token,
                          :project => { 
                            :name => ""
                          }
      last_response.status.should eql(422)

      @project.reload
      @project.name.should eql("Ticketee")
      errors = { :name => ["can't be blank"]}
      last_response.body.should eql(errors.to_json)
    end
  end
  
  context "deleting a project" do
    before do
      user.admin = true
      user.save
    end

    let(:url) { "/api/v1/projects/#{@project.id}" }
    it "JSON" do
      delete "#{url}.json", :token => token
      last_response.status.should eql(200)
    end
  end
end