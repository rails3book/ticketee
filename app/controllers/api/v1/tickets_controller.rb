class Api::V1::TicketsController < Api::V1::BaseController
  before_filter :find_project
  
  def index
    respond_with(@project.tickets)
  end

  private
    def find_project
      @project = Project.for(current_user).find(params[:project_id])
      rescue ActiveRecord::RecordNotFound
        error = { :error => "The project you were looking for" +
                            " could not be found."}
        respond_with(error, :status => 404)
    end
end