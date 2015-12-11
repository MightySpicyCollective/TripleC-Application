class SearchController < ApplicationController
  def index
    @classrooms = Classroom.search(params[:term])
    @schools    = School.search(params[:term])
    @projects   = Project.search(params[:term])
    @users      = User.search(params[:term])
  end
end
