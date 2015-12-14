ThinkingSphinx::Index.define :project, with: :active_record do
  # fields
  indexes name
  indexes description
  indexes source_code

  # attributes
  has status
end
