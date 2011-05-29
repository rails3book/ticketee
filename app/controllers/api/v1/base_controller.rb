class Api::V1::BaseController < ActionController::Base
  respond_to :json, :xml
  
  before_filter :authenticate_user

  private
    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])
      unless @current_user
        respond_with({:error => "Token is invalid." })
      end
    end
    
    def authorize_admin!
      if !@current_user.admin?
        if !@current_user.admin?
          error = { :error => "You must be an admin to do that." }
          # warden.custom_failure!
          render params[:format].to_sym => error, :status => 401
        end
      end
    end

    def current_user
      @current_user
    end
end