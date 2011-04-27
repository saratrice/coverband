class Ability
  include CanCan::Ability

  def initialize(user)
    
    user = user || User.new # for guest
    
    can :read, CoverBandName
    
    if user.role? :user
      can [:create], CoverBandName
    end
    
    if user.role? :admin
      can :read, :all
      can :manage, :all             # allow superadmins to do anything
      can :access, :rails_admin     # only allow admin users to access Rails Admin
    end

  end
end
