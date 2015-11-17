ActiveAdmin.register Role do
  permit_params :name, :identifier

  index do
    id_column
    column :name
    column :identifier
    actions
  end

  filter :name
  filter :identifier

  form do |f|
    f.inputs "Role Details" do
      f.input :name
      f.input :identifier
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :identifier
    end
  end
end
