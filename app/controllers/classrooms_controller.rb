class ClassroomsController < ApplicationController
  before_action :load_classroom, only: :show

  def index
    @classrooms = Classroom.all
  end

  def show
    @class_projects             = @classroom.users.collect(&:projects).flatten.to_a
    @class_followers            = @classroom.followers
    @class_followings           = @classroom.followings
    @class_sent_invites         = @classroom.sent_invites.pending
    @classroom_recieved_invites = @classroom.recieved_invites.pending
    @class_users                = @classroom.users
  end

  private

  def load_classroom
    @classroom = Classroom.find(params[:id])
  end
end
