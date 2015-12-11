ActiveAdmin.register User do
  permit_params :name, :email, :username, :description, :avatar,
                :password, :password_confirmation, :school_id,
                :classroom_id, :role_id

  form partial: 'form'

  member_action :approve, method: :patch do
    resource.update_column(:approved, true)
    redirect_to admin_users_path, notice: 'Approved!'
  end

  member_action :disapprove, method: :patch do
    resource.update_column(:approved, false)
    redirect_to admin_users_path, notice: 'Disapproved!'
  end

  member_action :reset_password do
  end

  member_action :save_password, method: :patch do
    password_params = params.require(:user).permit(:password, :password_confirmation)
    if resource.reset_password!(password_params[:password], password_params[:password_confirmation])
      redirect_to admin_users_path, notice: 'Password changed successfully.'
    else
      render :reset_password
    end
  end

  index do
    id_column
    column :name
    column :email
    column :username
    column :approved
    column :classroom
    column :school
    column :avatar do |user|
      image_tag(user.avatar.url(:thumb))
    end
    actions defaults: true do |user|
      html = if user.approved?
        link_to 'Disapprove', disapprove_admin_user_path(user), method: :patch
      else
        link_to 'Approve', approve_admin_user_path(user), method: :patch
      end
      html += " "
      html += (link_to 'Reset Password', reset_password_admin_user_path(user))
    end
  end

  show do
    attributes_table do
      row :username
      row :name
      row :email
      row :approved
      row :school
      row :classroom
      row :description
      row :avatar do |user|
        image_tag(user.avatar.url(:thumb))
      end
    end
  end

  filter :name
  filter :email
  filter :username
  filter :approved
end
