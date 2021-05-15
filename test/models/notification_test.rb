require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  test "the factory can build a valid Notification" do
    notification = FactoryBot.build(:notification)
    assert(notification)
    assert(notification.valid?, notification.errors.full_messages.to_sentence)
    assert(notification.save)
  end

  test "the factory can create a valid Notification" do
    notification = FactoryBot.create(:notification)
    assert(notification)
    assert(notification.valid?, notification.errors.full_messages.to_sentence)
    assert(notification.persisted?)
  end

  test "the factory generates a body and a subject for the notification" do
    notification = FactoryBot.create(:notification)

    assert(notification.subject)
    assert_kind_of(String, notification.subject)

    content = notification.content
    assert(content)
    assert_kind_of(ActionText::RichText, content)
    body = content.body
    assert(body)
    assert_kind_of(ActionText::Content, body)
  end
end
