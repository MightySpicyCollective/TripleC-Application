ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :username

  index do
    id_column
    column :first_name
    column :last_name
    column :email
    column :username
    actions
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
    end
    f.actions
  end
end
