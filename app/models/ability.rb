class Ability
  include CanCan::Ability

  def initialize(user)
    
    user = user || User.new # for guest
    
    can :read, :all                 # allow everyone to read everything
    can :create, CoverBandName
    if user.role? :admin
      can :manage, :all             # allow superadmins to do anything
      can :access, :rails_admin     # only allow admin users to access Rails Admin
    end

  end
end
