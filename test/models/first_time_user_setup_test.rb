require "test_helper"

class FirstTimeUserSetupTest < ActiveSupport::TestCase
  setup do
    FactoryBot.create(:system, :sol)
  end

  test "initialized with a User sends them a notification" do
    user = FactoryBot.create(:user)

    assert_difference("Notification.count", 1) do
      FirstTimeUserSetup.new(user).call
    end

    notification = Notification.last
    assert_equal(user, notification.recipient)
    assert_equal(SystemUser.new.system_user, notification.sender)
    assert_equal(I18n.t("welcome.notification.subject"), notification.subject)
  end

  test "initialized with a User gives them a Fleet with two Spaceships" do
    user = FactoryBot.create(:user)

    assert_difference("Fleet.count", 1) do
      assert_difference("Spaceship.count", 2) do
        FirstTimeUserSetup.new(user).call
      end
    end

    fleet = Fleet.last
    assert_equal(user, fleet.owned_by)
    assert_equal(2, fleet.spaceships.count)
  end
end
