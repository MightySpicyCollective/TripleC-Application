class Classroom < ActiveRecord::Base
  belongs_to :school
  belongs_to :teacher, class_name: User

  has_many :users
  has_many :projects, through: :users
  has_many :sent_invites, dependent: :destroy, foreign_key: :sender_id, class_name: Invite
  has_many :recieved_invites, dependent: :destroy, foreign_key: :reciever_id, class_name: Invite

  def connected_with?(other_class_id)
    Invite.accepted.exists?(sender_id: id, reciever_id: other_class_id) ||
    Invite.accepted.exists?(reciever_id: id, sender_id: other_class_id)
  end
end
