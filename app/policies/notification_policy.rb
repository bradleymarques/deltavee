class NotificationPolicy < ApplicationPolicy
  def show?
    record.sender == user || record.recipient == user
  end
end
