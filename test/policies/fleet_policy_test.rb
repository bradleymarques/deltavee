require "test_helper"

class FleetPolicyTest < ActiveSupport::TestCase
  test "Scope#resolve returns those fleets owned by this User" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)

    fleet1 = FactoryBot.create(:fleet, owned_by: user1)
    fleet2 = FactoryBot.create(:fleet, owned_by: user1)
    fleet3 = FactoryBot.create(:fleet, owned_by: user1)
    fleet4 = FactoryBot.create(:fleet, owned_by: user2)

    fleet_scope1 = FleetPolicy::Scope.new(user1, Fleet).resolve
    fleet_scope2 = FleetPolicy::Scope.new(user2, Fleet).resolve

    assert_equal(3, fleet_scope1.size)
    assert_equal(1, fleet_scope2.size)

    assert_includes(fleet_scope1, fleet1)
    assert_includes(fleet_scope1, fleet2)
    assert_includes(fleet_scope1, fleet3)
    refute_includes(fleet_scope1, fleet4)

    refute_includes(fleet_scope2, fleet1)
    refute_includes(fleet_scope2, fleet2)
    refute_includes(fleet_scope2, fleet3)
    assert_includes(fleet_scope2, fleet4)
  end

  test "#show? returns true if the User owns the Fleet" do
    user = FactoryBot.create(:user)
    fleet = FactoryBot.create(:fleet, owned_by: user)
    assert_equal(user, fleet.owned_by)
    assert_permit(user, fleet, :show?)
  end

  test "#show? returns false if the User does not own the Fleet" do
    user = FactoryBot.create(:user)
    fleet = FactoryBot.create(:fleet)
    refute_equal(user, fleet.owned_by)
    refute_permit(user, fleet, :show?)
  end
end
