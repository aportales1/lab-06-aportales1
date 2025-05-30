class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :read, :all
    can [:update, :destroy], User, id: user.id
    can [:create, :update, :destroy], Message, user_id: user.id
    can :create, Chat
    can [:update, :destroy], Chat, sender_id: user.id

  end
end