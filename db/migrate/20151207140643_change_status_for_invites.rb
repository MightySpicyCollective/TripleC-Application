class ChangeStatusForInvites < ActiveRecord::Migration
  def up
    remove_column :invites, :status
    add_column :invites, :status, :integer
  end

  def down
    remove_column :invites, :status
    change_column :invites, :status, :string
  end
end
