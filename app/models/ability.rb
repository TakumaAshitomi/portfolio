# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    if admin_user.admin?
      can :manage, :all
    end

    if user.member?
      can :read, :all
    end
  end
end
