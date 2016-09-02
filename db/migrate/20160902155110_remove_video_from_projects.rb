class RemoveVideoFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :video_file_name
    remove_column :projects, :video_content_type
    remove_column :projects, :video_file_size
    remove_column :projects, :video_updated_at
  end
end
