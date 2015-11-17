class Role < ActiveRecord::Base
  TYPES = { teacher: 1, student: 2 }
  scope :with_type, -> (role_identifier) { where(identifier: role_identifier) }

  has_many :users

  validates :name, :identifier, presence: true
  validates :identifier, uniqueness: { case_sensitive: true }, allow_blank: true
end
