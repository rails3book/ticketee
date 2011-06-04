require 'sinatra'

module Api
  module V3
    module JSON
      class Tickets < Sinatra::Base
        before do
          headers "Content-Type" => "text/json"
          find_user
          find_project
        end

        get '/' do
          @project.tickets.to_json
        end

        private
        
        def params
          hash = env["action_dispatch.request.path_parameters"].merge!(super)
          HashWithIndifferentAccess.new(hash)
        end
        
        private

          def find_user
            @user = User.find_by_authentication_token(params[:token])
            halt 401, "Token is invalid." unless @user
          end

          def find_project
            @project = Project.for(@user).find(params[:project_id])
            rescue ActiveRecord::RecordNotFound
              halt 404, "The project you were looking for could not be found."
          end
      end
    end
  end
end