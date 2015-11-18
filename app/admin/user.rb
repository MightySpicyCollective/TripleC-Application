ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :username

  member_action :approve, method: :patch do
    resource.update_column(:approved, true)
    redirect_to admin_users_path, notice: 'Approved!'
  end

  member_action :disapprove, method: :patch do
    resource.update_column(:approved, false)
    redirect_to admin_users_path, notice: 'Disapproved'
  end

  index do
    id_column
    column :first_name
    column :last_name
    column :email
    column :username
    column :approved
    actions defaults: true do |user|
      if user.approved?
        link_to 'Disapprove', disapprove_admin_user_path(user), method: :patch
      else
        link_to 'Approve', approve_admin_user_path(user), method: :patch
      end
    end
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :username

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :username
      f.input :classroom
      f.input :role
    end
    f.actions
  end
end
