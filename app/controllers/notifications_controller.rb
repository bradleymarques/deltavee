class NotificationsController < RestrictedAccessController
  def index
    @notifications = policy_scope(Notification)
  end
end
