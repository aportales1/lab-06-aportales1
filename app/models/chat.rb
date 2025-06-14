class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :sender_and_receiver_must_be_different

  def sender_and_receiver_must_be_different
    if sender_id == receiver_id
      errors.add(:receiver_id, "must be different from sender")
    end
  end
  scope :for_user, ->(user) {
    where("sender_id = ? OR receiver_id = ?", user.id, user.id)
  }
  def other_participant(current_user)
    sender == current_user ? receiver : sender
  end  
end

