class Classroom < ActiveRecord::Base
  extend FriendlyId
  include SwatchPopulator

  friendly_id :name, use: [:slugged, :finders]

  belongs_to :school
  belongs_to :teacher, class_name: User

  has_many :users
  has_many :projects, through: :users
  has_many :sent_invites, dependent: :destroy, foreign_key: :sender_id, class_name: Invite
  has_many :recieved_invites, dependent: :destroy, foreign_key: :reciever_id, class_name: Invite

  has_attached_file :photo, styles: { medium: '300x300!' }, default_url: 'paperclip-defaults/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def connected_with?(other_class_id)
    return true if(id == other_class_id)
    Invite.accepted.exists?(sender_id: id, reciever_id: other_class_id) ||
    Invite.accepted.exists?(reciever_id: id, sender_id: other_class_id)
  end

  def followers
    sent_invites.accepted.collect(&:reciever)
  end

  def followings
    recieved_invites.accepted.collect(&:sender)
  end
end
