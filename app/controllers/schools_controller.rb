class SchoolsController < ApplicationController
  before_action :load_school

  def show
  end

  private
  def load_school
    @school = School.find(params[:id])
  end
end
