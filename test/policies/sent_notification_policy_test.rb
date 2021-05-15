require "test_helper"

class SentNotificationPolicyTest < ActiveSupport::TestCase
  test "Scope#resolve returns those notifications sent by this user" do
    user = FactoryBot.create(:user)
    notification1 = FactoryBot.create(:notification, recipient: user)
    notification2 = FactoryBot.create(:notification, recipient: user)
    notification3 = FactoryBot.create(:notification, sender: user)

    scope = SentNotificationPolicy::Scope.new(user, Notification)
    notifications = scope.resolve

    refute_includes(notifications, notification1)
    refute_includes(notifications, notification2)
    assert_includes(notifications, notification3)
  end
end
