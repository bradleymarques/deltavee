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
    fleet = FactoryBot.create(:fleet)
    presented_fleet = BasePresenter.new(fleet)
    assert(presented_fleet)
    assert_kind_of(BasePresenter, presented_fleet)
    assert_equal(fleet, presented_fleet.model)
  end

  test "delegates methods to the model" do
    fleet = FactoryBot.create(:fleet)
    fleet.expects(:name).once.returns("The Fleet")
    presented_fleet = BasePresenter.new(fleet)
    assert_equal("The Fleet", presented_fleet.name)
  end

  test "#h returns ActionController::Base.helpers" do
    presented_thing = BasePresenter.new("A string")
    assert_equal(ActionController::Base.helpers, presented_thing.h)
  end
end
