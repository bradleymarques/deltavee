require "test_helper"

class SpaceshipTest < ActiveSupport::TestCase
  test "the factory can build a valid spaceship" do
    spaceship = FactoryBot.build(:spaceship)
    assert(spaceship)
    assert(spaceship.valid?, spaceship.errors.full_messages.to_sentence)
    assert(spaceship.save)
  end

  test "the factory can create a valid spaceship" do
    spaceship = FactoryBot.create(:spaceship)
    assert(spaceship)
    assert(spaceship.valid?)
    assert(spaceship.persisted?)
  end

  test "is invalid if it belongs to a fleet that belongs to another user" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)

    fleet = FactoryBot.create(:fleet, owned_by: user1)
    spaceship = FactoryBot.build(
      :spaceship,
      owned_by: user2,
      fleet: fleet
    )

    expected_error = "Fleet owner is not the same as the spaceship owner"

    refute(spaceship.valid?)
    assert_equal(expected_error, spaceship.errors.full_messages.to_sentence)
  end
end
