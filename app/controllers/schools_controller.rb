class SchoolsController < ApplicationController
  before_action :load_school

  def show
    @school_classrooms = @school.classrooms
    @school_projects   = @school.projects
  end

  private

  def load_school
    @school = School.find(params[:id])
  end
end
