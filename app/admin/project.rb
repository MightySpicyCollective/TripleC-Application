ActiveAdmin.register Project do
  filter :name

  index do
    id_column
    column :user_id
    column :name
  end
end
