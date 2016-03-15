class Project < ActiveRecord::Base
  include SwatchPopulator

  def to_param
    [id, name.parameterize].join("-")
  end

  has_paper_trail ignore: [:created_at, :updated_at, :id, :user_id]

  belongs_to :user
  belongs_to :forked_project, class_name: Project
  has_many :comments, dependent: :destroy

  has_attached_file :photo, styles: { medium: '300x300>' }, default_url: 'paperclip-defaults/:style/missing.png'
  validates :name, :description, :user, :user_id, presence: true

  STATUSES = { inactive: 0, active: 1 }

  delegate :username, :school, :classroom, to: :user
  delegate :teacher, to: :classroom

  before_validation :set_defaults

  def inactive?
    status.eql?(STATUSES[:inactive])
  end

  def active?
    status.eql?(STATUSES[:active])
  end

  def fork!(attributes = {})
    without_versioning do
      _project                             = Project.new(forked: true, forked_project_id: id)
      _project.name                        = name
      _project.description                 = description
      _project.user_id                     = attributes[:user_id]
      _project.status                      = STATUSES[:active]
      _project.source_code                 = source_code
      _project.completed_sound_snippet_url = completed_sound_snippet_url
      _project.save!
    end
  end

  private

  def set_defaults
    self.status ||= STATUSES[:active]
  end
end
