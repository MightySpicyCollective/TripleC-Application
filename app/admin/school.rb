ActiveAdmin.register School do
  permit_params :name, :location, :description, :photo

  filter :name
  filter :location
  filter :description

  index do
    id_column
    column :name
    column :location
    column :description
    column :photo do |s|
      image_tag(s.photo.url(:medium), height: '100')
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :location
      row :description
      row :photo do |s|
        image_tag(s.photo.url(:medium), height: '100')
      end
    end
  end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'School Details' do
      f.input :name
      f.input :location
      f.input :description
      f.input :photo, as: :file
    end
    f.actions
  end
end
