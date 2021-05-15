require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "#notification_count passed a user gets the number of received
        notifications" do
    user = FactoryBot.create(:user)
    assert_equal(0, notification_count(user))

    FactoryBot.create_list(:notification, 2, recipient: user)
    assert_equal(2, notification_count(user))
  end

  test "#toast_klass returns appropriate bootstrap classes" do
    assert_equal("toast align-items-center bg-danger border-0", toast_klass("alert"))
    assert_equal("toast align-items-center bg-primary border-0", toast_klass("something-else"))
  end
end
