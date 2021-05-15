require "test_helper"

class NotificationPolicyTest < ActiveSupport::TestCase
  setup do
    @notification = FactoryBot.create(:notification)
    @sender = @notification.sender
    @recipient = @notification.recipient
  end

  test "a user can show? a notification if they are the sender" do
    assert_permit(@sender, @notification, :show?)
  end

  test "a user can show? a notification if they are the recipient" do
    assert_permit(@recipient, @notification, :show?)
  end

  test "a user who is neither the sender nor the receiver can :show? the notification" do
    another_user = FactoryBot.create(:user)
    refute_equal(@sender, another_user)
    refute_equal(@recipient, another_user)

    refute_permit(another_user, @notification, :show?)
  end
end
