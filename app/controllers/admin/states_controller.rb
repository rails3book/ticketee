class Admin::StatesController < Admin::BaseController

  def index
    @states = State.all
  end
  
  def new
    @state = State.new
  end
end