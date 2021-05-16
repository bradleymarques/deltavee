require "test_helper"

class SystemUserTest < ActiveSupport::TestCase
  test "#system_user returns a valid, persisted User" do
    user = SystemUser.new.system_user
    assert(user)
    assert(user.valid?)
    assert(user.persisted?)
  end

  test "#system_user returns a user with the correct credentials" do
    user = SystemUser.new.system_user

    assert_equal(Rails.application.credentials.system_user[:username], user.username)
    assert_equal(Rails.application.credentials.system_user[:email], user.email)
  end

  test "#system_user creates a new user the first time, but not on subsequent calls" do
    assert_difference("User.count", 1) do
      SystemUser.new.system_user
    end

    assert_no_difference("User.count") do
      SystemUser.new.system_user
    end

    assert_no_difference("User.count") do
      SystemUser.new.system_user
    end
  end
end
