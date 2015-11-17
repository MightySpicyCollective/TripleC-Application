ActiveAdmin.register Classroom do
  permit_params :name, :school_id

  config.filters = false

  index do
    id_column
    column :school_id
    column :name
  end
end
