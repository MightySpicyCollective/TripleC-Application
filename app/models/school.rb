class School < ActiveRecord::Base
  extend FriendlyId
  include SwatchPopulator

  friendly_id :name, use: [:slugged, :finders]

  has_many :classrooms, dependent: :destroy
  has_many :projects

  validates :name, :location, presence: true

  has_attached_file :photo, styles: { medium: '300x300!' },
                            convert_options: {
                              medium: '-resize 300x300^ -background black -gravity center -extent 300x300',
                            },
                            default_url: 'paperclip-defaults/:style/missing.png'

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  scope :active, -> { where(active: true) }
end
