require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    login_as(user: @user)
  end

  test "GET #inbox renders the inbox" do
    get(inbox_url)
    assert_response(:ok)
    assert_template(:inbox)
  end

  test "GET #outbox renders the outbox" do
    get(outbox_url)
    assert_response(:ok)
    assert_template(:outbox)
  end
end
