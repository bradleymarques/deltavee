class FleetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.fleets
    end
  end
end
