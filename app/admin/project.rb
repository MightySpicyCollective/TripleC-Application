ActiveAdmin.register Project do
  permit_params :name, :user_id, :description, :school_id, :status, :forked, :completed_sound_snippet_url, :source_code

  filter :name

  index do
    id_column
    column :name
    column :username
    column :forked
    column :school
    column :classroom
    column :teacher do |p|
      link_to p.classroom.teacher.username, admin_user_path(p.classroom.teacher)
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :user
      row :school
      row :classroom
      row :teacher
      row :forked
      row :forked_project
      row :completed_sound_snippet_url
      row :source_code
    end
  end
end
