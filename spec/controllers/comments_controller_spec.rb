require 'spec_helper'

describe CommentsController do

  let(:project) { Project.create!(:name => "Ticketee") }

  let(:ticket) do
    project.tickets.create(:title => "State transitions",
                           :description => "Can't be hacked.")
  end

  let(:state) { State.create!(:name => "New") }
  let(:user) { create_user! }
  
  context "a user without permission to set state" do
    before do
      sign_in(:user, user)
    end

   it "cannot transition a state by passing through state_id" do
      post :create, { :comment => { :text => "Hacked!",
                                  :state_id => state.id },
                      :ticket_id => ticket.id }
      ticket.reload
      ticket.state.should eql(nil)
    end
  end

end
