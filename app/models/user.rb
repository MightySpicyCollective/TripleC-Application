class User < ActiveRecord::Base
  SWATCH_OPTIONS = %w(pink green blue dark-blue violet orange yellow dark-green black)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:username]

  belongs_to :role
  belongs_to :classroom
  belongs_to :school
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy

  extend FriendlyId

  friendly_id :username, use: [:slugged, :finders]

  validates :name, :username, :role, :role_id, presence: true
  validates :username, uniqueness: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50#" }, default_url: 'paperclip-defaults/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  scope :teachers, -> { includes(:role).where(roles: { identifier: Role::TYPES[:teacher].to_s }) }
  scope :students, -> { includes(:role).where(roles: { identifier: Role::TYPES[:student].to_s }) }

  scope :for_school, ->(school_id) { where(school_id: school_id) }

  delegate :teacher, to: :classroom
  delegate :name, :identifier, to: :role, prefix: true

  before_validation :set_role
  before_create :skip_confirmation!, :populate_dummy_swatch

  after_create :set_teacher_for_classroom, if: :teacher?

  def email_required?
    false
  end

  def teacher?
    role_identifier.eql?(Role::TYPES[:teacher].to_s)
  end

  private

  def set_role
    self.role ||= Role.with_type(Role::TYPES[:student]).first
  end

  def set_teacher_for_classroom
    classroom.update_column(:teacher_id, id)
  end

  def populate_dummy_swatch
    self.dummy_swatch_color = SWATCH_OPTIONS.sample
  end
end
