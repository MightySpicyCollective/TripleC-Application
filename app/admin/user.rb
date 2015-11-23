ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :username, :school_id, :classroom_id, :role_id

  form partial: 'form'

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

  show do
    attributes_table do
      row :username
      row :first_name
      row :last_name
      row :email
      row :approved
      row :school
      row :classroom
    end
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :username
  filter :approved
end
