class ProjectPresenter < SimpleDelegator
  def sharable?(user)
    active_project? && approved_user?(user) && teachers_connected?(user)
  end

  def active_project?
    model.active?
  end

  def non_teacher?(user)
    !user.teacher?
  end

  def approved_user?(user)
    user.approved?
  end

  private

  def teachers_connected?(user)
    return true if model.teacher == user.teacher
    model.classroom.connected_with?(user.classroom_id)
  end

  def model
    __getobj__
  end
end
