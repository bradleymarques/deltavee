require "test_helper"

class ApplicationPolicyTest < ActiveSupport::TestCase

  test "by default a user cannot do anything to a record" do
    record = System.new
    user = User.new

    refute_permit(user, record, :index?)
    refute_permit(user, record, :show?)
    refute_permit(user, record, :create?)
    refute_permit(user, record, :new?)
    refute_permit(user, record, :update?)
    refute_permit(user, record, :edit?)
    refute_permit(user, record, :destroy?)
  end

  test "by default a user cannot view any scopes" do
    FactoryBot.create(:system)
    user = User.new

    scope = ApplicationPolicy::Scope.new(user, System)
    assert_empty(scope.resolve)
  end
end
