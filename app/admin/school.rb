ActiveAdmin.register School do
  permit_params :name, :location

  filter :name
  filter :location

  index do
    id_column
    column :name
    column :location
  end
end
