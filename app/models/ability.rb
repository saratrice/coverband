class Ability
  include CanCan::Ability

  def initialize(user)
    
    user = user || User.new # for guest
    
    if user.role? :user
      can :manage, CoverBandName, :user_id => user.id
      can :read, CoverBandName
      can :manage, User, :user_id => user.id
    elsif user.role? :admin
      can :manage, :all             # allow superadmins to do anything
      can :access, :rails_admin     # only allow admin users to access Rails Admin
    end

  end
end
