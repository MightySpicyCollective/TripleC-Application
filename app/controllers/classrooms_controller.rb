class ClassroomsController < ApplicationController
  before_action :load_classroom, only: :show

  def index
    @classrooms = Classroom.all
  end

  def show
    @class_users = @classroom.users.students
  end

  private

  def load_classroom
    @classroom = Classroom.find(params[:id])
  end
end
