class ClassroomsController < ApplicationController
  before_action :load_classroom, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_teacher, except: [:index, :show]

  def index
    @classrooms = Classroom.all
  end

  def show
    @class_users                = @classroom.users.includes(:projects)
    @class_projects             = @class_users.collect(&:projects).flatten.to_a
    @class_followers            = @classroom.followers
    @class_followings           = @classroom.followings
    @class_sent_invites         = @classroom.sent_invites.pending
    @classroom_recieved_invites = @classroom.recieved_invites.pending
  end

  def edit
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to classroom_path(@classroom), notice: 'Classroom Successfully updated.'
    else
      render :edit
    end
  end

  private

  def load_classroom
    @classroom = Classroom.find(params[:id])
  end

  def ensure_teacher
    unless current_user.teacher? && @classroom.teacher_id.eql?(current_user.id)
      redirect_to(dashboard_path, alert: 'You dont have access to that.')
    end
  end

  def classroom_params
  params.require(:classroom).permit(:name, :description, :photo)
  end
end
