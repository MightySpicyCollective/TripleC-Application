class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_project, only: [:edit, :update, :destroy, :history]

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
    @versions = @project.versions
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end

  def load_project
    @project = Project.find_by(id: params[:id])
    unless @project
      redirect_to dashboard_path, alert: 'Project not found.'
    end
  end
end
