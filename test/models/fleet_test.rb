require "test_helper"

class FleetTest < ActiveSupport::TestCase
  test "the factory can build a valid Fleet" do
    fleet = FactoryBot.build(:fleet)
    assert(fleet)
    assert(fleet.valid?, fleet.errors.full_messages.to_sentence)
    assert(fleet.save)
  end

  test "the factory can create a valid Fleet" do
    fleet = FactoryBot.create(:fleet)
    assert(fleet)
    assert(fleet.valid?, fleet.errors.full_messages.to_sentence)
    assert(fleet.persisted?)
  end

  test "a fleet without any spaceships is invalid" do
    fleet = FactoryBot.build(:fleet)
    fleet.spaceships = []
    refute(fleet.valid?)
  end
end
