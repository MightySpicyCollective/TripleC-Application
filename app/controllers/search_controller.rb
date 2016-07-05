class SearchController < ApplicationController
  def index
    @classrooms = Classroom.search(params[:term])
    @schools    = School.search(params[:term], with: { active: true })
    @projects   = Project.search(params[:term], with: { status: Project::STATUSES[:active] })
    @users      = User.search(params[:term], with: { approved: true })
  end

  def new
  end
end
