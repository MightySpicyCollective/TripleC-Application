module RegistrationsHelper
  def create_or_update_user_path(resource)
    if resource.new_record?
      admin_users_path
    else
      admin_user_path(resource)
    end
  end

  def school_classroom_json_mapping
    schools = School.includes(:classrooms).all
    mapping = {}
    schools.each do |school|
      mapping[school.id] = school.classrooms.collect { |c| [c.name, c.id] }
    end
    mapping.to_json
  end
end
