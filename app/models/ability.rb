class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can :read, :all
      can :create, Store
      can :create, Item, :store => { :user => user }
      can :update, Store, :user_id => user.id
      can :destroy, Store, :user_id => user.id
      can :destroy, Item, :store => { :user => user }
    else
      can :read, :all
    end 
  end 
end

