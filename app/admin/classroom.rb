ActiveAdmin.register Classroom do
  actions :index

  config.filters = false

  index do
    id_column
    column :school_id
  end
end
