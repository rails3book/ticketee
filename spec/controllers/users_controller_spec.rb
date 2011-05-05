require 'spec_helper'

describe UsersController do

  describe "GET 'confirmation'" do
    it "should be successful" do
      get 'confirmation'
      response.should be_success
    end
  end

end
