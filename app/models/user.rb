class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :classroom
  has_many :projects, dependent: :destroy

  validates :first_name, :last_name, :username, :role, :role_id, presence: true
  validates :username, uniqueness: true

  before_validation :set_role

  def email_required?
    false
  end

  private

  def set_role
    self.role ||= Role.with_type(Role::TYPES[:student]).first
  end
end
