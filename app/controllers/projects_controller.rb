class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :history]
  before_action :load_project, only: [:show, :edit, :update, :destroy, :history, :share]
  before_action :ensure_approved, :ensure_non_owner, only: :share

  def index
    @projects = current_user.projects.page(params[:page]).per(10)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to dashboard_path, notice: 'Successfully created project.'
    else
      render :new
    end
  end

  def show
    @comments = @project.comments
    @versions = @project.versions
                        .reorder(created_at: :desc)
                        .limit(3)
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to dashboard_path, notice: 'Project Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to dashboard_path, notice: 'Successfully destroyed project.'
    else
      redirect_to dashboard_path, alert: 'Unable to destroy project. Please try after sometime.'
    end
  end

  def history
    @version = @project.versions
                        .reorder(created_at: :desc)
                        .page(params[:page])
                        .per(1)
  end

  def share
    @project.fork!(user_id: current_user.id)
    redirect_to dashboard_path, notice: 'Successfully Shared project!'
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status, :source_code)
  end

  def load_project
    @project = Project.find(params[:id])
  end

  def ensure_approved
    redirect_to(dashboard_path, alert: 'You are not approved to share the project.') unless current_user.approved?
  end

  def ensure_non_owner
    redirect_to(dashboard_path, alert: 'You cannot fork your own project') if @project.user_id.eql?(current_user.id)
  end
end
