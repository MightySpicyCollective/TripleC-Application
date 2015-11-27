class Project < ActiveRecord::Base
  has_paper_trail ignore: [:created_at, :updated_at, :id]

  belongs_to :user
  # has_many :comments, dependent: :destroy

  validates :name, :description, presence: true

  STATUSES = {
    inactive: 0,
    active: 1
  }
end
