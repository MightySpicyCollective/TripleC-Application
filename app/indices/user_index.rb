ThinkingSphinx::Index.define :user, with: :active_record do
  # fields
  indexes first_name
  indexes last_name
  indexes username
  indexes email
  indexes description

  # attributes
  has approved
end
