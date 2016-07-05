class AddSchoolIdAndClassroomIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :school_id, :integer
    add_column :projects, :classroom_id, :integer
  end
end
