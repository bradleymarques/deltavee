require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the factory can build a valid user" do
    user = FactoryBot.build(:user)
    assert(user)
    assert(user.valid?, user.errors.full_messages.to_sentence)
    assert(user.save)
  end

  test "the factory can create a valid user" do
    user = FactoryBot.create(:user)
    assert(user)
    assert(user.valid?, user.errors.full_messages.to_sentence)
    assert(user.persisted?)
  end

  test "the factory can create a valid user with sent and received notifications" do
    user = FactoryBot.create(
      :user,
      :with_sent_notifications,
      :with_received_notifications
    )

    assert_equal(1, user.sent_notifications.size)
    assert_equal(10, user.received_notifications.size)
  end
end
