class RegistrationsController < Devise::RegistrationsController
  self.scoped_views = false
  
  def new
    super
  end

  protected
    
  def after_inactive_sign_up_path_for(resource)
    confirm_user_path
  end
end