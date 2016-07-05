class PopulateClassroomIdAndSchoolId < ActiveRecord::Migration
  def change
    Project.unscoped.each do |project|
      user = project.user

      project.update_columns(school_id: user.school_id, classroom_id: user.classroom_id)
    end
  end
end
