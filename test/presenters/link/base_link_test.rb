require "test_helper"

module Link
  class BaseLinkTest < ActiveSupport::TestCase
    include Rails.application.routes.url_helpers

    test "things that are BaseLinks return a link to the model with some text" do
      fleet = FactoryBot.create(:fleet)
      notification = FactoryBot.create(:notification)

      fleet_link = Link::FleetLink.new(fleet)
      notification_link = Link::NotificationLink.new(notification)

      assert_includes(fleet_link.to_s, fleet.name)
      assert_includes(fleet_link.to_s, fleet_path(fleet))

      assert_includes(notification_link.to_s, notification.subject)
      assert_includes(notification_link.to_s, notification_path(notification))
    end
  end
end
