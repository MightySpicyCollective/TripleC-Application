ThinkingSphinx::Index.define :classroom, with: :active_record do
  # fields
  indexes name
  indexes description
  indexes slug
end
