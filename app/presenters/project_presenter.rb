class ProjectPresenter < SimpleDelegator
  def sharable?(user)
    model.active? && !user.teacher? && teachers_connected?(user)
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
