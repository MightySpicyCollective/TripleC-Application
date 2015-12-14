class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string

    User.unscoped.each do |user|
      say "Updating name for the user #{ user.id }"
      user.update_column(:name, user.first_name + user.last_name)
    end

    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
