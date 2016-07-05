class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_current_class, :ensure_teacher, :ensure_reciever, only: :create

  before_action :load_invite, only: [:accept, :reject]

  def create
    Invite.create(sender_id: @current_class.id, reciever_id: @reciever_class.id)
    redirect_to dashboard_path, notice: 'Invite Successfully Sent.'
  end

  def accept
    @invite.accept!
    redirect_to dashboard_path, notice: 'Invite Successfully Accepted.'
  end

  def reject
    @invite.reject!
    redirect_to dashboard_path, notice: 'Invite Successfully Rejected.'
  end

  private

  def load_current_class
    @current_class ||= Classroom.where(teacher_id: current_user.id).first
  end

  def ensure_teacher
    redirect_to(dashboard_path, notice: 'Accessible to only teachers') unless current_user.teacher?
  end

  def ensure_reciever
    @reciever_class ||= Classroom.find_by(id: params[:classroom_id])
    redirect_to(dashboard_path, notice: 'Classroom not found.') unless @reciever_class
  end

  def load_invite
    @invite ||= Invite.find_by(id: params[:id])
    redirect_to(dashboard_path, notice: 'Invite not found.') unless @invite
  end
end
