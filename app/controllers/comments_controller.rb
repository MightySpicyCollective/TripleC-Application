class CommentsController < ApplicationController
  before_action :authenticate_user!, :load_project, :ensure_approved

  def new
    @comment = current_user.comments.build(project_id: @project.id)
  end

  def create
    @comment = current_user.comments.build(comment_params.merge(project_id: @project.id))
    if @comment.save
      redirect_to view_project_path(@project), notice: 'Successfully created comment.'
    else
      render :new
    end
  end

  private

  def load_project
    @project = Project.find_by(id: params[:project_id])
    unless @project
      redirect_to dashboard_path, alert: 'Project not found.'
    end
  end

  def ensure_approved
    redirect_to(dashboard_path, alert: 'You are not approved to comment on the project.') unless current_user.approved?
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
