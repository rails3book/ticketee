class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_states
  
  private 

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
  def find_states
    @states = State.all
  end
end
