require "test_helper"

class SystemTest < ActiveSupport::TestCase
  test "the defined factory can build a valid System" do
    system = FactoryBot.build(:system)
    assert(system)
    assert(system.valid?)
    assert(system.save)
  end

  test "the defined factory can create a valid System" do
    system = FactoryBot.create(:system)
    assert(system)
    assert(system.valid?)
    assert(system.persisted?)
  end
end
