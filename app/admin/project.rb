ActiveAdmin.register Project do
  permit_params :name, :user_id, :description, :school_id, :status, :forked, :completed_sound_snippet_url, :source_code

  filter :name

  index do
    id_column
    column :name
    column :username
    column :school
    column :classroom
    column :teacher do |p|
      link_to p.classroom.teacher.username, admin_user_path(p.classroom.teacher)
    end
    actions
  end
end
