class DropSlugFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :slug
  end
end
