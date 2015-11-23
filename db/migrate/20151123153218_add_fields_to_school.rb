class AddFieldsToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :description, :text
    add_attachment :schools, :photo
  end
end
