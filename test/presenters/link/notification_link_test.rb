require "test_helper"

module Link
  class NotificationLinkTest < ActiveSupport::TestCase
    include Rails.application.routes.url_helpers

    test "#text returns the subject of the notification" do
      notification = FactoryBot.create(:notification, subject: "Single Twi'leks Near You")
      link = Link::NotificationLink.new(notification)
      assert_equal("Single Twi'leks Near You", link.text)
    end

    test "#text returns a truncated version of the notification subject if it is very long" do
      notification = FactoryBot.create(:notification, subject: Faker::Lorem.characters(number: 100))
      link = Link::NotificationLink.new(notification)
      assert_equal(Link::BaseLink::MAX_LENGTH, link.text.length)
    end

    test "#path returns the path to the notification" do
      notification = FactoryBot.create(:notification)
      link = Link::NotificationLink.new(notification)
      assert_equal(notification_path(notification), link.path)
    end
  end
end
