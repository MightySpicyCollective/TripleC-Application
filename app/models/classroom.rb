class Classroom < ActiveRecord::Base
  belongs_to :school
  has_many :users

  def teacher
    users.includes(:role).where(roles: { name: Role::TYPES[:teacher] }).first
  end
end
