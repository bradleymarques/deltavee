require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the factory can build a valid user" do
    user = FactoryBot.build(:user)
    assert(user)
    assert(user.valid?, user.errors.full_messages.to_sentence)
    assert(user.save)
  end

  test "the factory can create a valid user" do
    user = FactoryBot.create(:user)
    assert(user)
    assert(user.valid?, user.errors.full_messages.to_sentence)
    assert(user.persisted?)
  end
end
