class School < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy

  validates :name, :location, presence: true
end
