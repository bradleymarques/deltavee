require "test_helper"

class SystemNameGeneratorTest < ActiveSupport::TestCase
  test "#generate returns a string" do
    generator = SystemNameGenerator.new
    name = generator.generate
    assert(name)
    assert_kind_of(String, name)
  end

  test "#generate returns names that are valid for systems" do
    system = FactoryBot.build(:system)

    1_000.times do
      system.name = SystemNameGenerator.new.generate
      assert(system.valid?, system.name)
    end
  end
end
