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
    column :photo do |p|
      if p.photo.blank?
        image_tag(p.photo.url(:medium), height: '100', class: "border-radius-50 swatch-#{p.dummy_swatch_color}")
      else
        image_tag(p.photo.url(:medium), height: '100')
      end
    end
    column :teacher do |p|
      if p.classroom
        link_to p.classroom.teacher.username, admin_user_path(p.classroom.teacher)
      end
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
