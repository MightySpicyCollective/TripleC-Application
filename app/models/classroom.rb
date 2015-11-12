class Classroom < ActiveRecord::Base
  belongs_to :school
  has_many :users
end
