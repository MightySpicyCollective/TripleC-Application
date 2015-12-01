class AddSourceCodeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :source_code, :text
  end
end
