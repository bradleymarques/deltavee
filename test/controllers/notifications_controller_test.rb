require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    login_as(user: @user)
  end

  test "GET #index renders the inbox" do
    get(notifications_url)
    assert_response(:ok)
    assert_template(:index)
  end
end
