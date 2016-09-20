class ProjectPresenter < SimpleDelegator
  def sharable?(user)
    !user.classroom_id.eql?(model.classroom_id) &&
    active_project? &&
    approved_user?(user) &&
    teachers_connected?(user)
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

  def username(current_user)
    if model.user == current_user
      "me"
    else
      model.user.username
    end
  end

  def audio_class
    'playerholder' if model.audio.present?
  end

  def audio_url
    model.audio.url if model.audio.present?
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
