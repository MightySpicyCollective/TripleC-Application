class Invite < ActiveRecord::Base
  belongs_to :sender, class_name: Classroom
  belongs_to :reciever, class_name: Classroom

  before_create :initialize_status

  STATUSES = {
    sent:     1,
    accepted: 2,
    rejected: 3
  }

  scope :sent,     -> { where(status: STATUSES[:sent]) }
  scope :accepted, -> { where(status: STATUSES[:accepted]) }
  scope :rejected, -> { where(status: STATUSES[:rejected]) }

  def accept!
    update_column(:status, STATUSES[:accepted])
  end

  def reject!
    update_column(:status, STATUSES[:rejected])
  end

  private

  def initialize_status
    self.status = STATUSES[:sent]
  end
end
