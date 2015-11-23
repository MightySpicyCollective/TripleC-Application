ActiveAdmin.register Classroom do
  permit_params :name, :school_id

  config.filters = false

  index do
    id_column
    column :name
    column :school
  end
end
