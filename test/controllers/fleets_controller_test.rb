require "test_helper"

class FleetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    login_as(user: @user)
  end

  test "GET #index renders the index page" do
    get(fleets_path)
    assert_response(:ok)
    assert_template(:index)
  end

  test "GET #show renders the show page" do
    fleet = FactoryBot.create(:fleet, owned_by: @user)
    get(fleet_path(fleet))
    assert_response(:ok)
    assert_template(:show)
  end
end
