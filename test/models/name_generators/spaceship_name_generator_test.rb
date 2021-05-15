require "test_helper"

module NameGenerators
  class SpaceshipNameGeneratorTest < ActiveSupport::TestCase
    setup do
      @generator = NameGenerators::SpaceshipNameGenerator.new
    end

    test "#generate returns a string" do
      assert_kind_of(String, @generator.generate)
    end

    test "#generate returns a name that is valid for a spaceship" do
      spaceship = FactoryBot.build(:spaceship)

      500.times do
        spaceship.name = @generator.generate
        assert(spaceship.valid?, spaceship.name)
      end
    end
  end
end
