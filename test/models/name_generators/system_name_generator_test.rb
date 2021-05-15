require "test_helper"

module NameGenerators
  class SystemNameGeneratorTest < ActiveSupport::TestCase
    test "#generate returns a string" do
      generator = NameGenerators::SystemNameGenerator.new
      name = generator.generate
      assert(name)
      assert_kind_of(String, name)
    end

    test "#generate returns names that are valid for systems" do
      system = FactoryBot.build(:system)

      500.times do
        system.name = NameGenerators::SystemNameGenerator.new.generate
        assert(system.valid?, system.name)
      end
    end
  end
end
