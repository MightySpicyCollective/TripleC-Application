ActiveAdmin.register Classroom do
  permit_params :name, :description, :school_id, :teacher_id

  config.filters = false

  index do
    id_column
    column :name
    column :school
    column :teacher
    column :photo do |c|
      if c.photo.blank?
        image_tag(c.photo.url(:medium), height: '100', class: "border-radius-50 swatch-#{c.dummy_swatch_color}")
      else
        image_tag(c.photo.url(:medium), height: '100', class: 'border-radius-50')
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Classroom Details' do
      f.input :name
      f.input :school
      f.input :photo, as: :file
      f.input :teacher, as: :select, collection: User.teachers.pluck(:username, :id)
      f.input :description
    end
    f.actions
  end
end
