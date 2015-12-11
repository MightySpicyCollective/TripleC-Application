ThinkingSphinx::Index.define :school, with: :active_record do
  # fields
  indexes name
  indexes description
  indexes location

  # attributes
  has active
end
