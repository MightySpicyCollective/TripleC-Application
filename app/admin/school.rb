ActiveAdmin.register School do
  permit_params :name, :location, :description, :photo, :active

  filter :name
  filter :location
  filter :description
  filter :active

  index do
    id_column
    column :name
    column :location
    column :description
    column :active
    column :photo do |s|
      image_tag(s.photo.url(:medium), height: '100', class: "border-radius-50 swatch-#{s.dummy_swatch_color}")
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
      row :active
    end
  end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'School Details' do
      f.input :name
      f.input :location
      f.input :description
      f.input :photo, as: :file
      f.input :active
    end
    f.actions
  end
end
