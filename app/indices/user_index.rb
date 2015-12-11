ThinkingSphinx::Index.define :user, with: :active_record do
  # fields
  indexes name
  indexes username
  indexes email
  indexes description

  # attributes
  has approved
end
