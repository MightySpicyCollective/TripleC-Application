class AddIndexForComments < ActiveRecord::Migration
  def change
    add_index :comments, [:project_id, :created_at]
  end
end
