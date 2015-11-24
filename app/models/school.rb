class School < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy

  validates :name, :location, presence: true

  has_attached_file :photo, styles: { medium: '300x300>' }, default_url: '/images/:style/missing.png'

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  scope :active, -> { where(active: true) }
end
