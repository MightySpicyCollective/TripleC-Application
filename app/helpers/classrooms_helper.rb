module ClassroomsHelper
  def classroom_user_projects(classroom_user)
    classroom_user.projects.collect do |project|
      link_to project.name, view_project_path(project.id)
    end.join(' | ').html_safe
  end
end
