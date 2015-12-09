class AddSlugToTables < ActiveRecord::Migration
  def change
    add_column :schools, :slug, :string
    add_column :classrooms, :slug, :string
    add_column :projects, :slug, :string
    add_column :users, :slug, :string

    add_index :schools, :slug
    add_index :classrooms, :slug
    add_index :projects, :slug
    add_index :users, :slug
  end
end
