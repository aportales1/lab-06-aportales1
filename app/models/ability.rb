class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end
    can :create, Chat
    can [:update, :destroy], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end

    can :create, Message 

    can :read, Message do |message| 
      message.user_id == user.id || (
        message.chat.present? &&
        (message.chat.sender_id == user.id || message.chat.receiver_id == user.id)
      )
    end

    can [:update, :destroy], Message, user_id: user.id  
    can [:update, :destroy], User, id: user.id
    can :read, User, id: user.id
  end
end
