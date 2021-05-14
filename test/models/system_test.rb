require "test_helper"

class SystemTest < ActiveSupport::TestCase
  test "the defined factory can build a valid System" do
    system = FactoryBot.build(:system)
    assert(system)
    assert(system.valid?, system.errors.full_messages.to_sentence)
    assert(system.save)
  end

  test "the defined factory can create a valid System" do
    system = FactoryBot.create(:system)
    assert(system)
    assert(system.valid?)
    assert(system.persisted?)
  end

  test "is invalid with a name that is too short" do
    short_name = Faker::Lorem.characters(number: System::MIN_NAME_LENGTH - 1)
    system = FactoryBot.build(:system, name: short_name)
    refute(system.valid?)
  end

  test "is invalid with a name that is too long" do
    long_name = Faker::Lorem.characters(number: System::MAX_NAME_LENGTH + 1)
    system = FactoryBot.build(:system, name: long_name)
    refute(system.valid?)
  end

  test "is invalid with a name that is neother too long nor too short" do
    long_name = Faker::Lorem.characters(number: System::MAX_NAME_LENGTH - 1)
    system1 = FactoryBot.build(:system, name: long_name)
    assert(system1.valid?)

    short_name = Faker::Lorem.characters(number: System::MIN_NAME_LENGTH + 1)
    system2 = FactoryBot.build(:system, name: short_name)
    assert(system2.valid?)
  end
end
