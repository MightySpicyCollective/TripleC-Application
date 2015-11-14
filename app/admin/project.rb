ActiveAdmin.register Project do
  actions :index

  config.filters = false

  index do
    id_column
    column :user_id
  end
end
