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
end
