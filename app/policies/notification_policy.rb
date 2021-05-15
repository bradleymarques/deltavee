class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.none
    end
  end
end
