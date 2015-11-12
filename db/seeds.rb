Role::TYPES.each do |role_name, role_value|
  Role.create(name: role_name, identifier: role_value)
end
