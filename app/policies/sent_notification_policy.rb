class SentNotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(sender: user)
    end
  end
end
