require "test_helper"

class ReceivedNotificationPolicyTest < ActiveSupport::TestCase
  test "Scope#resolve returns those notifications received by this user" do
    user = FactoryBot.create(:user)
    notification1 = FactoryBot.create(:notification, recipient: user)
    notification2 = FactoryBot.create(:notification, recipient: user)
    notification3 = FactoryBot.create(:notification, sender: user)

    scope = ReceivedNotificationPolicy::Scope.new(user, Notification)
    notifications = scope.resolve

    assert_includes(notifications, notification1)
    assert_includes(notifications, notification2)
    refute_includes(notifications, notification3)
  end
end
