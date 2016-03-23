ActiveAdmin.register Project do
  permit_params :name, :user_id, :description, :school_id,
                :status, :forked, :completed_sound_snippet_url,
                :source_code, :photo

  filter :name

  index do
    id_column
    column :name
    column :username
    column :forked
    column :school
    column :classroom
    column :photo do |p|
      image_tag(p.photo.url(:medium), height: '100', class: "border-radius-50 swatch-#{p.dummy_swatch_color}")
    end
    column :teacher do |p|
      if p.classroom
        link_to p.classroom.teacher.username, admin_user_path(p.classroom.teacher)
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Project Details' do
      f.input :name
      f.input :username
      f.input :photo, as: :file
      f.input :source_code, as: :text
      f.input :description
      f.input :completed_sound_snippet_url
      f.input :dummy_swatch_color, as: :select, collection: SwatchPopulator::SWATCH_OPTIONS
    end
    f.actions
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
      row :source_code do |p|
        content_tag :pre do
          p.source_code
        end
      end
    end
  end
end
