class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:username]

  belongs_to :role
  belongs_to :classroom
  belongs_to :school
  has_many :projects, dependent: :destroy


  validates :first_name, :last_name, :username, :role, :role_id, presence: true
  validates :username, uniqueness: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_validation :set_role
  before_create :skip_confirmation!

  def email_required?
    false
  end

  private

  def set_role
    self.role ||= Role.with_type(Role::TYPES[:student]).first
  end
end
