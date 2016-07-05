class ClassroomPresenter < SimpleDelegator

  def teacher_name
    teacher.try(:name)
  end

  def school_name
    school.name
  end

  def school_logo
    school.photo.url(:medium)
  end

  def teacher
    @teacher ||= model.teacher
  end

  def connected?(classroom_id)
    model.connected_with?(classroom_id)
  end

  def has_same_teacher?(user)
    model.teacher_id == user.id
  end

  private

  def school
    @school ||= model.school
  end

  def model
    __getobj__
  end
end
