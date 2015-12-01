class AddAttributesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    add_column :projects, :status, :integer
    add_column :projects, :forked, :boolean, default: false
    add_column :projects, :forked_project_id, :integer
    add_column :projects, :completed_sound_snippet_url, :string
  end
end
