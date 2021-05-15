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

  test "GET #new renders new" do
    get(new_notification_url)
    assert_response(:ok)
    assert_template(:new)
  end

  test "GET #show renders the notification" do
    notification = FactoryBot.create(:notification, sender: @user)
    get(notification_url(notification))
    assert_response(:ok)
    assert_template(:show)
  end

  test "POST #create with a username that exists creates the notification" do
    another_user = FactoryBot.create(:user)

    params = {
      notification: {
        recipient: another_user.username,
        subject: "Some subject",
        content: "Some content"
      }
    }

    assert_difference("Notification.count", 1) do
      post(notifications_url, params: params)
    end

    assert_response(:redirect)
    assert_equal(I18n.t("notifications.sent"), flash[:success])

    notification = Notification.last
    assert(notification)
    assert_equal("Some subject", notification.subject)
    assert_equal("Some content", notification.content.body.to_plain_text)
    assert_equal(another_user, notification.recipient)
    assert_equal(@user, notification.sender)
  end

  test "POST #create with a username that does not exist does not create the notification" do
    params = {
      notification: {
        recipient: "this is a guess at a user name... it probably does not exist",
        subject: "Some subject",
        content: "Some content"
      }
    }

    assert_no_difference("Notification.count") do
      post(notifications_url, params: params)
    end

    assert_template(:new)
    assert_equal("Recipient must exist", flash[:alert])
  end
end
