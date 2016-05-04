class Enquiry < ActiveRecord::Base
  include Humanizer
  require_human_on :create

  validates :name, :email, :subject, :message, presence: true
end
