class ClassroomPresenter < SimpleDelegator

  def teacher_name
    teacher.try(:full_name)
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

  private

  def school
    @school ||= model.school
  end

  def model
    __getobj__
  end
end
