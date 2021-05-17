require "test_helper"

module Link
  class FleetLinkTest < ActiveSupport::TestCase
    include Rails.application.routes.url_helpers

    test "#text returns the name of the fleet" do
      fleet = FactoryBot.create(:fleet, name: "The Borg Collective")
      link = Link::FleetLink.new(fleet)
      assert_equal("The Borg Collective", link.text)
    end

    test "#text returns a truncated version of the fleet name if it is very long" do
      fleet = FactoryBot.create(:fleet, name: Faker::Lorem.characters(number: 100))
      link = Link::FleetLink.new(fleet)
      assert_equal(Link::BaseLink::MAX_LENGTH, link.text.length)
    end

    test "#path returns the path to the Fleet" do
      fleet = FactoryBot.create(:fleet)
      link = Link::FleetLink.new(fleet)
      assert_equal(fleet_path(fleet), link.path)
    end
  end
end
