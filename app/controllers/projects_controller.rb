class ProjectsController < ApplicationController
  before_filter :check_for_sign_up
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :find_project, :only => [:show,
                                         :edit,
                                         :update,
                                         :destroy]
  
   # caches_action :show, :cache_path => (proc do
   #      project_path(params[:id]) + "/#{current_user.id}/#{params[:page] || 1}"
   #    end)

  def index
    @projects = Project.for(current_user).all
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end
  
  def show
    @tickets = @project.tickets.includes(:tags).page(params[:page]).per(50)
  end
  
  def edit
  end
  
  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end
  
  private
    def find_project
      @project = Project.for(current_user).find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking" +
                      " for could not be found."
      redirect_to projects_path
    end
    
    def check_for_sign_up
      if request.referer == user_registration_url
        redirect_to confirm_user_path
      end
    end
end
