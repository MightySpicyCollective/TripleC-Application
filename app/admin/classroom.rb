ActiveAdmin.register Classroom do
  permit_params :name, :description, :school_id, :teacher_id

  config.filters = false

  index do
    id_column
    column :name
    column :school
    column :teacher
    actions
  end

  form do |f|
    f.inputs 'Classroom Details' do
      f.input :name
      f.input :school
      f.input :teacher, as: :select, collection: User.teachers.pluck(:username, :id)
      f.input :description
    end
    f.actions
  end
end
