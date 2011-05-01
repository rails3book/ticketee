class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
