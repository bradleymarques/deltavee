require "test_helper"

class BasePresenterTest < ActiveSupport::TestCase
  test "can be created for a collection of objects" do
    users = [FactoryBot.create(:user), FactoryBot.create(:user)]
    presented_collection = BasePresenter.collection(users)

    assert(presented_collection)
    assert_equal(2, presented_collection.size)
    assert_kind_of(BasePresenter, presented_collection.first)
    assert_kind_of(BasePresenter, presented_collection.second)
  end

  test "wraps a model" do
    user = FactoryBot.create(:user)
    presented_user = BasePresenter.new(user)
    assert(presented_user)
    assert_kind_of(BasePresenter, presented_user)
    assert_equal(user, presented_user.model)
  end

  test "delegates methods to the model" do
    user = FactoryBot.create(:user)
    user.expects(:username).once.returns("The user")
    presented_user = BasePresenter.new(user)
    assert_equal("The user", presented_user.username)
  end

  test "#h returns ActionController::Base.helpers" do
    presented_thing = BasePresenter.new(FactoryBot.build(:user))
    assert_equal(ActionController::Base.helpers, presented_thing.h)
  end
end
