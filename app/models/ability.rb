# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :session
    
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, owner: user
    end
  end
end
