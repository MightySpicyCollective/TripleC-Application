class AddAvatars < ActiveRecord::Migration
  def up
    add_attachment :classrooms, :photo
    add_attachment :projects, :photo
  end

  def down
    remove_attachment :classrooms, :avatar
    remove_attachment :projects, :avatar
  end
end
