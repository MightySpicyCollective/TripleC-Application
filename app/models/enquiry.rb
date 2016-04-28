class Enquiry < ActiveRecord::Base
  validates :name, :email, presence: true
end
