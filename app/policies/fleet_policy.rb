class FleetPolicy < ApplicationPolicy
  def show?
    user == record.owned_by
  end

  class Scope < Scope
    def resolve
      user.fleets
    end
  end
end
